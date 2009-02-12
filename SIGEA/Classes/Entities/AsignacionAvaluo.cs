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
            bool valuador_asigado = false;
            bool controlador_asignado = false;

            AsignacionAvaluo asignacion = GetForDataUpdate(data_context, idAvaluo);

            int idValuador = Valuador.GetIdFromName(data_context, data["nombreValuador"].ToString(), false);
            if (idValuador == 0)
                throw new Exception("El nombre de valuador especificado es inválido");
            if (asignacion.idAvaluo != idValuador)
            {
                valuador_asigado = true;
                asignacion.idValuador = idValuador;
            }

            int idControlador = Valuador.GetIdFromName(data_context, data["nombreControlador"].ToString(), true);
            if (idControlador == 0)
                throw new Exception("El nombre de controlador especificado es inválido");
            if (asignacion.idControlador != idControlador)
            {
                controlador_asignado = true;
                asignacion.idControlador = idControlador;
            }

            StatusAvaluo.SetAsignacion(data_context, idAvaluo, valuador_asigado, controlador_asignado);
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
            StatusAvaluo.RemoveAsignacion(data_context, idAvaluo);
        }

        private Entity GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("nombreValuador", this.Valuador1 != null ? this.Valuador1.nombre : "");
            data.Add("nombreControlador", this.Valuador != null ? this.Valuador.nombre : "");

            return data;
        }
    }
}
