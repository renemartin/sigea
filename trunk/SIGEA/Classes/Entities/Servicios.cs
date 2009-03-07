using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Servicios
    {
        public static string[] GetServicios(SIGEADataContext data_context, string prefix, int count, string tipoServicio)
        {

            var servicios_query = from vs in data_context.ValorServicio
                                  join ts in data_context.TipoServicio on vs.idTipoServicio equals ts.idTipoServicio
                                  where ts.descripcion == tipoServicio && vs.descripcion.StartsWith(prefix)
                                  select vs.descripcion;                                
            return servicios_query.Take(count).ToArray();

        }  
    
    }
}
