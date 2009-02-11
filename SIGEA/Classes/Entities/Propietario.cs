using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Propietario
    {
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("nombre", nombre);
            data.Add("CURP", CURP);
            data.Add("RFC", RFC);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            nombre = data["nombre"].ToString();
            CURP = data["CURP"].ToString();
            RFC = data["RFC"].ToString();
        }
    }
}
