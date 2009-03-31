<%@ Page Title="SIGEA - Comparables" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="Comparables.aspx.cs" Inherits="Cuentas_Valuacion_Comparables" %>

<%@ Register Src="~/Controles/BusquedaComparable.ascx" TagName="Buscador" TagPrefix="SIGEA" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        // Acciones del registro
        function addNewComparable() {
            //redirect("ComparableRegistro.aspx");
            openModalWindow("ComparableRegistro.aspx", 750, 550);
        }

        function viewComparable(sender, idComparable) {
            //redirect(String.format("ComparableRegistro.aspx?idComparable={0}", idComparable));
            openModalWindow(String.format("ComparableRegistro.aspx?idComparable={0}", idComparable), 750, 550);
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
    <asp:ScriptManager runat="server">
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
    
    <h1>Comparables</h1>
              
    <div class="formulario">
        <asp:UpdatePanel ID="comparableData_UpPanel" runat="server">
            <ContentTemplate>
   
                <div class="barraAcciones">
                    <asp:ImageButton ID="addNew_ImBtn" runat="server" SkinID="Add" />
                    <asp:ImageButton ID="buscar_ImBtn_ImBtn" runat="server" SkinID="Search"
                        OnClick="buscar_ImBtn_ImBtn_Click" />
                </div>
            
                <asp:Panel ID="filter_Panel" runat="server" CssClass="panel">
                    <table>
                        <tr>
                            <td class="celdaTituloSec">
                                Tipo:
                            </td>
                            <td class="celdaValor">
                                <asp:DropDownList ID="tipo_DDList" runat="server" DataSourceID="tipo_DS" DataTextField="descripcion"
                                    DataValueField="idTipoComparable" OnSelectedIndexChanged="tipo_DDList_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                
                <div class="etiqueta1">
                    <span class="textoNegritas">Filtro: </span>
                    <asp:Label ID="filtro_Lbl" runat="server"></asp:Label>
                </div>
                
                <div id="divBuscador" style="padding-top:5px; padding-bottom:10px">
                    <SIGEA:Buscador ID="buscador_Ctrl" runat="server" Mode="Server" 
                        OnSearch="buscador_Ctrl_Search" OnCancel="buscador_Ctrl_Cancel"
                        Hidden="True" />
                </div>
            
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
                
                <asp:ObjectDataSource ID="comparables_DS" runat="server" SelectMethod="GetLista" TypeName="SIGEA.Classes.Entities.ListaComparables">
                    <SelectParameters>
                        <asp:SessionParameter Name="idTipo" SessionField="idTipoComparableGrid" Type="Int16" />
                        <asp:SessionParameter Name="filtros" SessionField="filtrosComparablesGrid" Type="Object" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                     
            </ContentTemplate>

        </asp:UpdatePanel>
    </div>
</asp:Content>