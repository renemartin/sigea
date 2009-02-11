using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoContacto
    {
        public void SetData(Dictionary<string, object> datosContacto)
        {
            telefono1 = datosContacto["telefono1"].ToString();
            extensionTel1 = datosContacto["extensionTel1"].ToString();
            telefono2 = datosContacto["telefono2"].ToString();
            extensionTel2 = datosContacto["extensionTel2"].ToString();
            fax = datosContacto["fax"].ToString();
            celular = datosContacto["celular"].ToString();
            nextel = datosContacto["nextel"].ToString();
            claveNextel = datosContacto["claveNextel"].ToString();
            email1 = datosContacto["email1"].ToString();
            email2 = datosContacto["email2"].ToString();
            messenger = datosContacto["messenger"].ToString();
            skype = datosContacto["skype"].ToString();
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string,object>();

            datos.Add("telefono1", telefono1);
            datos.Add("extensionTel1", extensionTel1);
            datos.Add("telefono2", telefono2);
            datos.Add("extensionTel2", extensionTel2);
            datos.Add("fax", fax);
            datos.Add("celular", celular);
            datos.Add("nextel", nextel);
            datos.Add("claveNextel", claveNextel);
            datos.Add("email1", email1);
            datos.Add("email2", email2);
            datos.Add("messenger", messenger);
            datos.Add("skype", skype);

            return datos;
        }
    }
}
