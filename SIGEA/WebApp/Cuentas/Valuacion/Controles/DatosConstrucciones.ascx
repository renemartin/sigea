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
    
    //mostrar datos
    function setDatosConstrucciones(data) {
        $get("<%= calidadProy_DDList.ClientID %>").selectedValue = data.idCalidadProyecto;
        $get("<%= avanceObraGral_TBox.ClientID %>").value = data.avanceObra;
        $get("<%= claseGral_DDList.ClientID %>").selectedValue = data.idClase;
        $get("<%= estadoConservacionGral_DDList.ClientID %>").selectedValue = data.idConservacion;
        $get("<%= unidadesRentables_TBox.ClientID %>").value = data.unidadesRentables;
        $get("<%= constructor_TBox.ClientID %>").value = data.unidadRentable;
        $get("<%= nivelesConstruccion_TBox.ClientID %>").value = data.nivelesConstruccion;
        $get("<%= nivelEdificio_TBox.ClientID %>").value = data.nivelEdificio;
        $get("<%= horizontal_CBox.ClientID %>").checked = data.horizontal;
        $get("<%= vertical_CBox.ClientID %>").checked = data.vertical;
        
    }
    function setDatosCondominios(data) {
        $get("<%= avanceAComunes_TBox.ClientID %>").value = data.avanceObra;
        $get("<%= unidRentNucleo_TBox.ClientID %>").value = data.unidadesNucelo;
        $get("<%= unidRentConjunto_TBox.ClientID %>").value = data.unidadesConjunto;       
    }
    
    //guardar datos
    function getDatosConstrucciones() {
        var data = new Object();
        
        data.idCalidadProyecto = $get("<%= calidadProy_DDList.ClientID %>").selectedValue;
        data.avanceObra = $get("<%= avanceObraGral_TBox.ClientID %>").value;
        data.idClase = $get("<%= claseGral_DDList.ClientID %>").selectedValue;
        data.idConservacion = $get("<%= estadoConservacionGral_DDList.ClientID %>").selectedValue;
        data.unidadesRentables = $get("<%= unidadesRentables_TBox.ClientID %>").value = data.unidadRentable;
        data.constructor = $get("<%= constructor_TBox.ClientID %>").value;
        data.nivelesConstruccion = $get("<%= nivelesConstruccion_TBox.ClientID %>").value;
        data.nivelEdificio = $get("<%= nivelEdificio_TBox.ClientID %>").value;
        data.horizontal = $get("<%= horizontal_CBox.ClientID %>").checked;
        data.vertical = $get("<%= vertical_CBox.ClientID %>").checked; 
         
        return data;
    }
    function getDatosCondominios() {
        var data = new Object();
        
        data.avanceObra = $get("<%= avanceAComunes_TBox.ClientID %>").value;
        data.unidadesNucelo; $get("<%= unidRentNucleo_TBox.ClientID %>").value;
        data.unidadesConjunto = $get("<%= unidRentConjunto_TBox.ClientID %>").value;
        
        return data;
    }

    // Visibilidad secciones
    function showDatosConstruccionesCondominio() {
        setVisibility($get("seccion_construcciones_condominio"), true);
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
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="unidadesRentables_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTitulo">
            Niveles Construccion:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="nivelesConstruccion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Constructor:
        </td> 
        <td class="celdaValor">
            <asp:TextBox ID="constructor_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Niveles Edificio:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesEdificio_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="horizontal_CBox" Text="Horizontal" runat="server" />
            <asp:CheckBox ID="vertical_CBox" Text="vertical" runat="server"
        </td>
    </tr>
</table>
<table id="seccion_construcciones_condominio" style="display:none;">
    <tr>
        <td class="celdaTitulo">
            Avance de obra en áreas comúnes en condominios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceAComunes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables en el núcleo de construcción:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentNucleo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables del conjunto:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentConjunto_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
