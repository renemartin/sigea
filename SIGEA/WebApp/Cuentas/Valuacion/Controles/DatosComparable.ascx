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
        <td class="celdaValor">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server">
            </asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Superficie construida:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieConstruida_TBox" runat="server">
            </asp:TextBox>
        </td>
    </tr>
</table>

<table id="modTerreno" class="hidden">
    <tr>
        <td class="celdaTitulo">
            Uso de suelo:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="usoSuelo_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Clase:
        </td>
        <td class="celdaValor">
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
        Comparable.prototype.validate = validate;
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= tipoComparable_DDList.SelectedValue %>"),     // 0
            $get("<%= valorOferta_TBox.ClientID %>"),               // 1
            $get("<%= numeroFrentes_TBox.ClientID %>"),             // 2
            $get("<%= superficieTerreno_TBox.ClientID %>"),         // 3
            $get("<%= nombreContacto_TBox.ClientID %>"),            // 4
            $get("<%= emailContacto_TBox.ClientID %>"),             // 5
            $get("<%= telefonoContacto_TBox.ClientID %>"),          // 6
            $get("<%= usoSuelo_DDList.SelectedValue %>"),           // 7
            $get("<%= clase_DDList.SelectedValue %>"),              // 8
            $get("<%= conservacion_DDList.SelectedValue %>"),       // 9
            $get("<%= calidadProyecto_DDList.SelectedValue %>"),    // 10
            $get("<%= superficieConstruida_TBox.ClientID %>"),      // 11
            $get("<%= antiguedad_TBox.ClientID %>"),                // 12
            $get("<%= avanceObra_TBox.ClientID %>")                 // 13
        );
        this.validator = new ControlValidator(this.controls);        
        this.validator.addNumericField(1, true);
        this.validator.addNumericField(2, false);
        this.validator.addNumericField(3, true);
        this.validator.addNumericField(11, true);
        this.validator.addNumericField(12, true);
        this.validator.addNumericField(13, true);
        setOpcionalesTerreno(true);

        // Llenado de datos
        function fillData() {
            fillTipoComparable("<%= tipoComparable_DDList.SelectedValue %>");
            fillCalidadProyecto("<%= calidadProyecto_DDList.SelectedValue %>");
            fillClaseInmueble("<%= clase_DDList.SelectedValue %>");
            fillEstadoConservacion("<%= conservacion_DDList.SelectedValue %>");
            fillUsoSuelo("<%= usoSuelo_DDList.SelectedValue %>");
        }

        // DataBindings
        function getData() {
            var data = new Object();
           
            data.idTipoComparable = $get("<%= tipoComparable_DDList.SelectedValue %>").value;
            data.valorOferta = $get("<%= valorOferta_TBox.ClientID %>").value;
            data.numeroFrentes = $get("<%= numeroFrentes_TBox.ClientID %>").value;
            data.superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data.nombreContacto = $get("<%= nombreContacto_TBox.ClientID %>").value;
            data.emailContacto = $get("<%= emailContacto_TBox.ClientID %>").value;
            data.telefonoContacto = $get("<%= telefonoContacto_TBox.ClientID %>").value;

            if (!this.esTerreno) {
                data.idUsoSuelo = $get("<%= usoSuelo_DDList.SelectedValue %>").value;
                data.idClase = $get("<%= clase_DDList.SelectedValue %>").value;
                data.idConservacion = $get("<%= conservacion_DDList.SelectedValue %>").value;
                data.idCalidadProyecto = $get("<%= calidadProyecto_DDList.SelectedValue %>").value;
                data.superficieConstruida = $get("<%= superficieConstruida_TBox.ClientID %>").value;
                data.antiguedad = $get("<%= antiguedad_TBox.ClientID %>").value;
                data.avanceObra = $get("<%= avanceObra_TBox.ClientID %>").value;
            }

            return data;
        }

        function setData(data) {
            if (data != null) {                
                $get("<%= tipoComparable_DDList.SelectedValue %>").selectedValue = data.idTipoComparable;
                $get("<%= valorOferta_TBox.ClientID %>").value = data.valorOferta;
                $get("<%= numeroFrentes_TBox.ClientID %>").value = data.numeroFrentes;
                $get("<%= superficieTerreno_TBox.ClientID %>").value = data.superficieTerreno;
                $get("<%= nombreContacto_TBox.ClientID %>").value = data.nombreContacto;
                $get("<%= emailContacto_TBox.ClientID %>").value = data.emailContacto;
                $get("<%= telefonoContacto_TBox.ClientID %>").value = data.telefonoContacto;

                if (data.idTipoComparable == idTipoTerreno) {
                    $get("<%= usoSuelo_DDList.SelectedValue %>").selectedValue = data.idUsoSuelo;
                    $get("<%= clase_DDList.SelectedValue %>").selectedValue = data.idClase;
                    $get("<%= conservacion_DDList.SelectedValue %>").selectedValue = data.idConservacion;
                    $get("<%= calidadProyecto_DDList.SelectedValue %>").selectedValue = data.idCalidadProyecto;
                    $get("<%= superficieConstruida_TBox.ClientID %>").value = data.superficieConstruida;
                    $get("<%= antiguedad_TBox.ClientID %>").value = data.antiguedad;
                    $get("<%= avanceObra_TBox.ClientID %>").value = data.avanceObra;
                    setVisibility($get("modTerreno"), true);
                }
            }
            
            fillData();
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
    }

    function setTipoComparableSelection(valor) {
        var control = eval("<%= ID %>");
        control.esTerreno = valor == idTipoTerreno;
        setVisibility($get("modTerreno"), control.esTerreno)
        setOpcionalesTerreno(control.esTerreno);
    }

    function setOpcionalesTerreno(opcionales) {
        var i;
        for (i = 7; i < 14; i++) {
            if (opcionales) {
                this.validator.addOptionalField(i);
            }
            else {
                this.validator.removeOptionalField(i);
            }
        }
    }

    this["<%= ID %>"] = new Comparable();

</script>
