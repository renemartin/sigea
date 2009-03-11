<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAcabados.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAcabados" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


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
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="salaPisos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Pisos Interiores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="salaPisos_TBox" UseContextKey="True" 
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="salaMuros_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="salaMuros_TBox"  
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="salaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="salaPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="salaPlafones_TBox" ShowOnlyCurrentWordInCompletionListItem="True"
                MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Comedor:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="comedorPisos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Pisos Interiores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="comedorPisos_TBox" ShowOnlyCurrentWordInCompletionListItem="True"
                MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="comedorMuros_TBox_AutoCompleteExtender" 
               runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="comedorMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="comedorPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="comedorPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="comedorPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cocina:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="cocinaPisos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Pisos Interiores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="cocinaPisos_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="cocinaMuros_TBox_AutoCompleteExtender" 
               runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="cocinaMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cocinaPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="cocinaPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="cocinaPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Recámaras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="recamarasPisos_TBox_AutoCompleteExtender" 
               runat="server" CompletionInterval="500" ContextKey="Pisos Interiores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="recamarasPisos_TBox" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="recamarasMuros_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="recamarasMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="recamarasPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="recamarasPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="recamarasPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Baños:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="banosPisos_TBox_AutoCompleteExtender" 
               runat="server" CompletionInterval="500" ContextKey="Pisos Interiores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="banosPisos_TBox" 
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="banosMuros_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="banosMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="banosPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="banosPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Patios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="patiosPisos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Pisos Exteriores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"  
                TargetControlID="patiosPisos_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="patiosMuros_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="patiosMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="patiosPlafones_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="patiosPlafones_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="patiosPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPisos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="estacionamientoPisos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Pisos Exteriores" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"  
                TargetControlID="estacionamientoPisos_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoMuros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="estacionamientoMuros_TBox_AutoCompleteExtender" 
                 runat="server" CompletionInterval="500" ContextKey="Muros" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" UseContextKey="True"
                TargetControlID="estacionamientoMuros_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="estacionamientoPlafones_TBox" runat="server" 
                TextMode="MultiLine" SkinID="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="estacionamientoPlafones_TBox_AutoCompleteExtender" 
                 runat="server" CompletionInterval="500" ContextKey="Plafones" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="estacionamientoPlafones_TBox" MinimumPrefixLength="0" 
                ShowOnlyCurrentWordInCompletionListItem="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fachada:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="fachada_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="600px"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="fachada_TBox_AutoCompleteExtender" runat="server" 
                CompletionInterval="500" ContextKey="Fachada" DelimiterCharacters=", " 
                Enabled="True"  ServicePath="~/Services/MethodCallers.asmx" ServiceMethod = "GetNombresMateriales" 
                TargetControlID="fachada_TBox" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function Acabados() {

        // Inicialización
        Acabados.prototype.setData = setData;
        Acabados.prototype.getData = getData;
        Acabados.prototype.setFachada = setFachada;
        Acabados.prototype.getFachada = getFachada;
        // DataBinsings
        function setData(data_set) {

            if (data_set == null)
                return;

            // Datos recamaras
            if (data_set[0] != null) {
                var dataRecamaras = new Object();
                dataRecamaras = data_set[0];
                $get("<%= salaPisos_TBox.ClientID %>").value = dataRecamaras.piso;
                $get("<%= salaMuros_TBox.ClientID %>").value = dataRecamaras.muro;
                $get("<%= salaPlafones_TBox.ClientID %>").value = dataRecamaras.plafon;
            }

            // Datos comedor
            if (data_set[1] != null) {
                var dataComedor = new Object();
                dataComedor = data_set[1];
                $get("<%= comedorPisos_TBox.ClientID %>").value = dataComedor.piso;
                $get("<%= comedorMuros_TBox.ClientID %>").value = dataComedor.muro;
                $get("<%= comedorPlafones_TBox.ClientID %>").value = dataComedor.plafon;
            }

            // Datos cocina
            if (data_set[2] != null) {
                var dataCocina = new Object();
                dataCocina = data_set[2];
                $get("<%= cocinaPisos_TBox.ClientID %>").value = dataCocina.piso;
                $get("<%= cocinaMuros_TBox.ClientID %>").value = dataCocina.muro;
                $get("<%= cocinaPlafones_TBox.ClientID %>").value = dataCocina.plafon;
            }

            // Datos recamaras
            if (data_set[3] != null) {
                var dataRecamaras = new Object();
                dataRecamaras = data_set[3];
                $get("<%= recamarasPisos_TBox.ClientID %>").value = dataRecamaras.piso;
                $get("<%= recamarasMuros_TBox.ClientID %>").value = dataRecamaras.muro;
                $get("<%= recamarasPlafones_TBox.ClientID %>").value = dataRecamaras.plafon;
            }

            // Datos banos
            if (data_set[4] != null) {
                var dataBanos = new Object();
                dataBanos = data_set[4];
                $get("<%= banosPisos_TBox.ClientID %>").value = dataBanos.piso;
                $get("<%= banosMuros_TBox.ClientID %>").value = dataBanos.muro;
                $get("<%= banosPlafones_TBox.ClientID %>").value = dataBanos.plafon;
            }

            // Datos pisos
            if (data_set[5] != null) {
                var dataPisos = new Object();
                dataPisos = data_set[5];
                $get("<%= patiosPisos_TBox.ClientID %>").value = dataPisos.piso;
                $get("<%= patiosMuros_TBox.ClientID %>").value = dataPisos.muro;
                $get("<%= patiosPlafones_TBox.ClientID %>").value = dataPisos.plafon;
            }

            // Datos estacionamientos
            if (data_set[6] != null) {
                var dataEstacionamientos = new Object();
                dataEstacionamientos = data_set[6];
                $get("<%= estacionamientoPisos_TBox.ClientID %>").value = dataEstacionamientos.piso;
                $get("<%= estacionamientoMuros_TBox.ClientID %>").value = dataEstacionamientos.muro;
                $get("<%= estacionamientoPlafones_TBox.ClientID %>").value = dataEstacionamientos.plafon;
            }
        }
        
        function setFachada(data) {
            if(data == null )
                return null;
            
            $get("<%= fachada_TBox.ClientID %>").value = data.fachada;
        }
        
        function getFachada() {
            var data = new Object();
            data.fachada = $get("<%= fachada_TBox.ClientID %>").value;
            
            return data;
        }

        function getData() {
            var data_set = new Array();
            var dataSala = null;
            var dataComedor = null;
            var dataCocina = null;
            var dataRecamaras = null;
            var dataBanos = null;
            var dataPatios = null;
            var dataEstacionamientos = null;

            // Datos Sala
            dataSala = new Object();
            dataSala.idTipoAcabado = 1;
            dataSala.piso = $get("<%= salaPisos_TBox.ClientID %>").value;
            dataSala.muro = $get("<%= salaMuros_TBox.ClientID %>").value;
            dataSala.plafon = $get("<%= salaPlafones_TBox.ClientID %>").value;
            data_set[0] = dataSala;

            // Datos Comedor
            dataComedor = new Object();
            dataComedor.idTipoAcabado = 2;
            dataComedor.piso = $get("<%= comedorPisos_TBox.ClientID %>").value;
            dataComedor.muro = $get("<%= comedorMuros_TBox.ClientID %>").value;
            dataComedor.plafon = $get("<%= comedorPlafones_TBox.ClientID %>").value;
            data_set[1] = dataComedor;

            // Datos Cocina
            dataCocina = new Object();
            dataCocina.idTipoAcabado = 3;
            dataCocina.piso = $get("<%= cocinaPisos_TBox.ClientID %>").value;
            dataCocina.muro = $get("<%= cocinaMuros_TBox.ClientID %>").value;
            dataCocina.plafon = $get("<%= cocinaPlafones_TBox.ClientID %>").value;
            data_set[2] = dataCocina;

            // Datos Recamaras
            dataRecamaras = new Object();
            dataRecamaras.idTipoAcabado = 4;
            dataRecamaras.piso = $get("<%= recamarasPisos_TBox.ClientID %>").value;
            dataRecamaras.muro = $get("<%= recamarasMuros_TBox.ClientID %>").value;
            dataRecamaras.plafon = $get("<%= recamarasPlafones_TBox.ClientID %>").value;
            data_set[3] = dataRecamaras;

            // Datos Banos
            dataBanos = new Object();
            dataBanos.idTipoAcabado = 5;
            dataBanos.piso = $get("<%= banosPisos_TBox.ClientID %>").value;
            dataBanos.muro = $get("<%= banosMuros_TBox.ClientID %>").value;
            dataBanos.plafon = $get("<%= banosPlafones_TBox.ClientID %>").value;
            data_set[4] = dataBanos;

            // Datos Patios
            dataPatios = new Object();
            dataPatios.idTipoAcabado = 6;
            dataPatios.piso = $get("<%= patiosPisos_TBox.ClientID %>").value;
            dataPatios.muro = $get("<%= patiosMuros_TBox.ClientID %>").value;
            dataPatios.plafon = $get("<%= patiosPlafones_TBox.ClientID %>").value;
            data_set[5] = dataPatios;

            // Datos Estacionamientos
            dataEstacionamientos = new Object();
            dataEstacionamientos.idTipoAcabado = 7;
            dataEstacionamientos.piso = $get("<%= estacionamientoPisos_TBox.ClientID %>").value;
            dataEstacionamientos.muro = $get("<%= estacionamientoMuros_TBox.ClientID %>").value;
            dataEstacionamientos.plafon = $get("<%= estacionamientoPlafones_TBox.ClientID %>").value;
            data_set[6] = dataEstacionamientos;
            
            return data_set;
        }
    }

    this["<%= ID %>"] = new Acabados();
    
</script>