﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalacionesAdicionales.ascx.cs"
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
    function setDataInstalacionesAdicionles(data) {
        var i = null;
        var parent_id = "<%= ClientID %>";
        var filas_borrar = getCloningTableCount(parent_id +'_tabla_instalaciones') - data.length;
        
        if ( filas_borrar < 0 ) {
            while(filas_borrar-- != 0 )
                removeClonedRow(parent_id + '_tabla_instalaciones');
        }
        
        for ( i = 1; i <= data.length; i++ ) {
            $get( parent_id + "_descripcion_TBox_" + i).value = data[i].descripcion;
            $get( parent_id + "_cantidad_TBox_" + i).value = data[i].cantidad;
            $get( parent_id + "_unidad_DDList" + i).selectedValue = data[i].idTipoUnidad;
            $get( parent_id + "_edad_TBox_" + i).value = data[i].edad;
            $get( parent_id + "_conservacion_DDList_" + i).selectedValue = data[i].idTipoConservacion;
        }
        
        if ( i != data.length ) {
            addClonedRow(parent_id + '_tabla_instalaciones');
        }
    }
    
    //guardar datos
    function getDataInstalacionesAdicionales( parent_id ) {
        var data = new Object();
        var i = null;
        var numero_tablas = getCloningTableCount( parent_id + '_tabla_instalaciones');
        
        for ( i = 1; i <= numero_tablas; i++ ) {
            data[i].descripcion = $get( parent_id + "_descripcion_TBox_" + i).value;
            data[i].cantidad = $get( parent_id + "_cantidad_TBox_" + i).value;
            data[i].idTipoUnidad = $get( parent_id + "_unidad_DDList" + i).selectedValue;
            data[i].edad = $get( parent_id + "_edad_TBox_" + i).value;
            data[i].idTipoConservacion = $get( parent_id + "_conservacion_DDList_" + i).selectedValue;
        }
        return data;
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
