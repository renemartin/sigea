<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoServicios.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosServicios" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    //mostrar datos
    function setData(data) {
        $get("<%= gasNatural_CBox.ClientID %>").checked = data.gasNatural;
        $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked = data.gasNaturalSuministro;
        $get("<%= redTelefonica_CBox.ClientID %>").checked = data.redTelefonica;
        $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked = data.redTelefonicaArea;
        $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked = data.redTelefonicaAcometida;
        $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked = data.senalizacionNomenclatura;
        $get("<%= gasNatural_CBox.ClientID %>").checked = data.gasNatural;
        $get("<%= transporteUrbano_CBox.ClientID %>").checked = data.transporteUrbano;
        $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value = data.transporteUrbanoDistancia;
        $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value = data.transporteUrbanoFrecuencia;
        $get("<%= transporteSuburbano_CBox.ClientID %>").checked = data.transporteSuburbano;
        $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value = data.transporteSuburbanoDistancia;
        $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value = data.transporteSuburbanoFrecuencia;
        $get("<%= vigilancia_CBox.ClientID %>").checked = data.vigilancia;
        $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked = data.vigilanciaMunicipal;
        $get("<%= recoleccionBasura_CBox.ClientID %>").checked = data.recoleccionBasura;   
    }
    
    //guardar datos
    function getData() {
        var data = new Object();
        
        data.gasNatural = $get("<%= gasNatural_CBox.ClientID %>").checked;
        data.gasNaturalSuministro = $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked;
        data.redTelefonica = $get("<%= redTelefonica_CBox.ClientID %>").checked;
        data.redTelefonicaArea = $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked;
        data.redTelefonicaAcometida = $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked;
        data.senalizacionNomenclatura = $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked;
        data.gasNatural = $get("<%= gasNatural_CBox.ClientID %>").checked;
        data.transporteUrbano = $get("<%= transporteUrbano_CBox.ClientID %>").checked;
        data.transporteUrbanoDistancia = $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value;
        data.transporteUrbanoFrecuencia = $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value;
        data.transporteSuburbano = $get("<%= transporteSuburbano_CBox.ClientID %>").checked;
        data.transporteSuburbanoDistancia = $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value;
        data.transporteSuburbanoFrecuencia = $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value;
        data.vigilancia = $get("<%= vigilancia_CBox.ClientID %>").checked;
        data.vigilanciaMunicipal = $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked;
        data.recoleccionBasura = $get("<%= recoleccionBasura_CBox.ClientID %>").checked; 
        
        return data;  
    }

</script>
<table>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="gasNatural_CBox" Text="Gas natural" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="gasNaturalSuministro_CBox" Text="Con suministro" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="redTelefonica_CBox" Text="Red telefónica" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="redTelefonicaAerea_CBox" Text="Aérea" runat="server" />
            <asp:CheckBox ID="redTelefonicaAcometida_CBox" Text="Con acometida" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="senalizacionNomenclatura_CBox" Text="Señalización y nomenclatura"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transporteUrbano_CBox" Text="Transporte urbano" runat="server" />
        </td>
        <td class="subCampo">
            Distancia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transporteUrbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
        <td class="subCampo">
            Frecuencia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transporteUrbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">mins.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transporteSuburbano_CBox" Text="Transporte suburbano" runat="server" />
        </td>
        <td class="subCampo">
            Distancia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transporteSuburbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
        <td class="subCampo">
            Frecuencia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transporteSuburbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">mins.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="vigilancia_CBox" Text="Vigilancia" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="vigilanciaMunicipal_CBox" Text="Municipal" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="recoleccionBasura_CBox" Text="Recolección de basura municipal ó privada"
                runat="server" />
        </td>
    </tr>
</table>
