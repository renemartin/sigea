<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDireccion.ascx.cs"
    Inherits="Controles_DatosDireccion" %>

<script type="text/javascript">
    // DataBindings
    function getDatosDireccion() {
        return getDatosDireccion_Aux("<%= this.ClientID%>");
    }
    function getDatosDireccion_Aux(parent_id) {
        var data = new Object();

        data["calle"] = $get(parent_id + "_calle_TBox").value;
        data["entre1"] = $get(parent_id + "_entre1_TBox").value;
        data["entre2"] = $get(parent_id + "_entre2_TBox").value;
        data["numeroExterior"] = $get(parent_id + "_numExt_TBox").value;
        data["numeroInterior"] = $get(parent_id + "_numInt_TBox").value;
        data["claveEstado"] = $get(parent_id + "_estado_DDList").value;
        data["idMunicipio"] = $get(parent_id + "_municipio_DDList").value;
        data["nombreAsentamiento"] = $get(parent_id + "_asentamiento_TBox").value;
        data["codigoPostal"] = $get(parent_id + "_cp_TBox").value;

        return data;
    }
    function setDatosDireccion(data) {
        setDatosDireccion_Aux("<%= this.ClientID%>", data);
    }
    function setDatosDireccion_Aux(parent_id, data) {
        $get(parent_id + "_calle_TBox").value = data["calle"];
        $get(parent_id + "_entre1_TBox").value = data["entre1"];
        $get(parent_id + "_entre2_TBox").value = data["entre2"]
        $get(parent_id + "_numExt_TBox").value = data["numeroExterior"];
        $get(parent_id + "_numInt_TBox").value = data["numeroInterior"]
        $get(parent_id + "_estado_DDList").selectedValue = data["claveEstado"]
        $get(parent_id + "_municipio_DDList").selectedValue = data["idMunicipio"]
        $get(parent_id + "_asentamiento_TBox").value = data["nombreAsentamiento"];
        $get(parent_id + "_cp_TBox").value = data["codigoPostal"];
    }

    // Llenado de datos
    function fillDireccionData() {        
        fillDireccionData_Aux("<%= this.ClientID%>");
    }
    function fillDireccionData_Aux(parent_id) {
        fillEstados(parent_id + "_estado_DDList");
        updateMunicipios_Aux(parent_id);
    }
    function updateMunicipios() {
        updateMunicipios_Aux("<%= this.ClientID%>");
    }
    function updateMunicipios_Aux(parent_id) {
        fillMunicipios(parent_id + "_municipio_DDList", parent_id + "_estado_DDList");
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Calle:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="calle_TBox" runat="server"></asp:TextBox>
            <span class="subCampo">#</span>
            <asp:TextBox ID="numExt_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="subCampo">Int.</span>
            <asp:TextBox ID="numInt_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entre:
        </td>
        <td class="celdaContenido">
            <asp:TextBox ID="entre1_TBox" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="entre2_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estado:
        </td>
        <td class="celdaContenido">
            <asp:DropDownList ID="estado_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Municipio:
        </td>
        <td class="celdaContenido">
            <asp:DropDownList ID="municipio_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            C.P:
        </td>
        <td class="celdaContenido">
            <asp:TextBox ID="cp_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Asentamiento:
        </td>
        <td class="celdaContenido">
            <asp:TextBox ID="asentamiento_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
