using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace SIGEA.Classes.Entities
{
    public partial class Usuario
    {
        public static Usuario GetFromNombreUsuario(SIGEADataContext data_context, string nombreUsuario)
        {
            var usuario = data_context.Usuario.Where(u => u.nombreUsuario == nombreUsuario);
            if (!usuario.Any())
                return null;

            return usuario.Single();
        }
        public static bool CheckExistingUsername(SIGEADataContext data_context, string nombreUsuario, int idUsuario)
        {
            var usuario = from u in data_context.Usuario
                          where u.nombreUsuario == nombreUsuario && u.idUsuario != idUsuario
                          select u;

            if (usuario.Any())
                return false;

            return true;
        }
        public static Usuario GetFromId(SIGEADataContext data_context, int idUsuario)
        {
            var usuario = data_context.Usuario.Where(u => u.idUsuario == idUsuario);
            if (!usuario.Any())
                return null;

            return usuario.Single();
        }
        public static int GetIdFromNombreUsuario(SIGEADataContext data_context, string nombreUsuario)
        {
            if (!data_context.Usuario.Any(u => u.nombreUsuario == nombreUsuario))
                return 0;

            return data_context.Usuario.Single(u => u.nombreUsuario == nombreUsuario).idUsuario;
        }
        public static Usuario GetForDataUpdate(SIGEADataContext data_context, int idUsuario)
        {
            Usuario usuario = GetFromId(data_context, idUsuario);
            if (usuario == null)
            {
                usuario = new Usuario();
                usuario.fechaCreacion = DateTime.Today;
                usuario.fechaUltimaSesion = DateTime.Now;
                data_context.Usuario.InsertOnSubmit(usuario);
            }

            return usuario;
        }

        public static Usuario InsertNew(SIGEADataContext data_context, string nombreUsuario, string password, string email, DateTime fechaCreacion, bool activo)
        {
            Usuario nuevo_usuario = new Usuario();

            nuevo_usuario.nombreUsuario = nombreUsuario;
            nuevo_usuario.password = password;
            nuevo_usuario.email = email;
            nuevo_usuario.fechaCreacion = fechaCreacion;
            nuevo_usuario.fechaUltimaSesion = fechaCreacion;
            nuevo_usuario.activo = activo;
            nuevo_usuario.online = false;

            data_context.Usuario.InsertOnSubmit(nuevo_usuario);
            data_context.SubmitChanges();

            return nuevo_usuario;
        }

        public void SetDatos(Dictionary<string, object> datosUsuario)
        {
            nombreUsuario = datosUsuario["nombreUsuario"].ToString();
            password = datosUsuario["password"].ToString();
            email = datosUsuario["email"].ToString();
        }
        public void UpdateRoles(SIGEADataContext data_context, short[] rolesId)
        {
            Entities.RolUsuario.UpdateRoles(data_context, idUsuario, rolesId);
        }

        public MembershipUser ToMembershipUser(string providerName)
        {
            MembershipUser ret_user = new MembershipUser(
                providerName,
                nombreUsuario,
                idUsuario,
                email,
                string.Empty,
                string.Empty,
                true,
                activo,
                fechaCreacion,
                fechaUltimaSesion,
                DateTime.Now,
                DateTime.Today,
                DateTime.Today);

            return ret_user;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("idUsuario", idUsuario);
            datos.Add("nombreUsuario", nombreUsuario);
            datos.Add("password", password);
            datos.Add("email", email);

            return datos;
        }
    }
}
