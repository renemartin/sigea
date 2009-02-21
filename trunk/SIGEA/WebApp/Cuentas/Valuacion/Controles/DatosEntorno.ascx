<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntorno.ascx.cs"
    Inherits="Cuentas_Administracion_DatosEntorno" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoData(idClase) {
        fillClasificacionZona("<%= clasificacionZona_DDList.ClientID %>", idClase);
        fillProximidadUrbana("<%= proximidadUrbana_DDList.ClientID %>");
        fillNivelSocioeconomico("<%= nivelSocioeconomico_DDList.ClientID %>");
        fillConstruccionPredominante("<%= construccionPredominante_DDList.ClientID %>");
        fillDensidad("<%= densidadPoblacion_DDList.ClientID %>");
        fillImportanciaVialidad("<%= importanciaVia_DDList_1.ClientID %>");     
    }

    function setupTablaVias() {
        addCloningTable($get("tabla_vias"), 1, 3);
    }

    // Databindngs
    function setDatosEntorno(data) {
        if (data != null) {
            $get("<%= clasificacionZona_DDList.ClientID %>").selectedValue = data.idTipoClasificacionZona;
            $get("<%= proximidadUrbana_DDList.ClientID %>").selectedValue = data.idTipoProximidadUrbana;
            $get("<%= nivelSocioeconomico_DDList.ClientID %>").selectedValue = data.idTipoNivelSocioEconomico;
            $get("<%= construccionPredominante_DDList.ClientID %>").selectedValue = data.idTipoConstrucciones;
            $get("<%= densidadPoblacion_DDList.ClientID %>").selectedValue = data.idTipoDensidadPoblacion;
            $get("<%= indiceSaturacion_TBox.ClientID %>").value = data.indiceSaturacion;
        }
    }
    function getDatosEntorno() {
        var data = new Object();

        data.idTipoClasificacionZona = $get("<%= clasificacionZona_DDList.ClientID %>").value;
        data.idTipoProximidadUrbana = $get("<%= proximidadUrbana_DDList.ClientID %>").value;
        data.idTipoNivelSocioEconomico = $get("<%= nivelSocioeconomico_DDList.ClientID %>").value;
        data.idTipoConstrucciones = $get("<%= construccionPredominante_DDList.ClientID %>").value;
        data.idTipoDensidadPoblacion = $get("<%= densidadPoblacion_DDList.ClientID %>").value;
        data.indiceSaturacion = $get("<%= indiceSaturacion_TBox.ClientID %>").value;

        return data;
    }

    function setDatosViasAcceso(data) {
        if (data == null)
            return;
            
        var i = null;
        var parent_id = "<%= ClientID %>";

        for (i = 1; i <= data.length; i++) {
            $get(parent_id + "_via_TBox_" + i).value = data[i-1].nombreVia;
            $get(parent_id + "_importanciaVia_DDList_" + i).selectedValue = data[i-1].idImportanciaVia;            

            if (i != data.length) {
                addClonedRow('tabla_vias');
                fillImportanciaVialidad(parent_id + "_importanciaVia_DDList_" + (i+1));
            }
        }
    }

    //guardar datos
    function getDatosViasAcceso() {
        var data_set = new Array();
        var data = null;
        var parent_id = "<%= ClientID %>";
        var numero_filas = getCloningTableCount('tabla_vias');
        var i = null;

        for (i = 1; i <= numero_filas; i++) {
            data = new Object();
            data.idViaAcceso = i;
            data.nombreVia = $get(parent_id + "_via_TBox_" + i).value;
            data.idImportanciaVia = $get(parent_id + "_importanciaVia_DDList_" + i).value;
            data_set[i - 1] = data;
        }

        return data_set;
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Clasificación de zona:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="clasificacionZona_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Referencia de proximidad urbana SHF:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="proximidadUrbana_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Nivel socioeconómico:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="nivelSocioeconomico_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tipo de construcción predominante en calles circundantes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="construccionPredominante_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Indice de saturación de la zona:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="indiceSaturacion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Densidad de población:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="densidadPoblacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Vías de acceso e importancia de las mismas:
        </td>
        <td class="celdaValor" colspan="3">
            <table id="tabla_vias">
                <tr>
                    <td class="celdaHeader">
                        Nombre de vía
                    </td>
                    <td class="celdaHeader">
                        Importancia
                    </td>
                    <td>
                        <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
                        <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
                    </td>
                </tr>
                <tr>
                    <td class="celdaValor">
                        <asp:TextBox ID="via_TBox_1" runat="server"></asp:TextBox>
                    </td>
                    <td class="celdaValor">
                        <asp:DropDownList ID="importanciaVia_DDList_1" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
