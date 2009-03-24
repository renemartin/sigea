<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueIngresosHomologacion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosEnfoqueIngresosHomologacion" %>

<table class="tablaExtendida glosario">
    <tr>
        <td class="termino">
            FCom
        </td>
        <td class="definicion">
            Factor de Comercialización
        </td>
        <td class="termino">
            FCl
        </td>
        <td class="definicion">
            Factor de Clase
        </td>
        <td class="termino">
            FLo
        </td>
        <td class="definicion">
            Factor de Localización (Tipo de Colonia)
        </td>
    </tr>
    <tr>
        <td class="termino">
            FEd
        </td>
        <td class="definicion">
            Factor de Edad
        </td>
        <td class="termino">
            FUb
        </td>
        <td class="definicion">
            Factor de Ubicación en la Manzana (No. de Frentes)
        </td>
        <td class="termino">
            FSu
        </td>
        <td class="definicion">
            Factor de Superficie
        </td>
    </tr>
    <tr>
        <td class="termino">
            FCo
        </td>
        <td class="definicion">
            Factor de Conservación
        </td>
        <td class="termino">
            FPr
        </td>
        <td class="definicion">
            Factor de Proyecto o Avance de Obra
        </td>
        <td class="termino">
            FUs
        </td>
        <td class="definicion">
            Factor de Uso de Suelo
        </td>
    </tr>
</table>

<table class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td rowspan="2">
            FCom
        </td>
        <td rowspan="2">
            Valor ajustado
        </td>
        <td rowspan="2">
            Superficie rentable (m²)
        </td>
        <td rowspan="2">
            Valor unitario ajustado de renta
        </td>
        <td colspan="8">
            Factores de homologación
        </td>
        <td rowspan="2">
            FRe
        </td>
        <td rowspan="2">
            Valor unitario de renta homologado
        </td>
    </tr>
    <tr class="filaHeader">
        <td>
            FEd
        </td>
        <td>
            FCo
        </td>
        <td>
            FCl
        </td>
        <td>
            FUb
        </td>
        <td>
            FPr
        </td>
        <td>
            FLo
        </td>
        <td>
            FSu
        </td>
        <td>
            FUs
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="FCom_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VA_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="supRentable_Lbl" runat="server"></asp:Label>
            &nbsp;(m²)
        </td>
        <td class="celdaValor">
            <asp:Label ID="VUAR_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FEd_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FCo_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FCl_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FUb_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FPr_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FLo_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FSu_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FUs_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FRe_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VURH_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec" align="right" colspan="13">
            Valor unitario de renta homologado promedio:
        </td>
        <td class="celdaValor">
            <asp:Label ID="VURHP_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec" align="right" colspan="13">
            Valor unitario de renta a aplicar:
        </td>
        <td class="celdaValor">
            <asp:Label ID="VURA_Lbl" runat="server"></asp:Label>&nbsp;
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec" align="right" colspan="13">
            Renta bruta mensual:
        </td>
        <td class="celdaValor">
            <asp:Label ID="RBM_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function IngresosHomologacion() {
        // Inicialización
        IngresosHomologacion.prototype.getData = getData;
        IngresosHomologacion.prototype.setData = setData;
        IngresosHomologacion.prototype.validate = validate;

        // Databindings
        function getData() {
            var data_set = new Array();
            
            
            return data_set;
        }

        function setData(data_set) {
        }
        
        // Validación
        function validate() {
            return true;
        }
    }

    this["<%= ID %>"] = new IngresosHomologacion();

</script>