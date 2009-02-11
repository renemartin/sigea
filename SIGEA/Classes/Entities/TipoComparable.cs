using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class TipoComparable
    {
        public static TipoComparable InsertNew(SIGEADataContext data_context, string descripcion)
        {
            TipoComparable tipo_comparable = new TipoComparable();
            tipo_comparable.descripcion = descripcion;
            data_context.TipoComparable.InsertOnSubmit(tipo_comparable);
            return tipo_comparable;
        }

        public void SetData(Dictionary<string, object> datosTipoComparable)
        {
            descripcion = datosTipoComparable["descripcion"].ToString();
        }

        public static TipoComparable GetFromDescripcion(SIGEADataContext data_context, string descripcion)
        {
            var tipo_comparable = data_context.TipoComparable.Where(t => t.descripcion == descripcion);
            if (!tipo_comparable.Any())
                return null;

            return tipo_comparable.Single();
        }

        public static TipoComparable GetForDataUpdate(SIGEADataContext data_context, string descripcion)
        {
            TipoComparable tipo_comparable = GetFromDescripcion(data_context, descripcion);
            if (tipo_comparable == null)
            {
                tipo_comparable = new TipoComparable();
                data_context.TipoComparable.InsertOnSubmit(tipo_comparable);
            }
            
            return tipo_comparable;
        }

    }
}
