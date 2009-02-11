<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_Instalaciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillInstalacionesData(idClase) {
        fillServicio("<%= instHidraulicas_DDList.ClientID %>", "agua potable");
        fillServicio("<%= instSanitaria_DDList.ClientID %>", "drenaje");
        fillServicio("<%= instElectricas_DDList.ClientID %>", "electrificación");
        fillMaterial("<%= carpinteria_DDList.ClientID %>", "carpintería");
        fillMaterial("<%= herreria_DDList.ClientID %>", "herrería");        
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Hidráulicas:</td>
        <td class="celdaValor">
            <asp:DropDownList ID="instHidraulicas_DDList" runat="server">
            </asp:DropDownList>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
            Sanitarias:</td>
        <td class="celdaValor">
            <asp:DropDownList ID="instSanitaria_DDList" runat="server">
            </asp:DropDownList>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
             Eléctricas:  
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="instElectricas_DDList" runat="server">
            </asp:DropDownList> 
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="2">
            Cancelería y comunicaciones</td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Carpinteria:</td>
        <td class="celdaValor">
            <asp:DropDownList ID="carpinteria_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Herrería:</td>
        <td class="celdaValor">
            <asp:DropDownList ID="herreria_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>