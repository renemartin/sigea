using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    #region Enfoque de Costos
    public partial class EnfoqueCostos
    {
        public static EnfoqueCostos GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var enfoque_costos = from ec in data_context.EnfoqueCostos
                                 where ec.idAvaluo == idAvaluo
                                 select ec;

            if (!enfoque_costos.Any())
                return null;

            return enfoque_costos.Single();
        }

        public static EnfoqueCostos GetForDataUpdate(SIGEADataContext data_context, AvaluoInmobiliario avaluo)
        {
            EnfoqueCostos enfoqueCostos = avaluo.EnfoqueCostos;

            if (enfoqueCostos == null)
            {
                enfoqueCostos = new EnfoqueCostos();
                avaluo.EnfoqueCostos = enfoqueCostos; 
                //enfoqueCostos.idAvaluo = avaluo.idAvaluo;
                //data_context.EnfoqueCostos.InsertOnSubmit(enfoqueCostos);
            }

            return enfoqueCostos;
        }
        
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("VUHP", VUHP);
            data.Add("VUHTA", VUHTA);
            data.Add("valorTerreno", valorTerreno);
            data.Add("valorCP", valorCP);
            data.Add("valorCI", valorCI);
            data.Add("valorConstrucciones", valorConstrucciones);
            data.Add("valorIP", valorIP);
            data.Add("valorIC", valorIC);
            data.Add("valorInstalaciones", valorInstalaciones);
            data.Add("valorFisico", valorFisico);
            data.Add("loteTipo", loteTipo);
            data.Add("superficieConstruida", superficieConstruida);
            data.Add("superficieConstruidaM2", superficieConstruidaM2);
            data.Add("indivisoCC", indivisoCC);
            data.Add("indivsoIC", indivisoIC);
            data.Add("homologacionLoteTipo", homologacionLoteTipo);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        { 
            VUHP = decimal.Parse(data["VUHP"].ToString());
            VUHTA = decimal.Parse(data["VUHTA"].ToString());
            valorTerreno = decimal.Parse(data["valorTerreno"].ToString());
            valorCP = decimal.Parse(data["valorCP"].ToString());
            valorCI = decimal.Parse(data["valorCI"].ToString());
            valorConstrucciones = decimal.Parse(data["valorConstrucciones"].ToString());
            valorIP = decimal.Parse(data["valorIP"].ToString());
            valorIC = decimal.Parse(data["valorIC"].ToString());
            valorInstalaciones = decimal.Parse(data["valorInstalaciones"].ToString());
            valorFisico = decimal.Parse(data["valorFisico"].ToString());
            loteTipo = float.Parse(data["loteTipo"].ToString());
            superficieConstruida = float.Parse(data["superficieConstruida"].ToString());
            superficieConstruidaM2 = float.Parse(data["superficieConstruidaM2"].ToString());
            indivisoCC = bool.Parse(data["indivisoCC"].ToString());
            indivisoIC = bool.Parse(data["indivisoIC"].ToString());
            homologacionLoteTipo = bool.Parse(data["homologacionLoteTipo"].ToString());
        }
    }

    public partial class EnfoqueCostosConstrucciones
    {
        public static EnfoqueCostosConstrucciones GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var enfoque_costos_construcciones = from ecc in data_context.EnfoqueCostosConstrucciones
                                                join ec in data_context.EnfoqueCostos on ecc.idAvaluo equals ec.idAvaluo
                                                join a in data_context.AvaluoInmobiliario on ec.idAvaluo equals a.idAvaluo
                                                where a.idAvaluo == idAvaluo
                                                select ecc;

            if (!enfoque_costos_construcciones.Any())
                return null;

            return enfoque_costos_construcciones.Single();
        }

        public static EnfoqueCostosConstrucciones GetForDataUpdate(SIGEADataContext data_context, EnfoqueCostos enfoque_costos)
        {
            EnfoqueCostosConstrucciones enfoque_costos_construcciones = enfoque_costos.EnfoqueCostosConstrucciones.Single();

            if (enfoque_costos_construcciones == null)
            {
                enfoque_costos_construcciones = new EnfoqueCostosConstrucciones();
                enfoque_costos_construcciones.idAvaluo = enfoque_costos.idAvaluo;
                data_context.EnfoqueCostosConstrucciones.InsertOnSubmit(enfoque_costos_construcciones);
            }

            return enfoque_costos_construcciones;
        }

        public static Dictionary<string, object>[] GetEnfoqueCostosConstruccion(EnfoqueCostos enfoque_costos, bool comun)
        {
            var enfoque_costos_construcciones = from ecc in enfoque_costos.EnfoqueCostosConstrucciones
                                                where ecc.comun == comun
                                                select ecc.GetData();

            if (!enfoque_costos_construcciones.Any())
                return null;

            return enfoque_costos_construcciones.ToArray();
        }

        public static void SetEnfoqueCostosConstruccion(SIGEADataContext data_context, EnfoqueCostos enfoque_costos, Dictionary<string, object>[] data_set, bool comun)
        {
            EnfoqueCostosConstrucciones enfoque_costos_construccion = null;

            foreach(Dictionary<string, object> data in data_set)
            {
                var enfoque_costos_construccion_query = from ecc in enfoque_costos.EnfoqueCostosConstrucciones
                                                        where ecc.idAvaluo == enfoque_costos.idAvaluo && ecc.comun == comun
                                                        select ecc;

                if (enfoque_costos_construccion_query.Any())
                    enfoque_costos_construccion = enfoque_costos_construccion_query.Single();
                else
                {
                    enfoque_costos_construccion = new EnfoqueCostosConstrucciones();
                    enfoque_costos_construccion.idAvaluo = enfoque_costos.idAvaluo;
                    enfoque_costos_construccion.comun = comun;
                    enfoque_costos.EnfoqueCostosConstrucciones.Add(enfoque_costos_construccion);
                }

                enfoque_costos_construccion.SetData(data);
            }

            var delete_query = from ecc in enfoque_costos.EnfoqueCostosConstrucciones
                               where ecc.idAvaluo > data_set.Length
                               select ecc;

            data_context.EnfoqueCostosConstrucciones.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("num_construccion", num_construccion);
            data.Add("descripcion", descripcion);
            data.Add("clase", clase);
            data.Add("superficie", superficie);
            data.Add("VURN", VURN);
            data.Add("depreciacion", depreciacion);
            data.Add("valorNeto", valorNeto);
            data.Add("valorParcial", valorParcial);
            data.Add("indiviso", indiviso);
            data.Add("comun", comun);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            num_construccion = short.Parse(data["num_construccion"].ToString());
            descripcion = data["descripcion"].ToString();
            clase = data["clase"].ToString();
            superficie = float.Parse(data["superficie"].ToString());
            VURN = float.Parse(data["VURN"].ToString());
            depreciacion = float.Parse(data["depreciacion"].ToString());
            valorNeto = decimal.Parse(data["valorNeto"].ToString());
            valorParcial = decimal.Parse(data["valorParcial"].ToString());
            indiviso = bool.Parse(data["indiviso"].ToString());
            comun = bool.Parse(data["comun"].ToString());
        }
    }

    public partial class EnfoqueCostosHomologacion
    {
        public static EnfoqueCostosHomologacion GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var homologacion_query = from h in data_context.EnfoqueCostosHomologacion
                                     join ec in data_context.EnfoqueCostos on h.idAvaluo equals ec.idAvaluo
                                     join a in data_context.AvaluoInmobiliario on ec.idAvaluo equals a.idAvaluo
                                     where a.idAvaluo == idAvaluo
                                     select h;
            if (!homologacion_query.Any())
                return null;

            return homologacion_query.Single();
        }

        public static EnfoqueCostosHomologacion GetForDataUpdate(SIGEADataContext data_context, AvaluoInmobiliario avaluo, EnfoqueCostos enfoque_costos)
        {
            EnfoqueCostosHomologacion homologacion = enfoque_costos.EnfoqueCostosHomologacion.Single();

            if (homologacion == null)
            {
                homologacion = new EnfoqueCostosHomologacion();
                homologacion.idAvaluo = enfoque_costos.idAvaluo;
                data_context.EnfoqueCostosHomologacion.InsertOnSubmit(homologacion);
            }

            return homologacion;
        }

        public static Dictionary<string, object>[] GetEnfoqueCostosHomologacion(EnfoqueCostos enfoque_costos)
        {
            var homologacion = from h in enfoque_costos.EnfoqueCostosHomologacion
                                select h.GetData();

            if (!homologacion.Any())
                return null;

            return homologacion.ToArray();
        }

        public static void SetEnfoqueCostosHomologacion(SIGEADataContext data_context, EnfoqueCostos enfoque_costos, Dictionary<string, object>[] data_set)
        {
            EnfoqueCostosHomologacion homologacion = null;

            foreach (Dictionary<string, object> data in data_set)
            {
                var homologacion_query = from h in enfoque_costos.EnfoqueCostosHomologacion
                                                        where h.idAvaluo == enfoque_costos.idAvaluo
                                                        select h;

                if (homologacion_query.Any())
                    homologacion = homologacion_query.Single();
                else
                {
                    homologacion = new EnfoqueCostosHomologacion();
                    enfoque_costos.EnfoqueCostosHomologacion.Add(homologacion);
                }

                homologacion.SetData(data);
            }

            var delete_query = from h in enfoque_costos.EnfoqueCostosHomologacion
                               where h.idAvaluo > data_set.Length
                               select h;

            data_context.EnfoqueCostosHomologacion.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("FCOM", FCOM);
            data.Add("VAT", VAT);
            data.Add("VUT", VUT);
            data.Add("FZo", FZo);
            data.Add("FUb", FUb);
            data.Add("FFr", FFr);
            data.Add("FFo", FFo);
            data.Add("FSu", FSu);
            data.Add("FTo", FTo);
            data.Add("FUs", FUs);
            data.Add("FLo", FLo);
            data.Add("FRe", FRe);
            data.Add("FRER", FRER);
            data.Add("VUTH", VUTH);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            FCOM = float.Parse(data["FCOM"].ToString());
            VAT = decimal.Parse(data["VAT"].ToString());
            VUT = decimal.Parse(data["VUT"].ToString());
            FZo = float.Parse(data["FZo"].ToString());
            FUb = float.Parse(data["FUb"].ToString());
            FFr = float.Parse(data["FFr"].ToString());
            FFo = float.Parse(data["FFo"].ToString());
            FSu = float.Parse(data["FSu"].ToString());
            FTo = float.Parse(data["FTo"].ToString());
            FUs = float.Parse(data["FUs"].ToString());
            FLo = float.Parse(data["Flo"].ToString());
            FRe = float.Parse(data["FRe"].ToString());
            FRER = float.Parse(data["FRER"].ToString());
            VUTH = decimal.Parse(data["VUTH"].ToString());
        }
    }

    public partial class EnfoqueCostosInstalaciones
    {
        public static EnfoqueCostosInstalaciones GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var instalaciones_query = from i in data_context.EnfoqueCostosInstalaciones
                                      join ec in data_context.EnfoqueCostos on i.idAvaluo equals ec.idAvaluo
                                      join a in data_context.AvaluoInmobiliario on ec.idAvaluo equals a.idAvaluo
                                      where a.idAvaluo == idAvaluo
                                      select i;

            if (!instalaciones_query.Any())
                return null;

            return instalaciones_query.Single();                                       
        }

        public static EnfoqueCostosInstalaciones GetForDataUpdate(SIGEADataContext data_context,EnfoqueCostos enfoque_costos)
        {
            EnfoqueCostosInstalaciones instalaciones = enfoque_costos.EnfoqueCostosInstalaciones.Single();

            if (instalaciones == null)
            {
                instalaciones = new EnfoqueCostosInstalaciones();
                instalaciones.idAvaluo = enfoque_costos.idAvaluo;
                data_context.EnfoqueCostosInstalaciones.InsertOnSubmit(instalaciones);                
            }

            return instalaciones;
        }

        public static Dictionary<string, object>[] GetEnfoqueCostosInstalaciones(EnfoqueCostos enfoque_costos, bool comun)
        {
            var instalacion = from i in enfoque_costos.EnfoqueCostosInstalaciones
                              where i.comun == comun
                              select i.GetData();

            if (!instalacion.Any())
                return null;

            return instalacion.ToArray();
        }

        public static void SetEnfoqueCostosInstalaciones(SIGEADataContext data_context, EnfoqueCostos enfoque_costos, Dictionary<string, object>[] data_set, bool comun)
        {
            EnfoqueCostosInstalaciones instalacion = null;

            foreach (Dictionary<string, object> data in data_set)
            {
                var instalacion_query = from i in enfoque_costos.EnfoqueCostosInstalaciones
                                        where i.idAvaluo == enfoque_costos.idAvaluo && i.comun == comun
                                        select i;

                if (instalacion_query.Any())
                    instalacion = instalacion_query.Single();

                else
                {
                    instalacion = new EnfoqueCostosInstalaciones();
                    instalacion.idAvaluo = enfoque_costos.idAvaluo;
                    instalacion.comun = comun;
                    enfoque_costos.EnfoqueCostosInstalaciones.Add(instalacion);
                }

                instalacion.SetData(data);
            }

            var delete_query = from i in enfoque_costos.EnfoqueCostosInstalaciones
                               where i.idAvaluo > data_set.Length
                               select i;

            data_context.EnfoqueCostosInstalaciones.DeleteAllOnSubmit(delete_query.ToList());
        }
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("num_construccion", num_construccion);
            data.Add("cantidad", cantidad);
            data.Add("unidad", unidad);
            data.Add("VURN", VURN);
            data.Add("depreciacion", depreciacion);
            data.Add("valorNeto", valorNeto);
            data.Add("valorParcial", valorParcial);
            data.Add("tipoInstalacion", tipoInstalacion);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            num_construccion = short.Parse(data["num_construccion"].ToString());
            cantidad = double.Parse(data["cantidad"].ToString());
            unidad = data["unidad"].ToString();
            VURN = float.Parse(data["VURN"].ToString());
            depreciacion = float.Parse(data["depreciacion"].ToString());
            valorNeto = decimal.Parse(data["valorNeto"].ToString());
            valorParcial = decimal.Parse(data["valorParcial"].ToString());
            tipoInstalacion = data["tipoInstalacion"].ToString();
        }
    }
    #endregion

    #region Enfoque de Ingresos
    public partial class EnfoqueIngresos
    {
        public static EnfoqueIngresos GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var enfoque_ingresos = from e in data_context.EnfoqueIngresos
                                   where e.idAvaluo == idAvaluo
                                   select e;

            if (!enfoque_ingresos.Any())
                return null;

            return enfoque_ingresos.Single();
        }

        public static EnfoqueIngresos GetForDataUpdate(SIGEADataContext data_context, AvaluoInmobiliario avaluo)
        {
            EnfoqueIngresos enfoque_ingresos = avaluo.EnfoqueIngresos;

            if (enfoque_ingresos == null)
            {
                enfoque_ingresos = new EnfoqueIngresos();
                avaluo.EnfoqueIngresos = enfoque_ingresos;
            }

            return enfoque_ingresos;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("VURHP", VURHP);
            data.Add("VURA", VURA);
            data.Add("rentaBruta", rentaBruta);
            data.Add("mesesVacio", mesesVacio);
            data.Add("aniosVacio", aniosVacio);
            data.Add("predial", predial);
            data.Add("predialAnual", predialAnual);
            data.Add("mantenimiento", mantenimiento);
            data.Add("administracion", administracion);
            data.Add("seguros", seguros);
            data.Add("otros", otros);
            data.Add("depreciacion", depreciacion);
            data.Add("ISR", ISR);
            data.Add("deducciones", deducciones);
            data.Add("PLM", PLM);
            data.Add("PLA", PLA);
            data.Add("tasaReferencia", tasaReferencia);
            data.Add("tiempoVenta", tiempoVenta);
            data.Add("gastosVenta", gastosVenta);
            data.Add("tasaReal", tasaReal);
            data.Add("tasaLiquidez", tasaLiquidez);
            data.Add("tasaRecuperacion", tasaRecuperacion);
            data.Add("tasaEnfoqueFinanciero", tasaEnfoqueFinanciero);
            data.Add("tasaEnfoqueMercado", tasaEnfoqueMercado);
            data.Add("enfoqueFinanciero", enfoqueFinanciero);
            data.Add("resultadoAplicaicon", resultadoAplicacion);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            VURHP = decimal.Parse(data["VURHP"].ToString());
            VURA = decimal.Parse(data["VURA"].ToString());
            rentaBruta = decimal.Parse(data["rentaBruta"].ToString());
            mesesVacio = short.Parse(data["mesesVacio"].ToString());
            aniosVacio = short.Parse(data["aniosVacio"].ToString());
            predial = decimal.Parse(data["predial"].ToString());
            predialAnual = bool.Parse(data["predialAnual"].ToString());
            mantenimiento = float.Parse(data["mantenimiento"].ToString());
            administracion = float.Parse(data["administracion"].ToString());
            seguros = float.Parse(data["seguros"].ToString());
            otros = float.Parse(data["otros"].ToString());
            depreciacion = decimal.Parse(data["depreciacion"].ToString());
            ISR = float.Parse(data["ISR"].ToString());
            deducciones = decimal.Parse(data["deducciones"].ToString());
            PLM = decimal.Parse(data["PLM"].ToString());
            PLA = decimal.Parse(data["PLA"].ToString());
            tasaReferencia = float.Parse(data["tasaReferencia"].ToString());
            tiempoVenta = float.Parse(data["tiempoVenta"].ToString());
            gastosVenta = float.Parse(data["gastosVenta"].ToString());
            tasaReal = float.Parse(data["tasaReal"].ToString());
            tasaLiquidez = float.Parse(data["tasaLiquidez"].ToString());
            tasaRecuperacion = float.Parse(data["tasaRecuperacion"].ToString());
            tasaEnfoqueFinanciero = float.Parse(data["tasaEnfoqueFinanciero"].ToString());
            tasaEnfoqueMercado = float.Parse(data["tasaEnfoqueMercado"].ToString());
            enfoqueFinanciero = bool.Parse(data["enfoqueFinanciero"].ToString());
            resultadoAplicacion = decimal.Parse(data["resultadoAplicacion"].ToString());
        }
    }

    public partial class EnfoqueIngresosHomologacion
    {
        public static EnfoqueIngresosHomologacion GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var ingresos_homologacion = from ih in data_context.EnfoqueIngresosHomologacion
                                        where ih.idAvaluo == idAvaluo
                                        select ih;

            if (!ingresos_homologacion.Any())
                return null;

            return ingresos_homologacion.Single();
        }

        public static EnfoqueIngresosHomologacion GetForDataUpdate(SIGEADataContext data_context, EnfoqueIngresos enfoque_ingresos)
        {
            EnfoqueIngresosHomologacion ingresosHomologacion = enfoque_ingresos.EnfoqueIngresosHomologacion.Single();

            if (ingresosHomologacion == null)
            {
                ingresosHomologacion = new EnfoqueIngresosHomologacion();
                ingresosHomologacion.idAvaluo = enfoque_ingresos.idAvaluo;
                data_context.EnfoqueIngresosHomologacion.InsertOnSubmit(ingresosHomologacion);
            }

            return ingresosHomologacion;
        }

        public static Dictionary<string, object>[] GetEnfoqueIngresosHomologacion(EnfoqueIngresos enfoque_ingresos)
        {
            var homologacion = from h in enfoque_ingresos.EnfoqueIngresosHomologacion
                               where h.idAvaluo == enfoque_ingresos.idAvaluo
                               select h.GetData();

            if (!homologacion.Any())
                return null;

            return homologacion.ToArray();
        }

        public static void SetEnfoqueIngresosHomologacion(SIGEADataContext data_context, EnfoqueIngresos enfoque_ingresos, Dictionary<string, object>[] data_set)
        {
            EnfoqueIngresosHomologacion homologacion = null;

            foreach (Dictionary<string, object> data in data_set)
            {
                var homologacion_query = from h in enfoque_ingresos.EnfoqueIngresosHomologacion
                                         where h.idAvaluo == enfoque_ingresos.idAvaluo
                                         select h;

                if (homologacion_query.Any())
                    homologacion = homologacion_query.Single();
                else 
                {
                    homologacion = new EnfoqueIngresosHomologacion();
                    homologacion.idAvaluo = enfoque_ingresos.idAvaluo;
                    enfoque_ingresos.EnfoqueIngresosHomologacion.Add(homologacion);
                }

                enfoque_ingresos.SetData(data);
            }

            var delete_query = from h in enfoque_ingresos.EnfoqueIngresosHomologacion
                               where h.idAvaluo > data_set.Length
                               select h;

            data_context.EnfoqueIngresosHomologacion.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("caso", caso);
            data.Add("FCOM", FCOM);
            data.Add("VA", VA);
            data.Add("superficie", superficie);
            data.Add("VUAR", VUAR);
            data.Add("FED", FED);
            data.Add("FCO", FCO);
            data.Add("FCL", FCL);
            data.Add("FUB", FUB);
            data.Add("FPR", FPR);
            data.Add("FLO", FLO);
            data.Add("FSU", FSU);
            data.Add("FUS", FUS);
            data.Add("FRE", FRE);
            data.Add("VURH", VURH);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            caso = short.Parse(data["caso"].ToString());
            FCOM = float.Parse(data["FCOM"].ToString());
            VA = decimal.Parse(data["VA"].ToString());
            superficie = float.Parse(data["superficie"].ToString());
            VUAR = decimal.Parse(data["VUAR"].ToString());
            FED = float.Parse(data["FED"].ToString());
            FCO = float.Parse(data["FCO"].ToString());
            FCL = float.Parse(data["FCL"].ToString());
            FUB = float.Parse(data["FUB"].ToString());
            FPR = float.Parse(data["FPR"].ToString());
            FLO = float.Parse(data["FLO"].ToString());
            FSU = float.Parse(data["FSU"].ToString());
            FUS = float.Parse(data["FUS"].ToString());
            FRE = float.Parse(data["FRE"].ToString());
            VURH = decimal.Parse(data["VURH"].ToString());
        }
    }
    #endregion

    #region Enfoque de Mercado
    public partial class EnfoqueMercado
    {
        public static EnfoqueMercado GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var enfoque_mercado = from e in data_context.EnfoqueMercado
                                  where e.idAvaluo == idAvaluo
                                  select e;

            if (!enfoque_mercado.Any())
                return null;

            return enfoque_mercado.Single();
        }

        public static EnfoqueMercado GetDataForUpdate(SIGEADataContext data_context, AvaluoInmobiliario avaluo)
        {
            EnfoqueMercado mercado = avaluo.EnfoqueMercado;

            if (mercado == null)
            {
                mercado = new EnfoqueMercado();
                avaluo.EnfoqueMercado = mercado;
            }

            return mercado;
        }

        public Dictionary<string, object> GetData() 
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("VUVHP", VUVHP);
            data.Add("VUVA", VUVA);
            data.Add("resultadoAplicacion", resultadoAplicacion);
            data.Add("detalle", detalle);
            data.Add("numConst", numConst);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            VUVHP = decimal.Parse(data["VUVHP"].ToString());
            VUVA = decimal.Parse(data["VUVA"].ToString());
            resultadoAplicacion = decimal.Parse(data["resultadoAplicacion"].ToString());
            detalle = data["detalle"].ToString();
            numConst = int.Parse(data["numConst"].ToString());
        }
    }

    public partial class EnfoqueMercadoAplicacion
    {
        public static EnfoqueMercadoAplicacion GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var mercado_aplicacion = from ma in data_context.EnfoqueMercadoAplicacion
                                     join e in data_context.EnfoqueMercado on ma.idAvaluo equals e.idAvaluo
                                     join a in data_context.AvaluoInmobiliario on e.idAvaluo equals a.idAvaluo
                                     where a.idAvaluo == idAvaluo
                                     select ma;

            if (!mercado_aplicacion.Any())
                return null;

            return mercado_aplicacion.Single();
        }

        public static EnfoqueMercadoAplicacion GetForDataUpdate(SIGEADataContext data_context, EnfoqueMercado enfoque_mercado)
        {
            EnfoqueMercadoAplicacion aplicacion = enfoque_mercado.EnfoqueMercadoAplicacion.Single();

            if (aplicacion == null)
            {
                aplicacion = new EnfoqueMercadoAplicacion();
                aplicacion.idAvaluo = enfoque_mercado.idAvaluo;
                data_context.EnfoqueMercadoAplicacion.InsertOnSubmit(aplicacion);
            }

            return aplicacion;
        }

        public static Dictionary<string, object>[] GetEnfoqueMercadoAplicacion(EnfoqueMercado enfoque_mercado)
        {
            var mercado_aplicacion = from em in enfoque_mercado.EnfoqueMercadoAplicacion
                                     where em.idAvaluo == enfoque_mercado.idAvaluo
                                     select em.GetData();

            if (!mercado_aplicacion.Any() == null)
                return null;

            return mercado_aplicacion.ToArray();
        }

        public static void SetEnfoqueMercadoAplicacion(SIGEADataContext data_context, EnfoqueMercado enfoque_mercado, Dictionary<string, object>[] data_set)
        {
            EnfoqueMercadoAplicacion mercado_aplicacion = null;

            foreach (Dictionary<string, object> data in data_set)
            {
                var mercado_aplicacion_query = from ma in enfoque_mercado.EnfoqueMercadoAplicacion
                                               where ma.idAvaluo == enfoque_mercado.idAvaluo
                                               select ma;

                if (mercado_aplicacion_query.Any())
                    mercado_aplicacion = mercado_aplicacion_query.Single();
                else 
                {
                    mercado_aplicacion = new EnfoqueMercadoAplicacion();
                    mercado_aplicacion.idAvaluo = enfoque_mercado.idAvaluo;
                    enfoque_mercado.EnfoqueMercadoAplicacion.Add(mercado_aplicacion);
                }

                mercado_aplicacion.SetData(data);
            }

            var delete_query = from ma in enfoque_mercado.EnfoqueMercadoAplicacion
                               where ma.idAvaluo > data_set.Length
                               select ma;
            data_context.EnfoqueMercadoAplicacion.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("caso", caso);
            data.Add("valorParcial", valorParcial);
            data.Add("descripcion", descripcion);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            caso = short.Parse(data["caso"].ToString());
            valorParcial = decimal.Parse(data["valorParcial"].ToString());
            descripcion = data["descripcion"].ToString();
        }
    }

    public partial class EnfoqueMercadoHomologacion
    {
        public static EnfoqueMercadoHomologacion GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var homologacion = from h in data_context.EnfoqueMercadoHomologacion
                               join e in data_context.EnfoqueMercado on h.idAvaluo equals e.idAvaluo
                               join a in data_context.AvaluoInmobiliario on e.idAvaluo equals a.idAvaluo
                               where a.idAvaluo == idAvaluo
                               select h;

            if (!homologacion.Any())
                return null;

            return homologacion.Single();
        }

        public static EnfoqueMercadoHomologacion GetForDataUpdate(SIGEADataContext data_context, EnfoqueMercado enfoque_mercado)
        {
            EnfoqueMercadoHomologacion homologacion = enfoque_mercado.EnfoqueMercadoHomologacion.Single();

            if (homologacion == null)
            {
                homologacion = new EnfoqueMercadoHomologacion();
                homologacion.idAvaluo = enfoque_mercado.idAvaluo;
                data_context.EnfoqueMercadoHomologacion.InsertOnSubmit(homologacion);
            }

            return homologacion;
        }

        public static Dictionary<string, object>[] GetEnfoqueMercadoHomologacion(EnfoqueMercado enfoque_mercado)
        {
            var homologacion = from h in enfoque_mercado.EnfoqueMercadoHomologacion
                               where h.idAvaluo == enfoque_mercado.idAvaluo
                               select h.GetData();

            if (!homologacion.Any() == null)
                return null;

            return homologacion.ToArray();
        }

        public static void SetEnfoqueMercadoHomologacion(SIGEADataContext data_context, EnfoqueMercado enfoque_mercado, Dictionary<string, object>[] data_set)
        {
            EnfoqueMercadoHomologacion homologacion = null;

            foreach (Dictionary<string, object> data in data_set)
            {
                var homologacion_query = from h in enfoque_mercado.EnfoqueMercadoHomologacion
                                         where h.idAvaluo == enfoque_mercado.idAvaluo
                                         select h;

                if (homologacion_query.Any())
                    homologacion = homologacion_query.Single();
                else 
                {
                    homologacion = new EnfoqueMercadoHomologacion();
                    homologacion.idAvaluo = enfoque_mercado.idAvaluo;
                    enfoque_mercado.EnfoqueMercadoHomologacion.Add(homologacion);
                }

                homologacion.SetData(data);
            }

            var delete_query = from h in enfoque_mercado.EnfoqueMercadoHomologacion
                               where h.idAvaluo > data_set.Length
                               select h;

            data_context.EnfoqueMercadoHomologacion.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("caso", caso);
            data.Add("FCOM", FCOM);
            data.Add("valorAjustado", valorAjustado);
            data.Add("superficieVendible", superficieVendible);
            data.Add("VUAV", VUAV);
            data.Add("FED", FED);
            data.Add("FCO", FCO);
            data.Add("FCL", FCL);
            data.Add("FUB", FUB);
            data.Add("FPR", FPR);
            data.Add("FLO", FLO);
            data.Add("FSU", FSU);
            data.Add("FUS", FUS);
            data.Add("FRE", FRE);
            data.Add("VUVH", VUVH);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            caso = short.Parse(data["caso"].ToString());
            FCOM = float.Parse(data["FCOM"].ToString());
            valorAjustado = decimal.Parse(data["valorAjustado"].ToString());
            superficieVendible = float.Parse(data["superficieVendible"].ToString());
            VUAV = decimal.Parse(data["VUAV"].ToString());
            FED = float.Parse(data["FED"].ToString());
            FCO = float.Parse(data["FCO"].ToString());
            FCL = float.Parse(data["FCL"].ToString());
            FUB = float.Parse(data["FUB"].ToString());
            FPR = float.Parse(data["FPR"].ToString());
            FLO = float.Parse(data["FLO"].ToString());
            FSU = float.Parse(data["FSU"].ToString());
            FUS = float.Parse(data["FUS"].ToString());
            FRE = float.Parse(data["FRE"].ToString());
            VUVH = decimal.Parse(data["VUVH"].ToString());
        }
    }
    #endregion
}