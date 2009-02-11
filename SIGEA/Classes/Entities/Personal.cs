using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Personal
    {
        public static Personal GetFromId(SIGEADataContext data_context, int idPersonal)
        {
            var personal = data_context.Personal.Where(p => p.idPersonal == idPersonal);
            if (!personal.Any())
                return null;

            return personal.Single();
        }
        public static Personal GetForDataUpdate(SIGEADataContext data_context, int idPersonal)
        {
            Personal personal = null;

            if (idPersonal == 0)
            {
                // Si el personal es nuevo, crea las nuevas entidades y el usuario

                personal = new Personal();

                personal.fechaAlta = DateTime.Now;
                personal.activo = true;

                data_context.Personal.InsertOnSubmit(personal);
            }
            else
            {
                // Si el personal ya existe carga sus entidades

                personal = GetFromId(data_context, idPersonal);
            }

            return personal;
        }

        public static void Delete(SIGEADataContext data_context, int idPersonal)
        {
            Personal personal_delete = GetFromId(data_context, idPersonal);
            if (personal_delete == null)
            {
                throw new Exception("Identificador de personal inválido");
            }

            personal_delete.activo = false;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("nombre", nombre);
            datos.Add("fechaAlta", fechaAlta);

            return datos;
        }

        public void SetData(Dictionary<string, object> datosPersonales)
        {
            nombre = datosPersonales["nombre"].ToString();
            if (datosPersonales["fechaAlta"] != null)
                fechaAlta = (DateTime)datosPersonales["fechaAlta"];
        }
    }
}
