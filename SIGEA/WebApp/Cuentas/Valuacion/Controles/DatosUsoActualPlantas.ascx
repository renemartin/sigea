<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualPlantas.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosUsoActualPlantas" %>
<script type="text/javascript">
    
    //cargar datos
    function setDatosUsoActualPlantas(data_set) {
        if(data_set == null)
            return;
        
        //datos planta baja
        if(data_set[0] != null) {   
            var dataPB = new Object();
            dataPB = data_set[0];
            $get("<%= PB_cuartoServicio_CBox.ClientID %>").checked = dataPB.cuartoServicio;
            $get("<%= PB_cuartoLavado_CBox.ClientID %>").checked = dataPB.cuartoLavado;
            $get("<%= PB_areaServicioDescubierta_CBox.ClientID %>").checked = dataPB.areaServicio;
            $get("<%= PB_vestibuloIngreso_CBox.ClientID %>").checked = dataPB.vestibuloIngreso;
            $get("<%= PB_escaleraPrincipal_CBox.ClientID %>").checked = dataPB.escaleraPrincipal;
            $get("<%= PB_sala_CBox.ClientID %>").checked = dataPB.sala;
            $get("<%= PB_escaleraServicio_CBox.ClientID %>").checked = dataPB.escaleraServicio;
        }
        
        //datos planta alta
        if(data_set[1] != null) {
            var dataPA = new Object();
            dataPA = data_set[1];
            $get("<%= PA_cuartoServicio_CBox.ClientID %>").checked = dataPA.cuartoServicio;
            $get("<%= PA_cuartoLavado_CBox.ClientID %>").checked = dataPA.cuartoLavado;
            $get("<%= PA_areaServicioDescubierta_CBox.ClientID %>").checked = dataPA.areaServicio;
            $get("<%= PA_escaleraServicio_CBox.ClientID %>").checked = dataPA.escaleraServicio;
        }
        
        //datos otros niveles
        if(data_set[2] != null) {
            var dataON = new Object();
            dataON = data_set[2];
            $get("<%= ON_cuartoServicio_CBox.ClientID %>").checked = dataON.cuartoServicio;
            $get("<%= ON_cuartoLavado_CBox.ClientID %>").checked = dataON.cuartoLavado;
            $get("<%= ON_areaServicioDescubierta_CBox.ClientID %>").checked = dataON.areaServicio;
            $get("<%= ON_escaleraServicio_CBox.ClientID %>").checked = dataON.escaleraServicio;
        }
        
        //datos otros sotano
        if(data_set[3] != null) {
            var dataSO = new Object();
            dataSO = data_set[3];
            $get("<%= SO_cuartoServicio_CBox.ClientID %>").checked = dataSO.cuartoServicio;
            $get("<%= SO_cuartoLavado_CBox.ClientID %>").checked = dataSO.cuartoLavado;
            $get("<%= SO_escaleraServicio_CBox.ClientID %>").checked = dataSO.escaleraServicio;
        }              
    }    
    
    //guardar datos
    function getDatosUsoActualPlantas() {
        var data_set = new Array();
        
        //datos planta baja
        var dataPB = new Object();
        dataPB.planta = 0;
        dataPB.cuartoServicio = $get("<%= PB_cuartoServicio_CBox.ClientID %>").checked;
        dataPB.cuartoLavado = $get("<%= PB_cuartoLavado_CBox.ClientID %>").checked;
        dataPB.areaServicio = $get("<%= PB_areaServicioDescubierta_CBox.ClientID %>").checked;
        dataPB.vestibuloIngreso = $get("<%= PB_vestibuloIngreso_CBox.ClientID %>").checked;
        dataPB.escaleraPrincipal = $get("<%= PB_escaleraPrincipal_CBox.ClientID %>").checked;
        dataPB.sala = $get("<%= PB_sala_CBox.ClientID %>").checked;
        dataPB.escaleraServicio = $get("<%= PB_escaleraServicio_CBox.ClientID %>").checked;
        
        //datos planta alta
        var dataPA = new Object();
        dataPA.planta = 1;
        dataPA.cuartoServicio = $get("<%= PA_cuartoServicio_CBox.ClientID %>").checked;
        dataPA.cuartoLavado = $get("<%= PA_cuartoLavado_CBox.ClientID %>").checked;
        dataPA.areaServicio = $get("<%= PA_areaServicioDescubierta_CBox.ClientID %>").checked;
        dataPA.escaleraServicio = $get("<%= PA_escaleraServicio_CBox.ClientID %>").checked;
        dataPA.vestibuloIngreso = false;
        dataPA.escaleraPrincipal = false;
        dataPA.sala = false;
        
        
        
        //datos otros niveles
        var dataON = new Object();
        dataON.planta = 2;
        dataON.cuartoServicio = $get("<%= ON_cuartoServicio_CBox.ClientID %>").checked;
        dataON.cuartoLavado = $get("<%= ON_cuartoLavado_CBox.ClientID %>").checked;
        dataON.areaServicio = $get("<%= ON_areaServicioDescubierta_CBox.ClientID %>").checked;
        dataON.escaleraServicio = $get("<%= ON_escaleraServicio_CBox.ClientID %>").checked;
        dataON.vestibuloIngreso = false;
        dataON.escaleraPrincipal = false;
        dataON.sala = false;
        
        //datos otros sotano
        var dataSO = new Object();
        dataSO.planta = 3;
        dataSO.cuartoServicio = $get("<%= SO_cuartoServicio_CBox.ClientID %>").checked;
        dataSO.cuartoLavado = $get("<%= SO_cuartoLavado_CBox.ClientID %>").checked;
        dataSO.escaleraServicio = $get("<%= SO_escaleraServicio_CBox.ClientID %>").checked;
        dataSO.areaServicio = false;
        dataSO.vestibuloIngreso = false;
        dataSO.escaleraPrincipal = false;
        dataSO.sala = false;
        
        data_set[0] = dataPB;
        data_set[1] = dataPA;
        data_set[2] = dataON;
        data_set[3] = dataSO;
            
        return data_set;
    }

</script>
<table>
    <tr>
        <td class="celdaHeader" colspan="4">
            Planta baja
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_vestibuloIngreso_CBox" Text="Vestibulo de ingreso" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_escaleraPrincipal_CBox" Text="Escalera principal" runat="server" />
        </td>
        <td class="celdaValor" colspan="2">
            <asp:CheckBox ID="PB_sala_CBox" Text="Sala" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="4">
            Planta alta
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="4">
            Otros niveles
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="3">
            Sotano
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="SO_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="SO_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="SO_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
</table>
