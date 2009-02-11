<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEstructuras.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEstructuras" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEstructurasData(idClase) {
        fillMaterial("<%= cimentacion_DDList.ClientID %>", "cimentación");
        fillMaterial("<%= muros_DDList.ClientID %>", "muros");
        fillMaterial("<%= escaleras_DDList.ClientID %>", "escaleras");
        fillMaterial("<%= entrepisosTechos_DDList.ClientID %>", "entrepisos");
        fillMaterial("<%= trabesColumnas_DDList.ClientID %>", "trabes");        
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Cimentación:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="cimentacion_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Muros:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="muros_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Escaleras:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="escaleras_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entrepisos y techos:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="entrepisosTechos_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Trabes y columnas:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="trabesColumnas_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
    
</table>
