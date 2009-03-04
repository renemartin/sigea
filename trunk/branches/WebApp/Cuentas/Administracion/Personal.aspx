<%@ Page Title="SIGEA - Catálogo de personal" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="Personal.aspx.cs" Inherits="Cuentas_Administracion_Personal" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Acciones del registro
        function addNewPersonal() {
            redirect("PersonalRegistro.aspx");
        }

        function viewPersonal(sender, idPersonal) {
            redirect(String.format("PersonalRegistro.aspx?idPersonal={0}", idPersonal));
        }

        function deletePersonal(sender, idPersonal) {
            if (requestConfirmation("¿Desea eliminar el registro seleccionado?")) {
                deletePersonalAsync(
                    idPersonal
                    , deletePersonal_Success
                    , sender
                );
            }
        }
        function deletePersonal_Success(sender) {
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
            <asp:ScriptReference Path="~/Scripts/Entities/Personal.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Catálogo de personal</h1>
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
        <asp:UpdatePanel ID="personalData_UpPanel" runat="server" UpdateMode="Conditional"
            ChildrenAsTriggers="False">
            <ContentTemplate>
                <asp:GridView ID="data_gridView" runat="server" AutoGenerateColumns="False" DataSourceID="personal_DS"
                    AllowPaging="True" AllowSorting="True" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="nombre" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <img class="botonImagen" alt="Editar registro" src="../../Images/Icons/Editar.gif"
                                    onclick="viewPersonal(this, <%# Eval("idPersonal") %>);" />
                                <img class="botonImagen" alt="Eliminar registro" src="../../Images/Icons/Eliminar.gif"
                                    onclick="deletePersonal(this, <%# Eval("idPersonal") %>);" />
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="sinDatos">
                            Sin registros...
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:LinqDataSource ID="personal_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
                    OrderBy="nombre" Select="new (idPersonal, nombre)" TableName="Personal">
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
