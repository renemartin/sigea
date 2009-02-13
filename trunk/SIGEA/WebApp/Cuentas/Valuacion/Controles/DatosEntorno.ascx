<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntorno.ascx.cs" Inherits="Cuentas_Administracion_DatosEntorno" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoViasAcceso.ascx" TagName="DatosEntornoViasAcceso" TagPrefix="SIGEA" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoData(idClase) {
        fillClasificacionZona("<%= clasificacionZona_DDList.ClientID %>", idClase);
        fillProximidadUrbana("<%= proximidadUrbana_DDList.ClientID %>");
        fillNivelSocioeconomico("<%= nivelSocioeconomico_DDList.ClientID %>");
        fillConstruccionPredominante("<%= construccionPredominante_DDList.ClientID %>");
        fillDensidad("<%= densidadPoblacion_DDList.ClientID %>");        
    }   
    
    //mostrar datos
    function setDataEntorno(data) {
        $get("<%= clasificacionZona_DDList.ClientID %>").selectedValue = data.idTipoClasificacionZona;
        $get("<%= proximidadUrbana_DDList.ClientID %>").selectedValue = data.idTipoProximidadUrbana;
        $get("<%= nivelSocioeconomico_DDList.ClientID %>").selectedValue = data.idTipoNivelSocioEconomivo;
        $get("<%= construccionPredominante_DDList.ClientID %>").selectedValue = data.idTipoConstruccionProdominante;
        $get("<%= densidadPoblacion_DDList.ClientID %>").selectedValue = data.idTipoDensidadPoblacion;
        $get("<%= indiceSaturacion_TBox.ClientID %>").value = data.indiceSaturacion;
    }
    
    //guardar datos
    function getDataEntorno() {
        var data = new Object();
        
        data.idTipoClasificacionZona = $get("<%= clasificacionZona_DDList.ClientID %>").selectedValue;
        data.idTipoProximidadUrbana = $get("<%= proximidadUrbana_DDList.ClientID %>").selectedValue;
        data.idTipoNivelSocioEconomivo = $get("<%= nivelSocioeconomico_DDList.ClientID %>").selectedValue;
        data.idTipoConstruccionProdominante = $get("<%= construccionPredominante_DDList.ClientID %>").selectedValue;
        data.idTipoDensidadPoblacion = $get("<%= densidadPoblacion_DDList.ClientID %>").selectedValue;
        data.indiceSaturacion = $get("<%= indiceSaturacion_TBox.ClientID %>").value;
        
        return data;
    }
    
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Clasificación de zona:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="clasificacionZona_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Referencia de proximidad urbana SHF:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="proximidadUrbana_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Nivel socioeconómico:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="nivelSocioeconomico_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tipo de construcción predominante en calles circundantes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="construccionPredominante_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Indice de saturación de la zona:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="indiceSaturacion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Densidad de población:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="densidadPoblacion_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Vías de acceso e importancia de las mismas:
        </td>
        <td class="celdaValor" colspan="3">
            <SIGEA:DatosEntornoViasAcceso ID="vias_Ctrl" runat="server" />
        </td>
    </tr>
</table>