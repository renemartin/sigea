<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEstructuras.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEstructuras" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    
    //mostrar datos
    function setDatosEstructuras(data) {
        if(data == null)
            return;
        $get("<%= cimentacion_TBox.ClientID %>").value = data.cimentacion;
        $get("<%= muros_TBox.ClientID %>").value = data.muros;
        $get("<%= escaleras_TBox.ClientID %>").value = data.escaleras;
        $get("<%= entrepisosTechos_TBox.ClientID %>").value = data.entrepisos;
        $get("<%= trabesColumnas_TBox.ClientID %>").value = data.trabes;
    }
    
    //guardar datos
    function getDatosEstructuras() {
        var data = new Object();
        
        data.cimentacion = $get("<%= cimentacion_TBox.ClientID %>").value;
        data.muros = $get("<%= muros_TBox.ClientID %>").value;
        data.escaleras = $get("<%= escaleras_TBox.ClientID %>").value;
        data.entrepisos = $get("<%= entrepisosTechos_TBox.ClientID %>").value;
        data.trabes = $get("<%= trabesColumnas_TBox.ClientID %>").value;
        
        return data;
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Cimentación:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cimentacion_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Muros:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="muros_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Escaleras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="escaleras_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entrepisos y techos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="entrepisosTechos_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Trabes y columnas:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="trabesColumnas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    
</table>
