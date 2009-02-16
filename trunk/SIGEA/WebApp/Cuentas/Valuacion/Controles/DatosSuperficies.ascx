<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficies.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficies" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficiesAdicionales.ascx"
    TagName="SuperficiesAdicionales" TagPrefix="SIGEA" %>

<script type="text/javascript">
    // Llenado de datos
    function fillSuperficiesData() {
        fillFuente("<%= fuenteTerreno_DDList.ClientID %>");
        fillFuente("<%= fuenteIndiviso_DDList.ClientID %>");
        fillFuente("<%= fuentePrivativo_DDList.ClientID %>");
    }

    //mostrar datos
    function setDatosSuperficies(data) {
        $get("<%= superficieTerreno_TBox.ClientID %>").value = data.superficieTerreno;
        $get("<%= fuenteTerreno_DDList.ClientID %>").selectedValue = data.fuenteTerreno;
        $get("<%= especFuenteTerreno_TBox.ClientID %>").value = data.especFuenteTerreno;
        $get("<%= superficieFrente_TBox.ClientID %>").value = data.superficieFrente;
        $get("<%= indiviso_TBox.ClientID %>").value = data.indiviso;
        $get("<%= superficieTerreno_TBox.ClientID %>").value = data.superficieTerreno;
        $get("<%= proporcional_Lbl.ClientID %>").text = data.superficieTerreno;
        $get("<%= fuenteIndiviso_DDList.ClientID %>").selectedValue = data.fuenteIndiviso;
        $get("<%= especFuenteIndiviso_TBox.ClientID %>").value = data.especFuenteIndiviso;
        $get("<%= lotePrivativo_TBox.ClientID %>").value = data.lotePrivativo;
        $get("<%= fuentePrivativo_DDList.ClientID %>").value = data.fuentePrivativo;
        $get("<%= especFuentePrivativo_TBox.ClientID %>").value = data.especFuentePrivativo;
    }

    //guardar datos
    function getDatosSuperficies() {
        var data = new Object();

        data.superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
        data.fuenteTerreno = $get("<%= fuenteTerreno_DDList.ClientID %>").selectedValue;
        data.especFuenteTerreno = $get("<%= especFuenteTerreno_TBox.ClientID %>").value;
        data.superficieFrente = $get("<%= superficieFrente_TBox.ClientID %>").value;
        data.indiviso = $get("<%= indiviso_TBox.ClientID %>").value;
        data.superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
        data.superficieTerreno = $get("<%= proporcional_Lbl.ClientID %>").text;
        data.fuenteIndiviso = $get("<%= fuenteIndiviso_DDList.ClientID %>").selectedValue;
        data.especFuenteIndiviso = $get("<%= especFuenteIndiviso_TBox.ClientID %>").value;
        data.lotePrivativo = $get("<%= lotePrivativo_TBox.ClientID %>").value;
        data.fuentePrivativo = $get("<%= fuentePrivativo_DDList.ClientID %>").value;
        data.especFuentePrivativo = $get("<%= especFuentePrivativo_TBox.ClientID %>").value;

        return data;
    }

    // Visibilidad secciones
    function showDatosSuperficiesCondominio() {
        setVisibility($get("seccion_superficies_condominio"), true);
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
<div id="seccion_superficies_condominio" style="display: none;">
    <table>
        <tr>
            <td class="celdaTitulo">
                Indiviso:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="indiviso_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                <span class="textoChico">%</span>
                <div class="etiqueta2">
                    <asp:Label ID="proporcional_Lbl" runat="server"></asp:Label>
                </div>
            </td>
            <td class="celdaTituloSec" valign="top">
                Fuente:
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="fuenteIndiviso_DDList" runat="server">
                </asp:DropDownList>
                <div id="seccion_fuente_indiviso" style="display: none;">
                    <span class="subCampo">Especifique:</span>
                    <asp:TextBox ID="especFuenteIndiviso_TBox" runat="server"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="celdaTitulo">
                Lote privativo
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="lotePrivativo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                <span class="textoChico">m²</span>
            </td>
            <td class="celdaTituloSec" valign="top">
                Fuente:
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="fuentePrivativo_DDList" runat="server">
                </asp:DropDownList>
                <div id="seccion_fuente_privativo" style="display: none;">
                    <span class="subCampo">Especifique:</span>
                    <asp:TextBox ID="especFuentePrivativo_TBox" runat="server"></asp:TextBox></div>
            </td>
        </tr>
    </table>
    <table>
        <tr class="celdaHeader">
            <td>
                Áreas cubiertas
            </td>
            <td>
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
</div>
