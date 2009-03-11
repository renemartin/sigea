using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public class Bandejas
    {
        private SIGEADataContext data_context;
        private const int num_bandejas = 5;

        public Bandejas()
        {
            data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
            data_context.ObjectTrackingEnabled = false;

            DataLoadOptions options = new DataLoadOptions();
            options.LoadWith<AvaluoInmobiliario>(Avaluo => Avaluo.Inmueble);
            options.LoadWith<Inmueble>(Inmueble => Inmueble.TipoInmueble);
            options.LoadWith<Inmueble>(Inmueble => Inmueble.RegimenPropiedad);
            options.LoadWith<Inmueble>(Inmueble => Inmueble.DireccionInmueble);
            options.LoadWith<Inmueble>(Inmueble => Inmueble.FotografiaInmueble);
            options.LoadWith<FotografiaInmueble>(Foto => Foto.Archivo1);
            options.LoadWith<Archivo>(Archivo => Archivo.Carpeta);
            options.LoadWith<DireccionInmueble>(Ubicacion => Ubicacion.Direccion);
            options.LoadWith<Direccion>(Direccion => Direccion.CodigoPostal);
            options.LoadWith<CodigoPostal>(CP => CP.Asentamiento);
            options.LoadWith<Asentamiento>(Asentamiento => Asentamiento.Municipio);
            options.LoadWith<Municipio>(Municipio => Municipio.Estado);
            data_context.LoadOptions = options;
        }

        private IEnumerable<object> GetFromStatusList(SIGEADataContext data_context, short[] status_list)
        {
            var list_query = from a in data_context.AvaluoInmobiliario
                             where a.activo && status_list.Contains(a.idStatus)
                             select new
                             {
                                 idAvaluo = a.idAvaluo,
                                 idStatus = a.idStatus,
                                 urlThumbnail = a.Inmueble.GetUrlThumbnail(),
                                 IDE = a.IDE,
                                 datosInmueble = a.Inmueble.ToString(),
                                 fechaAlta = a.fechaCreacion
                             };

            return list_query.ToArray();
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

        public enum TipoBandeja
        {
            NoAsignados = 0, EnProceso = 1, EnCorreccion = 2, EnRevision = 3, Completados = 4
        }
    }
}
