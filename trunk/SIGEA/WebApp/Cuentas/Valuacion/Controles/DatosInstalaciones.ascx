<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_Instalaciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    
    //mostrar datos
    function setDatosInstalaciones(data) {
        if(data == null)
            return;
            
        $get("<%= hidraulicas_TBox.ClientID %>").value = data.hidraulicas;
        $get("<%= sanitarias_TBox.ClientID %>").value = data.sanitarias;
        $get("<%= electricas_TBox.ClientID %>").value = data.electricas;
        $get("<%= carpinteria_TBox.ClientID %>").value = data.carpinteria;
        $get("<%= herreria_TBox.ClientID %>").value = data.herreria;
        $get("<%= carpinteria_TBox.ClientID %>").value = data.canceleria;
    }
    
    //guardar datos
    function getDatosInstalaciones() {
        var data = null;
        data = new Object();
        
        data.hidraulicas = $get("<%= hidraulicas_TBox.ClientID %>").value;
        data.sanitarias = $get("<%= sanitarias_TBox.ClientID %>").value;
        data.electricas = $get("<%= electricas_TBox.ClientID %>").value;
        data.carpinteria = $get("<%= carpinteria_TBox.ClientID %>").value;
        data.herreria = $get("<%= herreria_TBox.ClientID %>").value;
        data.canceleria = $get("<%= carpinteria_TBox.ClientID %>").value;
        
        return data;       
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Hidráulicas:</td>
        <td class="celdaValor">
            <asp:TextBox ID="hidraulicas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
            Sanitarias:</td>
        <td class="celdaValor">
            <asp:TextBox ID="sanitarias_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
             Eléctricas:  
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="electricas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox> 
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
            <asp:TextBox ID="carpinteria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Herrería:</td>
        <td class="celdaValor">
            <asp:TextBox ID="herreria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cancelería:</td>
        <td class="celdaValor">
            <asp:TextBox ID="canceleria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
</table>