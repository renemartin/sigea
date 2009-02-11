using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Direccion
    {
        public void SetData(CodigoPostal codigoPostal, Dictionary<string, object> datosDireccion)
        {
            CodigoPostal = codigoPostal;

            calle = datosDireccion["calle"].ToString();
            numeroExterior = datosDireccion["numeroExterior"].ToString();
            numeroInterior = datosDireccion["numeroInterior"].ToString();
            entre1 = datosDireccion["entre1"].ToString();
            entre2 = datosDireccion["entre2"].ToString();            
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("calle", calle);
            datos.Add("numeroExterior", numeroExterior);
            datos.Add("numeroInterior", numeroInterior);
            datos.Add("entre1", entre1);
            datos.Add("entre2", entre2);

            datos.Add("claveEstado", CodigoPostal.Asentamiento.Municipio.claveEstado);
            datos.Add("idMunicipio", CodigoPostal.Asentamiento.idMunicipio);
            datos.Add("nombreAsentamiento", CodigoPostal.Asentamiento.nombreAsentamiento);
            datos.Add("codigoPostal", CodigoPostal.codigoPostal1);

            return datos;
        }
    }
}
