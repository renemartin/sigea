<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoInfraestructura.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_Infraestructura" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoInfraestructuraData() {
        fillMaterial("<%= materialVialidades_DDList.ClientID %>", "Vialidades");
        fillMaterial("<%= materialBanquetas_DDList.ClientID %>", "Banquetas");
        fillMaterial("<%= materialGuarniciones_DDList.ClientID %>", "Guarnición");
    }   
    
    //mostrar datos
    function setData(data) {
        $get("<%= aguaPotable_CBox.ClientID %>").checked = data.aguaPotable;
        $get("<%= aguaPotableSuministros_CBox.ClientID %>").checked = data.aguaPotableSuministro;
        $get("<%= drenaje_CBox.ClientID %>").checked = data.drenaje;
        $get("<%= drenajeConexion_CBox.ClientID %>").checked = data.drenajeConexion;
        $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked = data.drenajeFosaSeptica;
        $get("<%= electrificacion_CBox.ClientID %>").checked = data.electrificacion;
        $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked = data.electrificacionRedAerea;
        $get("<%= electrificacionSubterranea_CBox.ClientID %>").checked = data.electrificacionSubterranea;
        $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked = data.electrificacionConAcometida;
        $get("<%= electrificacionSubterranea_CBox.ClientID %>").checked = data.electrificacionSubterranea;
        $get("<%= alumbradoPublico_CBox.ClientID %>").checked = data.alumbradoPublico;
        $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked = data.alumbradoPublicoaereo;
        $get("<%= vialidades_CBox.ClientID %>").checked = data.vialidades;
        $get("<%= materialVialidades_DDList.ClientID %>").selectedValue = data.idTipoVialidades;
        $get("<%= anchoVialidad_TBox.ClientID %>").value = data.anchoVialidad;
        $get("<%= banquetas_CBox.ClientID %>").checked = data.banquetas;
        $get("<%= materialBanquetas_DDList.ClientID %>").selectedValue = data.idTipoBanquetas;
        $get("<%= guarniciones_CBox.ClientID %>").checked = data.guarniciones;
        $get("<%= materialGuarniciones_DDList.ClientID %>").selectedValue = data.idTipoGuarniciones;
        $get("<%= nivelInfraestructura_Lbl.ClientID %>").text = data.nivelInfraestructura;
        $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").text = data.nivelInfraestructuraSHF;
    }
    
   //guardar datos
    function getData() {
        var data = new Object();
        
         data.aguaPotable = $get("<%= aguaPotable_CBox.ClientID %>").checked;
         data.aguaPotableSuministro = $get("<%= aguaPotableSuministros_CBox.ClientID %>").checked;
         data.drenaje = $get("<%= drenaje_CBox.ClientID %>").checked;
         data.drenajeConexion = $get("<%= drenajeConexion_CBox.ClientID %>").checked;
         data.drenajeFosaSeptica =  $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked;
         data.electrificacion = $get("<%= electrificacion_CBox.ClientID %>").checked;
         data.electrificacionRedAerea = $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked;
         data.electrificacionSubterranea = $get("<%= electrificacionSubterranea_CBox.ClientID %>").checked;
         data.electrificacionConAcometida = $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked;
         data.electrificacionSubterranea = $get("<%= electrificacionSubterranea_CBox.ClientID %>").checked;
         data.alumbradoPublico = $get("<%= alumbradoPublico_CBox.ClientID %>").checked;
         data.alumbradoPublicoaereo = $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked;
         data.vialidades = $get("<%= vialidades_CBox.ClientID %>").checked;
         data.idTipoVialidades = $get("<%= materialVialidades_DDList.ClientID %>").selectedValue;
         data.anchoVialidad = $get("<%= anchoVialidad_TBox.ClientID %>").value;
         data.banquetas = $get("<%= banquetas_CBox.ClientID %>").checked;
         data.idTipoBanquetas = $get("<%= materialBanquetas_DDList.ClientID %>").selectedValue;
         data.guarniciones = $get("<%= guarniciones_CBox.ClientID %>").checked;
         data.idTipoGuarniciones = $get("<%= materialGuarniciones_DDList.ClientID %>").selectedValue;
         data.nivelInfraestructura = $get("<%= nivelInfraestructura_Lbl.ClientID %>").text;
         data.nivelInfraestructuraSHF = $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").text;
        
        return data;
    }
</script>

<table>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="aguaPotable_CBox" Text="Agua potable" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="aguaPotableSuministro_CBox" Text="Con suministro" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="drenaje_CBox" Text="Drenaje y alcantarillado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="drenajeConexion_CBox" Text="Con conexíon al inmueble" runat="server" /><br />
            <asp:CheckBox ID="drenajeFosaSeptica_CBox" Text="Fosa séptica" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="electrificacion_CBox" Text="Electrificación" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="electrificacionRedAerea_CBox" Text="Red aérea" runat="server" /><br />
            <asp:CheckBox ID="electrificacionRedSubterranea_CBox" Text="Red subterranea" runat="server" /><br />
            <asp:CheckBox ID="electrificacionConAcometida_CBox" Text="Con acometida" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="alumbradoPublico_CBox" Text="Alumbrado público" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="alumbradoPublicoAereo_CBox" Text="Aéreo" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="vialidades_CBox" Text="Vialidades" runat="server" />
        </td>
        <td class="celdaValor">
            <span class="subCampo">Material:</span>
            <asp:DropDownList ID="materialVialidades_DDList" runat="server">
            </asp:DropDownList>
            <span class="subCampo">Ancho:</span>
            <asp:TextBox ID="anchoVialidad_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="banquetas_CBox" Text="Banquetas" runat="server" />
        </td>
        <td class="celdaValor">
            <span class="subCampo">Material:</span>
            <asp:DropDownList ID="materialBanquetas_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="guarniciones_CBox" Text="Guarniciones" runat="server" />
        </td>
        <td class="celdaValor">
            <span class="subCampo">Material:</span>
            <asp:DropDownList ID="materialGuarniciones_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="2">
            <div class="etiqueta2">
                <span class="textoNegritas">Porcentaje de infraestructura disponible:</span>
                <asp:Label ID="nivelInfraestructura_Lbl" runat="server"></asp:Label>
                <span class="textoChico">&nbsp;%</span>
            </div>
            <div class="etiqueta2">
                <span class="textoNegritas">Nivel de infraestructura urbana SHF:</span>
                <asp:Label ID="nivelInfraestructuraSHF_Lbl" runat="server"></asp:Label>
            </div>
        </td>
    </tr>
</table>
