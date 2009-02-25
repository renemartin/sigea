<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_Instalaciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
//    function fillInstalacionesData(idClase) {
//        fillServicio("<%= instHidraulicas_DDList.ClientID %>", "agua potable");
//        fillServicio("<%= instSanitaria_DDList.ClientID %>", "drenaje");
//        fillServicio("<%= instElectricas_DDList.ClientID %>", "electrificación");
//        fillMaterial("<%= carpinteria_DDList.ClientID %>", "carpintería");
//        fillMaterial("<%= herreria_DDList.ClientID %>", "herrería");        
//        fillMaterial("<%= canceleria_DDList.ClientID %>", "cancelería"); 
//    }
    
    //mostrar datos
    function setDatosInstalaciones(data) {
        $get("<%= instHidraulicas_TBox.ClientID %>").value = data.hidraulicas;
        $get("<%= instSanitaria_TBox.ClientID %>").value = data.sanitarias;
        $get("<%= instElectricas_TBox.ClientID %>").value = data.electricas;
        $get("<%= carpinteria_TBox.ClientID %>").value = data.carpinteria;
        $get("<%= herreria_TBox.ClientID %>").value = data.herreria;
        $get("<%= carpinteria_TBox.ClientID %>").value = data.canceleria;
    }
    
    //guardar datos
    function getDatosInstalaciones() {
        var data = new Object();
        
        data.hidraulica = $get("<%= instHidraulicas_TBox.ClientID %>").value;
        data.sanitaria = $get("<%= instSanitaria_TBox.ClientID %>").value;
        data.electrica = $get("<%= instElectricas_TBox.ClientID %>").value;
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
            <asp:TextBox ID="instHidraulicas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
            Sanitarias:</td>
        <td class="celdaValor">
            <asp:TextBox ID="instSanitaria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
             Eléctricas:  
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="instElectricas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
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