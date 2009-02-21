﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficies.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficies" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillSuperficiesData() {
        fillFuente("<%= fuenteTerreno_DDList.ClientID %>");
    }

    // DataBindings
    function setDatosSuperficies(data) {
        if (data != null) {
            $get("<%= superficieTerreno_TBox.ClientID %>").value = data.totalTerreno;
            $get("<%= fuenteTerreno_DDList.ClientID %>").selectedValue = data.fuenteTerreno;
            $get("<%= especFuenteTerreno_TBox.ClientID %>").value = data.otraFuenteTerreno;
            $get("<%= superficieFrente_TBox.ClientID %>").value = data.frenteLote;
        }
    }
    function getDatosSuperficies() {
        var data = new Object();

        data.totalTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
        data.fuenteTerreno = $get("<%= fuenteTerreno_DDList.ClientID %>").value;
        data.otraFuenteTerreno = $get("<%= especFuenteTerreno_TBox.ClientID %>").value;
        data.frenteLote = $get("<%= superficieFrente_TBox.ClientID %>").value;

        return data;
    }
    
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Superficie del terreno:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec">
            Fuente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteTerreno_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_terreno" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteTerreno_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Frente del lote:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieFrente_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
    </tr>
</table>
