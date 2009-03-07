using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Materiales
    {
        public static string[] GetMateriales(SIGEADataContext data_context, string prefix, int count, string tipoMaterial)
        {

            var materiales_query = from vm in data_context.ValorMaterial
                                   join tm in data_context.TipoMaterial on vm.idTipoMaterial equals tm.idTipoMaterial
                                   where tm.descripcion == tipoMaterial && vm.descripcion.StartsWith(prefix)
                                   select vm.descripcion;
            return materiales_query.Take(count).ToArray();
           
        }  
        
       
    }
}
