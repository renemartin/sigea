<%@ Page Title="SIGEA - Comparables" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="Comparables.aspx.cs" Inherits="Cuentas_Administracion_Comparables" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        // Acciones del registro
        function addNewComparable() {
            redirect("ComparableRegistro.aspx");
        }

        function viewComparable(sender, idComparable) {
            redirect(String.format("ComparableRegistro.aspx?idComparable={0}", idComparable));
        }

        function deleteComparable(sender, idComparable) {
            if (requestConfirmation("¿Desea eliminar el registro seleccionado?")) {
                deleteComparableAsync(
                    idComparable
                    , deleteComparable_Success
                    , sender
                );
            }
        }
        function deleteComparable_Success(sender) {
            var row = sender.parentNode.parentNode;
            row.style.display = "none";
        }
    </script>

</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Comparables.js" />
        </Scripts>
    </asp:ScriptManager>  
    
    <h1>Comparables</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="addNew_ImBtn" runat="server" SkinID="Add" /></div>
    <asp:Panel ID="filter_Panel" runat="server" CssClass="panel">
        <table>
            <tr>
                <td class="celdaTitulo">
                    Tipo:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="tipo_DDList" runat="server" DataSourceID="tipo_DS" 
                        DataTextField="descripcion" DataValueField="idTipoComparable">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="search_ImBtn" runat="server" SkinID="Search" 
                        OnClick="search_ImBtn_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    <div class="formulario">
        <asp:UpdatePanel ID="comparableData_UpPanel" runat="server">
            <ContentTemplate>
                <asp:GridView ID="data_gridView" runat="server" AutoGenerateColumns="False" DataSourceID="comparables_DS"
                    AllowPaging="True" AllowSorting="True" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Tipo" SortExpression="idTipoComparable" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <%# Eval("TipoComparable.descripcion") %>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="valorOferta" HeaderText="Valor Oferta" 
                            ReadOnly="True" SortExpression="valorOferta" 
                            DataFormatString="{0:c}" ItemStyle-VerticalAlign="Top" >
                        <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionComparable" HeaderText="Descripción" HtmlEncode="false"
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top" >
                        <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionUbicacion" HeaderText="Ubicación" HtmlEncode="false" 
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top" >
                        <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionContacto" HeaderText="Contacto" HtmlEncode="false" 
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top" >
                        <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaCreacion" HeaderText="Fecha creación" 
                            ReadOnly="True" SortExpression="fechaCreacion"
                            HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" 
                            ItemStyle-VerticalAlign="Top" >
                        <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaActualizacion" HeaderText="Fecha actualización" 
                            ReadOnly="True" SortExpression="fechaActualizacion"
                            HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" 
                            ItemStyle-VerticalAlign="Top" >
                                                
                        <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                                                
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <img class="botonImagen" alt="Editar registro" src="../../Images/Icons/Editar.gif"
                                    onclick="viewComparable(this, <%# Eval("idComparable") %>);" />
                                <img class="botonImagen" alt="Eliminar registro" src="../../Images/Icons/Eliminar.gif"
                                    onclick="deleteComparable(this, <%# Eval("idComparable") %>);" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="sinDatos">
                            Sin registros...
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:LinqDataSource ID="tipo_DS" runat="server" 
                    ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext" Select="new (idTipoComparable, descripcion)"
                    TableName="TipoComparable" 
                    OnContextCreating="SetupContext">
                </asp:LinqDataSource>                
            
                <asp:LinqDataSource ID="comparables_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
                    OrderBy="fechaActualizacion DESC" Select="new (idComparable, valorOferta, DescripcionComparable, DescripcionUbicacion, DescripcionContacto, fechaCreacion, fechaActualizacion, idTipoComparable, TipoComparable)"
                    TableName="ComparableInmobiliario" StoreOriginalValuesInViewState="False" 
                    OnContextCreating="SetupContext" Where="@idTipoComparable = 0 || idTipoComparable == @idTipoComparable">
                    <WhereParameters>
                        <asp:SessionParameter SessionField="idTipoComparableGrid" Name="idTipoComparable" 
                            Type="Int32" DefaultValue="0" />
                    </WhereParameters>
                </asp:LinqDataSource>                
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="search_ImBtn" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>