<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BusquedaComparable.ascx.cs" 
    Inherits="Controles_BusquedaComparable" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<h1>
    Búsqueda de Comparables
</h1>
<table>
    <tr>
        <td class="celdaTitulo">
            Valor oferta:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="operador_DDList" runat="server">
                <asp:ListItem Text="=" Value="0" Selected="True"></asp:ListItem>
                <asp:ListItem Text=">" Value="1" Selected="False"></asp:ListItem>
                <asp:ListItem Text="&gt;=" Value="2" Selected="False"></asp:ListItem>
                <asp:ListItem Text="<" Value="3" Selected="False"></asp:ListItem>
                <asp:ListItem Text="&lt;=" Value="4" Selected="False"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="valorOferta_TBox" runat="server"></asp:TextBox>
        </td>
         <td class="celdaTitulo">
            Número de frentes:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="numeroFrentes_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Superficie terreno:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superficie construida:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieConstruida_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Antigüedad:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="antiguedad_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Avance obra:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceObra_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fecha de creación:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="fechaCreacion_TBox" runat="server" Enabled="false"></asp:TextBox>
            <asp:Image ID="calendar_img" runat="server" ImageUrl="../Images/Icons/calendar.gif" ImageAlign="AbsMiddle"/>
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="fechaCreacion_TBox"
                PopupButtonID="calendar_img">
            </cc1:CalendarExtender>
        </td>
        <td class="celdaTitulo">
            Calle:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="calle_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Asentamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="asentamiento_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Código postal:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="codigoPostal_TBox" runat="server"></asp:TextBox>
        </td>   
        <td class="celdaTitulo">
            Municipio:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="municipio_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Estado:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estado_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">
    
    function BusquedaComparable() {

        // Inicialización
        BusquedaComparable.prototype.getData = getData;

        function getData() {
            var data = new Object();
            
            data.codigoPostal = $get("<%= codigoPostal_TBox.ClientID %>").value;
            data.valorOferta = $get("<%= valorOferta_TBox.ClientID %>").value;
            data.operador = $get("<%= operador_DDList.ClientID %>").value;
            data.numeroFrentes = $get("<%= numeroFrentes_TBox.ClientID %>").value;
            data.superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data.superficieConstruida = $get("<%= superficieConstruida_TBox.ClientID %>").value;
            data.antiguedad = $get("<%= antiguedad_TBox.ClientID %>").value;
            data.avanceObra = $get("<%= avanceObra_TBox.ClientID %>").value;
            data.fechaCreacion = $get("<%= fechaCreacion_TBox.ClientID %>").value;
            data.calle = $get("<%= calle_TBox.ClientID %>").value;
            data.municioio = $get("<%= municipio_TBox.ClientID %>").value;
            data.estado = $get("<%= estado_TBox.ClientID %>").value;
            data.asentamiento = $get("<%= asentamiento_TBox.ClientID %>").value;
            
            return data;
        }      
    
        this["<%= ID %>"] = new BusquedaComparable();
    }
</script>