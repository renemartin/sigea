﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAdvertencias.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAdvertencias" %>


<ol>
    <li>
        <asp:CheckBox ID="sinDocumentacion_CBox" runat="server" Text="NO SE DISPUSO DE DOCUMENTACIÓN RELEVANTE" />
    </li>
    <li>
        <asp:CheckBox ID="sinOferta_CBox" runat="server" Text="NO SE ENCUENTRAN OFERTAS DEL MERCADO EN LA ZONA SUFICIENTES PARA CONSIDERAR EL ENFOQUE COMPARATIVO DEL MERCADO" />
    </li>
    <li>
        <asp:CheckBox ID="dudaUso_CBox" runat="server" Text="EXISTE DUDA SOBRE EL USO DEL INMUEBLE O DE ALGUNA SECCION DEL MISMO" />
    </li>
    <li>
        <asp:CheckBox ID="obrasAfectacion_CBox" runat="server" Text="EXISTEN OBRAS PUBLICAS O PRIVADAS QUE AFECTAN LOS SERVICIOS EN LA COLONIA" />
    </li>
</ol>
<span>Otras advertencias:</span>
<br />
<asp:TextBox ID="otrasAdvertencias_TBox" runat="server" TextMode="MultiLine" 
    Height="70px" Width="550px" MaxLength="500"></asp:TextBox>

<script type="text/javascript">

    function Advertencias() {

        // Inicialización
        if (typeof (Advertencias_Init) == "undefined") {
            Advertencias_Init = true;
            Advertencias.prototype.setData = setData;
            Advertencias.prototype.getData = getData;
        }

        // Databindings
        function setData(data) {
            if (data != null) {
                $get("<%= sinDocumentacion_CBox.ClientID %>").checked = data.advertenciaDocumentacion;
                $get("<%= sinOferta_CBox.ClientID %>").checked = data.advertenciaOfertas;
                $get("<%= dudaUso_CBox.ClientID %>").checked = data.advertenciaUso;
                $get("<%= obrasAfectacion_CBox.ClientID %>").checked = data.advertenciaObras;
                $get("<%= otrasAdvertencias_TBox.ClientID %>").value = data.otrasAdvertencias;
            }
            else {
                $get("<%= sinDocumentacion_CBox.ClientID %>").checked = false;
                $get("<%= sinOferta_CBox.ClientID %>").checked = false;
                $get("<%= dudaUso_CBox.ClientID %>").checked = false;
                $get("<%= obrasAfectacion_CBox.ClientID %>").checked = false;
                $get("<%= otrasAdvertencias_TBox.ClientID %>").value = "";
            }
        }

        function getData() {
            var data = new Object();

            data.advertenciaDocumentacion = $get("<%= sinDocumentacion_CBox.ClientID %>").checked;
            data.advertenciaOfertas = $get("<%= sinOferta_CBox.ClientID %>").checked;
            data.advertenciaUso = $get("<%= dudaUso_CBox.ClientID %>").checked;
            data.advertenciaObras = $get("<%= obrasAfectacion_CBox.ClientID %>").checked;
            data.otrasAdvertencias = $get("<%= otrasAdvertencias_TBox.ClientID %>").value;

            return data;
        }
    }

    this["<%= ID %>"] = new Advertencias();
    
</script>