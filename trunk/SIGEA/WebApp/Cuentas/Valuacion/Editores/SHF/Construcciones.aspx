<%@ Page Title="SIGEA - Editor SHF - Construcciones" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="Construcciones.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Construcciones" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstrucciones.ascx" TagName="Construcciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstruccionesClasificacion.ascx"
    TagName="ConstruccionesClasificacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficies.ascx" TagName="Superficies"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficiesAdicionales.ascx"
    TagName="SuperficiesAdicionales" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

<script type="text/javascript">

    function editUsoActual() {
        openModalWindow("Modulos/UsoActual.aspx", 750, 480);
    }

</script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />            
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Tables.js" />
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Descripción de las construcciones
    </h1>
    <div id="form" class="formulario">
        <div class="etiqueta1">
            <span class="textoNegritas">Descripción de uso actual:</span>
            <asp:Label ID="descripcion_Lbl" runat="server">No especificada...</asp:Label>&nbsp;
            <asp:ImageButton ID="editarUsoActua_ImBtn" runat="server" SkinID="EditSmall" />
        </div>        
        <h2>
            Clasificación de las construcciones privativas</h2>
        <SIGEA:ConstruccionesClasificacion ID="construccionesClasificacion_Ctrl" runat="server" />
        <h2>
            Datos generales de las construcciones</h2>
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
        <h2>
            Datos de superficies</h2>
        <SIGEA:Superficies ID="superficies_Ctrl" runat="server" />
        <div>
            <table>
                <tr class="celdaHeader">
                    <td>
                        Áreas cubiertas
                    </td>
                    <td>
                        Obras complementarias
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <SIGEA:SuperficiesAdicionales ID="superficiesConstrucciones_Ctrl" runat="server" />
                    </td>
                    <td valign="top">
                        <SIGEA:SuperficiesAdicionales ID="superficiesObras_Ctrl" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
