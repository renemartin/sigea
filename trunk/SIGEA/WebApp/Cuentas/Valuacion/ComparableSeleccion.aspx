<%@ Page Title="SIGEA - Comparable Selección" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="ComparableSeleccion.aspx.cs" Inherits="Cuentas_Valuacion_ComparableSeleccion" %>

<%@ Register Src="~/Controles/BusquedaComparable.ascx" TagName="BusquedaAvanzada"
    TagPrefix="SIGEA" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <div class="formulario">
        <asp:UpdatePanel ID="comparableData_UpPanel" runat="server">
            <ContentTemplate>
                <div class="etiqueta1">
                    <span class="textoNegritas">Filtro: </span>
                    <asp:Label ID="filtro_Lbl" runat="server"></asp:Label>
                </div>
                <SIGEA:BusquedaAvanzada ID="BusquedaComparable_Ctrl" runat="server" CancelarVisible="false"
                    OnSearch="BusquedaComparable_Search" />
                <asp:GridView ID="data_gridView" runat="server" AutoGenerateColumns="False" DataSourceID="comparables_DS"
                    AllowPaging="True" AllowSorting="True" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <input type="checkbox" id="comparable_CBox" idcomparable='<%# Eval("idComparable") %>' />
                            </ItemTemplate>
                            <ItemStyle Width="10px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo" SortExpression="idTipoComparable" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <%# Eval("TipoComparable.descripcion") %>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="valorOferta" HeaderText="Valor Oferta" ReadOnly="True"
                            SortExpression="valorOferta" DataFormatString="{0:c}" ItemStyle-VerticalAlign="Top">
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionComparable" HeaderText="Descripción" HtmlEncode="false"
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top">
                            <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionUbicacion" HeaderText="Ubicación" HtmlEncode="false"
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top">
                            <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DescripcionContacto" HeaderText="Contacto" HtmlEncode="false"
                            ReadOnly="True" ItemStyle-CssClass="textoChico" ItemStyle-VerticalAlign="Top">
                            <ItemStyle CssClass="textoChico" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaCreacion" HeaderText="Fecha creación" ReadOnly="True"
                            SortExpression="fechaCreacion" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}"
                            ItemStyle-VerticalAlign="Top">
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaActualizacion" HeaderText="Fecha actualización" ReadOnly="True"
                            SortExpression="fechaActualizacion" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}"
                            ItemStyle-VerticalAlign="Top">
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="sinDatos">
                            Sin registros...
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:LinqDataSource ID="tipo_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
                    Select="new (idTipoComparable, descripcion)" TableName="TipoComparable" OnContextCreating="SetupContext">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="comparables_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
                    OrderBy="fechaActualizacion DESC" Select="new (idComparable, valorOferta, DescripcionComparable, DescripcionUbicacion, DescripcionContacto, fechaCreacion, fechaActualizacion, idTipoComparable, TipoComparable)"
                    TableName="ComparableInmobiliario" StoreOriginalValuesInViewState="False" OnContextCreating="SetupContext"
                    Where="@idTipoComparable = 0 || idTipoComparable == @idTipoComparable">
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
    <div class="formulario">
        <div class="barraMenu">
            <asp:ImageButton ID="cancel_ImBtn" runat="server" SkinID="Cancel" OnClientClick="closeWindow(false); return false;" />
        </div>
    </div>
</asp:Content>
