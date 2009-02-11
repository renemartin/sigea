using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoContactoComparable
    {
        public void SetData( Dictionary<string, object> datosContactoComparable )
        {
            nombre = datosContactoComparable["nombre"].ToString();
            apellido = datosContactoComparable["apellido"].ToString();
            telefono = datosContactoComparable["telefono"].ToString();
            email = datosContactoComparable["email"].ToString();
        }

        public static DatoContactoComparable GetFromID(SIGEADataContext data_context, int idDatoContactoComparable)
        {
            var dato_contacto = data_context.DatoContactoComparable.Where(d => d.idDatoContactoComparable == idDatoContactoComparable);
            if (!dato_contacto.Any())
                return null;

            return dato_contacto.Single();
        }

        public static DatoContactoComparable GetDataForUpdate(SIGEADataContext data_context, int idDatoContactoComparable)
        {
            DatoContactoComparable dato_contacto = null;

            if (idDatoContactoComparable == 0)
            {
                dato_contacto = new DatoContactoComparable();
                data_context.DatoContactoComparable.InsertOnSubmit(dato_contacto);
            }

            return dato_contacto;
        }
    }
}
