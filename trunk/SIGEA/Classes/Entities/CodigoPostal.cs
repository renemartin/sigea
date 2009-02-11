using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class CodigoPostal
    {
        public static CodigoPostal GetFromData(SIGEADataContext data_context, Dictionary<string, object> datosDireccion)
        {
            CodigoPostal cp = Ubicaciones.GetCodigoPostal(
                data_context,
                datosDireccion["codigoPostal"].ToString(),
                datosDireccion["nombreAsentamiento"].ToString(),
                int.Parse(datosDireccion["idMunicipio"].ToString()));

            return cp;
        }
    }
}
