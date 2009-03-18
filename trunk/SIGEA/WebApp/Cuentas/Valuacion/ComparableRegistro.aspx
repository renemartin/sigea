<%@ Page Title="SIGEA - Registro de Comparables" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="ComparableRegistro.aspx.cs" Inherits="Cuentas_Administracion_ComparableRegistro"
    EnableViewState="false" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosComparable.ascx" TagName="DatosComparable"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        var idComparable = 0;

        function saveComparable() {
            saveComparableAsync(
                idComparable
                , ctrl_Comparable.getData()
                , saveComparable_Success
            );
        }
        function saveComparable_Success(id) {
            showMessage("Datos guardados");
        }

        function loadComparable(keyId) {
            if (keyId != 0) {
                idComparable = keyId;
                loadComparableAsync(idComparable, callBackList);
            }
            else {
                loadFormComparable_Success();
            }
        }
        function loadFormComparable_Success(data) {
            
        }
        
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Datos del comparable</h1>
        
    <div class="formulario">
        <SIGEA:DatosComparable id="ctrl_Comparable" runat="server">
        </SIGEA:DatosComparable>
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
    </div>
</asp:Content>
