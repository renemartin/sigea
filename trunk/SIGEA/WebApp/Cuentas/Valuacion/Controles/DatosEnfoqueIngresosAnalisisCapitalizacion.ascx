<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueIngresosAnalisisCapitalizacion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_AnalisisCapitalizacionIngresos" %>
    
<table>
    <tr>
        <td class="celdaTitulo">
            Tasa de referencia:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="tasaReferencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tiempo de venta:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="tiempoVenta_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">meses</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Gastos de venta:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="gastosVenta_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            &nbsp;<span class="textoChico">%</span>
        </td>
    </tr>
</table>

<table>
    <tr class="filaHeader">
        <td colspan="2">
            Enfoque financiero
        </td>
        <td colspan="2">
            Enfoque de mercado
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tasa real:
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaReal" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Valor unitario de renta promedio
        </td>
        <td class="celdaValor">
            <asp:Label ID="valorURP_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tasa de liquidez:
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaLiquidez_Lbl" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Valor unitario de venta promedio
        </td>
        <td class="celdaValor">
            <asp:Label ID="valorUVP_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tasa de recuperacion:
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaRecuperacion_Lbl" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
        </td>
        <td class="celdaValor">
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tasa de enfoque financiero:
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaEnfoqueFinancierio_Lbl" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Tasa de enfoque de mercado
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaEnfoqueMercado_Lbl" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
    </tr>
</table>

<div style="padding-top:20px; padding-bottom:20px;">
    <span class="textoNegritas">Enfoque que se aplica:</span>
    <asp:RadioButton ID="EnfoqueFinanciero_RButton" Text="Enfoque financiero" GroupName="enfoque"
        Checked="true" runat="server" />
    <asp:RadioButton ID="EnfoqueMercado_RButton" Text="Enfoque de mercado" GroupName="enfoque"
        runat="server" />
</div>
                
<table>
    <tr>
        <td class="celdaTitulo">
            Tasa de capitalización aplicable al caso:
        </td>
        <td class="celdaValor">
            <asp:Label ID="tasaCapitalizacion_Label" runat="server"></asp:Label>
            &nbsp;<span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de periodos considerados 
            &nbsp;<span class="textoChico">(años):</span>
        </td>
        <td class="celdaValor">
            <asp:Label ID="numeroPeriodos_Label" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function IngresosCapitalizacion() {
        // Inicialización
        IngresosCapitalizacion.prototype.getData = getData;
        IngresosCapitalizacion.prototype.setData = setData;
        IngresosCapitalizacion.prototype.validate = validate;

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

    this["<%= ID %>"] = new IngresosCapitalizacion();

</script>