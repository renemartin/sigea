<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueIngresosAnalisisDeducciones.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_AnalisisDeduccionesIngresos" %>

<table>
    <tr class="filaHeader">
        <td>
            Concepto
        </td>
        <td>
            Monto
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Vacíos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="meses_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">mes(es) cada</span>
            &nbsp;<asp:TextBox ID="TextBox2" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">año(s)</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Impuesto predial:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="montoPredial_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">
                <asp:RadioButton ID="predialAnual_RBtn" runat="server" Checked="True" GroupName="impuestoPredial"
                    Text="Anual" />
                <asp:RadioButton ID="predialBimestral_RBtn" runat="server" GroupName="impuestoPredial"
                    Text="Bimestral" />
            </span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Conservación y mantenimiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="conservacion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Administración:
        </td>
        <td class="celdaValor">
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Seguros:
        </td>
        <td class="celdaValor">
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Otros:
        </td>
        <td class="celdaValor">
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Depreciación fiscal:
        </td>
        <td class="celdaValor">
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            ISR:
        </td>
        <td class="celdaValor">
        </td>
    </tr>
</table>

<table>
    <tr>
        <td class="celdaTitulo">
            Deducciones mensuales:
        </td>
        <td class="celdaValor">
            <asp:Label ID="deduccionesM_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Producto líquido mensual:
        </td>
        <td class="celdaValor">
            <asp:Label ID="productoLM_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Producto líquido anual:
        </td>
        <td class="celdaValor">
            <asp:Label ID="productoLA_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function IngresosDeducciones() {
        // Inicialización
        IngresosDeducciones.prototype.getData = getData;
        IngresosDeducciones.prototype.setData = setData;
        IngresosDeducciones.prototype.validate = validate;

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

    this["<%= ID %>"] = new IngresosDeducciones();

</script>