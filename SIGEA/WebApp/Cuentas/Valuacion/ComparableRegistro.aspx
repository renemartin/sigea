<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComparableRegistro.aspx.cs" Inherits="Cuentas_Administracion_ComparableRegistro" EnableViewState="false" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosComparable.ascx" TagName="DatosComparable"
    TagPrefix="SIGEA" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1" runat="server">
    <title>SIGEA - SIGEA - Registro de Comparables</title>
    <base target="_self" />
    
    <script type="text/javascript">
        // Variables
        var idComparable = 0;

        // Guardado de datos
        function saveComparable() {
            if (ctrl_Comparable.validate()) {
                saveComparableAsync(
                    idComparable
                    , ctrl_Comparable.getData()
                    , saveComparable_Success
                );
            }
        }
        function saveComparable_Success(id) {
            idComparable = id;
            showMessage("Datos guardados");
            window.returnValue = "reload";
            closeWindow(false);
        }

        // Carga de datos
        function loadComparable(keyId) {
            if (keyId != 0) {
                idComparable = keyId;
                loadComparableAsync(idComparable, ctrl_Comparable);
            }
            else {
                ctrl_Comparable.setData();
            }
        }
        
    </script>
    
</head>
<body>
    <form id="form1" runat="server">    

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
            <asp:ScriptReference Path="~/Scripts/Entities/Comparables.js" />
        </Scripts>
    </asp:ScriptManager>
    
    <div class="modulo">
        <br />
        <div class="formulario">
            <SIGEA:DatosComparable ID="ctrl_Comparable" runat="server"></SIGEA:DatosComparable>
            <div class="barraMenu">
                <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
                <asp:ImageButton ID="cancel_ImBtn" runat="server" SkinID="Cancel" OnClientClick="closeWindow(false); return false;" />
            </div>
        </div>
    </div>
</form>
</body>
</html>
