using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Cliente
    {
        public static Cliente GetFromId(SIGEADataContext data_context, int idCliente)
        {
            var cliente_query = data_context.Cliente.Where(c => c.idCliente == idCliente);
            if (!cliente_query.Any())
                return null;

            return cliente_query.Single();
        }
        public static Cliente GetForDataUpdate(SIGEADataContext data_context, int idCliente)
        {
            Cliente cliente = null;

            if (idCliente == 0)
            {
                // Si el cliente es nuevo, crea las nuevas entidades y el usuario

                cliente = new Cliente();
                cliente.DatoContacto = new DatoContacto();
                cliente.Direccion = new Direccion();

                cliente.fechaAlta = DateTime.Now;
                cliente.activo = true;

                data_context.Cliente.InsertOnSubmit(cliente);
            }
            else
            {
                // Si el cliente ya existe carga sus entidades

                cliente = GetFromId(data_context, idCliente);
                if (cliente != null)
                {
                    if (cliente.DatoContacto == null)
                        cliente.DatoContacto = new DatoContacto();

                    if (cliente.Direccion == null)
                        cliente.Direccion = new Direccion();
                }
            }

            return cliente;
        }
        public static Usuario GetUsuarioFromId(SIGEADataContext data_context, int idCliente)
        {
            var usuario = from u in data_context.Usuario
                          join uc in data_context.UsuarioCliente on u.idUsuario equals uc.idUsuario
                          where uc.master && uc.idCliente == idCliente
                          select u;
            if (!usuario.Any())
                return null;

            return usuario.Single();
        }
        public static string GetUrlFoto(SIGEADataContext data_context, int idCliente)
        {
            Cliente cliente = GetFromId(data_context, idCliente);
            if (cliente == null || cliente.Archivo == null)
                return string.Empty;

            return cliente.Archivo.GetUrl();
        }
        public static void Delete(SIGEADataContext data_context, int idCliente)
        {
            Cliente cliente_delete = GetFromId(data_context, idCliente);
            if (cliente_delete == null)
            {
                throw new Exception("Identificador de cliente inválido");
            }

            cliente_delete.activo = false;
        }

        public string GetUrlFoto()
        {
            if (Archivo == null)
                return string.Empty;

            return this.Archivo.GetUrl();
        }
        public UsuarioCliente GetUsuarioMaster()
        {
            var usuario_query = from u in this.UsuarioCliente
                                where u.master == true
                                select u;
            if (!usuario_query.Any())
                return null;

            return usuario_query.Single();
        }
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("nombre", nombre);
            datos.Add("paginaWeb", paginaWeb);
            datos.Add("fechaAlta", fechaAlta);

            return datos;
        }

        public void SetData(Dictionary<string, object> datosPersonales)
        {
            nombre = datosPersonales["nombre"].ToString();
            paginaWeb = datosPersonales["paginaWeb"].ToString();
            if (datosPersonales["fechaAlta"] != null)
                fechaAlta = (DateTime)datosPersonales["fechaAlta"];
        }
        public void UpdateUsuarioMaster(Usuario usuario)
        {
            UsuarioCliente usuario_cliente = GetUsuarioMaster();
            if (usuario_cliente == null)
            {
                usuario_cliente = new UsuarioCliente();
                usuario_cliente.Usuario = usuario;
                usuario_cliente.Cliente = this;
                usuario_cliente.master = true;

                this.UsuarioCliente.Add(usuario_cliente);
            }
        }
    }
}
