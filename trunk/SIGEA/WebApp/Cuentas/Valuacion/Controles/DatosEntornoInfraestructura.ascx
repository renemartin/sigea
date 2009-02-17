<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoInfraestructura.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_Infraestructura" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoInfraestructuraData() {
        fillMaterial("<%= materialVialidades_DDList.ClientID %>", "Vialidades");
        fillMaterial("<%= materialBanquetas_DDList.ClientID %>", "Banquetas");
        fillMaterial("<%= materialGuarniciones_DDList.ClientID %>", "Guarnición");
    }

    // Databindings
    function setDatosEntornoInfraestructura(data) {
        if (data != null) {
            $get("<%= aguaPotable_CBox.ClientID %>").checked = data.aguaPotable;
            $get("<%= aguaPotableSuministro_CBox.ClientID %>").checked = data.aguaPotableSuministro;
            $get("<%= drenaje_CBox.ClientID %>").checked = data.drenaje;
            $get("<%= drenajeConexion_CBox.ClientID %>").checked = data.drenajeConexion;
            $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked = data.drenajeFosaSeptica;
            $get("<%= electrificacion_CBox.ClientID %>").checked = data.electrificacion;
            $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked = data.electrificacionRedAerea;
            $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked = data.electrificacionConAcometida;
            $get("<%= alumbradoPublico_CBox.ClientID %>").checked = data.alumbradoPublico;
            $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked = data.alumbradoPublicoAereo;
            $get("<%= vialidades_CBox.ClientID %>").checked = data.vialidades;
            if (data.vialidades) {
                $get("<%= materialVialidades_DDList.ClientID %>").value = data.idTipoVialidades;
                $get("<%= anchoVialidad_TBox.ClientID %>").value = data.anchoVialidades;
            }            
            $get("<%= banquetas_CBox.ClientID %>").checked = data.banquetas;
            if (data.banquetas) {
                $get("<%= materialBanquetas_DDList.ClientID %>").value = data.idTipoBanquetas;
            }            
            $get("<%= guarniciones_CBox.ClientID %>").checked = data.guarniciones;
            if (data.guarniciones) {
                $get("<%= materialGuarniciones_DDList.ClientID %>").value = data.idTipoGuarniciones;
            }

            $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML = getNumString(data.nivelInfraestructura, 2);
            $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML = getNumString(data.nivelInfraestructuraSHF);

            setVisibility($get("seccion_agua_potable"), data.aguaPotable);
            setVisibility($get("seccion_drenaje"), data.drenaje);
            setVisibility($get("seccion_electrificacion"), data.electrificacion);
            setVisibility($get("seccion_alumbrado"), data.alumbradoPublico);
            setVisibility($get("seccion_vialidades"), data.vialidades);
            setVisibility($get("seccion_banquetas"), data.banquetas);
            setVisibility($get("seccion_guarniciones"), data.guarniciones);
        }
    }
    function getDatosEntornoInfraestructura() {
        var data = new Object();

        data.aguaPotable = $get("<%= aguaPotable_CBox.ClientID %>").checked;
        data.aguaPotableSuministro = data.aguaPotable ? $get("<%= aguaPotableSuministro_CBox.ClientID %>").checked : false;
        data.drenaje = $get("<%= drenaje_CBox.ClientID %>").checked;
        data.drenajeConexion = data.drenaje ? $get("<%= drenajeConexion_CBox.ClientID %>").checked : false;
        data.drenajeFosaSeptica = data.drenaje ? $get("<%= drenajeFosaSeptica_CBox.ClientID %>").checked : false;
        data.electrificacion = $get("<%= electrificacion_CBox.ClientID %>").checked;
        data.electrificacionRedAerea = data.electrificacion ? $get("<%= electrificacionRedAerea_CBox.ClientID %>").checked : false;
        data.electrificacionConAcometida = data.electrificacion ? $get("<%= electrificacionConAcometida_CBox.ClientID %>").checked : false;
        data.alumbradoPublico = $get("<%= alumbradoPublico_CBox.ClientID %>").checked;
        data.alumbradoPublicoAereo = data.alumbradoPublico ? $get("<%= alumbradoPublicoAereo_CBox.ClientID %>").checked : false;
        data.vialidades = $get("<%= vialidades_CBox.ClientID %>").checked;
        if (data.vialidades) {
            data.idTipoVialidades = $get("<%= materialVialidades_DDList.ClientID %>").selectedValue;
            data.anchoVialidades = $get("<%= anchoVialidad_TBox.ClientID %>").value;
        }
        data.banquetas = $get("<%= banquetas_CBox.ClientID %>").checked;
        if (data.banquetas) {
            data.idTipoBanquetas = $get("<%= materialBanquetas_DDList.ClientID %>").selectedValue;
        }
        data.guarniciones = $get("<%= guarniciones_CBox.ClientID %>").checked;
        if (data.guarniciones) {
            data.idTipoGuarniciones = $get("<%= materialGuarniciones_DDList.ClientID %>").selectedValue;
        }
        data.nivelInfraestructura = $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML;
        data.nivelInfraestructuraSHF = $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML;

        return data;
    }

    function setDatosEntornoServicios(data) {
        if (data != null) {
            $get("<%= gasNatural_CBox.ClientID %>").checked = data.gasNatural;
            $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked = data.gasNaturalSuministro;
            $get("<%= redTelefonica_CBox.ClientID %>").checked = data.redTelefonica;
            $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked = data.redTelefonicaAerea;
            $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked = data.redTelefonicaAcometida;
            $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked = data.senalizacionNomenclatura;
            $get("<%= transporteUrbano_CBox.ClientID %>").checked = data.transporteUrbano;
            if (data.transporteUrbano) {
                $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value = data.transporteUrbanoDistancia;
                $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value = data.transporteUrbanoFrecuencia;
            }
            $get("<%= transporteSuburbano_CBox.ClientID %>").checked = data.transporteSuburbano;
            if (data.transporteSuburbano) {
                $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value = data.transporteSuburbanoDistancia;
                $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value = data.transporteSuburbanoFrecuencia;
            }
            $get("<%= vigilancia_CBox.ClientID %>").checked = data.vigilancia;
            $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked = data.vigilanciaMunicipal;
            $get("<%= recoleccionBasura_CBox.ClientID %>").checked = data.recoleccionBasura;

            setVisibility($get("seccion_gas_natural"), data.gasNatural);
            setVisibility($get("seccion_red_telefonica"), data.redTelefonica);
            setVisibility($get("seccion_transporte_urbano"), data.transporteUrbano);
            setVisibility($get("seccion_transporte_suburbano"), data.transporteSuburbano);
            setVisibility($get("seccion_vigilancia_municipal"), data.vigilanciaMunicipal);
        }
    }
    function getDatosEntornoServicios() {
        var data = new Object();

        data.gasNatural = $get("<%= gasNatural_CBox.ClientID %>").checked;
        data.gasNaturalSuministro = data.gasNatural ? $get("<%= gasNaturalSuministro_CBox.ClientID %>").checked : false;
        data.redTelefonica = $get("<%= redTelefonica_CBox.ClientID %>").checked;
        data.redTelefonicaAerea = data.redTelefonica ? $get("<%= redTelefonicaAerea_CBox.ClientID %>").checked : false;
        data.redTelefonicaAcometida = data.redTelefonica ? $get("<%= redTelefonicaAcometida_CBox.ClientID %>").checked : false;
        data.senalizacionNomenclatura = $get("<%= senalizacionNomenclatura_CBox.ClientID %>").checked;
        data.transporteUrbano = $get("<%= transporteUrbano_CBox.ClientID %>").checked;
        if (data.transporteUrbano) {
            data.transporteUrbanoDistancia = $get("<%= transporteUrbanoDistancia_TBox.ClientID %>").value;
            data.transporteUrbanoFrecuencia = $get("<%= transporteUrbanoFrecuencia_TBox.ClientID %>").value;
        }
        data.transporteSuburbano = $get("<%= transporteSuburbano_CBox.ClientID %>").checked;
        if (data.transporteSuburbano) {
            data.transporteSuburbanoDistancia = $get("<%= transporteSuburbanoDistancia_TBox.ClientID %>").value;
            data.transporteSuburbanoFrecuencia = $get("<%= transporteSuburbanoFrecuencia_TBox.ClientID %>").value;
        }
        data.vigilancia = $get("<%= vigilancia_CBox.ClientID %>").checked;
        data.vigilanciaMunicipal = data.vigilancia ? $get("<%= vigilanciaMunicipal_CBox.ClientID %>").checked : false;
        data.recoleccionBasura = $get("<%= recoleccionBasura_CBox.ClientID %>").checked;

        return data;
    }

    // Nivel
    function updateNivelInfraestructura() {
        var nivel = calcularNivelInfraestructura(getDatosEntornoInfraestructura(), getDatosEntornoServicios());

        $get("<%= nivelInfraestructura_Lbl.ClientID %>").innerHTML = nivel.nivelInfraestructura;
        $get("<%= nivelInfraestructuraSHF_Lbl.ClientID %>").innerHTML = nivel.nivelInfraestructuraSHF;
    }
</script>

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
