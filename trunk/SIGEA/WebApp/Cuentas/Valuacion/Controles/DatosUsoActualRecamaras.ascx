<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualRecamaras.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosRecamara" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

    function setupTablaRecamaras() {
        addCloningTable($get("tabla_recamaras"), 1, 5);
    }
    
    //mostrar datos
    function setDatosUsoActualRecamara(data) {
        var i = null;
        var parent_id = "<%= ClientID %>";
        var filas_borrar = getCloningTableCount('tabla_recamaras') - data.length;
        
        if ( filas_borrar > 0 ) {
            while(filas_borrar-- != 0 ) 
                removeClonedRow('tabla_recamaras');
        }
                    
        for( i=1; i<=data.length; i++ ) {
        
            $get( parent_id + "_cantidad_TBox_" + i).value = data[i].cantidad;
            $get( parent_id + "_tipoPlanta_DDList_" + i).selectedValue = data[i].nivel;
            $get( parent_id + "_espacioCloset_RBtn_" + i).checked = data[i].espacioCloset;
            $get( parent_id + "_closetEquipado_RBtn_" + i).checked = data[i].closetEquipado;
            $get( parent_id + "_terraza_CBox_" + i).checked = data[i].terraza;
            $get( parent_id + "_balcon_CBox_" + i).checked = data[i].balcon;
            $get( parent_id + "_vestidor_CBox_" + i).checked = data[i].vestidor;        
                        
            if ( i != data.length ) {
                addClonedRow('tabla_recamaras');
            }
        }
        
        //guardar datos Tabla UsoActualRecamaras
        function getDatosUsoActualRecamara( parent_id ) {
            var data = new Object();
            var i = null;
            var numero_tablas = getCloningTableCount('tabla_recamaras');
            
            for ( i = 1; i<= numero_tablas; i++ ) {
            
                data[i].cantidad = $get( parent_id + "_cantidad_TBox_" + i).value;
                data[i].nivel = $get( parent_id + "_tipoPlanta_DDList_" + i).selectedValue;
                data[i].espacioCloset = $get( parent_id + "_espacioCloset_RBtn_" + i).checked;
                data[i].closetEquipado = $get( parent_id + "_closetEquipado_RBtn_" + i).checked;
                data[i].terraza = $get( parent_id + "_terraza_CBtn_" + i).checked;
                data[i].balcon = $get( parent_id + "_balcon_CBtn_" + i).checked;
                data[i].vestidor = $get( parent_id + "_vestidor_CBtn_" + i).checked;
           }
           
           return data;
        }
    }

</script>

<table id="tabla_recamaras">
    <tr>
        <td align="right">
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td class="celdaTituloSec">
                        Cantidad:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="cantidad_TBox_1" runat="server" SkinID="Numero"></asp:TextBox>
                    </td>
                    <td class="celdaTituloSec">
                        Planta:
                    </td>
                    <td class="celdaValor">
                        <asp:DropDownList ID="tipoPlanta_DDList_1" runat="server">
                            <asp:ListItem Value="0" Selected="True">Selecione...</asp:ListItem>
                            <asp:ListItem Value="1">BAJA</asp:ListItem>
                            <asp:ListItem Value="2">ALTA</asp:ListItem>
                            <asp:ListItem Value="3">OTROS NIVELES</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="celdaValor" colspan="4">
                        <asp:RadioButton ID="sinCloset_RBtn_1" Text="Sin closet" GroupName="Closet" runat="server" />
                        <asp:RadioButton ID="espacioCloset_RBtn_1" Text="Espacio closet" GroupName="Closet"
                            runat="server" />
                        <asp:RadioButton ID="closetEquipado_RBtn_1" Text="Closet Equipado" GroupName="Closet"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="celdaValor" colspan="4">
                        <asp:CheckBox ID="terraza_CBox_1" Text="Terraza" runat="server" />
                        <asp:CheckBox ID="balcon_CBox_1" Text="Balcón" runat="server" />
                        <asp:CheckBox ID="vestidor_CBox_1" Text="Vestidor" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
