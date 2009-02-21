<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstruccionesClasificacion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosConstruccionesClasificacion" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillConstruccionesClasificacionData() {
        fillClaseInmueble("<%= clase_DDList_1.ClientID %>");
        fillFuente("<%= fuente_DDList_1.ClientID %>");
        fillEstadoConservacion("<%= estadoCons_DDList_1.ClientID %>");
    }
    function setupTablaConstrucciones() {
        addCloningTable($get("tabla_construcciones"), 1, 5);
    }
    
    // Databindings
    function setDatosConstruccionesClasificacion(data) {
        if (data == null)
            return;
    
        var i = null;
        var parent_id = "<%= ClientID %>";
        
        for ( i=1; i <= data.length; i++ ) {
            $get( parent_id + "_tipo_CBox_" + i).checked = data[i-1].accesorio;
            $get( parent_id + "_descripcion_TBox_" + i).value = data[i-1].descripcion;
            $get( parent_id + "_clase_DDList_" + i).selectedValue = data[i-1].idClase;
            $get( parent_id + "_superficie_TBox_" + i).value = data[i-1].superficie;
            $get( parent_id + "_fuente_DDList_" + i).selectedValue = data[i-1].idFuente;
            $get( parent_id + "_nivelesTipo_TBox_" + i).value = data[i-1].niveles;
            $get( parent_id + "_nivelesCuerpo_TBox_" + i).value = data[i-1].nivelesCuerpo;
            $get( parent_id + "_edad_TBox_" + i).value = data[i-1].edad;
            $get( parent_id + "_avance_TBox_" + i).value = data[i-1].avanceObra;
            $get( parent_id + "_vidaUtil_TBox_" + i).value = data[i-1].vidaUtil;
            $get( parent_id + "_estadoCons_DDList_" + i).selectedValue = data[i-1].idConservacion;

            if (i != data.length) {
                addClonedRow('tabla_construcciones');
                fillEstadoConservacion(parent_id + "_estadoCons_DDList_" + (i + 1));
                fillClaseInmueble(parent_id + "_clase_DDList_" + (i + 1));
                fillFuente(parent_id + "_fuente_DDList_" + (i + 1));
                fillEstadoConservacion(parent_id + "_estadoCons_DDList_" + (i + 1));                
            }
        }                       
    }
    
    function getDatosConstruccionesClasificacion() {
        var data_set = new Array();
        var data = null;
        var i = null;
        var numero_tablas= getCloningTableCount('tabla_construcciones');

        var parent_id = "<%= ClientID %>";
        
        for ( i = 1; i <= numero_tablas; i++ ) {
            data = new Object();
            data.numeroTipo = i;
            data.accesorio = $get( parent_id + "_tipo_CBox_" + i).checked;
            data.descripcion = $get( parent_id + "_descripcion_TBox_" + i).value;
            data.idClase = $get( parent_id + "_clase_DDList_" + i).value;
            data.superficie = $get( parent_id + "_superficie_TBox_" + i).value;
            data.idFuente = $get( parent_id + "_fuente_DDList_" + i).value;
            data.otraFuente = "";
            data.niveles = $get( parent_id + "_nivelesTipo_TBox_" + i).value;
            data.nivelesCuerpo = $get( parent_id + "_nivelesCuerpo_TBox_" + i).value;
            data.edad = $get( parent_id + "_edad_TBox_" + i).value;
            data.avanceObra = $get( parent_id + "_avance_TBox_" + i).value;
            data.vidaUtil = $get( parent_id + "_vidaUtil_TBox_" + i).value;
            data.idConservacion = $get( parent_id + "_estadoCons_DDList_" + i).value;
            
            data_set[i-1] = data;
        }
        
        return data_set;
    }

</script>

<table id="tabla_construcciones" class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td>
            Tipo
        </td>
        <td>
            Descripción
        </td>
        <td>
            Clase
        </td>
        <td>
            Superficie (m²)
        </td>
        <td>
            Fuente
        </td>
        <td>
            # Niv. tipo
        </td>
        <td>
            # Niv. cuerpo
        </td>
        <td>
            Edad (años)
        </td>
        <td>
            Avance obra (%)
        </td>
        <td>
            Vida útil (años)
        </td>
        <td>
            Estado cons.
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="tipo_CBox_1" Text="Const." runat="server" />
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox_1" runat="server" SkinID="Compacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="clase_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficie_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuente_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesTipo_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesCuerpo_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avance_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vidaUtil_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoCons_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td>
        </td>
    </tr>
</table>
