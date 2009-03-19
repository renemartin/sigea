<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosComparable.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosComparable" %>

<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Tipo:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="tipoComparable_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Valor de oferta:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="valorOferta_TBox" runat="server">
            </asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Número de frentes:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="numeroFrentes_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superficie del Terreno:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server">
            </asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
    </tr>
</table>

<table id="seccion_construccion" class="hidden">
    <tr>
        <td class="celdaTitulo">
            Superficie construida:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieConstruida_TBox" runat="server">
            </asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Uso de suelo:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="usoSuelo_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clase:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="clase_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Conservación:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="conservacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Antigüedad:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="antiguedad_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Calidad del proyecto:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="calidadProyecto_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Avance de la obra:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceObra_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
</table>

<table>
    <tr>
        <td class="celdaTitulo">
            Nombre de contacto:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="nombreContacto_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Teléfono
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="telefonoContacto_TBox" runat="server">
            </asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Email
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="emailContacto_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
</table>

<SIGEA:DatosDireccion ID="ubicacion_Ctrl" runat="server" />

<script type="text/javascript">

    // Variables
    var idTipoTerreno = "1"

    function Comparable() {
        // Inicialización
        this.esTerreno = true;
        Comparable.prototype.fillData = fillData;
        Comparable.prototype.getData = getData;
        Comparable.prototype.setData = setData;
        Comparable.prototype.clear = clear;
        Comparable.prototype.validate = validate;
        Comparable.prototype.setOpcionalesTerreno = setOpcionalesTerreno;
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= tipoComparable_DDList.ClientID %>"),          // 0
            $get("<%= valorOferta_TBox.ClientID %>"),               // 1
            $get("<%= numeroFrentes_TBox.ClientID %>"),             // 2
            $get("<%= superficieTerreno_TBox.ClientID %>"),         // 3
            $get("<%= nombreContacto_TBox.ClientID %>"),            // 4
            $get("<%= telefonoContacto_TBox.ClientID %>"),          // 5
            $get("<%= usoSuelo_DDList.ClientID %>"),                // 6
            $get("<%= clase_DDList.ClientID %>"),                   // 7
            $get("<%= conservacion_DDList.ClientID %>"),            // 8
            $get("<%= calidadProyecto_DDList.ClientID %>"),         // 9
            $get("<%= superficieConstruida_TBox.ClientID %>"),      // 10
            $get("<%= antiguedad_TBox.ClientID %>"),                // 11
            $get("<%= avanceObra_TBox.ClientID %>")                 // 12
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addNumericField(1, true);
        this.validator.addNumericField(2, false);
        this.validator.addNumericField(3, true);
        this.validator.addNumericField(10, true);
        this.validator.addNumericField(11, true);
        this.validator.addNumericField(12, true);
        this.setOpcionalesTerreno(true);

        // Llenado de datos
        function fillData() {
            fillTipoComparable("<%= tipoComparable_DDList.ClientID %>");
            fillCalidadProyecto("<%= calidadProyecto_DDList.ClientID %>");
            fillClaseInmueble("<%= clase_DDList.ClientID %>");
            fillEstadoConservacion("<%= conservacion_DDList.ClientID %>");
            fillUsoSuelo("<%= usoSuelo_DDList.ClientID %>");
        }

        // DataBindings
        function getData() {
            var data_set = new Array()

            data_set[0] = new Object();
            data_set[0].idTipoComparable = $get("<%= tipoComparable_DDList.ClientID %>").value;
            data_set[0].valorOferta = $get("<%= valorOferta_TBox.ClientID %>").value;
            data_set[0].numeroFrentes = $get("<%= numeroFrentes_TBox.ClientID %>").value;
            data_set[0].superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data_set[0].nombreContacto = $get("<%= nombreContacto_TBox.ClientID %>").value;
            data_set[0].emailContacto = $get("<%= emailContacto_TBox.ClientID %>").value;
            data_set[0].telefonoContacto = $get("<%= telefonoContacto_TBox.ClientID %>").value;

            if (!this.esTerreno) {
                data_set[0].idUsoSuelo = $get("<%= usoSuelo_DDList.ClientID %>").value;
                data_set[0].idClase = $get("<%= clase_DDList.ClientID %>").value;
                data_set[0].idConservacion = $get("<%= conservacion_DDList.ClientID %>").value;
                data_set[0].idCalidadProyecto = $get("<%= calidadProyecto_DDList.ClientID %>").value;
                data_set[0].superficieConstruida = $get("<%= superficieConstruida_TBox.ClientID %>").value;
                data_set[0].antiguedad = $get("<%= antiguedad_TBox.ClientID %>").value;
                data_set[0].avanceObra = $get("<%= avanceObra_TBox.ClientID %>").value;
            }

            data_set[1] = ubicacion_Ctrl.getData();
            
            return data_set;
        }

        function setData(data_set) {
            if (data_set != null) {
                $get("<%= tipoComparable_DDList.ClientID %>").selectedValue = data_set[0].idTipoComparable;
                $get("<%= valorOferta_TBox.ClientID %>").value = data_set[0].valorOferta;
                $get("<%= numeroFrentes_TBox.ClientID %>").value = data_set[0].numeroFrentes;
                $get("<%= superficieTerreno_TBox.ClientID %>").value = data_set[0].superficieTerreno;
                $get("<%= nombreContacto_TBox.ClientID %>").value = data_set[0].nombreContacto;
                $get("<%= emailContacto_TBox.ClientID %>").value = data_set[0].emailContacto;
                $get("<%= telefonoContacto_TBox.ClientID %>").value = data_set[0].telefonoContacto;

                if (data_set[0].idTipoComparable != idTipoTerreno) {
                    $get("<%= usoSuelo_DDList.ClientID %>").selectedValue = data_set[0].idUsoSuelo;
                    $get("<%= clase_DDList.ClientID %>").selectedValue = data_set[0].idClase;
                    $get("<%= conservacion_DDList.ClientID %>").selectedValue = data_set[0].idConservacion;
                    $get("<%= calidadProyecto_DDList.ClientID %>").selectedValue = data_set[0].idCalidadProyecto;
                    $get("<%= superficieConstruida_TBox.ClientID %>").value = data_set[0].superficieConstruida;
                    $get("<%= antiguedad_TBox.ClientID %>").value = data_set[0].antiguedad;
                    $get("<%= avanceObra_TBox.ClientID %>").value = data_set[0].avanceObra;
                    this.esTerreno = false;
                    setVisibility($get("seccion_construccion"), true);
                    this.setOpcionalesTerreno(false); 
                }
                else {                    
                    this.esTerreno = true;                                       
                }

                ubicacion_Ctrl.setData(data_set[1]);
            }
            else {
                ubicacion_Ctrl.fillData();
            }
            
            fillData();
        }

        // Limpiar datos
        function clear() {
            $get("<%= tipoComparable_DDList.ClientID %>").value = "0"
            $get("<%= valorOferta_TBox.ClientID %>").value = "";
            $get("<%= numeroFrentes_TBox.ClientID %>").value = "";
            $get("<%= superficieTerreno_TBox.ClientID %>").value = "";
            $get("<%= nombreContacto_TBox.ClientID %>").value = "";
            $get("<%= emailContacto_TBox.ClientID %>").value = "";
            $get("<%= telefonoContacto_TBox.ClientID %>").value = "";

            $get("<%= usoSuelo_DDList.ClientID %>").selectedValue = "0";
            $get("<%= clase_DDList.ClientID %>").selectedValue = "0";
            $get("<%= conservacion_DDList.ClientID %>").selectedValue = "0";
            $get("<%= calidadProyecto_DDList.ClientID %>").selectedValue = "0";
            $get("<%= superficieConstruida_TBox.ClientID %>").value = "";
            $get("<%= antiguedad_TBox.ClientID %>").value = "";
            $get("<%= avanceObra_TBox.ClientID %>").value = "";
            this.esTerreno = true;
            setVisibility($get("seccion_construccion"), false);
        }

        // Validación
        function validate() {
            var validated = true;

            if (!this.validator.validate()) {
                validated = false;
            }
            if (!ubicacion_Ctrl.validate()) {
                validated = false;
            }

            return validated;
        }

        function setOpcionalesTerreno(opcionales) {
            var i;
            for (i = 6; i < 13; i++) {
                if (opcionales) {
                    this.validator.addOptionalField(i);
                }
                else {
                    this.validator.removeOptionalField(i);                    
                }
            }
        }
    }

    function setTipoComparableSelection(valor) {        
        var control = eval("<%= ID %>");
        control.esTerreno = valor == idTipoTerreno || valor == "0";
        control.setOpcionalesTerreno(control.esTerreno);
        setVisibility($get("seccion_construccion"), !control.esTerreno)        
    }

    this["<%= ID %>"] = new Comparable();

</script>
