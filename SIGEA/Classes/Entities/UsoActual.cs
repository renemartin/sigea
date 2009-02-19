using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class UsoActualInmueble
    {
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
            cantidad = short.Parse(data["idViaAcceso"].ToString());
            planta = short.Parse(data["idImportanciaVia"].ToString());
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
        public static void SePlantas(UsoActualInmueble uso_actual, Dictionary<string, object>[] data_set)
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
        }
    }
}
