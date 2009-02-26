<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AvaluoRegistro.aspx.cs" Inherits="Cuentas_Valuacion_AvaluoRegistro" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Registro de avalúo</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Acciones
        function asignarAvaluo() {
            var result = openModalWindow(
                "AvaluoAsignacion.aspx?idAvaluo=" + idAvaluo, 450, 180);
            if (result != undefined) {
                window.returnValue = result;
            }           
        }
        function editarAvaluo() {
            openFullWindow("Editores/SHF/DatosAvaluo.aspx?idAvaluo=" + idAvaluo, idAvaluo);
            window.returnValue == "recargar";       
        }
        function revisarAvaluo() {
        }
        function descargarAvaluo() {
        }

        // Obtención de datos
        function getRegistroAvaluo(id) {
            idAvaluo = id;
            getRegistroAvaluoAsync(idAvaluo, getRegistroAvaluo_Success);
        }
        function getRegistroAvaluo_Success(data) {
            setDatosAsignacion(data);
            setActionsVisibility(data.idStatus);
        }

        // Vaciado de datos
        function setDatosAsignacion(data) {
            $get("<%= IDE_Lbl.ClientID %>").innerHTML = data.IDE;
            $get("<%= status_Lbl.ClientID %>").innerHTML = data.status;
            $get("<%= fechaAlta_Lbl.ClientID %>").innerHTML = getDateString(data.fechaAlta);
            $get("<%= fechaFinalizacion_Lbl.ClientID %>").innerHTML = getDateString(data.fechaFinalizacion);
            $get("<%= datosInmueble_Lbl.ClientID %>").innerHTML = data.datosInmueble;
            $get("<%= supTerreno_Lbl.ClientID %>").innerHTML = getNumString(data.supTerreno);
            $get("<%= supConstruida_Lbl.ClientID %>").innerHTML = getNumString(data.supConstruida);
            $get("<%= supVendible_Lbl.ClientID %>").innerHTML = getNumString(data.supVendible);
            $get("<%= valorMercado_Lbl.ClientID %>").innerHTML = getCurrString(data.valorMercado);
            $get("<%= valorTerreno_Lbl.ClientID %>").innerHTML = getCurrString(data.valorTerreno);
            $get("<%= valorConstruccion_Lbl.ClientID %>").innerHTML = getCurrString(data.valorConstruccion);
            $get("<%= valorInstalaciones_Lbl.ClientID %>").innerHTML = getCurrString(data.valorInstalaciones);
            $get("<%= valorConcluido_Lbl.ClientID %>").innerHTML = getCurrString(data.valorConcluido);

            var urlFoto = "../../"
                + (data.urlFoto == "" ? "Images/NoDisponible.jpg" : data.urlFoto);
            var foto = $get("<%= foto_Ima.ClientID %>");
            foto.src = urlFoto;
            setVisibility(foto, true);            
        }

        // Establecimiento de acciones por status
        function setActionsVisibility(idStatus) {
            setVisibility($get("<%= asignar_ImBtn.ClientID %>"), verificarAccionAsignar(idStatus), "inline");
            setVisibility($get("<%= editar_ImBtn.ClientID %>"), verificarAccionEditar(idStatus), "inline");
            setVisibility($get("<%= revisar_ImBtn.ClientID %>"), verificarAccionRevisar(idStatus), "inline");
            setVisibility($get("<%= descargar_ImBtn.ClientID %>"), verificarAccionDescargar(idStatus), "inline");
        }  
                    
    </script>

    <div class="modulo">
        <div class="formulario">
            <div class="etiqueta1">
                <span class="textoNegritas">IDE:</span>
                <asp:Label ID="IDE_Lbl" runat="server"></asp:Label>
            </div>
            <div class="etiqueta2">
                <span class="textoNegritas">Status:</span>
                <asp:Label ID="status_Lbl" runat="server"></asp:Label>
            </div>
            <div class="foto">
                <asp:Image ID="foto_Ima" runat="server" CssClass="hidden" />
            </div>
            <table class="tablaCompactaExtendida">
                <tr>
                    <td class="celdaTitulo">
                        Fecha de alta
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="fechaAlta_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Fecha de finalización
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="fechaFinalizacion_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo" valign="top">
                        Inmueble:
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="datosInmueble_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Superficie de terreno en m²
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="supTerreno_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Superficie construida en m²
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="supConstruida_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Superficie vendible en m²
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="supVendible_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Valor comparativo de mercado
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="valorMercado_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Valor físico del terreno
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="valorTerreno_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Valor físico de la construcción
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="valorConstruccion_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Valor físico de instalaciones
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="valorInstalaciones_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Valor concluido
                    </td>
                    <td class="celdaValor">
                        <asp:Label ID="valorConcluido_Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="asignar_ImBtn" runat="server" SkinID="Asign" CssClass="hidden" />
            <asp:ImageButton ID="editar_ImBtn" runat="server" SkinID="LoadEditor" CssClass="hidden" />
            <asp:ImageButton ID="revisar_ImBtn" runat="server" SkinID="Review" CssClass="hidden" />
            <asp:ImageButton ID="descargar_ImBtn" runat="server" SkinID="PDF" CssClass="hidden" />
        </div>
    </div>
    </form>
</body>
</html>
