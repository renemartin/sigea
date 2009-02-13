<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualDistribucion.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosDistribucion" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    //mostrar datos
    function setDatosUsoActualDistribucion(data) {
        $get("<%= tipoEstacionamiento_DDList.ClientID %>").selectedValue = data.idTipoEstacionamiento;
        $get("<%= cupoCarros_TBox.ClientID %>").value = data.cupoEstacionamiento;
        $get("<%= jardin_CBox.ClientID %>").checked = data.jardinesFrontales;
        $get("<%= jardinFondo_CBox.ClientID %>").checked = data.jardinesFondo;
        $get("<%= jardinLateral_CBox.ClientID %>").checked = data.jardinesLateral;
        $get("<%= elevador_CBox.ClientID %>").checked = data.elevador;
        $get("<%= banosCompletos_TBox.ClientID %>").value = data.numBaniosCompletos;
        $get("<%= banosMedios_TBox.ClientID %>").value = data.numBaniosMedios;
        $get("<%= cuentaCocina_CBox.ClientID %>").value = data.cocina;
        $get("<%= conTarja_RBtn.ClientID %>").checked = data.tarja;
        $get("<%= mueblesCocina_RBtn.ClientID %>").checked = data.cocinaMuebles;
        $get("<%= cocinaIntegral_RBtn.ClientID %>").checked = data.cocinaIntegral;
        $get("<%= forjadaSitio_RBtn.ClientID %>").checked = data.forjadaSitio;
        $get("<%= comedor_CBox.ClientID %>").checked = data.comedor;
        $get("<%= despensa_CBox.ClientID %>").checked = data.despensa;
    }
    
    //guardar datos
    function getDatosUsoActualDistribucion() {
        var data = new Object();
        
        data.idTipoEstacionamiento = $get("<%= tipoEstacionamiento_DDList.ClientID %>").selectedValue;
        data.cupoEstacionamiento = $get("<%= cupoCarros_TBox.ClientID %>").value;
        data.jardinesFrontales = $get("<%= jardin_CBox.ClientID %>").checked;
        data.jardinesFondo = $get("<%= jardinFondo_CBox.ClientID %>").checked;
        data.jardinesLateral = $get("<%= jardinLateral_CBox.ClientID %>").checked;
        data.elevador = $get("<%= elevador_CBox.ClientID %>").checked;
        data.numBaniosCompletos = $get("<%= banosCompletos_TBox.ClientID %>").value;
        data.numBaniosMedios = $get("<%= banosMedios_TBox.ClientID %>").value;
        data.cocina = $get("<%= cuentaCocina_CBox.ClientID %>").value;
        data.tarja = $get("<%= conTarja_RBtn.ClientID %>").checke;
        data.cocinaMuebles = $get("<%= mueblesCocina_RBtn.ClientID %>").checked;
        data.cocinaIntegral = $get("<%= cocinaIntegral_RBtn.ClientID %>").checked;
        data.forjadaSitio = $get("<%= forjadaSitio_RBtn.ClientID %>").checked;
        data.comedor = $get("<%= comedor_CBox.ClientID %>").checked;
        data.despensa = $get("<%= despensa_CBox.ClientID %>").checked;
        
        return data;        
    }
</script>
<table>
    <tr>
        <td class="celdaTitulo">
            Tipo estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="tipoEstacionamiento_DDList" runat="server">
                <asp:ListItem Value="0" Selected="True">Selecione...</asp:ListItem>                
                <asp:ListItem Value="1">COCHERA DESCUBIERTA</asp:ListItem>
                <asp:ListItem Value="2">COCHERA SEMIDESCUBIERTA</asp:ListItem>
                <asp:ListItem Value="3">COCHERA CUBIERTA</asp:ListItem>                
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Cupo de carros:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cupoCarros_TBox" runat="server" SkinID="Numero"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Jardines:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="jardin_CBox" Text="Tiene jardines" runat="server" /><br />
            <asp:CheckBox ID="jardinFondo_CBox" Text="Tiene jardín al fondo" runat="server" /><br />
            <asp:CheckBox ID="jardinLateral_CBox" Text="Tiene jardín lateral" runat="server" />
        </td>
        <td class="celdaTituloSec" valign="top">
            Elevador:</td>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="elevador_CBox" Text="Tiene elevador" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec">
            Baños completos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosCompletos_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Baños medios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMedios_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaTitulo" valign="top">
            Cocina:</td>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="cuentaCocina_CBox" Text="Cuenta con cocina" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:RadioButton ID="conTarja_RBtn" Text="Con tarja" runat="server" />
            <br />
            <asp:RadioButton ID="mueblesCocina_RBtn" Text="Muebles de cocina" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:RadioButton ID="cocinaIntegral_RBtn" Text="Cocina integral" runat="server" />
            <br />
            <asp:RadioButton ID="forjadaSitio_RBtn" Text="Forjada en sitio" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
        <td class="celdaValor">
            <asp:CheckBox ID="comedor_CBox" Text="Comedor" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="despensa_CBox" Text="Despensa" runat="server" />
        </td>
    </tr>
</table>
