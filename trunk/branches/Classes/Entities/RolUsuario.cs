using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class RolUsuario
    {
        public static void UpdateRoles(SIGEADataContext data_context, int idUsuario, short[] roleIds)
        {
            var roles_eliminar = from ru in data_context.RolUsuario
                                 where ru.idUsuario == idUsuario && !roleIds.Contains(ru.idRol)
                                 select ru;
            if (roles_eliminar.Any())
                data_context.RolUsuario.DeleteAllOnSubmit(roles_eliminar);

            List<RolUsuario> roles_nuevos = new List<RolUsuario>();

            foreach (short idRole in roleIds)
            {
                if (!data_context.RolUsuario.Any(ru => ru.idRol == idRole && ru.idUsuario == idUsuario))
                {
                    RolUsuario nuevo_rol = new RolUsuario();
                    nuevo_rol.idRol = idRole;
                    nuevo_rol.idUsuario = idUsuario;
                    roles_nuevos.Add(nuevo_rol);
                }
            }

            if (roles_nuevos.Count > 0)
                data_context.RolUsuario.InsertAllOnSubmit(roles_nuevos);
        }
    }
}
