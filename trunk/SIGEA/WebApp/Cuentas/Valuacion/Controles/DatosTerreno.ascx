<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerreno.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerreno" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillTerrenoData() {        
        fillUbicacion("<%= ubicacion_DDList.ClientID %>");
        fillTopografia("<%= topografia_DDList.ClientID %>");
        fillCaracPanoramicas("<%= caracPanoramicas_DDList.ClientID %>");
        fillUsoSuelo("<%= usoSuelo_DDList.ClientID %>");
        fillFuente("<%= fuenteDensidad_DDList.ClientID %>");
        fillServidumbre("<%= servidumbre_DDList.ClientID %>");
    }   
    
    //mostrar datos
    function setData(data) {
        $get("<%= frentes_TBox.ClientId %>").value = data.frentes;
        $get("<%= configuracionRegular_CBox.ClientId %>").checked = data.configuracionRegular;
        $get("<%= lados_TBox.ClientId %>").value = data.lados;
        $get("<%= ubicacion_DDList.ClientId %>").selectedValue = data.ubicacion;
        $get("<%= topografia_DDList.ClientId %>").selectedValue = data.topografia;
        $get("<%= caracPanoramicas_DDList.ClientId %>").selectedValue = data.caracPanoramicas;
        $get("<%= usoSuelo_DDList.ClientId %>").selectedValue = data.usoSuelo;
        $get("<%= densidadHabitacional_TBox.ClientId %>").value = data.densidadHabitacional;
        $get("<%= fuenteDensidad_DDList.ClientId %>").selectedValue = data.fuenteDensidad;
        $get("<%= habHectarea_TBox.ClientId %>").value = data.habHectarea;
        $get("<%= vivHectarea_TBox.ClientId %>").value = data.vivHectarea;
        $get("<%= servidumbre_DDList.ClientId %>").selectedValue = data.servidumbre;
    }
    
    //guardar datos
    function getData() {
        var data = new Object();
        
        data.frentes = $get("<%= frentes_TBox.ClientId %>").value;
        data.configuracionRegular = $get("<%= configuracionRegular_CBox.ClientId %>").checked;
        data.lados = $get("<%= lados_TBox.ClientId %>").value;
        data.ubicacion = $get("<%= ubicacion_DDList.ClientId %>").selectedValue;
        data.topografia = $get("<%= topografia_DDList.ClientId %>").selectedValue;
        data.caracPanoramicas = $get("<%= caracPanoramicas_DDList.ClientId %>").selectedValue;
        data.usoSuelo = $get("<%= usoSuelo_DDList.ClientId %>").selectedValue;
        data.densidadHabitacional = $get("<%= densidadHabitacional_TBox.ClientId %>").value;
        data.fuenteDensidad = $get("<%= fuenteDensidad_DDList.ClientId %>").selectedValue;
        data.habHectarea = $get("<%= habHectarea_TBox.ClientId %>").value;
        data.vivHectarea = $get("<%= vivHectarea_TBox.ClientId %>").value;
        data.servidumbre = $get("<%= servidumbre_DDList.ClientId %>").selectedValue;
        
        return data;
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Frentes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="frentes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Configuración:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="configuracionRegular_CBox" runat="server" Text="Regular" />
        </td>
        <td class="celdaTituloSec">
            Lados:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="lados_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Ubicación:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="ubicacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Topografía:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="topografia_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Caracteristicas panoramicas:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="caracPanoramicas_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Uso de suelo:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="usoSuelo_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Densidad habitacional:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="densidadHabitacional_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Fuente de densidad habitacional:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteDensidad_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Habitantes por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="habHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Viviendas por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vivHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Servidumbre y/o restricciones:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="servidumbre_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
