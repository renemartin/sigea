using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class AvaluoInmobiliario
    {
        private const short status_alta = 1;
        private const short tipoAvaluo_SHF = 1;
        private const short tipoAvaluo_TerrenoSHF = 2;
        private const short tipoInmueble_Terreno = 1;

        public static AvaluoInmobiliario GetFromId(SIGEADataContext data_context, int idAvaluo)
        {
            var avaluo_query = from a in data_context.AvaluoInmobiliario
                               where a.idAvaluo == idAvaluo
                               select a;

            if (!avaluo_query.Any())
                return null;

            return avaluo_query.Single();
        }
        public static AvaluoInmobiliario GetForDataUpadte(SIGEADataContext data_context, int idAvaluo)
        {
            AvaluoInmobiliario avaluo = null;

            if (idAvaluo == 0)
            {
                // Si el avaluo es nuevo, crea las nuevas entidades y el usuario

                avaluo = new AvaluoInmobiliario();
                avaluo.Solicitante = new Solicitante();
                avaluo.Solicitante.Direccion = new Direccion();

                avaluo.Inmueble = new Inmueble();
                avaluo.Inmueble.DireccionInmueble = new DireccionInmueble();
                avaluo.Inmueble.DireccionInmueble.Direccion = new Direccion();
                avaluo.Inmueble.Propietario = new Propietario();
                avaluo.Inmueble.Propietario.Direccion = new Direccion();

                avaluo.idStatus = status_alta;
                avaluo.fechaCreacion = DateTime.Today;
                avaluo.activo = true;

                data_context.AvaluoInmobiliario.InsertOnSubmit(avaluo);
            }
            else
            {
                // Si el valuador ya existe carga sus entidades

                avaluo = GetFromId(data_context, idAvaluo);
            }

            return avaluo;
        }
        public static object GetRegistro(SIGEADataContext data_context, int idAvaluo)
        {
            var avaluo_query =
                from a in data_context.AvaluoInmobiliario
                where a.idAvaluo == idAvaluo
                select new
                {
                    idStatus = a.idStatus,
                    IDE = a.IDE,
                    status = a.StatusAvaluo.descripcion,
                    urlFoto = "",
                    fechaAlta = a.fechaCreacion,
                    fechaFinalizacion = a.fechaFinalizacion,
                    datosInmueble = a.Inmueble.ToString(),
                    supTerreno = 0,
                    supConstruida = 0,
                    supVendible = 0,
                    valorMercado = 0,
                    valorTerreno = 0,
                    valorConstruccion = 0,
                    valorInstalaciones = 0,
                    valorConcluido = 0
                };
            if (!avaluo_query.Any())
                return null;

            return avaluo_query.Single();
        }
        public static object GetEstadoInmueble(SIGEADataContext data_context, int idAvaluo)
        {
            var estado_query =
                from a in data_context.AvaluoInmobiliario
                where a.idAvaluo == idAvaluo
                select new
                {
                    claveEstado = a.Inmueble.DireccionInmueble.Direccion.CodigoPostal.Asentamiento.Municipio.Estado.claveEstado,
                    nombreEstado = a.Inmueble.DireccionInmueble.Direccion.CodigoPostal.Asentamiento.Municipio.Estado.nombreEstado
                };

            if (!estado_query.Any())
                return null;

            return estado_query.Single();
        }

        public static void Cancel(SIGEADataContext data_context, int idAvaluo)
        {
            AvaluoInmobiliario avaluo_cancelar = GetFromId(data_context, idAvaluo);
            if (avaluo_cancelar == null)
            {
                throw new Exception("Identificador de avalúo inválido");
            }

            avaluo_cancelar.activo = false;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idSubTipo", idSubTipo);
            data.Add("idProposito", idProposito);
            data.Add("especRecuperacion", especRecuperacion);
            data.Add("especProposito", especProposito);
            data.Add("promocionVIASC", promocionVIASC);
            data.Add("operacionContado", operacionContado);
            data.Add("idCliente", idCliente);

            return data;
        }
        private short GetSubTipo(short idTipoInmueble)
        {
            if (idTipoInmueble == tipoInmueble_Terreno)
                return tipoAvaluo_TerrenoSHF;

            return tipoAvaluo_SHF;
        }

        public void GenerarIDE()
        {
            if (!string.IsNullOrEmpty(IDE))
            {
                throw new Exception("El avalúo especificado ya contiene un IDE generado");
            }

            SIGEADataContext data_context = new SIGEADataContext();

            int? consecutivo = 0;
            string IDE_generado = string.Empty;

            data_context.GenerarIDE(
                (short)fechaCreacion.Month,
                (short)fechaCreacion.Year,
                ref consecutivo,
                ref IDE_generado);

            IDE = IDE_generado;
        }
        public void SetData(Dictionary<string, object> data)
        {
            idProposito = short.Parse(data["idProposito"].ToString());
            especRecuperacion = data["especRecuperacion"].ToString();
            especProposito = data["especProposito"].ToString();

            idCliente = data.ContainsKey("idCliente")
                ? (int?)int.Parse(data["idCliente"].ToString())
                : null;

            if (data.ContainsKey("promocionVIASC"))
                promocionVIASC = (bool)data["promocionVIASC"];
            if (data.ContainsKey("operacionContado"))
                operacionContado = (bool)data["operacionContado"];
        }
        public void UpdateSubTipo(short idTipoInmueble)
        {
            idSubTipo = GetSubTipo(idTipoInmueble);
        }
    }
}
