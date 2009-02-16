<%@ Page Title="SIGEA - Catálogo de clientes" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="Clientes.aspx.cs" Inherits="Cuentas_Administracion_Clientes" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Acciones del registro
        function addNewCliente() {
            redirect("ClienteRegistro.aspx");
        }

        function viewCliente(sender, idCliente) {
            redirect(String.format("ClienteRegistro.aspx?idCliente={0}", idCliente));
        }

        function deleteCliente(sender, idCliente) {
            if (requestConfirmation("¿Desea eliminar el registro seleccionado?")) {
                deleteClienteAsync(
                    idCliente
                    , deleteCliente_Success
                    , sender
                );
            }
        }
        function deleteCliente_Success(sender) {
            var row = sender.parentNode.parentNode;
            row.style.display = "none";
        }
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Clientes.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Catálogo de clientes</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="addNew_ImBtn" runat="server" SkinID="Add" /></div>
    <asp:Panel ID="filter_Panel" runat="server" CssClass="panel">
        <table>
            <tr>
                <td class="celdaTitulo">
                    Nombre:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="nombre_TBox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="search_ImBtn" runat="server" SkinID="Search" OnClick="search_ImBtn_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div class="formulario">
        <asp:UpdatePanel ID="clienteData_UpPanel" runat="server" UpdateMode="Conditional"
            ChildrenAsTriggers="False">
            <ContentTemplate>
                <asp:GridView ID="data_gridView" runat="server" AutoGenerateColumns="False" DataSourceID="clientes_DS"
                    AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Width="500px">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="nombre" />
                        <asp:TemplateField HeaderText="Email" SortExpression="DatoContacto.email1">
                            <ItemTemplate>
                                <%#Eval("DatoContacto.email1")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <img class="botonImagen" alt="Editar registro" src="../../Images/Icons/Editar.gif"
                                    onclick="viewCliente(this, <%# Eval("idCliente") %>);" />
                                <img class="botonImagen" alt="Eliminar registro" src="../../Images/Icons/Eliminar.gif"
                                    onclick="deleteCliente(this, <%# Eval("idCliente") %>);" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <div class="sinDatos">
                            Sin registros...
                        </div>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="clientes_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
                    OrderBy="nombre" Select="new (idCliente, nombre, DatoContacto)" TableName="Cliente">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="nombre_TBox" Name="nombre" PropertyName="Text" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="search_ImBtn" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
