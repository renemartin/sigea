<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoEquipamiento.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosEntornoEquipamiento" %>


<table>
    <tr>
        <td class="celdaTitulo">
            Iglesia:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaIglesia_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Mercado:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaMercado_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Plaza pública:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaPlaza_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Escuela:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaEscuela_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Hospital:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaHospital_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Parque/Jardín:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaParque_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Banco:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaBanco_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Parada tranporte:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaTransporte_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
</table>
<div class="etiqueta2">
    <span class="textoNegritas">Proximidad general:</span>
    <asp:Label ID="proximidadGeneral_Lbl" Text="0" runat="server"></asp:Label>
    <span class="textoChico">&nbsp;%</span>
</div>
<div class="etiqueta2">
    <span class="textoNegritas">Nivel de equipamiento urbano:</span>
    <asp:Label ID="nivelEquipamiento_Lbl" Text="0" runat="server"></asp:Label>
</div>

<script type="text/javascript">

    function Equipamiento() {

        // Inicialización
        if (typeof (Equipamiento_Init) == "undefined") {
            Equipamiento_Init = true;
            Equipamiento.prototype.setData = setData;
            Equipamiento.prototype.getData = getData;
            Equipamiento.prototype.validate = validate;
            Equipamiento.prototype.updateNivelEquipamiento = updateNivelEquipamiento;
        }
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= distanciaIglesia_TBox.ClientID %>"),      // 0
            $get("<%= distanciaMercado_TBox.ClientID %>"),      // 1
            $get("<%= distanciaPlaza_TBox.ClientID %>"),        // 2
            $get("<%= distanciaEscuela_TBox.ClientID %>"),      // 3
            $get("<%= distanciaHospital_TBox.ClientID %>"),     // 4
            $get("<%= distanciaParque_TBox.ClientID %>"),       // 5
            $get("<%= distanciaBanco_TBox.ClientID %>"),        // 6
            $get("<%= distanciaTransporte_TBox.ClientID %>")    // 7
        );
        this.validator = new ControlValidator(this.controls);
        for (i = 0; i < this.controls.length; i++) {
            this.validator.addOptionalField(i);
            this.validator.addNumericField(i, true, 2000, 0);
        }
        
        // Databindings
        function setData(data) {
            if (data != null) {
                $get("<%= distanciaIglesia_TBox.ClientID %>").value = getNumString(data.distanciaIglesia, 2);
                $get("<%= distanciaMercado_TBox.ClientID %>").value = getNumString(data.distanciaMercado, 2);
                $get("<%= distanciaPlaza_TBox.ClientID %>").value = getNumString(data.distanciaPlaza, 2);
                $get("<%= distanciaEscuela_TBox.ClientID %>").value = getNumString(data.distanciaEscuela, 2);
                $get("<%= distanciaHospital_TBox.ClientID %>").value = getNumString(data.distanciaHospital, 2);
                $get("<%= distanciaParque_TBox.ClientID %>").value = getNumString(data.distanciaParque, 2);
                $get("<%= distanciaBanco_TBox.ClientID %>").value = getNumString(data.distanciaBanco, 2);
                $get("<%= distanciaTransporte_TBox.ClientID %>").value = getNumString(data.distanciaEstacionTransporte, 2);
                $get("<%= proximidadGeneral_Lbl.ClientID %>").innerHTML = getNumString(data.proximidadGeneral, 2);
                $get("<%= nivelEquipamiento_Lbl.ClientID %>").innerHTML = getNumString(data.nivelEquipamientoUrbano);
            }
        }
        function getData() {
            var data = new Object();

            var distanciaIglesia = $get("<%= distanciaIglesia_TBox.ClientID %>").value;
            var distanciaMercado = $get("<%= distanciaMercado_TBox.ClientID %>").value;
            var distanciaPlaza = $get("<%= distanciaPlaza_TBox.ClientID %>").value;
            var distanciaEscuela = $get("<%= distanciaEscuela_TBox.ClientID %>").value;
            var distanciaHospital = $get("<%= distanciaHospital_TBox.ClientID %>").value;
            var distanciaParque = $get("<%= distanciaParque_TBox.ClientID %>").value;
            var distanciaBanco = $get("<%= distanciaBanco_TBox.ClientID %>").value;
            var distanciaEstacionTransporte = $get("<%= distanciaTransporte_TBox.ClientID %>").value;

            if (!isNaN(parseFloat(distanciaIglesia)))
                data.distanciaIglesia = distanciaIglesia;
            if (!isNaN(parseFloat(distanciaMercado)))
                data.distanciaMercado = distanciaMercado;
            if (!isNaN(parseFloat(distanciaPlaza)))
                data.distanciaPlaza = distanciaPlaza;
            if (!isNaN(parseFloat(distanciaEscuela)))
                data.distanciaEscuela = distanciaEscuela;
            if (!isNaN(parseFloat(distanciaHospital)))
                data.distanciaHospital = distanciaHospital;
            if (!isNaN(parseFloat(distanciaParque)))
                data.distanciaParque = distanciaParque;
            if (!isNaN(parseFloat(distanciaBanco)))
                data.distanciaBanco = distanciaBanco;
            if (!isNaN(parseFloat(distanciaEstacionTransporte)))
                data.distanciaEstacionTransporte = distanciaEstacionTransporte;

            data.proximidadGeneral = $get("<%= proximidadGeneral_Lbl.ClientID %>").innerHTML;
            data.nivelEquipamientoUrbano = $get("<%= nivelEquipamiento_Lbl.ClientID %>").innerHTML;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }

        // Nivel
        function updateNivelEquipamiento() {
            var datosEntorno = this.getData();
            var nivel = calcularNivelEquipamiento(datosEntorno);
            var proximidad = calcularProximidadGeneral(datosEntorno);

            $get("<%= nivelEquipamiento_Lbl.ClientID %>").innerHTML = nivel;
            $get("<%= proximidadGeneral_Lbl.ClientID %>").innerHTML = proximidad
        }
    }

    this["<%= ID %>"] = new Equipamiento();
    
</script>