<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosCondominio.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosCondominio" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficiesAdicionales.ascx"
    TagName="SuperficiesAdicionales" TagPrefix="SIGEA" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillCondominiosData() {
        fillFuente("<%= fuenteIndiviso_DDList.ClientID %>");
        fillFuente("<%= fuentePrivativo_DDList.ClientID %>");
    }

    // Databindings
    function setDatosCondominio(data) {
        if (data != null) {
            $get("<%= avanceAComunes_TBox.ClientID %>").value = data.avanceObra;
            $get("<%= unidRentNucleo_TBox.ClientID %>").value = data.unidadesRentNucleo;
            $get("<%= unidRentConjunto_TBox.ClientID %>").value = data.unidadesRentConjunto;
        }
    }
    function getDatosCondominio() {
        var data = new Object();

        data.avanceObra = $get("<%= avanceAComunes_TBox.ClientID %>").value;
        data.unidadesRentNucleo = $get("<%= unidRentNucleo_TBox.ClientID %>").value;
        data.unidadesRentConjunto = $get("<%= unidRentConjunto_TBox.ClientID %>").value;

        return data;
    }

    function setDatosSuperficiesCondominio(data) {
        if (data != null) {
            $get("<%= indiviso_TBox.ClientID %>").value = data.indiviso;
            $get("<%= superficieTerreno_TBox.ClientID %>").value = data.totalTerreno;
            $get("<%= fuenteIndiviso_DDList.ClientID %>").selectedValue = data.fuenteIndiviso;
            $get("<%= especFuenteIndiviso_TBox.ClientID %>").value = data.otraFuenteIndiviso;
            $get("<%= lotePrivativo_TBox.ClientID %>").value = data.privativo;
            $get("<%= fuentePrivativo_DDList.ClientID %>").value = data.fuentePrivativo;
            $get("<%= especFuentePrivativo_TBox.ClientID %>").value = data.otraFuentePrivativo;
        }
    }
    function getDatosSuperficiesCondominio() {
        var data = new Object();

        data.indiviso = $get("<%= indiviso_TBox.ClientID %>").value;
        data.totalTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
        data.fuenteIndiviso = $get("<%= fuenteIndiviso_DDList.ClientID %>").value;
        data.otraFuenteIndiviso = $get("<%= especFuenteIndiviso_TBox.ClientID %>").value;
        data.privativo = $get("<%= lotePrivativo_TBox.ClientID %>").value;
        data.fuentePrivativo = $get("<%= fuentePrivativo_DDList.ClientID %>").value;
        data.otraFuentePrivativo = $get("<%= especFuentePrivativo_TBox.ClientID %>").value;

        return data;
    }
    
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Superficie del terreno:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Avance de obra en áreas comúnes en condominios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceAComunes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables en el núcleo de construcción:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentNucleo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables del conjunto:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentConjunto_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td colspan="4" class="celdaHeader">
            Superficies del condominio
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Indiviso:
        </td>
        <td class="celdaValor" valign="top">
            <asp:TextBox ID="indiviso_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
            <div id="seccion_proporcional">
                <asp:Label ID="proporcional_Lbl" runat="server"></asp:Label>
            </div>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor" valign="top">
            <asp:DropDownList ID="fuenteIndiviso_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_indiviso" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteIndiviso_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Lote privativo
        </td>
        <td class="celdaValor" valign="top">
            <asp:TextBox ID="lotePrivativo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor" valign="top">
            <asp:DropDownList ID="fuentePrivativo_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_privativo" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuentePrivativo_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaHeader">
            Áreas cubiertas
        </td>
        <td class="celdaHeader">
            Obras complementarias
        </td>
    </tr>
    <tr>
        <td valign="top">
            <SIGEA:SuperficiesAdicionales ID="superficiesConstrucciones_Ctrl" runat="server" />
        </td>
        <td valign="top">
            <SIGEA:SuperficiesAdicionales ID="superficiesObras_Ctrl" runat="server" />
        </td>
    </tr>
</table>
