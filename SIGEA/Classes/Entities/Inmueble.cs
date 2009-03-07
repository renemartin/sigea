using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Inmueble
    {
        public static Inmueble GetFromId(SIGEADataContext data_context, int idInmueble)
        {
            var inmueble_query = from i in data_context.Inmueble
                                 where i.idInmueble == idInmueble
                                 select i;

            if (!inmueble_query.Any())
                return null;

            return inmueble_query.Single();
        }
        public static Inmueble GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var inmueble_query = from i in data_context.Inmueble
                                 join a in data_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                 where a.idAvaluo == idAvaluo
                                 select i;

            if (!inmueble_query.Any())
                return null;

            return inmueble_query.Single();
        }
        public static int GetIdFromAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var inmueble_query = from i in data_context.Inmueble
                                 join a in data_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                 where a.idAvaluo == idAvaluo
                                 select i.idInmueble;

            if (!inmueble_query.Any())
                return 0;

            return inmueble_query.Single();
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoInmueble", idTipoInmueble);
            data.Add("idRegimenPropiedad", idRegimenPropiedad);
            data.Add("otroTipoInmueble", otroTipoInmueble);
            data.Add("claveCatastral", claveCatastral);
            data.Add("cuentaPredial", cuentaPredial);
            data.Add("cuentaAgua", cuentaAgua);
            data.Add("telefono", telefono);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoInmueble = short.Parse(data["idTipoInmueble"].ToString());
            idRegimenPropiedad = short.Parse(data["idRegimenPropiedad"].ToString());
            otroTipoInmueble = data["otroTipoInmueble"].ToString();
            claveCatastral = data["claveCatastral"].ToString();
            cuentaPredial = data["cuentaPredial"].ToString();
            cuentaAgua = data["cuentaAgua"].ToString();
            telefono = data["telefono"].ToString();
        }

        public override string ToString()
        {
            StringBuilder text = new StringBuilder();
            text.Append(this.TipoInmueble.descripcion);
            text.Append(", RÉGIMEN ");
            text.Append(this.RegimenPropiedad.descripcion);
            text.Append("<br/>");
            text.Append(" EN ");
            text.Append(this.DireccionInmueble.Direccion.calle);
            text.Append(" # ");
            text.Append(this.DireccionInmueble.Direccion.numeroExterior);
            if (!string.IsNullOrEmpty(this.DireccionInmueble.Direccion.numeroInterior))
            {
                text.Append(" INT. ");
                text.Append(this.DireccionInmueble.Direccion.numeroInterior);
            }
            text.Append("<br/>");
            text.Append(this.DireccionInmueble.Direccion.CodigoPostal.Asentamiento.Municipio.nombreMunicipio);
            text.Append(", ");
            text.Append(this.DireccionInmueble.Direccion.CodigoPostal.Asentamiento.Municipio.Estado.nombreEstado);

            return text.ToString().ToUpper();
        }

        public int GetIdThumbnail()
        {
            if (FotografiaInmueble == null)
                return 0;

            var foto = FotografiaInmueble.Where(f => f.principal).Select(f => f.idArchivoThumbnail);
            if (!foto.Any())
                return 0;

            return foto.Single();
        }
    }
}
