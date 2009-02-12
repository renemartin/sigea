using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Valuador
    {
        public static Valuador GetFromId(SIGEADataContext data_context, int idValuador)
        {            
            var valuador = data_context.Valuador.Where(v => v.idValuador == idValuador);
            if (!valuador.Any())
                return null;

            return valuador.Single();
        }
        public static Valuador GetForDataUpdate(SIGEADataContext data_context, int idValuador)
        {
            Valuador valuador = null;

            if (idValuador == 0)
            {
                // Si el valuador es nuevo, crea las nuevas entidades y el usuario

                valuador = new Valuador();
                valuador.DatoContacto = new DatoContacto();
                valuador.Direccion = new Direccion();

                valuador.fechaAlta = DateTime.Now;
                valuador.activo = true;

                data_context.Valuador.InsertOnSubmit(valuador);
            }
            else
            {
                // Si el valuador ya existe carga sus entidades

                valuador = GetFromId(data_context, idValuador);
                if (valuador != null)
                {
                    if (valuador.DatoContacto == null)
                        valuador.DatoContacto = new DatoContacto();

                    if (valuador.Direccion == null)
                        valuador.Direccion = new Direccion();
                }
            }

            return valuador;
        }
        public static Usuario GetUsuarioFromId(SIGEADataContext data_context, int idValuador)
        {
            var usuario = from u in data_context.Usuario
                          join uv in data_context.UsuarioValuador on u.idUsuario equals uv.idUsuario
                          where uv.master && uv.idValuador == idValuador
                          select u;
            if (!usuario.Any())
                return null;

            return usuario.Single();
        }
        public static int GetIdFromName(SIGEADataContext data_context, string nombre, bool controlador)
        {
            var valuador_query = from v in data_context.Valuador
                                 where v.nombre.ToLower() == nombre.ToLower().Trim() 
                                    && ((controlador && v.TipoValuador.descripcion.ToLower() == "controlador")
                                        || (!controlador && v.TipoValuador.descripcion.ToLower() != "controlador"))
                                    && v.activo
                                 select v.idValuador;

            if (!valuador_query.Any())
                return 0;

            return valuador_query.Take(1).Single();
        }
        public static string GetUrlFoto(SIGEADataContext data_context, int idValuador)
        {
            Valuador valuador = GetFromId(data_context, idValuador);
            if (valuador == null || valuador.Archivo == null)
                return string.Empty;

            return valuador.Archivo.GetUrl();
        }
        
        public static void Delete(SIGEADataContext data_context, int idValuador)
        {
            Valuador valuador_delete = GetFromId(data_context, idValuador);
            if (valuador_delete == null)
            {
                throw new Exception("Identificador de valuador inválido");
            }

            valuador_delete.activo = false;
        }

        public string GetUrlFoto()
        {
            if (Archivo == null)
                return string.Empty;

            return this.Archivo.GetUrl();
        }
        public UsuarioValuador GetUsuarioMaster()
        {
            var usuario_query = from u in this.UsuarioValuador
                                where u.master == true
                                select u;
            if (!usuario_query.Any())
                return null;

            return usuario_query.Single();
        }
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("idTipoValuador", idTipoValuador);
            datos.Add("nombre", nombre);
            datos.Add("nombreAsistente", nombreAsistente);
            datos.Add("emailAsistente", emailAsistente);
            datos.Add("externo", externo);
            datos.Add("fechaAlta", fechaAlta);

            return datos;
        }

        public void SetData(Dictionary<string, object> datosPersonales)
        {
            idTipoValuador = short.Parse(datosPersonales["idTipoValuador"].ToString());
            nombre = datosPersonales["nombre"].ToString();
            nombreAsistente = datosPersonales["nombreAsistente"].ToString();
            emailAsistente = datosPersonales["emailAsistente"].ToString();
            externo = (bool)datosPersonales["externo"];
            if (datosPersonales["fechaAlta"] != null)
                fechaAlta = (DateTime)datosPersonales["fechaAlta"];
        }
        public void UpdateUsuarioMaster(Usuario usuario)
        {
            UsuarioValuador usuario_valuador = GetUsuarioMaster();
            if (usuario_valuador == null)
            {
                usuario_valuador = new UsuarioValuador();
                usuario_valuador.Usuario = usuario;
                usuario_valuador.Valuador = this;
                usuario_valuador.master = true;

                this.UsuarioValuador.Add(usuario_valuador);
            }
        }
    }
}
