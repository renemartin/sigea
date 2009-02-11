using System;
using System.Data;
using System.Data.Odbc;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Web.Security;
using SIGEA.Classes.Entities;

namespace SIGEA.Classes.Security
{
    public class CustomRoleProvider : RoleProvider
    {
        #region Class Variables

        private string connectionString;
        private string applicationName;
        private SIGEADataContext context;

        #endregion

        #region Initialization

        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (name == null || name.Length == 0)
            {
                name = "CustomRoleProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Manages user roles");
            }

            //Initialize the abstract base class.
            base.Initialize(name, config);

            applicationName = GetConfigValue(config["applicationName"], System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath);

            ConnectionStringSettings ConnectionStringSettings = ConfigurationManager.ConnectionStrings[config["connectionStringName"]];

            if ((ConnectionStringSettings == null) || (ConnectionStringSettings.ConnectionString.Trim() == String.Empty))
            {
                throw new ProviderException("Connection string cannot be blank.");
            }

            connectionString = ConnectionStringSettings.ConnectionString;

            context = new SIGEADataContext(connectionString);
        }

        private string GetConfigValue(string configValue, string defaultValue)
        {
            if (String.IsNullOrEmpty(configValue))
            {
                return defaultValue;
            }

            return configValue;
        }

        #endregion

        #region Properties

        public override string ApplicationName
        {
            get { return applicationName; }
            set { applicationName = value; }
        }

        #endregion

        #region Implemented Abstract Methods from RoleProvider

        public override void AddUsersToRoles(string[] usernames, string[] rolenames)
        {
            short idRol = 0;
            int idUsuario = 0;

            List<RolUsuario> asignaciones = new List<RolUsuario>();
            RolUsuario nueva_asignacion = null;

            foreach (string username in usernames)
            {
                foreach (string rolename in rolenames)
                {
                    idRol = RolSistema.GetIdFromNombre(context, rolename);
                    if (idRol == 0)
                    {
                        throw new ProviderException("Rolename invalid");
                    }

                    idUsuario = Usuario.GetIdFromNombreUsuario(context, username);
                    if (idUsuario == 0)
                    {
                        throw new ProviderException("Username invalid");
                    }

                    if (IsUserInRole(username, rolename))
                    {
                        throw new ProviderException("User is already in role.");
                    }

                    nueva_asignacion = new RolUsuario();
                    nueva_asignacion.idRol = idRol;
                    nueva_asignacion.idUsuario = idUsuario;
                    asignaciones.Add(nueva_asignacion);
                }
            }

            foreach (RolUsuario asignacion in asignaciones)
            {
                context.RolUsuario.InsertOnSubmit(asignacion);
            }

            context.SubmitChanges();
        }

        public override void CreateRole(string rolename)
        {
            if (RoleExists(rolename))
            {
                throw new ProviderException("Role name already exists.");
            }

            RolSistema nuevo_rol = new RolSistema();
            nuevo_rol.nombreRol = rolename;
            context.RolSistema.InsertOnSubmit(nuevo_rol);
            context.SubmitChanges();
        }

        public override bool DeleteRole(string rolename, bool throwOnPopulatedRole)
        {
            if (!RoleExists(rolename))
            {
                throw new ProviderException("Role does not exist.");
            }

            if (throwOnPopulatedRole && GetUsersInRole(rolename).Length > 0)
            {
                throw new ProviderException("Cannot delete a populated role.");
            }

            RolSistema rol_eliminar = RolSistema.GetFromNombre(context, rolename);
            context.RolSistema.DeleteOnSubmit(rol_eliminar);
            context.SubmitChanges();

            return true;
        }

        public override string[] GetAllRoles()
        {
            var role_list = from r in context.RolSistema
                            select r.nombreRol;

            if (!role_list.Any())
                return new string[] { };

            return role_list.ToArray();
        }

        public override string[] GetRolesForUser(string username)
        {
            var role_list = from r in context.RolSistema
                            join ur in context.RolUsuario on r.idRol equals ur.idUsuario
                            join u in context.Usuario on ur.idUsuario equals u.idUsuario
                            where u.nombreUsuario == username
                            select r.nombreRol;

            if (!role_list.Any())
                return new string[] { };

            return role_list.ToArray();
        }

        public override string[] GetUsersInRole(string rolename)
        {
            var user_list = from r in context.RolSistema
                            join ur in context.RolUsuario on r.idRol equals ur.idUsuario
                            join u in context.Usuario on ur.idUsuario equals u.idUsuario
                            where r.nombreRol == rolename
                            select u.nombreUsuario;

            if (!user_list.Any())
                return new string[] { };

            return user_list.ToArray();
        }

        public override bool IsUserInRole(string username, string rolename)
        {
            var check = (from r in context.RolSistema
                         join ur in context.RolUsuario on r.idRol equals ur.idUsuario
                         join u in context.Usuario on ur.idUsuario equals u.idUsuario
                         where r.nombreRol == rolename && u.nombreUsuario == username
                         select r.idRol).Any();

            return check;
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] rolenames)
        {
            int idRol = 0;
            int idUsuario = 0;

            List<RolUsuario> asignaciones = new List<RolUsuario>();
            RolUsuario asignacion_removida = null;

            foreach (string username in usernames)
            {
                foreach (string rolename in rolenames)
                {
                    idRol = RolSistema.GetIdFromNombre(context, rolename);
                    if (idRol == 0)
                    {
                        throw new ProviderException("Rolename invalid");
                    }

                    idUsuario = Usuario.GetIdFromNombreUsuario(context, username);
                    if (idUsuario == 0)
                    {
                        throw new ProviderException("Username invalid");
                    }

                    if (!IsUserInRole(username, rolename))
                    {
                        throw new ProviderException("User is not in role.");
                    }

                    asignacion_removida = (from ru in context.RolUsuario
                                           where ru.idRol == idRol && ru.idUsuario == idUsuario
                                           select ru).Single();
                    asignaciones.Add(asignacion_removida);
                }
            }

            foreach (RolUsuario asignacion in asignaciones)
            {
                context.RolUsuario.DeleteOnSubmit(asignacion);
            }

            context.SubmitChanges();
        }

        public override bool RoleExists(string rolename)
        {
            return RolSistema.GetIdFromNombre(context, rolename) != 0;
        }

        public override string[] FindUsersInRole(string rolename, string usernameToMatch)
        {
            var user_list = from r in context.RolSistema
                            join ur in context.RolUsuario on r.idRol equals ur.idUsuario
                            join u in context.Usuario on ur.idUsuario equals u.idUsuario
                            where r.nombreRol == rolename && u.nombreUsuario.StartsWith(usernameToMatch)
                            select u.nombreUsuario;

            if (!user_list.Any())
                return new string[] { };

            return user_list.ToArray();
        }

        #endregion
    }
}
