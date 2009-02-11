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
