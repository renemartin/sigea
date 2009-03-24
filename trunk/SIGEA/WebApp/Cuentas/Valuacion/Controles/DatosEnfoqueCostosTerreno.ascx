<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosTerreno.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosTerreno" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Lote tipo:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="loteTipo_TBox" runat="server"></asp:TextBox>
            &nbsp;<span class="textoChico">m²</span>
        </td>
    </tr>
</table>

<table class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td>
            Fracción
        </td>
        <td>
            Superficie 
            <span class="textoChico">(m²)</span>
        </td>
        <td>
            Valor unitario
        </td>
        <td>
            Fzo
        </td>
        <td>
            Fub
        </td>
        <td>
            FFr
        </td>
        <td>
            FSu
        </td>
        <td>
            FFo
        </td>
        <td>
            FRe
        </td>
        <td>
            Valor neto
        </td>
        <td>
            Valor fracción
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:DropDownList ID="Fraccion_DDList_1" runat="server" SkinID="Compacto"></asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:Label ID="ST_Label_1" runat="server"></asp:Label>
            &nbsp;m²
            <asp:Label ID="Indiviso_Lbl_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VU_Lbl_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="FZO_DDList_1" Width="50px" runat="server" SkinID="Compacto">
                <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
                <asp:ListItem Text="0.80"></asp:ListItem>
                <asp:ListItem Text="1.20"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FUB_Label_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="FFR_DDList_1" Width="50px" runat="server" SkinID="Compacto">
                <asp:ListItem Text="0.60"></asp:ListItem>
                <asp:ListItem Text="0.80"></asp:ListItem>
                <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FSU_Lbl_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FFO_DDList_1" Text="1" Width="35px" runat="server" 
                SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FRE_Lbl_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VUN_Lbl_1" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VFT_Lbl_1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="Fraccion_TBox_2" runat="server" SkinID="Compacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="Superficie_TBox_2" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            &nbsp;m²
        </td>
        <td class="celdaValor">
            <asp:Label ID="VU_Label_2" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="FZO_DDList_2" Width="50px" runat="server" 
                SkinID="Compacto">
                <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
                <asp:ListItem Text="0.80"></asp:ListItem>
                <asp:ListItem Text="1.20"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FUB_TBox_2" Text="1" Width="35px" runat="server" 
                SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="FFR_DDList_2" Width="50px" runat="server" 
                SkinID="Compacto">
                <asp:ListItem Text="0.60"></asp:ListItem>
                <asp:ListItem Text="0.80"></asp:ListItem>
                <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FSU_TBox_2" Text="1" Width="35" runat="server" 
                SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FFO_TBox_2" Text="1" Width="35" runat="server" 
                SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FRE_Label_2" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VUN_Label_2" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VFT_Label_2" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" align="right" colspan="10">
            Valor de Terreno:
        </td>
        <td class="celdaValor">
            $
            <asp:Label ID="VT_Label" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function CostosTerreno() {
        // Inicialización
        CostosTerreno.prototype.getData = getData;
        CostosTerreno.prototype.setData = setData;
        CostosTerreno.prototype.validate = validate;

        // Databindings
        function getData() {
            var data_set = new Array();
            
            
            return data_set;
        }

        function setData(data_set) {
        }
        
        // Validación
        function validate() {
            return true;
        }
    }

    this["<%= ID %>"] = new CostosTerreno();

</script>