<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAcabados.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAcabados" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    //mostrar datos
    function setDatosDatosAcabados(data) {
        $get("<%= salaPisos_TBox.ClientID %>").value = data.salaPisos;
        $get("<%= salaMuros_TBox.ClientID %>").value = data.salaMuros;
        $get("<%= salaPlafones_TBox.ClientID %>").value = data.salaPlafones;
        $get("<%= comedorPisos_TBox.ClientID %>").value = data.comedorPisos;
        $get("<%= comedorMuros_TBox.ClientID %>").value = data.comedorMuros;
        $get("<%= comedorPlafones_TBox.ClientID %>").value = data.comedorPlafones;
        $get("<%= cocinaPisos_TBox.ClientID %>").value = data.cocinaPisos;
        $get("<%= cocinaMuros_TBox.ClientID %>").value = data.cocinaMuros;
        $get("<%= cocinaPlafones_TBox.ClientID %>").value = data.cocinaPlafones;
        $get("<%= recamarasPisos_TBox.ClientID %>").value = data.recamarasPisos;
        $get("<%= recamarasMuros_TBox.ClientID %>").value = data.recamarasMuros;
        $get("<%= recamarasPlafones_TBox.ClientID %>").value = data.recamarasPlafones;
        $get("<%= banosPisos_TBox.ClientID %>").value = data.banosPisos;
        $get("<%= banosMuros_TBox.ClientID %>").value = data.banosMuros;
        $get("<%= banosPlafones_TBox.ClientID %>").value = data.banosPlafones;
        $get("<%= patiosPisos_TBox.ClientID %>").value = data.patiosPisos;
        $get("<%= patiosMuros_TBox.ClientID %>").value = data.patiosMuros;
        $get("<%= patiosPlafones_TBox.ClientID %>").value = data.patiosPlafones;
        $get("<%= estacionamientoPisos_TBox.ClientID %>").value = data.estacionamientoPisos;
        $get("<%= estacionamientoMuros_TBox.ClientID %>").value = data.estacionamientoMuros;
        $get("<%= estacionamientoPlafones_TBox.ClientID %>").value = data.estacionmientoPlafones;
        $get("<%= fachada_TBox.ClientID %>").value = data.fachadaPisos;
    }
    //guardar datos
    function getDatosDatosAcabados() {
        var data = new Object();
        
        data.salaPisos = $get("<%= salaPisos_TBox.ClientID %>").value;
        data.salaMuros = $get("<%= salaMuros_TBox.ClientID %>").value;
        data.salaPlafones = $get("<%= salaPlafones_TBox.ClientID %>").value;
        data.comedorPisos = $get("<%= comedorPisos_TBox.ClientID %>").value;
        data.comedorMuros = $get("<%= comedorMuros_TBox.ClientID %>").value;
        data.comedorPlafones = $get("<%= comedorPlafones_TBox.ClientID %>").value;
        data.cocinaPisos = $get("<%= cocinaPisos_TBox.ClientID %>").value;
        data.cocinaMuros = $get("<%= cocinaMuros_TBox.ClientID %>").value;
        data.cocinaPlafones = $get("<%= cocinaPlafones_TBox.ClientID %>").value;
        data.recamarasPisos = $get("<%= recamarasPisos_TBox.ClientID %>").value;
        data.recamarasMuros = $get("<%= recamarasMuros_TBox.ClientID %>").value;
        data.recamarasPlafones = $get("<%= recamarasPlafones_TBox.ClientID %>").value;
        data.banosPisos = $get("<%= banosPisos_TBox.ClientID %>").value;
        data.banosMuros = $get("<%= banosMuros_TBox.ClientID %>").value;
        data.banosPlafones = $get("<%= banosPlafones_TBox.ClientID %>").value;
        data.patiosPisos = $get("<%= patiosPisos_TBox.ClientID %>").value;
        data.patiosMuros = $get("<%= patiosMuros_TBox.ClientID %>").value;
        data.patiosPlafones = $get("<%= patiosPlafones_TBox.ClientID %>").value;
        data.estacionamientoPisos = $get("<%= estacionamientoPisos_TBox.ClientID %>").value;
        data.estacionamientoMuros = $get("<%= estacionamientoMuros_TBox.ClientID %>").value;
        data.estacionamientoPlafones = $get("<%= estacionamientoPlafones_TBox.ClientID %>").value;
        data.fachadaPisos = $get("<%= fachada_TBox.ClientID %>").value;
        
        return data;
    }
    
</script>

<table>
    <tr>
        <td>
        </td>
        <td class="celdaHeader">
            Pisos
        </td>
        <td class="celdaHeader">
            Muros
        </td>
        <td class="celdaHeader">
            Plafones
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Sala:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Comedor:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cocina:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Recámaras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Baños:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Patios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPlafones_TBox" runat="server" 
                TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fachada:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="fachada_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="544px"></asp:TextBox>
        </td>
    </tr>
</table>
