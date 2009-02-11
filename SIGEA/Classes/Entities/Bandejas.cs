using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public class Bandejas
    {
        public enum TipoBandeja
        {
            NoAsignados = 0, EnProceso = 1, EnCorreccion = 2, EnRevision = 3, Completados = 4
        }
        private SIGEADataContext data_context;
        private const int num_bandejas = 5;

        public Bandejas()
        {
            data_context = new SIGEADataContext();
        }

        private static IEnumerable<object> GetFromStatusList(SIGEADataContext data_context, short[] status_list)
        {
            var avaluos_query = from a in data_context.AvaluoInmobiliario
                                where a.activo && status_list.Contains(a.idStatus)
                                select new
                                {
                                    idAvaluo = a.idAvaluo,
                                    idStatus = a.idStatus,
                                    IDE = a.IDE,
                                    urlFoto = "",
                                    datosInmueble = a.Inmueble.ToString(),
                                    fechaAlta = a.fechaCreacion 
                                };

            return avaluos_query.ToArray();
        }
        private int GetCountFromStatusList(SIGEADataContext data_context, short[] status_list)
        {
            var count_query = from a in data_context.AvaluoInmobiliario
                              where a.activo && status_list.Contains(a.idStatus)
                              select a.idAvaluo;

            return count_query.Count();
        }

        public IEnumerable<object> GetBandeja(short idTipo)
        {
            return GetBandeja((TipoBandeja)idTipo);
        }
        public IEnumerable<object> GetBandeja(TipoBandeja tipo)
        {
            switch (tipo)
            {
                case TipoBandeja.NoAsignados:
                    return GetBandejaNoAsignados();
                case TipoBandeja.EnProceso:
                    return GetBandejaEnProceso();
                case TipoBandeja.EnCorreccion:
                    return GetBandejaEnCorrecion();
                case TipoBandeja.EnRevision:
                    return GetBandejaEnRevision();
                case TipoBandeja.Completados:
                    return GetBandejaCompletados();
            }

            return null;
        }
        public int[] GetCount()
        {
            int[] count = new int[num_bandejas];
            count[0] = GetCountFromStatusList(data_context, StatusAvaluo.ListaNoAsignados);
            count[1] = GetCountFromStatusList(data_context, StatusAvaluo.ListaEnProceso);
            count[2] = GetCountFromStatusList(data_context, StatusAvaluo.ListaEnCorreccion);
            count[3] = GetCountFromStatusList(data_context, StatusAvaluo.ListaEnRevision);
            count[4] = GetCountFromStatusList(data_context, StatusAvaluo.ListaCompletados);

            return count;
        }

        private IEnumerable<object> GetBandejaNoAsignados()
        {
            return GetFromStatusList(data_context, StatusAvaluo.ListaNoAsignados);
        }
        private IEnumerable<object> GetBandejaEnProceso()
        {
            return GetFromStatusList(data_context, StatusAvaluo.ListaEnProceso);
        }
        private IEnumerable<object> GetBandejaEnCorrecion()
        {
            return GetFromStatusList(data_context, StatusAvaluo.ListaEnCorreccion);
        }
        private IEnumerable<object> GetBandejaEnRevision()
        {
            return GetFromStatusList(data_context, StatusAvaluo.ListaEnRevision);
        }
        private IEnumerable<object> GetBandejaCompletados()
        {
            return GetFromStatusList(data_context, StatusAvaluo.ListaCompletados);
        }
    }
}
