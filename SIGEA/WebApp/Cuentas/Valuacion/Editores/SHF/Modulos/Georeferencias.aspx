<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Georeferencias.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Georeferencias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SIGEA - Editor SHF - Georeferencias del inmueble</title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Inmuebles.js" />
        </Scripts>
    </asp:ScriptManager>

    <script type="text/javascript">
        //Variables
        var idAvaluo = 0;
        var validator = null;

        // Databindings
        function getDatosGeolocalizacion() {
            var data = new Object();
            data.formatoAbsoluto = $get("<%= absolutos_RBtn.ClientID %>").checked;

            if (data.formatoAbsoluto) {
                data.latitud = $get("<%= latitudAbsoluto_TBox.ClientID%>").value;
                data.longitud = $get("<%= longitudAbsoluto_TBox.ClientID%>").value;
            }
            else {
                data.latitud = calcularAbs(parseFloat($get("<%= gradosLatitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= minutosLatitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= segundosLatitud_TBox.ClientID %>").value));

                data.longitud = calcularAbs(parseFloat($get("<%= gradosLongitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= minutosLongitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= segundosLongitud_TBox.ClientID %>").value));
            }

            data.altitud = $get("<%= altitud_TBox.ClientID %>").value;
            return data;
        }
        function setDatosGeolocalizacion(data) {
            var latitudGMS = new Array();
            var longitudGMS = new Array();
            
            if (data != null) {
                $get("<%= absolutos_RBtn.ClientID %>").checked = data.formatoAbsoluto;
                if (data.formatoAbsoluto) {
                    setFormatoAbsoluto(data.latitud, data.longitud);
                }
                else {
//                    debugger;
                    latitudGMS = calcularGMS(data.latitud);
                    longitudGMS = calcularGMS(data.longitud);
                    setFormatoGMS(latitudGMS, longitudGMS);
                }
                $get("<%= altitud_TBox.ClientID%>").value = getNumString(data.altitud, 11);
            }

            setVisibilityFormato();
        }
        
        //Guardar
        function saveGeolocalizacion() {
            if (validate()) {
                saveGeolocalizacionAsync(
                    idAvaluo
                    , getDatosGeolocalizacion()
                    , saveGeolocalizacion_Success
                );
            }
            else {
                showMessage("El bloque de datos contiene campos inváidos");
            }
        }
        function saveGeolocalizacion_Success() {
            showMessage("Datos guardados");
        }
        
        //Cargar
        function loadGeolocalizacion(key_id) {
            idAvaluo = key_id;
            loadGeolocalizacionAsync(idAvaluo, setDatosGeolocalizacion);
        }
        
        //Validar
        function setupValidator() {
            var controls;
            
            if ($get("<%= absolutos_RBtn.ClientID %>").checked == true) {
                controls = new Array(
                    $get("<%= latitudAbsoluto_TBox.ClientID%>"),
                    $get("<%= longitudAbsoluto_TBox.ClientID%>"),
                    $get("<%= altitud_TBox.ClientID%>"));                
            }
            else {
                controls = new Array(
                    $get("<%= gradosLatitud_TBox.ClientID %>"),
                    $get("<%= minutosLatitud_TBox.ClientID %>"),
                    $get("<%= segundosLatitud_TBox.ClientID %>"),
                    $get("<%= gradosLongitud_TBox.ClientID %>"),
                    $get("<%= minutosLongitud_TBox.ClientID %>"),
                    $get("<%= segundosLongitud_TBox.ClientID %>"),
                    $get("<%= altitud_TBox.ClientID%>"));
            }

            validator = new ControlValidator(controls);
            for (var i = 0; i < controls.length; i++) {
                validator.addNumericField(i, true);
            }
        }
                
        function validate() {
            var validated = true;
            if (validator == null || !validator.validate())
                validated = false;
            return validated;
        }
        
        function setFormatoGMS(latitudGMS, longitudGMS) {
            $get("<%= gradosLatitud_TBox.ClientID %>").value = getNumString(latitudGMS[0]);
            $get("<%= minutosLatitud_TBox.ClientID %>").value = getNumString(latitudGMS[1]);
            $get("<%= segundosLatitud_TBox.ClientID %>").value = getNumString(latitudGMS[2], 2);
            
            $get("<%= gradosLongitud_TBox.ClientID %>").value = getNumString(longitudGMS[0]);
            $get("<%= minutosLongitud_TBox.ClientID %>").value = getNumString(longitudGMS[1]);
            $get("<%= segundosLongitud_TBox.ClientID %>").value = getNumString(longitudGMS[2], 2);
        }

        function setFormatoAbsoluto(latitudAbsoluto, longitudAbsoluto) {
            $get("<%= latitudAbsoluto_TBox.ClientID%>").value = getNumString(latitudAbsoluto, 11);
            $get("<%= longitudAbsoluto_TBox.ClientID%>").value = getNumString(longitudAbsoluto, 11);
        }
        
        function setVisibilityFormato(convertir) {
            var absolutos = $get("<%= absolutos_RBtn.ClientID%>").checked;

            $get("seccion_latitudAbsoluto").style.display = absolutos ? "block" : "none";
            $get("seccion_longitudAbsoluto").style.display = absolutos ? "block" : "none";
            $get("seccion_latitudGrados").style.display = absolutos ? "none" : "block";
            $get("seccion_longitudGrados").style.display = absolutos ? "none" : "block";

            if (convertir == true) {
                convertirGeoreferencias(absolutos);
            }
            setupValidator();
        }

        function convertirGeoreferencias(absolutos) {
            var latitud = 0;
            var longitud = 0;
            var latitudGMS = null;
            var longitudGMS = null;
            
            if (absolutos) {
               
                latitud = calcularAbs(parseFloat($get("<%= gradosLatitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= minutosLatitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= segundosLatitud_TBox.ClientID %>").value));

                longitud = calcularAbs(parseFloat($get("<%= gradosLongitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= minutosLongitud_TBox.ClientID %>").value)
                                            , parseFloat($get("<%= segundosLongitud_TBox.ClientID %>").value));

                setFormatoAbsoluto(latitud, longitud);
            }
            else {
                latitud = $get("<%= latitudAbsoluto_TBox.ClientID%>").value;
                longitud = $get("<%= longitudAbsoluto_TBox.ClientID%>").value;                
                latitudGMS = calcularGMS(latitud);
                longitudGMS = calcularGMS(longitud);
                setFormatoGMS(latitudGMS, longitudGMS);
            }
        }
    </script>

    <div class="modulo">
        <br />
        <div class="formulario">
            <table>
                <tr>
                    <td class="celdaTitulo">
                        Formato:
                    </td>
                    <td class="celdaValor">
                        <asp:RadioButton ID="absolutos_RBtn" runat="server" GroupName="formato" Text="Georeferencias absolutas" />
                        <asp:RadioButton ID="grados_RBtn" runat="server" GroupName="formato" Text="Grados, minutos y segundos" Checked="True" />
                    </td>                    
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Latitud (N)
                    </td>
                    <td>
                        <table id="seccion_latitudGrados">
                            <tr>
                                <td class="celdaValor">
                                    Grados:
                                    <asp:TextBox ID="gradosLatitud_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                                </td>
                                <td class="celdaValor">
                                    Minutos:
                                    <asp:TextBox ID="minutosLatitud_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                                </td>
                                <td class="celdaValor">
                                    Segundos:
                                    <asp:TextBox ID="segundosLatitud_TBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table id="seccion_latitudAbsoluto" class="hidden">
                            <tr>
                                <td class="celdaValor" colspan="3">
                                    Valor absoluto:
                                    <asp:TextBox ID="latitudAbsoluto_TBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Longitud (W)
                    </td>
                    <td>
                        <table id="seccion_longitudGrados">
                            <tr>
                                <td class="celdaValor">
                                    Grados:
                                    <asp:TextBox ID="gradosLongitud_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                                </td>
                                <td class="celdaValor">
                                    Minutos:
                                    <asp:TextBox ID="minutosLongitud_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                                </td>
                                <td class="celdaValor">
                                    Segundos:
                                    <asp:TextBox ID="segundosLongitud_TBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table id="seccion_longitudAbsoluto" class="hidden">
                            <tr>
                                <td class="celdaValor" colspan="3">
                                    Valor absoluto:
                                    <asp:TextBox ID="longitudAbsoluto_TBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Altitud (MSNM)
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="altitud_TBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
    </div>
    </form>
</body>
</html>
