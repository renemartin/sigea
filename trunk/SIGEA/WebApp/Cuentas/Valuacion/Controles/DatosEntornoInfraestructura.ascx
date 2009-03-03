<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoInfraestructura.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_Infraestructura" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="aguaPotable_CBox" Text="Agua potable" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_agua_potable" style="display: none">
                <asp:CheckBox ID="aguaPotableSuministro_CBox" Text="Con suministro" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="drenaje_CBox" Text="Drenaje y alcantarillado" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_drenaje" style="display: none">
                <asp:CheckBox ID="drenajeConexion_CBox" Text="Con conexíon al inmueble" runat="server" /><br />
                <asp:CheckBox ID="drenajeFosaSeptica_CBox" Text="Fosa séptica" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="electrificacion_CBox" Text="Electrificación" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_electrificacion" style="display: none">
                <asp:CheckBox ID="electrificacionRedAerea_CBox" Text="Red aérea" runat="server" /><br />
                <asp:CheckBox ID="electrificacionConAcometida_CBox" Text="Con acometida" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="alumbradoPublico_CBox" Text="Alumbrado público" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_alumbrado" style="display: none">
                <asp:CheckBox ID="alumbradoPublicoAereo_CBox" Text="Aéreo" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="vialidades_CBox" Text="Vialidades" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_vialidades" style="display: none">
                <span class="subCampo">Material:</span>
                <asp:DropDownList ID="materialVialidades_DDList" runat="server">
                </asp:DropDownList>
                <span class="subCampo">Ancho:</span>
                <asp:TextBox ID="anchoVialidad_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                <span class="textoChico">m.</span>
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="banquetas_CBox" Text="Banquetas" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_banquetas" style="display: none">
                <span class="subCampo">Material:</span>
                <asp:DropDownList ID="materialBanquetas_DDList" runat="server">
                </asp:DropDownList>
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="guarniciones_CBox" Text="Guarniciones" runat="server" />
        </td>
        <td class="celdaValor">
            <div id="seccion_guarniciones" style="display: none">
                <span class="subCampo">Material:</span>
                <asp:DropDownList ID="materialGuarniciones_DDList" runat="server">
                </asp:DropDownList>
            </div>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaHeader" colspan="5">
            Otros servicios
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="gasNatural_CBox" Text="Gas natural" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <div id="seccion_gas_natural" style="display: none">
                <asp:CheckBox ID="gasNaturalSuministro_CBox" Text="Con suministro" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="redTelefonica_CBox" Text="Red telefónica" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <div id="seccion_red_telefonica" style="display: none">
                <asp:CheckBox ID="redTelefonicaAerea_CBox" Text="Aérea" runat="server" />
                <asp:CheckBox ID="redTelefonicaAcometida_CBox" Text="Con acometida" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="senalizacionNomenclatura_CBox" Text="Señalización y nomenclatura"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transporteUrbano_CBox" Text="Transporte urbano" runat="server" />
        </td>
        <td colspan="4">
            <table id="seccion_transporte_urbano" style="display: none">
                <tr>
                    <td class="subCampo">
                        Distancia
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="transporteUrbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                        <span class="textoChico">m.</span>
                    </td>
                    <td class="subCampo">
                        Frecuencia
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="transporteUrbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                        <span class="textoChico">mins.</span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transporteSuburbano_CBox" Text="Transporte suburbano" runat="server" />
        </td>
        <td colspan="4">
            <table id="seccion_transporte_suburbano" style="display: none">
                <tr>
                    <td class="subCampo">
                        Distancia
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="transporteSuburbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                        <span class="textoChico">m.</span>
                    </td>
                    <td class="subCampo">
                        Frecuencia
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="transporteSuburbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                        <span class="textoChico">mins.</span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="vigilancia_CBox" Text="Vigilancia" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <div id="seccion_vigilancia_municipal" style="display: none">
                <asp:CheckBox ID="vigilanciaMunicipal_CBox" Text="Municipal" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="recoleccionBasura_CBox" Text="Recolección de basura municipal ó privada"
                runat="server" />
        </td>
    </tr>
</table>
<div class="etiqueta2">
    <span class="textoNegritas">Porcentaje de infraestructura disponible:</span>
    <asp:Label ID="nivelInfraestructura_Lbl" Text="0" runat="server"></asp:Label>
    <span class="textoChico">&nbsp;%</span>
</div>
<div class="etiqueta2">
    <span class="textoNegritas">Nivel de infraestructura urbana SHF:</span>
    <asp:Label ID="nivelInfraestructuraSHF_Lbl" Text="0" runat="server"></asp:Label>
</div>

<script type="text/javascript">
    function Infraestructura() {

        // Inicialización
        if (typeof (Infraestructura_Init) == "undefined") {
            Infraestructura_Init = true;
            Infraestructura.prototype.fillData = fillData;
            Infraestructura.prototype.setData = setData;
            Infraestructura.prototype.getData = getData;
            Infraestructura.prototype.validate = validate;
            Infraestructura.prototype.updateNivelInfraestructura = updateNivelInfraestructura;
        }
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= materialVialidades_DDList.ClientID %>"),          // 0
            $get("<%= anchoVialidad_TBox.ClientID %>"),                 // 1
            $get("<%= materialBanquetas_DDList.ClientID %>"),           // 2
            $get("<%= materialGuarniciones_DDList.ClientID %>"),        // 3
            $get("<%= transporteUrbanoDistancia_TBox.ClientID %>"),     // 4
            $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>"),    // 5
            $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>"),  // 6
            $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>")  // 7
        );
        this.validator = new ControlValidator(this.controls);
        for (i = 0; i < this.controls.length; i++) {
            this.validator.addOptionalField(i);
        }
        this.validator.addNumericField(1, true);
        this.validator.addNumericField(4, true);
        this.validator.addNumericField(5, true);
        this.validator.addNumericField(6, true);
        this.validator.addNumericField(7, true);
        
        // Llenado de datos
        function fillData() {
            fillMaterial("<%= materialVialidades_DDList.ClientID %>", "Vialidades");
            fillMaterial("<%= materialBanquetas_DDList.ClientID %>", "Banquetas");
            fillMaterial("<%= materialGuarniciones_DDList.ClientID %>", "Guarnición");
        }

        // Databindings
        function setData(data_set) {
            if (data_set != null) {
                // Infraestructura
                if (data_set[0] != null) {
                    $get("<%= aguaPotable_CBox.ClientID %>").checked = data_set[0].aguaPotable;
                    $get("<%= aguaPotableSuministro_CBox.ClientID %>").checked = data_set[0].aguaPotableSuministro;
                    $get("<%= drenaje_CBox.ClientID %>").checked = data_set[0].drenaje;
                    $get("<%= drenajeConexion_CBox.ClientID %>").checked = data_set[0].drenajeConexion;
                    $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked = data_set[0].drenajeFosaSeptica;
                    $get("<%= electrificacion_CBox.ClientID %>").checked = data_set[0].electrificacion;
                    $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked = data_set[0].electrificacionRedAerea;
                    $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked = data_set[0].electrificacionConAcometida;
                    $get("<%= alumbradoPublico_CBox.ClientID %>").checked = data_set[0].alumbradoPublico;
                    $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked = data_set[0].alumbradoPublicoAereo;
                    $get("<%= vialidades_CBox.ClientID %>").checked = data_set[0].vialidades;
                    if (data_set[0].vialidades) {
                        $get("<%= materialVialidades_DDList.ClientID %>").selectedValue = data_set[0].idTipoVialidades;
                        $get("<%= anchoVialidad_TBox.ClientID %>").value = data_set[0].anchoVialidades;
                        this.validator.removeOptionalField(0);
                        this.validator.removeOptionalField(1);
                    }
                    $get("<%= banquetas_CBox.ClientID %>").checked = data_set[0].banquetas;
                    if (data_set[0].banquetas) {
                        $get("<%= materialBanquetas_DDList.ClientID %>").selectedValue = data_set[0].idTipoBanquetas;
                        this.validator.removeOptionalField(2);
                    }
                    $get("<%= guarniciones_CBox.ClientID %>").checked = data_set[0].guarniciones;
                    if (data_set[0].guarniciones) {
                        $get("<%= materialGuarniciones_DDList.ClientID %>").selectedValue = data_set[0].idTipoGuarniciones;
                        this.validator.removeOptionalField(3);
                    }
                    $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML = getNumString(data_set[0].nivelInfraestructura, 2);
                    $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML = getNumString(data_set[0].nivelInfraestructuraSHF);

                    setVisibility($get("seccion_agua_potable"), data_set[0].aguaPotable);
                    setVisibility($get("seccion_drenaje"), data_set[0].drenaje);
                    setVisibility($get("seccion_electrificacion"), data_set[0].electrificacion);
                    setVisibility($get("seccion_alumbrado"), data_set[0].alumbradoPublico);
                    setVisibility($get("seccion_vialidades"), data_set[0].vialidades);
                    setVisibility($get("seccion_banquetas"), data_set[0].banquetas);
                    setVisibility($get("seccion_guarniciones"), data_set[0].guarniciones);
                }

                // Servicios
                if (data_set[1] != null) {
                    $get("<%= gasNatural_CBox.ClientID %>").checked = data_set[1].gasNatural;
                    $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked = data_set[1].gasNaturalSuministro;
                    $get("<%= redTelefonica_CBox.ClientID %>").checked = data_set[1].redTelefonica;
                    $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked = data_set[1].redTelefonicaAerea;
                    $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked = data_set[1].redTelefonicaAcometida;
                    $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked = data_set[1].senalizacionNomenclatura;
                    $get("<%= transporteUrbano_CBox.ClientID %>").checked = data_set[1].transporteUrbano;
                    if (data_set[1].transporteUrbano) {
                        $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value = data_set[1].transporteUrbanoDistancia;
                        $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value = data_set[1].transporteUrbanoFrecuencia;
                        this.validator.removeOptionalField(4);
                        this.validator.removeOptionalField(5);
                    }
                    $get("<%= transporteSuburbano_CBox.ClientID %>").checked = data_set[1].transporteSuburbano;
                    if (data_set[1].transporteSuburbano) {
                        $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value = data_set[1].transporteSuburbanoDistancia;
                        $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value = data_set[1].transporteSuburbanoFrecuencia;
                        this.validator.removeOptionalField(6);
                        this.validator.removeOptionalField(7);
                    }
                    $get("<%= vigilancia_CBox.ClientID %>").checked = data_set[1].vigilancia;
                    $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked = data_set[1].vigilanciaMunicipal;
                    $get("<%= recoleccionBasura_CBox.ClientID %>").checked = data_set[1].recoleccionBasura;

                    setVisibility($get("seccion_gas_natural"), data_set[1].gasNatural);
                    setVisibility($get("seccion_red_telefonica"), data_set[1].redTelefonica);
                    setVisibility($get("seccion_transporte_urbano"), data_set[1].transporteUrbano);
                    setVisibility($get("seccion_transporte_suburbano"), data_set[1].transporteSuburbano);
                    setVisibility($get("seccion_vigilancia_municipal"), data_set[1].vigilanciaMunicipal);
                }
            }

            this.fillData();
        }
        function getData() {
            var data_set = new Array();

            // Infraestructura
            data_set[0] = new Object();
            data_set[0].aguaPotable = $get("<%= aguaPotable_CBox.ClientID %>").checked;
            data_set[0].aguaPotableSuministro = data_set[0].aguaPotable ? $get("<%= aguaPotableSuministro_CBox.ClientID %>").checked : false;
            data_set[0].drenaje = $get("<%= drenaje_CBox.ClientID %>").checked;
            data_set[0].drenajeConexion = data_set[0].drenaje ? $get("<%= drenajeConexion_CBox.ClientID %>").checked : false;
            data_set[0].drenajeFosaSeptica = data_set[0].drenaje ? $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked : false;
            data_set[0].electrificacion = $get("<%= electrificacion_CBox.ClientID %>").checked;
            data_set[0].electrificacionRedAerea = data_set[0].electrificacion ? $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked : false;
            data_set[0].electrificacionConAcometida = data_set[0].electrificacion ? $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked : false;
            data_set[0].alumbradoPublico = $get("<%= alumbradoPublico_CBox.ClientID %>").checked;
            data_set[0].alumbradoPublicoAereo = data_set[0].alumbradoPublico ? $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked : false;
            data_set[0].vialidades = $get("<%= vialidades_CBox.ClientID %>").checked;
            if (data_set[0].vialidades) {
                data_set[0].idTipoVialidades = $get("<%= materialVialidades_DDList.ClientID %>").value;
                data_set[0].anchoVialidades = $get("<%= anchoVialidad_TBox.ClientID %>").value;
            }
            data_set[0].banquetas = $get("<%= banquetas_CBox.ClientID %>").checked;
            if (data_set[0].banquetas) {
                data_set[0].idTipoBanquetas = $get("<%= materialBanquetas_DDList.ClientID %>").value;
            }
            data_set[0].guarniciones = $get("<%= guarniciones_CBox.ClientID %>").checked;
            if (data_set[0].guarniciones) {
                data_set[0].idTipoGuarniciones = $get("<%= materialGuarniciones_DDList.ClientID %>").value;
            }
            data_set[0].nivelInfraestructura = $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML;
            data_set[0].nivelInfraestructuraSHF = $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML;

            // Servicios
            data_set[1] = new Object();
            data_set[1].gasNatural = $get("<%= gasNatural_CBox.ClientID %>").checked;
            data_set[1].gasNaturalSuministro = data_set[1].gasNatural ? $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked : false;
            data_set[1].redTelefonica = $get("<%= redTelefonica_CBox.ClientID %>").checked;
            data_set[1].redTelefonicaAerea = data_set[1].redTelefonica ? $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked : false;
            data_set[1].redTelefonicaAcometida = data_set[1].redTelefonica ? $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked : false;
            data_set[1].senalizacionNomenclatura = $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked;
            data_set[1].transporteUrbano = $get("<%= transporteUrbano_CBox.ClientID %>").checked;
            if (data_set[1].transporteUrbano) {
                data_set[1].transporteUrbanoDistancia = $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value;
                data_set[1].transporteUrbanoFrecuencia = $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value;
            }
            data_set[1].transporteSuburbano = $get("<%= transporteSuburbano_CBox.ClientID %>").checked;
            if (data_set[1].transporteSuburbano) {
                data_set[1].transporteSuburbanoDistancia = $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value;
                data_set[1].transporteSuburbanoFrecuencia = $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value;
            }
            data_set[1].vigilancia = $get("<%= vigilancia_CBox.ClientID %>").checked;
            data_set[1].vigilanciaMunicipal = data_set[1].vigilancia ? $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked : false;
            data_set[1].recoleccionBasura = $get("<%= recoleccionBasura_CBox.ClientID %>").checked;

            return data_set;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }

        // Nivel
        function updateNivelInfraestructura() {
            var data_set = this.getData();
            var nivel = calcularNivelInfraestructura(data_set[0], data_set[1]);

            $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML = nivel.nivelInfraestructura;
            $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML = nivel.nivelInfraestructuraSHF;
        }
    }

    this["<%= ID %>"] = new Infraestructura();

    // Validaciones de seleccion
    function setVialidadesSelection(value) {
        if (value) {
            eval("<%= ID %>").validator.removeOptionalField(0);
            eval("<%= ID %>").validator.removeOptionalField(1);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(0);
            eval("<%= ID %>").validator.addOptionalField(1);
        }
    }
    function setBanquetasSelection(value) {
        if (value) {
            eval("<%= ID %>").validator.removeOptionalField(2);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(2);
        }
    }
    function setGuarnicionesSelection(value) {
        if (value) {
            eval("<%= ID %>").validator.removeOptionalField(3);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(3);
        }
    }
    function setTransporteUrbanoSelection(value) {
        if (value) {
            eval("<%= ID %>").validator.removeOptionalField(4);
            eval("<%= ID %>").validator.removeOptionalField(5);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(4);
            eval("<%= ID %>").validator.addOptionalField(5);
        }
    }
    function setTransporteSuburbanoSelection(value) {
        if (value) {
            eval("<%= ID %>").validator.removeOptionalField(6);
            eval("<%= ID %>").validator.removeOptionalField(7);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(6);
            eval("<%= ID %>").validator.addOptionalField(7);
        }
    }
    
</script>

