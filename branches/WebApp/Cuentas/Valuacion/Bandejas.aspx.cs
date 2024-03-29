﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_Bandejas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetAttributes();
        GetBandejasCount();

        avaluos_GridView.DataBind();
    }

    public string ValidateUrlFoto(string url)
    {
        string ruta_base = "../../";
        string ruta_imagen = string.IsNullOrEmpty(url)
            ? "Images/NoDisponible.jpg"
            : url;

        return ruta_base + ruta_imagen;
    }
    public string GetMensajeSinDatos()
    {
        if (Session["tipoBandeja"] == null)
            return "Seleccione una bandeja";
        return "Sin registros";
    }

    private void GetBandejasCount()
    {
        Bandejas bandejas = new Bandejas();
        int[] cuenta = bandejas.GetCount();

        noAsignados_Lbl.Text = string.Format("{0}", cuenta[0]);
        enProceso_Lbl.Text = string.Format("{0}", cuenta[1]);
        enCoreccion_Lbl.Text = string.Format("{0}", cuenta[2]);
        enRevision_Lbl.Text = string.Format("{0}", cuenta[3]);
        completados_Lbl.Text = string.Format("{0}", cuenta[4]);
    }
    private void SetAttributes()
    {
        search_ImBtn.OnClientClick = "verificarExistenciaAvaluo(); return false;";

        refresh_ImBtn.Click += new ImageClickEventHandler(refresh_ImBtn_Click);
        noAsignados_LkBtn.Click += new EventHandler(noAsignados_LkBtn_Click);
        enProceso_LkBtn.Click += new EventHandler(enProceso_LkBtn_Click);
        enCorreccion_LkBtn.Click += new EventHandler(enCorreccion_LkBtn_Click);
        enRevision_LkBtn.Click += new EventHandler(enRevision_LkBtn_Click);
        completados_LkBtn.Click += new EventHandler(completados_LkBtn_Click);
    }

    private void refresh_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        GetBandejasCount();
    }
    private void noAsignados_LkBtn_Click(object sender, EventArgs e)
    {
        Session["tipoBandeja"] = Bandejas.TipoBandeja.NoAsignados;
    }
    private void enProceso_LkBtn_Click(object sender, EventArgs e)
    {
        Session["tipoBandeja"] = Bandejas.TipoBandeja.EnProceso;
    }
    private void enCorreccion_LkBtn_Click(object sender, EventArgs e)
    {
        Session["tipoBandeja"] = Bandejas.TipoBandeja.EnCorreccion;
    }
    private void enRevision_LkBtn_Click(object sender, EventArgs e)
    {
        Session["tipoBandeja"] = Bandejas.TipoBandeja.EnRevision;
    }
    private void completados_LkBtn_Click(object sender, EventArgs e)
    {
        Session["tipoBandeja"] = Bandejas.TipoBandeja.Completados;
    }
}
