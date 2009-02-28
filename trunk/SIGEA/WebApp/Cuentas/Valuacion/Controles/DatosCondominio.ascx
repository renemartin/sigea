<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosCondominio.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosCondominio" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficiesAdicionales.ascx"
    TagName="SuperficiesAdicionales" TagPrefix="SIGEA" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Superficie del terreno:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
    </tr>
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
<table>
    <tr>
        <td colspan="4" class="celdaHeader">
            Superficies del condominio
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Indiviso:
        </td>
        <td class="celdaValor" valign="top">
            <asp:TextBox ID="indiviso_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
            <div id="seccion_proporcional">
                <asp:Label ID="proporcional_Lbl" runat="server"></asp:Label>
            </div>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor" valign="top">
            <asp:DropDownList ID="fuenteIndiviso_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_indiviso" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteIndiviso_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Lote privativo
        </td>
        <td class="celdaValor" valign="top">
            <asp:TextBox ID="lotePrivativo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor" valign="top">
            <asp:DropDownList ID="fuentePrivativo_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_privativo" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuentePrivativo_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaHeader">
            Áreas cubiertas
        </td>
        <td class="celdaHeader">
            Obras complementarias
        </td>
    </tr>
    <tr>
        <td valign="top">
            <SIGEA:SuperficiesAdicionales ID="superficiesConstrucciones_Ctrl" runat="server" />
        </td>
        <td valign="top">
            <SIGEA:SuperficiesAdicionales ID="superficiesObras_Ctrl" runat="server" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    function Condominio() {
        // Inicialización
        if (typeof (Condominio_Init) == "undefined") {
            Condominio_Init = true;
            Condominio.prototype.fillData = fillData;
            Condominio.prototype.setData = setData;
            Condominio.prototype.getData = getData;
            Condominio.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= avanceAComunes_TBox.ClientID %>"),          // 0
            $get("<%= unidRentNucleo_TBox.ClientID %>"),          // 1
            $get("<%= unidRentConjunto_TBox.ClientID %>"),        // 2
            $get("<%= indiviso_TBox.ClientID %>"),                // 3
            $get("<%= superficieTerreno_TBox.ClientID %>"),       // 4
            $get("<%= fuenteIndiviso_DDList.ClientID %>"),        // 5
            $get("<%= especFuenteIndiviso_TBox.ClientID %>"),     // 6
            $get("<%= lotePrivativo_TBox.ClientID %>"),           // 7
            $get("<%= fuentePrivativo_DDList.ClientID %>"),       // 8
            $get("<%= especFuentePrivativo_TBox.ClientID %>")     // 9
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(6);
        this.validator.addOptionalField(9);
        this.validator.addNumericField(0, true);
        this.validator.addNumericField(1, false);
        this.validator.addNumericField(2, false);
        this.validator.addNumericField(3, true);
        this.validator.addNumericField(4, true);
        this.validator.addNumericField(7, true);
    
        // Llenado de datos
        function fillData() {
            fillFuente("<%= fuenteIndiviso_DDList.ClientID %>");
            fillFuente("<%= fuentePrivativo_DDList.ClientID %>");
        }

        // Databindings
        function setData(data_set) {
            if (data_set != null) {
                if (data_set[0] != null) {
                    $get("<%= avanceAComunes_TBox.ClientID %>").value = data_set[0].avanceObra;
                    $get("<%= unidRentNucleo_TBox.ClientID %>").value = data_set[0].unidadesRentNucleo;
                    $get("<%= unidRentConjunto_TBox.ClientID %>").value = data_set[0].unidadesRentConjunto;

                }

                if (data_set[1] != null) {
                    $get("<%= indiviso_TBox.ClientID %>").value = data_set[1].indiviso;
                    $get("<%= superficieTerreno_TBox.ClientID %>").value = data_set[1].totalTerreno;
                    $get("<%= fuenteIndiviso_DDList.ClientID %>").selectedValue = data_set[1].fuenteIndiviso;
                    $get("<%= especFuenteIndiviso_TBox.ClientID %>").value = data_set[1].otraFuenteIndiviso;
                    $get("<%= lotePrivativo_TBox.ClientID %>").value = data_set[1].privativo;
                    $get("<%= fuentePrivativo_DDList.ClientID %>").selectedValue = data_set[1].fuentePrivativo;
                    $get("<%= especFuentePrivativo_TBox.ClientID %>").value = data_set[1].otraFuentePrivativo;

                }
                
                superficiesConstrucciones_Ctrl.setData(data_set[2]);
                superficiesObras_Ctrl.setData(data_set[3]);
            }

            this.fillData();
        }
        function getData() {
            var data_set = new Array();

            data_set[0] = new Object();
            data_set[0].avanceObra = $get("<%= avanceAComunes_TBox.ClientID %>").value;
            data_set[0].unidadesRentNucleo = $get("<%= unidRentNucleo_TBox.ClientID %>").value;
            data_set[0].unidadesRentConjunto = $get("<%= unidRentConjunto_TBox.ClientID %>").value;

            data_set[1] = new Object();
            data_set[1].indiviso = $get("<%= indiviso_TBox.ClientID %>").value;
            data_set[1].totalTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data_set[1].fuenteIndiviso = $get("<%= fuenteIndiviso_DDList.ClientID %>").value;
            data_set[1].otraFuenteIndiviso = $get("<%= especFuenteIndiviso_TBox.ClientID %>").value;
            data_set[1].privativo = $get("<%= lotePrivativo_TBox.ClientID %>").value;
            data_set[1].fuentePrivativo = $get("<%= fuentePrivativo_DDList.ClientID %>").value;
            data_set[1].otraFuentePrivativo = $get("<%= especFuentePrivativo_TBox.ClientID %>").value;

            data_set[2] = superficiesConstrucciones_Ctrl.getData();
            data_set[3] = superficiesObras_Ctrl.getData();
            
            return data_set;
        }

        // Validación
        function validate() {
            var condominio_valid = this.validator.validate();
            var construcciones_valid = superficiesConstrucciones_Ctrl.validate()
            var obras_valid = superficiesObras_Ctrl.validate();

            return condominio_valid && construcciones_valid && obras_valid;
        }
    }

    this["<%= ID %>"] = new Condominio();
    
</script>