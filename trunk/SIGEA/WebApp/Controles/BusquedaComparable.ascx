<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BusquedaComparable.ascx.cs"
    Inherits="Controles_BusquedaComparable" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div class="formulario">
    <table class="tablaCompactaExtendida">
        <tr>
            <td class="celdaTitulo">
                Valor oferta:
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="operador_DDList" runat="server">
                    <asp:ListItem Text="=" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="&gt;" Value="1" Selected="False"></asp:ListItem>
                    <asp:ListItem Text="&gt;=" Value="2" Selected="False"></asp:ListItem>
                    <asp:ListItem Text="&lt;" Value="3" Selected="False"></asp:ListItem>
                    <asp:ListItem Text="&lt;=" Value="4" Selected="False"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="valorOferta_TBox" runat="server"></asp:TextBox>
            </td>
            <td class="celdaTituloSec">
                Fecha límite de antigüedad:
            </td>
            <td class="celdaValor" colspan="3">
                <asp:TextBox ID="fechaCreacion_TBox" runat="server" Enabled="false"></asp:TextBox>
                &nbsp;<asp:Image ID="calendar_img" runat="server" ImageUrl="../Images/Icons/calendar.gif"
                    ImageAlign="AbsMiddle" />
            </td>
        </tr>
        <tr>
            <td class="celdaTitulo">
                Número de frentes:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="numeroFrentes_TBox" runat="server"></asp:TextBox>
                TargetControlID="numeroFrentes_TBox">
            </td>
            <td class="celdaTituloSec">
                Superficie terreno:
            </td>
            <td class="celdaValor" colspan="3">
                <asp:TextBox ID="superficieTerreno_TBox" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Panel ID="construccion_Panel" runat="server" CssClass="hidden">
        <table class="tablaCompactaExtendida">
            <tr class="filaHeaderSeccion">
                <td colspan="6">
                    Datos de construcción
                </td>
            </tr>
            <tr>
                <td class="celdaTitulo">
                    Superficie construida:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="superficieConstruida_TBox" runat="server"></asp:TextBox>
                </td>
                <td class="celdaTituloSec">
                    Uso de suelo:
                </td>
                <td class="celdaValor" colspan="3">
                    <asp:DropDownList ID="usoSuelo_DDList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="usoSuelo_DS" DataTextField="descripcion" DataValueField="idTipoUsoSuelo">
                        <asp:ListItem Value="0" Text="Seleccione..." />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="celdaTitulo">
                    Clase:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="clase_DDList" runat="server" AppendDataBoundItems="True" DataSourceID="clase_DS"
                        DataTextField="descripcion" DataValueField="idClase">
                        <asp:ListItem Value="0" Text="Seleccione..." />
                    </asp:DropDownList>
                </td>
                <td class="celdaTituloSec">
                    Conservación:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="conservacion_DDList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="conservacion_DS" DataTextField="descripcion" DataValueField="idTipoEstadoConservacion">
                        <asp:ListItem Value="0" Text="Seleccione..." />
                    </asp:DropDownList>
                </td>
                <td class="celdaTituloSec">
                    Antigüedad:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="antiguedad_TBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="celdaTitulo">
                    Avance obra:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="avanceObra_TBox" runat="server"></asp:TextBox>
                </td>
                <td class="celdaTituloSec">
                    Calidad del proyecto:
                </td>
                <td class="celdaValor" colspan="3">
                    <asp:DropDownList ID="calidadProyecto_DDList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="calidad_DS" DataTextField="descripcion" DataValueField="idTipoCalidadProyecto">
                        <asp:ListItem Value="0" Text="Seleccione..." />
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table class="tablaCompactaExtendida">
        <tr class="filaHeaderSeccion">
            <td colspan="6">
                Datos de ubicación
            </td>
        </tr>
        <tr>
            <td class="celdaTitulo">
                Calle:
            </td>
            <td class="celdaValor" colspan="3">
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="fechaCreacion_TBox"
                    PopupButtonID="calendar_img">
                </cc1:CalendarExtender>
                <asp:TextBox ID="calle_TBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="celdaTituloSec">
                Código postal:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="codigoPostal_TBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="celdaTitulo">
                Asentamiento:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="asentamiento_TBox" runat="server"></asp:TextBox>
            </td>
            <td class="celdaTituloSec">
                Municipio:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="municipio_TBox" runat="server"></asp:TextBox>
            </td>
            <td class="celdaTituloSec">
                Estado:
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="estado_TBox" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
<div class="barraAcciones" style="text-align: right">
    <asp:ImageButton ID="buscar_ImBtn" runat="server" SkinID="Search" OnClick="buscar_ImBtn_Click" />
    <asp:ImageButton ID="cancelar_ImBtn" runat="server" SkinID="Cancel" OnClick="cancelar_ImBtn_Click" />
</div>
<asp:LinqDataSource ID="usoSuelo_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
    OrderBy="descripcion DESC" Select="new (descripcion, idTipoUsoSuelo)" TableName="TipoUsoSuelo"
    StoreOriginalValuesInViewState="False" OnContextCreating="SetupContext">
</asp:LinqDataSource>
<asp:LinqDataSource ID="clase_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
    OrderBy="idClase DESC" Select="new (descripcion, idClase)" TableName="ClaseInmueble"
    StoreOriginalValuesInViewState="False" OnContextCreating="SetupContext">
</asp:LinqDataSource>
<asp:LinqDataSource ID="conservacion_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
    OrderBy="descripcion DESC" Select="new (descripcion, idTipoEstadoConservacion)"
    TableName="TipoEstadoConservacion" StoreOriginalValuesInViewState="False" OnContextCreating="SetupContext">
</asp:LinqDataSource>
<asp:LinqDataSource ID="calidad_DS" runat="server" ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext"
    OrderBy="descripcion DESC" Select="new (descripcion, idTipoCalidadProyecto)"
    TableName="TipoCalidadProyecto" StoreOriginalValuesInViewState="False" OnContextCreating="SetupContext">
</asp:LinqDataSource>

<script type="text/javascript">

    function BusquedaComparable() {

        // Inicialización
        BusquedaComparable.prototype.getData = getData;
        BusquedaComparable.prototype.setTipo = setTipo;
        BusquedaComparable.prototype.clear = clear;

        // Inicialización de validador
        //        this.controls = new Array(
        //            $get(this.parent_id + "_calle_TBox"),           // 0
        //            $get(this.parent_id + "_entre1_TBox"),          // 1
        //            $get(this.parent_id + "_entre2_TBox"),          // 2
        //            $get(this.parent_id + "_numExt_TBox"),          // 3
        //            $get(this.parent_id + "_numInt_TBox"),          // 4
        //            $get(this.parent_id + "_estado_DDList"),        // 5
        //            $get(this.parent_id + "_municipio_DDList"),     // 6
        //            $get(this.parent_id + "_asentamiento_TBox"),    // 7
        //            $get(this.parent_id + "_cp_TBox")               // 8
        //        );
        //        this.validator = new ControlValidator(this.controls);
        //        this.validator.addOptionalField(1);
        //        this.validator.addOptionalField(2);
        //        this.validator.addOptionalField(4);
        //        this.validator.addNumericField(8, false);
        this.controls = new Array(
            $get(this.parent_id + "valorOferta_TBox"),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + ""),
            $get(this.parent_id + "")
        );


        function getData() {
            var data = new Object();

            data.valorOferta = $get("<%= valorOferta_TBox.ClientID %>").value;
            data.operadorValor = $get("<%= operador_DDList.ClientID %>").value;
            data.fechaCreacion = $get("<%= fechaCreacion_TBox.ClientID %>").value;
            data.numeroFrentes = $get("<%= numeroFrentes_TBox.ClientID %>").value;
            data.superficieTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;

            data.superficieConstruida = $get("<%= superficieConstruida_TBox.ClientID %>").value;
            data.usoSuelo = $get("<%= usoSuelo_DDList.ClientID %>").value;
            data.clase = $get("<%= clase_DDList.ClientID %>").value;
            data.conservacion = $get("<%= conservacion_DDList.ClientID %>").value;
            data.antiguedad = $get("<%= antiguedad_TBox.ClientID %>").value;
            data.avanceObra = $get("<%= avanceObra_TBox.ClientID %>").value;
            data.calidad = $get("<%= calidadProyecto_DDList.ClientID %>").value;

            data.calle = $get("<%= calle_TBox.ClientID %>").value;
            data.codigoPostal = $get("<%= codigoPostal_TBox.ClientID %>").value;
            data.asentamiento = $get("<%= asentamiento_TBox.ClientID %>").value;
            data.municipio = $get("<%= municipio_TBox.ClientID %>").value;
            data.estado = $get("<%= estado_TBox.ClientID %>").value;

            return data;
        }

        function setTipo(idTipo) {
            this.clear();
            $get("<%= construccion_Panel.ClientID %>").style.display = idTipo == "1" ? "none" : "block";
        }

        function clear() {
            $get("<%= valorOferta_TBox.ClientID %>").value = "";
            $get("<%= operador_DDList.ClientID %>").selectedIndex = 0;
            $get("<%= fechaCreacion_TBox.ClientID %>").value = "";
            $get("<%= numeroFrentes_TBox.ClientID %>").value = "";
            $get("<%= superficieTerreno_TBox.ClientID %>").value = "";

            $get("<%= superficieConstruida_TBox.ClientID %>").value = "";
            $get("<%= usoSuelo_DDList.ClientID %>").selectedIndex = 0;
            $get("<%= clase_DDList.ClientID %>").selectedIndex = 0;
            $get("<%= conservacion_DDList.ClientID %>").selectedIndex = 0;
            $get("<%= antiguedad_TBox.ClientID %>").value = "";
            $get("<%= avanceObra_TBox.ClientID %>").value = "";
            $get("<%= calidadProyecto_DDList.ClientID %>").selectedIndex = 0;

            $get("<%= calle_TBox.ClientID %>").value = "";
            $get("<%= codigoPostal_TBox.ClientID %>").value = "";
            $get("<%= asentamiento_TBox.ClientID %>").value = "";
            $get("<%= municipio_TBox.ClientID %>").value = "";
            $get("<%= estado_TBox.ClientID %>").value = "";
        }

        function validate() {
        }

    }

    this["<%= ID %>"] = new BusquedaComparable();
</script>

