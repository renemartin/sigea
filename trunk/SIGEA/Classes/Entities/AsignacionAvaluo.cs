using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entity = System.Collections.Generic.Dictionary<string, object>;

namespace SIGEA.Classes.Entities
{
    public partial class AsignacionAvaluo
    {
        private static AsignacionAvaluo GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var asignacion_query = from a in data_context.AsignacionAvaluo
                                   where a.idAvaluo == idAvaluo
                                   select a;

            if (!asignacion_query.Any())
                return null;

            return asignacion_query.Single();
        }
        private static AsignacionAvaluo GetForDataUpdate(SIGEADataContext data_context, int idAvaluo)
        {
            AsignacionAvaluo asignacion = GetFromIdAvaluo(data_context, idAvaluo);

            if (asignacion == null)
            {
                asignacion = new AsignacionAvaluo();
                asignacion.idAvaluo = idAvaluo;

                data_context.AsignacionAvaluo.InsertOnSubmit(asignacion);
            }

            return asignacion;
        }

        public static void Save(SIGEADataContext data_context, int idAvaluo, Entity data)
        {
            AsignacionAvaluo asignacion = GetForDataUpdate(data_context, idAvaluo);

            int idValuador = Valuador.GetIdFromName(data_context, data["nombreValuador"].ToString());
            if (idValuador == 0)
                throw new Exception("El nombre de valuador especificado es inválido");
            asignacion.idValuador = idValuador;

            int idControlador = Valuador.GetIdFromName(data_context, data["nombreControlador"].ToString());
            if (idControlador == 0)
                throw new Exception("El nombre de controlador especificado es inválido");
            asignacion.idControlador = idControlador;
        }
        public static Entity Load(SIGEADataContext data_context, int idAvaluo)
        {
            AsignacionAvaluo asignacion = GetFromIdAvaluo(data_context, idAvaluo);
            if (asignacion == null)
                return null;

            return asignacion.GetData();
        }
        public static void Delete(SIGEADataContext data_context, int idAvaluo)
        {
            AsignacionAvaluo asignacion = GetFromIdAvaluo(data_context, idAvaluo);
            if (asignacion == null)
                throw new Exception("El identificador de la asignación es inválido");

            data_context.AsignacionAvaluo.DeleteOnSubmit(asignacion);
        }

        private Entity GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("nombreValuador", this.Valuador != null ? this.Valuador.nombre : "");
            data.Add("nombreControlador", this.Valuador1 != null ? this.Valuador1.nombre : "");

            return data;
        }
    }
}
