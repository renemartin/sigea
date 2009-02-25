<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosGeneralesAvaluo.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosGeneralesAvaluo" %>
<link href="../../../App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />    
        
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

<script type="text/javascript">

    function AvaluoInmobiliario() {

        // Inicialización
        if (typeof (AvaluoInmobiliario_Init) == "undefined") {
            AvaluoInmobiliario_Init = true;
            AvaluoInmobiliario.prototype.fillData = fillData;
            AvaluoInmobiliario.prototype.setData = setData;
            AvaluoInmobiliario.prototype.getData = getData;
            AvaluoInmobiliario.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= proposito_DDList.ClientID %>"),                   // 0
            $get("<%= especProposito_TBox.ClientID %>"),                // 1
            $get("<%= especRecuperacion_TBox.ClientID %>"),             // 2
            $get("<%= cliente_DDList.ClientID %>"),                     // 3
            $get("<%= promocionVIASC_CBox.ClientID %>"),                // 4
            $get("<%= contado_CBox.ClientID %>"),                       // 5
            $get("<%= tipoCredito_DDList.ClientID %>"),                 // 6
            $get("<%= entidadOtorgante_DDList.ClientID %>"),            // 7
            $get("<%= entidadCofinanciamiento_DDList.ClientID %>"),     // 8
            $get("<%= tipoCreditoInterno_DDList.ClientID %>")           // 9
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(1);
        this.validator.addOptionalField(2);
        this.validator.addOptionalField(3);
        this.validator.addOptionalField(4);
        this.validator.addOptionalField(6);
        this.validator.addOptionalField(7);
        this.validator.addOptionalField(8);
        this.validator.addOptionalField(9);

        // DataBindings
        function getData() {
            var data_set = new Array();
            var seccion_proposito = $get("seccion_proposito");
            var seccion_recuperacion = $get("seccion_recuperacion");

            // Datos avalúo
            data_set[0] = new Object();
            data_set[0].idProposito = $get("<%= proposito_DDList.ClientID %>").value;
            data_set[0].especProposito = getVisibility(seccion_proposito)
                ? $get("<%= especProposito_TBox.ClientID %>").value : "";
            data_set[0].especRecuperacion = getVisibility(seccion_recuperacion)
                ? $get("<%= especRecuperacion_TBox.ClientID %>").value : "";
            data_set[0].operacionContado = $get("<%= contado_CBox.ClientID %>").checked;
            if (getVisibility($get("seccion_promocion"))) {
                data_set[0].promocionVIASC = $get("<%= promocionVIASC_CBox.ClientID %>").checked;

                if (getVisibility($get("seccion_cliente"))) {
                    data_set[0].idCliente = $get("<%= cliente_DDList.ClientID %>").value;
                }
            }
            
            // Datos crédito
            if ($get("seccion_credito").style.display == "none") {
                data_set[1] = null;
            } 
            else {
                data_set[1] = new Object();
                data_set[1].idTipoCredito = $get("<%= tipoCredito_DDList.ClientID %>").value;
                data_set[1].idEntidadOtorgante = $get("<%= entidadOtorgante_DDList.ClientID %>").value;
                if ($get("seccion_cofinanciamiento").style.display != "none")
                    data_set[1].idEntidadCofinanciamiento = $get("<%= entidadCofinanciamiento_DDList.ClientID %>").value;
                if ($get("seccion_subtipo_credito").style.display != "none")
                    data_set[1].idTipoCreditoInterno = $get("<%= tipoCreditoInterno_DDList.ClientID %>").value;
            }

            return data_set;
        }
        
        function setData(data_set) {
            // Datos avalúo
            $get("<%= proposito_DDList.ClientID %>").selectedValue = data_set[0].idProposito;
            $get("<%= especProposito_TBox.ClientID %>").value = data_set[0].especProposito;
            $get("<%= especRecuperacion_TBox.ClientID %>").value = data_set[0].especRecuperacion
            $get("<%= cliente_DDList.ClientID %>").selectedValue = data_set[0].idCliente;
            $get("<%= promocionVIASC_CBox.ClientID %>").checked = data_set[0].promocionVIASC;
            $get("<%= contado_CBox.ClientID %>").checked = data_set[0].operacionContado;

            setVisibility($get("seccion_credito"), data_set[0].operacionContado == false);
            setVisibility($get("seccion_recuperacion"), data_set[0].especRecuperacion != "");
            setVisibility($get("seccion_proposito"), data_set[0].especProposito != "");
            
            // Datos crédito
            if (data_set[1] != null) {
                $get("<%= tipoCredito_DDList.ClientID %>").selectedValue = data_set[1].idTipoCredito;
                $get("<%= entidadOtorgante_DDList.ClientID %>").selectedValue = data_set[1].idEntidadOtorgante;
                $get("<%= entidadCofinanciamiento_DDList.ClientID %>").selectedValue = data_set[1].idEntidadCofinanciamiento;
                $get("<%= tipoCreditoInterno_DDList.ClientID %>").selectedValue = data_set[1].idTipoCreditoInterno;

                setVisibility($get("seccion_cofinanciamiento"), data_set[1].idEntidadCofinanciamiento != null);
            }
            else {
                $get("seccion_cofinanciamiento").style.display = "none";
                $get("seccion_subtipo_credito").style.display = "none";

                $get("<%= tipoCredito_DDList.ClientID %>").selectedIndex = 0;
                $get("<%= entidadOtorgante_DDList.ClientID %>").selectedIndex = 0;
                $get("<%= entidadCofinanciamiento_DDList.ClientID %>").selectedIndex = 0;
                $get("<%= tipoCreditoInterno_DDList.ClientID %>").selectedIndex = 0;
            }
            
            this.fillData();
        }
        
        // Llenado de datos
        function fillData() {
            fillProposito("<%= proposito_DDList.ClientID %>");
            fillTipoCredito("<%= tipoCredito_DDList.ClientID %>", setTipoCreditoSelection);
            fillEntidadOtorgante("<%= entidadOtorgante_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>", setEntidadFinanciamientoSelection);
            fillCreditoInterno("<%= tipoCreditoInterno_DDList.ClientID %>", "<%= entidadOtorgante_DDList.ClientID %>");
            fillEntidadCofinanciamiento("<%= entidadCofinanciamiento_DDList.ClientID %>", "<%= tipoCredito_DDList.ClientID %>");
            fillCliente("<%= cliente_DDList.ClientID %>");
        }
        
        // Validación
        function validate() {
            return this.validator.validate();
        }

    }

    // Validacion de selecciones
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
    function setEntidadFinanciamientoSelection() {
        var entidad = $get("<%= entidadOtorgante_DDList.ClientID %>");

        var tiene_credito_interno = Boolean.parse(entidad.options[entidad.selectedIndex].getAttribute("att1"));
        var subtipo_display = tiene_credito_interno
            ? "block"
            : "none";

        $get("seccion_subtipo_credito").style.display = subtipo_display;
        if (entidad.value != "0") {
            fillCreditoInterno("<%= tipoCreditoInterno_DDList.ClientID %>", "<%= entidadOtorgante_DDList.ClientID %>");
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

    this["<%= ID %>"] = new AvaluoInmobiliario();
    
</script>

