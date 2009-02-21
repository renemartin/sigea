<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstrucciones.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosConstrucciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillConstruccionesData() {
        fillCalidadProyecto("<%= calidadProy_DDList.ClientID %>");
        fillClaseInmueble("<%= claseGral_DDList.ClientID %>");
        fillEstadoConservacion("<%= estadoConservacionGral_DDList.ClientID %>");
    }   
    
    // Databindings
    function setDatosConstrucciones(data) {
        if (data != null) {
            $get("<%= claseGral_DDList.ClientID %>").selectedValue = data.idClaseGeneral;
            $get("<%= estadoConservacionGral_DDList.ClientID %>").selectedValue = data.idConservacionGeneral;
            $get("<%= calidadProy_DDList.ClientID %>").selectedValue = data.idCalidadProyecto;
            $get("<%= constructor_TBox.ClientID %>").value = data.nombreConstructor;
            $get("<%= avanceObraGral_TBox.ClientID %>").value = data.avanceObraGeneral;            
            $get("<%= nivelesConstruccion_TBox.ClientID %>").value = data.nivelesConstruccion;
            $get("<%= nivelEdificio_TBox.ClientID %>").value = data.nivelEdificio;
            $get("<%= horizontal_CBox.ClientID %>").checked = data.horizontal;
            $get("<%= vertical_CBox.ClientID %>").checked = data.vertical;
            $get("<%= unidadesRentables_TBox.ClientID %>").value = data.unidadesRentables;
        }
    }
    
    //guardar datos
    function getDatosConstrucciones() {
        var data = new Object();

        data.idClaseGeneral = $get("<%= claseGral_DDList.ClientID %>").value;
        data.idConservacionGeneral = $get("<%= estadoConservacionGral_DDList.ClientID %>").value;
        data.idCalidadProyecto = $get("<%= calidadProy_DDList.ClientID %>").value;
        data.nombreConstructor = $get("<%= constructor_TBox.ClientID %>").value;
        data.avanceObraGeneral = $get("<%= avanceObraGral_TBox.ClientID %>").value;
        data.nivelesConstruccion = $get("<%= nivelesConstruccion_TBox.ClientID %>").value;
        data.nivelEdificio = $get("<%= nivelEdificio_TBox.ClientID %>").value;
        data.horizontal = $get("<%= horizontal_CBox.ClientID %>").checked;
        data.vertical = $get("<%= vertical_CBox.ClientID %>").checked;
        data.unidadesRentables = $get("<%= unidadesRentables_TBox.ClientID %>").value;
          
        return data;
    }

</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Calidad del proyecto:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="calidadProy_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Avance de obra general:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceObraGral_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clase general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="claseGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Estado de conservación general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoConservacionGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidadesRentables_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Tipo construcción</td>
        <td class="celdaValor">
            <asp:CheckBox ID="horizontal_CBox" Text="Horizontal" runat="server" />
            <asp:CheckBox ID="vertical_CBox" Text="Vertical" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Niveles construccion:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesConstruccion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Nivel en edificio:</td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelEdificio_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Constructor:
        </td> 
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="constructor_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    </table>
