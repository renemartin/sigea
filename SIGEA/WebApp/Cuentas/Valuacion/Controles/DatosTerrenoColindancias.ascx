<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerrenoColindancias.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerrenoColindancias" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
    // Llenado de datos
    function fillTerrenoColindanciasData() {
        fillFuente("<%= fuenteMedidas_DDList.ClientID %>");
    }   
    
    //mostrar datos
    function setDatos(data) {
        $get("<%= fuenteMedidas_DDList.ClientID %>").selectedValue = data.descripcion;
        $get("<%= colindancias_TBox.ClientID %>").value = data.colindancias;
    }
    
    //guardar datos
    function getDatos() {
        var data = new Object();
        
        data.direccion = $get("<%= fuenteMedidas_DDList.ClientID %>").selectedValue;
        data.colindancias = $get("<%= colindancias_TBox.ClientID %>").value;
        
        return data;
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Fuente de medidas y colindancias:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteMedidas_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="2">
            Colindancias
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="2">
            <asp:TextBox ID="colindancias_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
</table>
