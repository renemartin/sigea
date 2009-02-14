using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Declaraciones
    {
        public static Declaraciones GetFromId(SIGEADataContext data_context, int idAvaluo)
        {
            var declaraciones_query = from d in data_context.Declaraciones
                                      where d.idAvaluo == idAvaluo
                                      select d;

            if (!declaraciones_query.Any())
                return null;

            return declaraciones_query.Single();
        }

        public static Declaraciones GetForDataUpdate(SIGEADataContext data_context, int idAvaluo)
        {
            Declaraciones declaraciones = GetFromId(data_context, idAvaluo);

            if (declaraciones == null)
            {
                declaraciones = new Declaraciones();
                declaraciones.idAvaluo = idAvaluo;
                data_context.Declaraciones.InsertOnSubmit(declaraciones);
            }

            return declaraciones;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idAvaluo", idAvaluo);
            data.Add("declaracionIdentificacion", declaracionIdentificacion);
            data.Add("declaracionSuperficies", declaracionSuperficies);
            data.Add("declaracionConstrucciones", declaracionConstrucciones);
            data.Add("declaracionMonumento", declaracionMonumento);
            data.Add("declaracionPatrimonio", declaracionPatrimonio);
            data.Add("advertenciaDocumentacion", advertenciaDocumentacion);
            data.Add("advertenciaOfertas", advertenciaOfertas);
            data.Add("advertenciaUso", advertenciaUso);
            data.Add("advertenciaObras", advertenciaOfertas);
            data.Add("otrasAdvertencias", otrasAdvertencias);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            declaracionIdentificacion = (bool)data["declaracionIdentificacion"];
            declaracionSuperficies = (bool)data["declaracionSuperficies"];
            declaracionConstrucciones = (bool)data["declaracionConstrucciones"];
            declaracionMonumento = (bool)data["declaracionMonumento"];
            declaracionPatrimonio = (bool)data["declaracionPatrimonio"];
            advertenciaDocumentacion = (bool)data["advertenciaDocumentacion"];
            advertenciaOfertas = (bool)data["advertenciaOfertas"];
            advertenciaUso = (bool)data["advertenciaUso"];
            advertenciaObras = (bool)data["advertenciaObras"];
            otrasAdvertencias = data["otrasAdvertencias"].ToString(); ;
        }
    }
}