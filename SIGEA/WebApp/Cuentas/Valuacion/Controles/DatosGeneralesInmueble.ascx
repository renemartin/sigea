<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosGeneralesInmueble.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosGeneralesInmueble" %>
<%@ Register Src="DatosDireccionInmueble.ascx" TagName="DatosDireccionInmueble" TagPrefix="SIGEA" %>
<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<script type="text/javascript">
    // DataBindings
    function getDatosInmueble() {
        var data = new Object();

        data["idTipoInmueble"] = $get("<%= tipoInmueble_DDList.ClientID %>").value;
        data["idRegimenPropiedad"] = $get("<%= regimenPropiedad_DDList.ClientID %>").value;
        data["otroTipoInmueble"] = "";
        data["claveCatastral"] = $get("<%= claveCatastral_TBox.ClientID %>").value;
        data["cuentaPredial"] = $get("<%= cuentaPredial_TBox.ClientID %>").value;
        data["cuentaAgua"] = $get("<%= cuentaAgua_TBox.ClientID %>").value;
        data["telefono"] = $get("<%= telefono_TBox.ClientID %>").value;

        return data;
    }
    function setDatosInmueble(data) {
        $get("<%= tipoInmueble_DDList.ClientID %>").selectedValue = data["idTipoInmueble"];
        $get("<%= regimenPropiedad_DDList.ClientID %>").selectedValue = data["idRegimenPropiedad"];
        $get("<%= claveCatastral_TBox.ClientID %>").value = data["claveCatastral"];
        $get("<%= cuentaPredial_TBox.ClientID %>").value = data["cuentaPredial"]
        $get("<%= cuentaAgua_TBox.ClientID %>").value = data["cuentaAgua"];
        $get("<%= telefono_TBox.ClientID %>").value = data["telefono"];
    }

    // Llenado de datos
    function fillInmuebleData() {
        fillTipoInmueble("<%= tipoInmueble_DDList.ClientID %>");
        fillRegimenPropiedad("<%= regimenPropiedad_DDList.ClientID %>");
    }

    // Obtención de datos

    function getIdTipoInmueble() {
        return $get("<%= tipoInmueble_DDList.ClientID %>").value;
    }
   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Tipo de inmueble:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="tipoInmueble_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Régimen de propiedad:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="regimenPropiedad_DDList" runat="server">
            </asp:DropDownList>
    </tr>
</table>
<SIGEA:DatosDireccion ID="direccion_Ctrl" runat="server" />
<SIGEA:DatosDireccionInmueble id="ubicacion_Ctrl" runat="server" />
<table>
    <tr>
        <td class="celdaTitulo">
            Teléfono:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="telefono_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clave catastral:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="claveCatastral_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Cuenta predial:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cuentaPredial_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cuenta agua:
        </td>
        <td class="celdaValor" >
            <asp:TextBox ID="cuentaAgua_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            CUV:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="CUV_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
