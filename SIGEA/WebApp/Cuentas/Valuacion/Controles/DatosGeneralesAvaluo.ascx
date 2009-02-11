<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosGeneralesAvaluo.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosGeneralesAvaluo" %>

<script type="text/javascript">
    // DataBindings
    function getDatosAvaluo() {
        var data = new Object();

        data["idTipoInmueble"] = getIdTipoInmueble();
        data["idProposito"] = $get("<%= proposito_DDList.ClientID %>").value;
        data["especProposito"] = $get("<%= especProposito_TBox.ClientID %>").value;
        data["especRecuperacion"] = $get("<%= especRecuperacion_TBox.ClientID %>").value;
        data["idCliente"] = $get("<%= cliente_DDList.ClientID %>").value;
        data["operacionContado"] = $get("<%= contado_CBox.ClientID %>").checked;
        
        if ($get("seccion_promocion").style.display == "block") {            
            data["promocionVIASC"] = $get("<%= promocionVIASC_CBox.ClientID %>").checked;

            if ($get("seccion_cliente").style.display != "none") {
                data["idCliente"] = $get("<%= cliente_DDList.ClientID %>").selectedValue;
            }
        }

        return data;
    }
    function setDatosAvaluo(data) {
        $get("<%= proposito_DDList.ClientID %>").selectedValue = data["idProposito"];
        $get("<%= especProposito_TBox.ClientID %>").value = data["especProposito"];
        $get("<%= especRecuperacion_TBox.ClientID %>").value = data["especRecuperacion"]
        $get("<%= cliente_DDList.ClientID %>").selectedValue = data["idCliente"];
        $get("<%= contado_CBox.ClientID %>").checked = data["operacionContado"];
        $get("<%= promocionVIASC_CBox.ClientID %>").checked = data["promocionVIASC"];
    }

    function getDatosCredito() {
        if ($get("seccion_credito").style.display == "none")
            return null;
    
        var data = new Object();

        data["idTipoCredito"] = $get("<%= tipoCredito_DDList.ClientID %>").value;
        data["idEntidadOtorgante"] = $get("<%= entidadOtorgante_DDList.ClientID %>").value;
        
        if ($get("seccion_cofinanciamiento").style.display != "none")
            data["idEntidadCofinanciamiento"] = $get("<%= entidadCofinanciamiento_DDList.ClientID %>").value;
        if ($get("seccion_subtipo_credito").style.display != "none")
            data["idTipoCreditoInterno"] = $get("<%= tipoCreditoInterno_DDList.ClientID %>").value;

        return data;
    }
    function setDatosCredito(data) {
        if (data != null) {
            $get("<%= tipoCredito_DDList.ClientID %>").selectedValue = data["idTipoCredito"];
            $get("<%= entidadOtorgante_DDList.ClientID %>").selectedValue = data["idEntidadOtorgante"];
            $get("<%= entidadCofinanciamiento_DDList.ClientID %>").selectedValue = data["idEntidadCofinanciamiento"];
            $get("<%= tipoCreditoInterno_DDList.ClientID %>").selectedValue = data["idTipoCreditoInterno"];
        }
    }

    // Llenado de datos
    function fillAvaluoData() {
        fillProposito("<%= proposito_DDList.ClientID %>");
        fillTipoCredito("<%= tipoCredito_DDList.ClientID %>");
        fillEntidadOtorgante("<%= entidadOtorgante_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>");
        fillCreditoInterno("<%= tipoCreditoInterno_DDList.ClientID %>", "<%= entidadOtorgante_DDList.ClientID %>");
        fillEntidadCofinanciamiento("<%= entidadCofinanciamiento_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>");
        fillCliente("<%= cliente_DDList.ClientID %>");
    }

    // Validacion de selecciones
    function setDatosAvaluoSelection() {
        setPropositoSelection();
        setContadoSelection();
        setTipoCreditoSelection();
        setEntidadFinanciamientoSelection();
        setPromocionSelection();
    }
    function setPropositoSelection() {
        var proposito = $get("<%= proposito_DDList.ClientID %>");
        var proposito_text = proposito.options[proposito.selectedIndex].text;
        var seccion_recuperacion = $get("seccion_recuperacion");
        var seccion_proposito = $get("seccion_proposito");

        seccion_recuperacion.style.display = "none";
        seccion_proposito.style.display = "none";

        if (proposito_text.toLowerCase() == "recuperación") {
            seccion_recuperacion.style.display = "block";
        }
        else if (proposito_text.toLowerCase() == "otro") {
            seccion_proposito.style.display = "block";
        }
    }
    function setContadoSelection() {
        var contado_checked = $get("<%= contado_CBox.ClientID %>").checked;
        var sub_display = contado_checked ? "none" : "block";

        $get("seccion_credito").style.display = sub_display;
    }
    function setTipoCreditoSelection() {
        var tipo_credito = $get("<%= tipoCredito_DDList.ClientID %>");
        if (tipo_credito.options[tipo_credito.selectedIndex].getAttribute("att1") != null) {
            var tiene_cofi = Boolean.parse(tipo_credito.options[tipo_credito.selectedIndex].getAttribute("att1"));
            var cofinanciamiento_display = tiene_cofi
            ? "block"
            : "none";

            $get("seccion_cofinanciamiento").style.display = cofinanciamiento_display;
            if (tipo_credito.value != "0") {
                fillEntidadOtorgante("<%= entidadOtorgante_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>", setEntidadFinanciamientoSelection);
                fillEntidadCofinanciamiento("<%= entidadCofinanciamiento_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>");
            }
        }
    }
    function setEntidadFinanciamientoSelection() {
        var entidad = $get("<%= entidadOtorgante_DDList.ClientID %>");
        if (entidad.options[entidad.selectedIndex].getAttribute("att1") != null) {
            var tiene_credito_interno = Boolean.parse(entidad.options[entidad.selectedIndex].getAttribute("att1"));
            var subtipo_display = tiene_credito_interno
            ? "block"
            : "none";

            $get("seccion_subtipo_credito").style.display = subtipo_display;
            if (entidad.value != "0") {
                fillCreditoInterno("<%= tipoCreditoInterno_DDList.ClientID %>", "<%= entidadOtorgante_DDList.ClientID %>");
            }
        }
    }
    function setPromocionSelection() {
        var promocion_checked = $get("<%= promocionVIASC_CBox.ClientID %>").checked;
        var sub_display = !promocion_checked ? "none" : "block";

        $get("seccion_cliente").style.display = sub_display;
    }

    // Visibilidad controles
    function showSeccionPromocion() {
        $get("seccion_promocion").style.display = "block";
    }
</script>

<table>
    <tr>
        <td class="celdaTitulo" valign="top">
            Propósito:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="proposito_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_proposito" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especProposito_TBox" runat="server"></asp:TextBox></div>
            <div id="seccion_recuperacion" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especRecuperacion_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Tipo de crédito:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="contado_CBox" runat="server" Text="Operación de contado" Checked="True" />
            <table id="seccion_credito" style="display: none">
                <tr>
                    <td class="subCampo">
                        Tipo de crédito:
                    </td>
                    <td>
                        <asp:DropDownList ID="tipoCredito_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subCampo">
                        Entidad otorgante:
                    </td>
                    <td>
                        <asp:DropDownList ID="entidadOtorgante_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="seccion_subtipo_credito" style="display: none">
                    <td class="subCampo">
                        Sub-tipo:
                    </td>
                    <td>
                        <asp:DropDownList ID="tipoCreditoInterno_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="seccion_cofinanciamiento" style="display: none">
                    <td class="subCampo">
                        Entidad cofinanciamiento:
                    </td>
                    <td>
                        <asp:DropDownList ID="entidadCofinanciamiento_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="seccion_promocion" style="display: none;">
    <tr>
        <td class="celdaTitulo">
            Promoción:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="promocionVIASC_CBox" runat="server" Text="VIASC Realiza la promoción"
                Checked="true" />
        </td>
    </tr>
    <tr id="seccion_cliente">
        <td class="celdaTitulo">
            Cliente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="cliente_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
