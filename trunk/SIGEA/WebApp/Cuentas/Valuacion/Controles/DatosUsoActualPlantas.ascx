<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualPlantas.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosUsoActualPlantas" %>
<script type="text/javascript">
    
    //cargar datos
    function setDatosUsoActualPlantas(data) {
        //datos planta baja
//          $get("<%= PB_cuartoServicio_CBox.ClientID %>").checked = data[0].cuartoServicio;
//        $get("<%= PB_cuartoLavado_CBox.ClientID %>").checked = data[0].cuartoLavado;
//        $get("<%= PB_areaServicioDescubierta_CBox.ClientID %>").checked = data[0].areaServicio;
//        $get("<%= PB_vestibuloIngreso_CBox.ClientID %>").checked = data[0].vestibuloIngreso;
//        $get("<%= PB_escaleraPrincipal_CBox.ClientID %>").checked = data[0].escaleraPrincipal;
//        $get("<%= PB_sala_CBox.ClientID %>").checked = data[0].sala;
        $get("<%= PB_escaleraServicio_CBox.ClientID %>").checked = data[0].escaleraServicio;
//        
//        //datos planta alta
//        $get("<%= PA_cuartoServicio_CBox.ClientID %>").checked = data[1].cuartoServicio;
//        $get("<%= PA_cuartoLavado_CBox.ClientID %>").checked = data[1].cuartoLavado;
//        $get("<%= PA_areaServicioDescubierta_CBox.ClientID %>").checked = data[1].areaServicio;
//        $get("<%= PA_escaleraServicio_CBox.ClientID %>").checked = data[1].escaleraServicio;
//        
//        //datos otros niveles
//        $get("<%= ON_cuartoServicio_CBox.ClientID %>").checked = data[2].cuartoServicio;
//        $get("<%= ON_cuartoLavado_CBox.ClientID %>").checked = data[2].cuartoLavado;
//        $get("<%= ON_areaServicioDescubierta_CBox.ClientID %>").checked = data[2].areaServicio;
//        $get("<%= ON_escaleraServicio_CBox.ClientID %>").checked = data[2].escaleraServicio;
//        
//        //datos otros sotano
//        $get("<%= SO_cuartoServicio_CBox.ClientID %>").checked = data[3].cuartoServicio;
//        $get("<%= SO_cuartoLavado_CBox.ClientID %>").checked = data[3].cuartoLavado;
//        $get("<%= SO_escaleraServicio_CBox.ClientID %>").checked = data[3].escaleraServicio;
                       
    }    
    
    //guardar datos
    function getDatosUsoActualPlantas() {
        var data = new Array();
            
        //datos planta baja
        data[0].planta = 1;
        data[0].cuartoServicio = $get("<%= PB_cuartoServicio_CBox.ClientID %>").checked;
        data[0].cuartoLavado = $get("<%= PB_cuartoLavado_CBox.ClientID %>").checked;
        data[0].areaServicio = $get("<%= PB_areaServicioDescubierta_CBox.ClientID %>").checked;
        data[0].vestibuloIngreso = $get("<%= PB_vestibuloIngreso_CBox.ClientID %>").checked;
        data[0].escaleraPrincipal = $get("<%= PB_escaleraPrincipal_CBox.ClientID %>").checked;
        data[0].sala = $get("<%= PB_sala_CBox.ClientID %>").checked;
        data[0].escaleraServicio = $get("<%= PB_escaleraServicio_CBox.ClientID %>").checked;
        
        //datos planta alta
        data[1].planta = 2;
        data[1].cuartoServicio = $get("<%= PA_cuartoServicio_CBox.ClientID %>").checked;
        data[1].cuartoLavado = $get("<%= PA_cuartoLavado_CBox.ClientID %>").checked;
        data[1].areaServicio = $get("<%= PA_areaServicioDescubierta_CBox.ClientID %>").checked;
        data[1].escaleraServicio = $get("<%= PA_escaleraServicio_CBox.ClientID %>").checked;
        
        //datos otros niveles
        data[2].planta = 3;
        data[2].cuartoServicio = $get("<%= ON_cuartoServicio_CBox.ClientID %>").checked;
        data[2].cuartoLavado = $get("<%= ON_cuartoLavado_CBox.ClientID %>").checked;
        data[2].areaServicio = $get("<%= ON_areaServicioDescubierta_CBox.ClientID %>").checked;
        data[2].escaleraServicio = $get("<%= ON_escaleraServicio_CBox.ClientID %>").checked;
        
        //datos otros sotano
        data[3].planta = 4;
        data[3].cuartoServicio = $get("<%= SO_cuartoServicio_CBox.ClientID %>").checked;
        data[3].cuartoLavado = $get("<%= SO_cuartoLavado_CBox.ClientID %>").checked;
        data[3].escaleraServicio = $get("<%= SO_escaleraServicio_CBox.ClientID %>").checked;
            
        return data;
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
