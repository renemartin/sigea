using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class UsoActualInmueble
    {
        public static UsoActualInmueble GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var uso_actual_query = from u in data_context.UsoActualInmueble
                                   join i in data_context.Inmueble on u.idInmueble equals i.idInmueble
                                   join a in data_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                   where a.idAvaluo == idAvaluo
                                   select u;

            if(!uso_actual_query.Any())
                return null;

            return uso_actual_query.Single();
        }

        public static UsoActualInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            UsoActualInmueble datos_uso_actual = inmueble.UsoActualInmueble;

            if (datos_uso_actual == null)
            {
                datos_uso_actual = new UsoActualInmueble();
                datos_uso_actual.idInmueble = inmueble.idInmueble;
                data_context.UsoActualInmueble.InsertOnSubmit(datos_uso_actual);
            }

            return datos_uso_actual;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoEstacionamiento", idTipoEstacionamiento);
            data.Add("cupoEstacionamiento", cupoEstacionamiento);
            data.Add("jardinesFrontales", jardinesFrontales);
            data.Add("jardinesFondo", jardinesFondo);
            data.Add("jardinesLateral", jardinesLateral);
            data.Add("elevador", elevador);
            data.Add("cocina", cocina);
            data.Add("cocinaMuebles", cocinaMuebles);
            data.Add("cocinaIntegral", cocinaIntegral);
            data.Add("comedor", comedor);
            data.Add("despensa", despensa);
            data.Add("numBaniosCompletos", numBaniosCompletos);
            data.Add("numBaniosMedios", numBaniosMedios);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoEstacionamiento = short.Parse(data["idTipoEstacionamiento"].ToString());
            cupoEstacionamiento = data.ContainsKey("cupoEstacionamiento")
                ? (short?)short.Parse(data["cupoEstacionamiento"].ToString())
                : null;
            jardinesFrontales = (bool)data["jardinesFrontales"];
            jardinesFondo = (bool)data["jardinesFondo"];
            jardinesLateral = (bool)data["jardinesLateral"];
            elevador = (bool)data["elevador"];
            cocina = (bool)data["cocina"];
            cocinaMuebles = (bool)data["cocinaMuebles"];
            cocinaIntegral = (bool)data["cocinaIntegral"];
            comedor = (bool)data["comedor"];
            despensa = (bool)data["despensa"];
            numBaniosCompletos = short.Parse(data["numBaniosCompletos"].ToString());
            numBaniosMedios = short.Parse(data["numBaniosMedios"].ToString());
        }

        public override string ToString()
        {
            StringBuilder descripcion = new StringBuilder();

            descripcion.AppendFormat(
                "{0} EN PROPIEDAD {1} CON ELEMENTOS DE CONSTRUCCIÓN",
                Inmueble.TipoInmueble.descripcion,
                Inmueble.RegimenPropiedad.descripcion);

            if (TipoEstacionamiento != null)
            {
                if (TipoEstacionamiento.descripcion.ToLower() != "no cuenta con estacionamiento")
                {
                    descripcion.AppendFormat(", {0} CON CUPO PARA {1} CARRO(S)",
                        TipoEstacionamiento.descripcion, cupoEstacionamiento);
                }
                else
                {
                    descripcion.Append(", SIN ESTACIONAMIENTO");
                }
            }
            if (jardinesFrontales)
                descripcion.Append(", JARDINES FRONTALES");
            if (jardinesFrontales)
                descripcion.Append(", JARDINES AL FONDO");
            if (jardinesFrontales)
                descripcion.Append(", JARDINES LATERALES");
            if (elevador)
                descripcion.Append(", ELEVADOR");
            if (cocina)
            {
                descripcion.Append(", COCINA");
                if (cocinaIntegral)
                {
                    descripcion.Append(" INTEGRAL");
                }
                else
                {
                    descripcion.Append(" FORJADA EN SITIO");
                    if (cocinaMuebles)
                        descripcion.Append(" AMUEBLADA");
                    else
                        descripcion.Append(" CON TARJA");
                }
            }
            if (comedor && despensa)
                descripcion.Append(", CON COMEDOR Y DESPENSA");
            else if (comedor)
                descripcion.Append(", CON COMEDOR");
            else if (despensa)
                descripcion.Append(", CON DESPENSA");
            if (numBaniosCompletos != 0)
            {
                descripcion.AppendFormat(", {0} BAÑO(S) COMPLETO(S)",
                    numBaniosCompletos);
            }
            if (numBaniosMedios != 0)
            {
                descripcion.Append(string.Format(", {0} BAÑO(S) MEDIO(S)",
                    numBaniosMedios));
            }
            descripcion.Append("</BR>");

            foreach (Entities.UsoActualArea area in UsoActualArea)
            {
                descripcion.Append(area.TipoPlanta.descripcion + ": ");

                int num_recamaras = UsoActualRecamara.Where(r => r.planta == area.planta).Sum(r => r.cantidad);
                if (num_recamaras > 0)
                    descripcion.AppendFormat(" CON {0} RECAMARA(S)", num_recamaras);
                else
                    descripcion.AppendFormat(" CON ELEMENTOS DE NIVEL");
                if (area.vestibuloIngreso.HasValue && area.vestibuloIngreso.Value)
                    descripcion.Append(", VESTIBULO DE INGRESO");
                if (area.areaServicio.HasValue && area.areaServicio.Value)
                    descripcion.Append(", AREA DE SERVICIO DESCUBIERTA");
                if (area.sala.HasValue && area.sala.Value)
                    descripcion.Append(", SALA");
                if (area.escaleraPrincipal.HasValue && area.escaleraPrincipal.Value)
                    descripcion.Append(", ESCALERA PRINCIPAL");
                if (area.escaleraServicio)
                    descripcion.Append(", ESCALERA DE SERVICIO");
                if (area.cuartoServicio)
                    descripcion.Append(", CUARTO DE SERVICIO");
                if (area.cuartoLavado)
                    descripcion.Append(", CUARTO LAVADO");

                descripcion.Append("<BR/>");
            }


            return descripcion.ToString();
        }
    }

    public partial class UsoActualRecamara
    {
        public static Dictionary<string, object>[] GetRecamaras(UsoActualInmueble uso_actual)
        {
            var recamaras_query = from re in uso_actual.UsoActualRecamara
                                  orderby re.idUsoRecamara
                                  select re.GetData();

            if (!recamaras_query.Any())
                return null;

            return recamaras_query.ToArray();
        }
        public static void SetRecamaras(UsoActualInmueble uso_actual, Dictionary<string, object>[] data_set)
        {
            UsoActualRecamara recamara = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var recamaras_query = from re in uso_actual.UsoActualRecamara
                                      where re.idUsoRecamara == short.Parse(data["idUsoRecamara"].ToString())
                                      select re;

                if (recamaras_query.Any())
                {
                    recamara = recamaras_query.Single();
                }
                else
                {
                    recamara = new UsoActualRecamara();
                    uso_actual.UsoActualRecamara.Add(recamara);
                }

                recamara.SetData(data);
            }

            var delete_query = from re in uso_actual.UsoActualRecamara
                               where re.idUsoRecamara > data_set.Length
                               select re;
            foreach (UsoActualRecamara delete_item in delete_query.ToList())
                uso_actual.UsoActualRecamara.Remove(delete_item);
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idUsoRecamara", idUsoRecamara);
            data.Add("cantidad", cantidad);
            data.Add("planta", planta);
            data.Add("espacioCloset", espacioCloset);
            data.Add("closetEquipado", closetEquipado);
            data.Add("balcon", balcon);
            data.Add("vestidor", vestidor);
            data.Add("terraza", terraza);

            return data;
        }
        public void SetData(Dictionary<string, object> data)
        {
            idUsoRecamara = short.Parse(data["idUsoRecamara"].ToString());
            cantidad = short.Parse(data["cantidad"].ToString());
            planta = short.Parse(data["planta"].ToString());
            espacioCloset = (bool)data["espacioCloset"];
            closetEquipado = (bool)data["closetEquipado"];
            balcon = (bool)data["balcon"];
            vestidor = (bool)data["vestidor"];
            terraza = (bool)data["terraza"];
        }
    }

    public partial class UsoActualArea
    {
        public static Dictionary<string, object>[] GetPlantas(UsoActualInmueble uso_actual)
        {
            var plantas_query = from p in uso_actual.UsoActualArea
                                orderby p.planta
                                select p.GetData();

            if (!plantas_query.Any())
                return null;

            return plantas_query.ToArray();
        }
        public static void SetPlantas(UsoActualInmueble uso_actual, Dictionary<string, object>[] data_set)
        {
            UsoActualArea planta = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var plantas_query = from p in uso_actual.UsoActualArea
                                    where p.planta == short.Parse(data["planta"].ToString())
                                    select p;

                if (plantas_query.Any())
                {
                    planta = plantas_query.Single();
                }
                else
                {
                    planta = new UsoActualArea();
                    uso_actual.UsoActualArea.Add(planta);
                }

                planta.SetData(data);
            }

            var delete_query = from p in uso_actual.UsoActualArea
                               where p.planta > data_set.Length
                               select p;
            foreach (UsoActualArea delete_item in delete_query.ToList())
                uso_actual.UsoActualArea.Remove(delete_item);
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("planta", planta);
            data.Add("cuartoServicio", cuartoServicio);
            data.Add("cuartoLavado", cuartoLavado);
            data.Add("areaServicio", areaServicio);
            data.Add("vestibuloIngreso", vestibuloIngreso);
            data.Add("escaleraPrincipal", escaleraPrincipal);
            data.Add("sala", sala);
            data.Add("escaleraServicio", escaleraServicio);

            return data;
        }
        public void SetData(Dictionary<string, object> data)
        {
            planta = short.Parse(data["planta"].ToString());
            cuartoServicio = (bool)data["cuartoServicio"];
            cuartoLavado = (bool)data["cuartoLavado"];
            areaServicio = (bool)data["areaServicio"];
            vestibuloIngreso = (bool)data["vestibuloIngreso"];
            escaleraPrincipal = (bool)data["escaleraPrincipal"];
            sala = (bool)data["sala"];
            escaleraServicio = (bool)data["escaleraServicio"];

        }
    }
}
