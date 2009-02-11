using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class RolSistema
    {
        public static RolSistema GetFromNombre(SIGEADataContext context, string nombreRol)
        {
            var rol = context.RolSistema.Where(r => r.nombreRol == nombreRol);
            if (!rol.Any())
                return null;

            return rol.Single();
        }
        public static short GetIdFromNombre(SIGEADataContext context, string nombreRol)
        {
            if (!context.RolSistema.Any(r => r.nombreRol == nombreRol))
                return 0;
    
            return context.RolSistema.Single(r => r.nombreRol == nombreRol).idRol;
        }
    }
}
