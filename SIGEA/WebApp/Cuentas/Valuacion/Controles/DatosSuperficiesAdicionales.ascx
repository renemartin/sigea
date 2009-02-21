<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficiesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficiesAdicionales" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    function setupTablaSuperficiesAdicionales(parent_id) {
        tabla = $get(parent_id + "_tabla_adicionales");
        addCloningTable(tabla, 1, 5);
    }

    // Databindings
    function setDatosSuperficiesAdicionales(parent_id, data) {
        if (data == null)
            return;
    
        var i = null;
        
        for (i = 1; i <= data.length; i++) {
            $get(parent_id + "_Concepto_TBox_" + i).value = data[i-1].concepto;
            $get(parent_id + "_Superficie_TBox_" + i).value = data[i-1].superficie;

            if (i != data.length) {
                addClonedRow(parent_id + '_tabla_adicionales');
            }
        }        
    }

    //guardar datos
    function getDatosSuperficiesAdicionales(parent_id) {
        var data_set = new Array();
        var i = null;
        var numero_tablas = getCloningTableCount(parent_id + '_tabla_adicionales');

        for (i = 1; i <= numero_tablas; i++) {
            data = new Object();
            data.idArea = i;
            data.concepto = $get(parent_id + "_Concepto_TBox_" + i).value;
            data.superficie = $get(parent_id + "_Superficie_TBox_" + i).value;

            data_set[i - 1] = data;
        }

        return data_set;
    }
</script>

<table id="<%= ClientID %>_tabla_adicionales">
    <tr class="filaHeader">
        <td>
            Concepto
        </td>
        <td>
            Superficie
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="Concepto_TBox_1" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="Superficie_TBox_1" runat="server"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td>
        </td>
    </tr>
</table>
