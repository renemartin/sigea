<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerrenoCalles.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerrenoCalles" %>

<table>
    <tr>
        <td class="celdaTitulo" valign="top">
            Calles:
        </td>
        <td class="celdaValor">
            <table>
                <tr>
                    <td class="subCampo">
                        Calle transversal:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="calleTrans1_TBox" runat="server"></asp:TextBox>
                    </td>
                    <td class="celdaValor">
                        <span class="subCampo">Orientación: </span>
                        <asp:DropDownList ID="orientacion1_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subCampo">
                        Calle transversal:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="calleTrans2_TBox" runat="server"></asp:TextBox>
                    </td>
                    <td class="celdaValor">
                        <span class="subCampo">Orientación: </span>
                        <asp:DropDownList ID="orientacion2_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subCampo">
                        Calle limítrofe:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="calleLimitrofe_TBox" runat="server"></asp:TextBox>
                    </td>
                    <td class="celdaValor">
                        <span class="subCampo">Orientación: </span>
                        <asp:DropDownList ID="orientacion3_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function TerrenoCalles() {

        // Inicialización
        if (typeof (TerrenoCalles_Init) == "undefined") {
            TerrenoCalles.prototype.fillData = fillData;
            TerrenoCalles.prototype.setData = setData;
            TerrenoCalles.prototype.getData = getData;
            TerrenoCalles.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= calleTrans1_TBox.ClientID %>"),       // 0
            $get("<%= calleTrans2_TBox.ClientID %>"),       // 1
            $get("<%= calleLimitrofe_TBox.ClientID %>"),    // 2
            $get("<%= orientacion1_DDList.ClientID %>"),    // 3
            $get("<%= orientacion2_DDList.ClientID %>"),    // 4
            $get("<%= orientacion3_DDList.ClientID %>")    // 5
        );
        this.validator = new ControlValidator(this.controls);
    
        // Llenado de datos
        function fillData() {
            fillOrientacion("<%= orientacion1_DDList.ClientID %>");
            fillOrientacion("<%= orientacion2_DDList.ClientID %>");
            fillOrientacion("<%= orientacion3_DDList.ClientID %>");
        }

        // Databindings
        function setData(data) {
            if (data != null) {
                $get("<%= calleTrans1_TBox.ClientID %>").value = data.calleTransversal1;
                $get("<%= calleTrans2_TBox.ClientID %>").value = data.calleTransversal2;
                $get("<%= calleLimitrofe_TBox.ClientID %>").value = data.calleLimitrofe;
                $get("<%= orientacion1_DDList.ClientID %>").selectedValue = data.idTipoOrientacion1;
                $get("<%= orientacion2_DDList.ClientID %>").selectedValue = data.idTipoOrientacion2;
                $get("<%= orientacion3_DDList.ClientID %>").selectedValue = data.idTipoOrientacion3;
            }

            this.fillData();
        }
        
        function getData() {
            var data = new Object();

            data.calleTransversal1 = $get("<%= calleTrans1_TBox.ClientID %>").value;
            data.calleTransversal2 = $get("<%= calleTrans2_TBox.ClientID %>").value;
            data.calleLimitrofe = $get("<%= calleLimitrofe_TBox.ClientID %>").value;
            data.idTipoOrientacion1 = $get("<%= orientacion1_DDList.ClientID %>").value;
            data.idTipoOrientacion2 = $get("<%= orientacion2_DDList.ClientID %>").value;
            data.idTipoOrientacion3 = $get("<%= orientacion3_DDList.ClientID %>").value;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
        
    }

    this["<%= ID %>"] = new TerrenoCalles();
    
</script>

