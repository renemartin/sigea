<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEstructuras.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEstructuras" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Cimentación:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cimentacion_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="400px" MaxLength="400"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="cimentacion_TBox_AutoCompleteExtender" 
                runat="server"
                ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" TargetControlID="cimentacion_TBox" 
                UseContextKey="True" ContextKey="Cimentacion" CompletionInterval="500" 
                FirstRowSelected="True" DelimiterCharacters=", " 
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0" Enabled="True">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Muros:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="muros_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="400px" MaxLength="400"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="muros_TBox_AutoCompleteExtender" runat="server" 
                CompletionInterval="500" ContextKey="Muros" DelimiterCharacters=", " 
                Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" TargetControlID="muros_TBox" 
                UseContextKey="True" ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Escaleras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="escaleras_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="400px" MaxLength="400"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="escaleras_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Escaleras" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx"
                TargetControlID="escaleras_TBox" UseContextKey="True" 
                 ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entrepisos y techos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="entrepisosTechos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="400px" MaxLength="400"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="entrepisosTechos_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Entrepisos" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="entrepisosTechos_TBox" UseContextKey="True" 
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Trabes y columnas:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="trabesColumnas_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="50px" Width="400px" MaxLength="400"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="trabesColumnas_TBox_AutoCompleteExtender" 
                runat="server" CompletionInterval="500" ContextKey="Trabes" 
                DelimiterCharacters=", " Enabled="True" ServiceMethod="GetNombresMateriales" 
                ServicePath="~/Services/MethodCallers.asmx" 
                TargetControlID="trabesColumnas_TBox" UseContextKey="True" 
                ShowOnlyCurrentWordInCompletionListItem="True" MinimumPrefixLength="0">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    
</table>

<script type="text/javascript">

    function Estructuras() {

        // Inicialización
        Estructuras.prototype.setData = setData;
        Estructuras.prototype.getData = getData;
        Estructuras.prototype.validate = validate;

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= cimentacion_TBox.ClientID %>"),       // 0
            $get("<%= muros_TBox.ClientID %>"),             // 1
            $get("<%= escaleras_TBox.ClientID %>"),         // 2
            $get("<%= entrepisosTechos_TBox.ClientID %>"),  // 3
            $get("<%= trabesColumnas_TBox.ClientID %>")     // 4
        );
        this.validator = new ControlValidator(this.controls);

        // DataBindings
        function setData(data) {
            if (data == null)
                return;
                
            $get("<%= cimentacion_TBox.ClientID %>").value = data.cimentacion;
            $get("<%= muros_TBox.ClientID %>").value = data.muros;
            $get("<%= escaleras_TBox.ClientID %>").value = data.escaleras;
            $get("<%= entrepisosTechos_TBox.ClientID %>").value = data.entrepisos;
            $get("<%= trabesColumnas_TBox.ClientID %>").value = data.trabes;
        }
        function getData() {
            var data = new Object();

            data.cimentacion = $get("<%= cimentacion_TBox.ClientID %>").value;
            data.muros = $get("<%= muros_TBox.ClientID %>").value;
            data.escaleras = $get("<%= escaleras_TBox.ClientID %>").value;
            data.entrepisos = $get("<%= entrepisosTechos_TBox.ClientID %>").value;
            data.trabes = $get("<%= trabesColumnas_TBox.ClientID %>").value;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new Estructuras();
    
</script>