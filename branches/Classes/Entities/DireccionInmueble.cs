using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DireccionInmueble
    {
        public void SetData(Dictionary<string, object> datosDireccion)
        {
            edificio = datosDireccion["edificio"].ToString();
            lote = datosDireccion["lote"].ToString();
            manzana = datosDireccion["manzana"].ToString();
            superManzana = datosDireccion["superManzana"].ToString();
            condominio = datosDireccion["condominio"].ToString();
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("edificio", edificio);
            datos.Add("lote", lote);
            datos.Add("manzana", manzana);
            datos.Add("superManzana", superManzana);
            datos.Add("condominio", condominio);

            return datos;
        }
    }
}
