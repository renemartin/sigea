<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualRecamaras.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosRecamara" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

    function setupTablaRecamaras() {
        addCloningTable($get("tabla_recamaras"), 1, 5);
    }
    
    //mostrar datos
    function setDatosUsoActualRecamaras(data) {
        if(data == null)
            return;
        
        var i = null;
        var parent_id = "<%= ClientID %>";
        var filas_borrar = getCloningTableCount('tabla_recamaras') - data.length;
        
        if ( filas_borrar > 0 ) {
            while(filas_borrar-- != 0 ) 
                removeClonedRow('tabla_recamaras');
        }
                    
        for( i=1; i<=data.length; i++ ) {
        
            $get( parent_id + "_cantidad_TBox_" + i).value = data[i-1].cantidad;
            $get( parent_id + "_tipoPlanta_DDList_" + i).selectedValue = data[i-1].planta;
            $get( parent_id + "_espacioCloset_RBtn_" + i).checked = data[i-1].espacioCloset;
            $get( parent_id + "_closetEquipado_RBtn_" + i).checked = data[i-1].closetEquipado;
            $get( parent_id + "_terraza_CBox_" + i).checked = data[i-1].terraza;
            $get( parent_id + "_balcon_CBox_" + i).checked = data[i-1].balcon;
            $get( parent_id + "_vestidor_CBox_" + i).checked = data[i-1].vestidor;        
                        
            if ( i != data.length ) {
                addClonedRow('tabla_recamaras');
            }
        }
     }   
    //guardar datos Tabla UsoActualRecamaras
    function getDatosUsoActualRecamaras() {
        var data_set = new Array();
        var data = null;
        var i = null;
        var parent_id = "<%= ClientID %>";
        var numero_tablas = getCloningTableCount('tabla_recamaras');
        
        for ( i = 1; i<= numero_tablas; i++ ) {
            data = new Object();
            data[i-1].cantidad =1;// $get( parent_id + "_cantidad_TBox_" + i).value;
            data[i-1].planta = 1; //$get( parent_id + "_tipoPlanta_DDList_" + i).selectedValue;
            data[i-1].espacioCloset = 1; //$get( parent_id + "_espacioCloset_RBtn_" + i).checked;
            data[i-1].closetEquipado =1;// $get( parent_id + "_closetEquipado_RBtn_" + i).checked;
            data[i-1].terraza =1; //$get( parent_id + "_terraza_CBtn_" + i).checked;
            data[i-1].balcon =1; //$get( parent_id + "_balcon_CBtn_" + i).checked;
            data[i-1].vestidor =1; //$get( parent_id + "_vestidor_CBtn_" + i).checked;
            
            data_set[i-1] = data;
        }
       
       return data_set;
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
