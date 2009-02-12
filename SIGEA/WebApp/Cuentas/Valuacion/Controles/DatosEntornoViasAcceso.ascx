<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoViasAcceso.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosViasAcceso" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoViasAccesoData() {
        fillImportanciaVialidad("<%= importanciaVia_DDList.ClientID %>");
    }   
    
    //mostrar datos
    function setData(data) {
        $get("<%= importanciaVia_DDList.ClientID %>").selectedValue = data.idImportancia;
        $get("<%= via_TBox.ClientID %>").selectedValue = data.nombreVia;
    }
    
    //guardar datos
    function getData() {
        var data = new Object();
        
        data.idImportancia = $get("<%= importanciaVia_DDList.ClientID %>").selectedValue;
        data.nombreVia = $get("<%= via_TBox.ClientID %>").selectedValue;
        
        return data;
    }
</script>

<table>
    <tr>
        <td class="celdaHeader">
            Nombre de vía
        </td>
        <td class="celdaHeader">
            Importancia
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="via_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="importanciaVia_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
</table>