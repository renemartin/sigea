<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosInstalaciones.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosInstalaciones" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosTablaInstalaciones.ascx"
    TagName="TablaInstalaciones" TagPrefix="SIGEA" %>
<div id="seccion_InstalacionesPrivativas" class="hidden">
    <h3>
        Instalaciones privativas</h3>
    <SIGEA:TablaInstalaciones ID="instalacionesPrivativas_Ctrl" runat="server" />
</div>
<div id="seccion_InstalacionesComunes" class="hidden">
    <h3>
        Instalaciones comúnes</h3>
    <SIGEA:TablaInstalaciones ID="instalacionesComunes_Ctrl" runat="server" />
</div>
<div id="seccion_ValorTotal" style="text-align: right; padding-top: 10px;">
    <span class="textoNegritas">Valor total de las instalaciones:</span>
    <asp:Label ID="totalInstalaciones_Lbl" runat="server"></asp:Label>
</div>

<script type="text/javascript">

    function CostosInstalaciones() {
        // Inicialización
        CostosInstalaciones.prototype.getData = getData;
        CostosInstalaciones.prototype.setData = setData;
        CostosInstalaciones.prototype.validate = validate;
        CostosInstalaciones.prototype.showPrivativas = showPrivativas;
        CostosInstalaciones.prototype.showComunes = showComunes;

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
        
        // Visibilidad
        function showPrivativas() {
            $get("seccion_instalacionesPrivativas").style.display = "block";
        }
        function showComunes() {
            $get("seccion_instalacionesComunes").style.display = "block";
        }

        
    }

    this["<%= ID %>"] = new CostosInstalaciones();

</script>

