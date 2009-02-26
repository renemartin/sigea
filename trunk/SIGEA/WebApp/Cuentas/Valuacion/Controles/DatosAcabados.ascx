<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAcabados.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAcabados" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    //mostrar datos
    function setDatosAcabados(data_set) {
    
        if(data_set == null)
            return;
            
        //datos recamaras
        if(data_set[0] != null) {
            var dataRecamaras = new Object();
            dataRecamaras = data_set[0];
            $get("<%= salaPisos_TBox.ClientID %>").value = dataRecamaras.piso;
            $get("<%= salaMuros_TBox.ClientID %>").value = dataRecamaras.muro;
            $get("<%= salaPlafones_TBox.ClientID %>").value = dataRecamaras.plafon;
        }
        
        //datos comedor
        if(data_set[1] != null) {
            var dataComedor = new Object();
            dataComedor = data_set[1];
            $get("<%= comedorPisos_TBox.ClientID %>").value = dataComedor.piso;
            $get("<%= comedorMuros_TBox.ClientID %>").value = dataComedor.muro;
            $get("<%= comedorPlafones_TBox.ClientID %>").value = dataComedor.plafon;
        }
        
        //datos cocina
        if(data_set[2] != null) {
            var dataCocina = new Object();
            dataCocina = data_set[2];
            $get("<%= cocinaPisos_TBox.ClientID %>").value = dataCocina.piso;
            $get("<%= cocinaMuros_TBox.ClientID %>").value = dataCocina.muro;
            $get("<%= cocinaPlafones_TBox.ClientID %>").value = dataCocina.plafon;
        }
        
        //datos recamaras
        if(data_set[3] != null) {
            var dataRecamaras = new Object();
            dataRecamaras = data_set[3];
            $get("<%= recamarasPisos_TBox.ClientID %>").value = dataRecamaras.piso;
            $get("<%= recamarasMuros_TBox.ClientID %>").value = dataRecamaras.muro;
            $get("<%= recamarasPlafones_TBox.ClientID %>").value = dataRecamaras.plafon;
        }
        
        //datos banos
        if(data_set[4] != null) {
            var dataBanos = new Object();
            dataBanos = data_set[4];    
            $get("<%= banosPisos_TBox.ClientID %>").value = dataBanos.piso;
            $get("<%= banosMuros_TBox.ClientID %>").value = dataBanos.muro;
            $get("<%= banosPlafones_TBox.ClientID %>").value = dataBanos.plafon;
        }
        
        //datos pisos
        if(data_set[5] != null) {
            var dataPisos = new Object();
            dataPisos = data_set[5];
            $get("<%= patiosPisos_TBox.ClientID %>").value = dataPisos.piso;
            $get("<%= patiosMuros_TBox.ClientID %>").value = dataPisos.muro;
            $get("<%= patiosPlafones_TBox.ClientID %>").value = dataPisos.plafon;
        }
        
        //datos estacionamientos
        if(data_set[6] != null) {
            var dataEstacionamientos = new Object();
            dataEstacionamientos = data_set[6];
            $get("<%= estacionamientoPisos_TBox.ClientID %>").value = dataEstacionamientos.piso;
            $get("<%= estacionamientoMuros_TBox.ClientID %>").value = dataEstacionamientos.muro;
            $get("<%= estacionamientoPlafones_TBox.ClientID %>").value = dataEstacionamientos.plafon;
        }
        
//        if(data_set[7] != null)   {
//            var dataFachada = new Object();
//            dataFachada = data_set[7];
//            $get("<%= fachada_TBox.ClientID %>").value = dataFachada.fachada;
//        }
    }
    //guardar datos
    function getDatosAcabados() {
        var data_set = new Array();
        
        //datos Sala
        var dataSala = new Object();
        dataSala.idTipoAcabado = 0;
        dataSala.piso = $get("<%= salaPisos_TBox.ClientID %>").value;
        dataSala.muro = $get("<%= salaMuros_TBox.ClientID %>").value;
        dataSala.plafon = $get("<%= salaPlafones_TBox.ClientID %>").value;
        
        //datos Comedor
        var dataComedor = new Object();
        dataComedor.idTipoAcabado = 1;
        dataComedor.piso = $get("<%= comedorPisos_TBox.ClientID %>").value;
        dataComedor.muro = $get("<%= comedorMuros_TBox.ClientID %>").value;
        dataComedor.plafon = $get("<%= comedorPlafones_TBox.ClientID %>").value;
        
        //datos Cocina
        var dataCocina = new Object();
        dataCocina.idTipoAcabado = 2;
        dataCocina.piso = $get("<%= cocinaPisos_TBox.ClientID %>").value;
        dataCocina.muro = $get("<%= cocinaMuros_TBox.ClientID %>").value;
        dataCocina.plafon = $get("<%= cocinaPlafones_TBox.ClientID %>").value;
        
        //datos Recamaras
        var dataRecamaras = new Object();
        dataRecamaras = idTipoAcabado = 3;
        dataRecamaras.piso = $get("<%= recamarasPisos_TBox.ClientID %>").value;
        dataRecamaras.muro = $get("<%= recamarasMuros_TBox.ClientID %>").value;
        dataRecamaras.plafon = $get("<%= recamarasPlafones_TBox.ClientID %>").value;
            
        //datos Banos
        var dataBanos = new Object();
        dataBanos.idTipoAcabado = 4;    
        dataBanos.piso = $get("<%= banosPisos_TBox.ClientID %>").value;
        dataBanos.muro = $get("<%= banosMuros_TBox.ClientID %>").value;
        dataBanos.plafon = $get("<%= banosPlafones_TBox.ClientID %>").value;
        
        //datos Patios
        var dataPatios = new Object();
        dataPatios.idTipoAcabado = 5;
        dataPatios.piso = $get("<%= patiosPisos_TBox.ClientID %>").value;
        dataPatios.muro = $get("<%= patiosMuros_TBox.ClientID %>").value;
        dataPatios.plafon = $get("<%= patiosPlafones_TBox.ClientID %>").value;
        
        //datos Estacionamientos
        var dataEstacionamientos = new Object();
        dataEstacionamientos.idTipoAcabado = 6;
        dataEstacionamientos.piso = $get("<%= estacionamientoPisos_TBox.ClientID %>").value;
        dataEstacionamientos.muro = $get("<%= estacionamientoMuros_TBox.ClientID %>").value;
        dataEstacionamientos.plafon = $get("<%= estacionamientoPlafones_TBox.ClientID %>").value;
        
        //datos Fachada
//        var dataFachada = new Object();
//        dataFachada.fachada = $get("<%= fachada_TBox.ClientID %>").value;
        
        data_set[0] = dataSala;
        data_set[1] = dataComedor;
        data_set[2] = dataCocina;
        data_set[3] = dataRecamaras;
        data_set[4] = dataBanos;
        data_set[5] = dataPatios;
        data_set[6] = dataEstacionamientos;
        //data_set[7] = dataFachada;
        
        return data_set;
    }
    
</script>

<table>
    <tr>
        <td>
        </td>
        <td class="celdaHeader">
            Pisos
        </td>
        <td class="celdaHeader">
            Muros
        </td>
        <td class="celdaHeader">
            Plafones
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Sala:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Comedor:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cocina:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Recámaras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Baños:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Patios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPlafones_TBox" runat="server" 
                TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fachada:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="fachada_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="544px"></asp:TextBox>
        </td>
    </tr>
</table>
