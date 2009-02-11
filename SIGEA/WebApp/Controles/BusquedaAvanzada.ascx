<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BusquedaAvanzada.ascx.cs" Inherits="Controles_BusquedaPersonalizada" %>

<script type="text/javascript">
</script>
<h1>
Búsqueda Avanzada
</h1>
<table>
    <tr>
        <td>
            <asp:ListBox ID="OperadorLogico_LBox" style="height:40px; width:54px;" selectionmode="Single" runat="server">
                <asp:ListItem Text="Y" Value="AND" Selected="False">
                </asp:ListItem>
                <asp:ListItem Text="O" Value="OR" Selected="False">
                </asp:ListItem>
            </asp:ListBox>
        </td>
        <td>
            <asp:DropDownList ID="Campos_DDList" runat="server"></asp:DropDownList>
        </td>
        <td>
            <asp:DropDownList ID="Simbolos_DDList" runat="server">
                <asp:ListItem Text="=" Value="=" Selected="True"></asp:ListItem>
                <asp:ListItem Text="<>" Value="<>" Selected="False"></asp:ListItem>
                <asp:ListItem Text=">" Value=">" Selected="False"></asp:ListItem>
                <asp:ListItem Text="&gt;=" Value="&gt;=" Selected="False"></asp:ListItem>
                <asp:ListItem Text="<" Value="<" Selected="False"></asp:ListItem>
                <asp:ListItem Text="&lt;=" Value="&lt;=" Selected="False"></asp:ListItem>
                <asp:ListItem Text="LIKE" Value="LIKE" Selected="False"></asp:ListItem>
                <asp:ListItem Text="NOT LIKE" Value="NOT LIKE" Selected="False"></asp:ListItem>
                <asp:ListItem Text="IS NULL" Value="IS NULL" Selected="False"></asp:ListItem>
                <asp:ListItem Text="IS NOT NULL" Value="IS NOT NULL" Selected="False"></asp:ListItem>  
            </asp:DropDownList>
        </td>
        <td>
            <asp:TextBox ID="Valor_TBox" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="AgregarCondicion_Button" text="Agregar Condición" 
                runat="server" onclick="AgregarCondicion_Button_Click" />
        </td>
    </tr>
</table>
<table>
    <tr>
        <td>
            <textarea id="Filtros_TxtArea" rows="10" cols="45"  runat="server" disabled="disabled">
            </textarea>
        </td>
        <td style="width:40px;">
        </td>
        <td>
            <asp:Button ID="AplicarFiltros_Button" style="width:100px;" 
                Text="Aplicar Filtro" runat="server" onclick="AplicarFiltros_Button_Click" />
            <br/><br/>
            <asp:Button ID="ActualizarFiltros_Button" style="width:100px;" 
                Text="Actualizar" runat="server" onclick="ActualizarFiltros_Button_Click" />
            <br/><br/>
            <asp:Button ID="BorrarFiltros_Button" style="width:100px;" 
                Text="Borrar Filtros" runat="server" onclick="BorrarFiltros_Button_Click" />
        </td>
    </tr>
</table>
