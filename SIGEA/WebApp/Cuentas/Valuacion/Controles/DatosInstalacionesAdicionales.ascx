<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalacionesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_InstalacionesAdicionales" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillInstalacionesAdicionalesData(parent_id) {
        fillUnidad(parent_id + "_unidad_DDList_1");
        fillEstadoConservacion(parent_id + "_conservacion_DDList_1");
    }

    function setupTablaSuperficiesAdicionales(parent_id) {
        tabla = $get(parent_id + "_tabla_instalaciones");
        addCloningTable(tabla, 1, 5);
    }
    
    //mostrar datos
    function setDatosInstalacionesAdicionales(data) {
        if(data == null)
            return;
            
        var i = null;
        var parent_id = "<%= ClientID %>";
        var filas_borrar = getCloningTableCount(parent_id +'_tabla_instalaciones') - data.length;
        
        if ( filas_borrar < 0 ) {
            while(filas_borrar-- != 0 )
                removeClonedRow(parent_id + '_tabla_instalaciones');
        }
        
        for ( i = 1; i <= data.length; i++ ) {
            $get( parent_id + "_descripcion_TBox_" + i).value = data[i-1].descripcion;
            $get( parent_id + "_cantidad_TBox_" + i).value = data[i-1].cantidad;
            $get( parent_id + "_unidad_DDList" + i).value = data[i-1].idTipoUnidad;
            $get( parent_id + "_edad_TBox_" + i).value = data[i-1].edad;
            $get( parent_id + "_conservacion_DDList_" + i).value = data[i-1].idTipoConservacion;
        }
        
        if ( i != data.length ) {
            addClonedRow(parent_id + '_tabla_instalaciones');
        }
    }
    
    //guardar datos
    function getDatosInstalacionesAdicionales( parent_id ) {
        var data_set = new Array();
        var data = null;
        data = new Object();
        var i = null;
        var numero_tablas = getCloningTableCount( parent_id + '_tabla_instalaciones');
        
        for ( i = 1; i <= numero_tablas; i++ ) {
            
            data = new Object();
            data.descripcion = $get( parent_id + "_descripcion_TBox_" + i).value;
            data.cantidad = $get( parent_id + "_cantidad_TBox_" + i).value;
            data.idTipoUnidad = $get( parent_id + "_unidad_DDList_" + i).value;
            data.edad = $get( parent_id + "_edad_TBox_" + i).value;
            data.idTipoConservacion = $get( parent_id + "_conservacion_DDList_" + i).value;
            
            data_set[i - 1] = data;
        }
        return data_set;
    }
    
</script>

<table id="<%= ClientID %>_tabla_instalaciones" >
    <tr class="filaHeader">
        <td>
            Descripción
        </td>
        <td>
            Cantidad
        </td>
        <td>
            Unidad
        </td>
        <td>
            Edad
            <span class="textoChico">(años)</span>
        </td>
        <td>
            Estado de conservación
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox_1" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cantidad_TBox_1" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="unidad_DDList_1" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox_1" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="conservacion_DDList_1" runat="server">
            </asp:DropDownList>
        </td>
        <td></td>
    </tr>
</table>
