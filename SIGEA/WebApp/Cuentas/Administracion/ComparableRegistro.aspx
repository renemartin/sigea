<%@ Page Title ="SIGEA - Registro de Comparables" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="ComparableRegistro.aspx.cs" Inherits="Cuentas_Administracion_ComparableRegistro" EnableViewState="false" %>
    
<%@ Register Src="../../Controles/DatosContacto.ascx" TagName="DatosContacto" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <%--<script type="text/javascript">
        var idComparable = 0;
        var idTipoComparable = "<%= tipoComparable_DDList.ClientID %>";
        
        function getData(){
            var data = new Object();
            var fechaCreacion = $get("<%= fechaCreacion_TBox.ClientID %>").value;
            
            data["nombre"] = $get("<%= nombre_TBox.ClientID %>").value;
            data["idTipoComparable"] = $get("<%= tipoComparable_DDList.SelectedValue %>").value;
            data["valorOferta"] = $get("<%= valorOferta_TBox.ClientID %>").value;
            data["idUsoSuelo"] = $get("<%= usoSuelo_DDList.SelectedValue %>").value;
            data["numeroFrentes"] = $get("<%= numeroFrentes_TBox.ClientID %>").value;
            data["superficieTerreno"] = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data["superficieConstruida"] = $get("<%= superficieConstruida_TBox.ClientID %>").value;
            data["idClase"] = $get("<%= clase_DDList.SelectedValue %>").value;
            data["antiguedad"] = $get("<%= antiguedad_TBox.ClientID %>").value;
            data["idConservacion"] = $get("<%= conservacion_DDList.SelectedValue %>").value;
            data["idCalidadProyecto"] = $get("<%= calidadProyecto_DDList.SelectedValue %>").value;
            data["avanceObra"] = $get("<%= avanceObra_TBox.ClientID %>").value;
            data["fechaCreacion"] = fechaCreacion == "" ? null : getDate(fechaCreacion);
            
            return data;
        }
        
        function setData(data){
            $get("<%= nombre_TBox.ClientID %>").value = data["nombre"];
            $get("<%= tipoComparable_DDList.SelectedValue %>").value = data["idTipoComparable"];
            $get("<%= valorOferta_TBox.ClientID %>").value = data["valorOferta"];
            $get("<%= usoSuelo_DDList.SelectedValue %>").value = data["idUsoSuelo"];
            $get("<%= numeroFrentes_TBox.ClientID %>").value = data["numeroFrentes"];
            $get("<%= superficieTerreno_TBox.ClientID %>").value = data["superficieTerreno"];
            $get("<%= superficieConstruida_TBox.ClientID %>").value = data["superficieConstruida"];
            $get("<%= usoSuelo_DDList.SelectedValue %>").value = data["idClase"];
            $get("<%= antiguedad_TBox.ClientID %>").value = data["antiguedad"];
            $get("<%= conservacion_DDList.SelectedValue %>").value = data["idConservacion"];
            $get("<%= calidadProyecto_DDList.SelectedValue %>").value = data["idCalidadProyecto"];
            $get("<%= avanceObra_TBox.ClientID %>").value = data["avanceObra"];
            $get("<%= fechaActualizacion_TBox.ClientID %>").value = data["fechaActualizacion"]; 
            setFechaCreacion(data["fechaCreacion"]);
        }
        
        function setFechaCreacion(date){
            $get("<%= fechaCreacion_TBox.ClientID %>").value = getDateString(date);
        }
        
        function saveFormComparable(){
            saveComparable(
                idComparable
                , getData()
                , getDatosUbicacion()
                , getDatosContacto()
                , saveFormComparableSuccess()
            );
        }
        
        function saveFormComparableSuccess(id){
            idComparable = id;
            setControlsVisibility();
            setFechaCreacion(new Date());
            showMessage("Datos guardados");
        }
        
        function loadFormComparable(keyId){
            if(keyId != 0)
            {
                idComparable = keyId;
                
                var callBackList = new Array();
                callBackList[0] = loadFormComparableSuccess;
                callBackList[1] = setData;
                callBackList[2] = setDatosUbicacion();
                callBackList[3] = setDatosContacto();
                
                loadComparable(idComparable, callBackList);
            }
            else {
                loadFormComparableSuccess();
            }
        }
        function loadFormComparableSucess(){
            fillFormComparableData();
            setControlsVisibility();
        }
        function fillFormComparableData(){
            fillTipoComparable(comparable_id);
            fillCalidadProyecto(calidadProyecto_id);
            fillClase(clase_id);
            fillConservacion(conservacion_id);
            fillUsoSuelo(usoSuelo_id);
        }
        
        function setControlsVisibility(){
            if (idComparable != 0){
                $get("menu").style.display = "block";
            
            }
        
        }
    </script>--%>
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>Datos del Comparable</h1>
    <div id="menu" style="display:none;">
        <asp:ImageButton ID="addNew_ImBtn" runat="server" SkinID="Add" /></div>
    <div class="formulario">
        <table>
            <tr>
                <td class="celdaTitulo">
                    Nombre:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="nombre_TBox" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="celdaTitulo">
                    Tipo:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="tipoComparable_DDList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="celdaTitulo">
                    Valor Oferta:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="valorOferta_TBox" runat="server">
                    </asp:TextBox>
                </td>
                <td class="celdaTitulo">
                    Uso de Suelo:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="usoSuelo_DDList" runat="server">
                    </asp:DropDownList>
                </td>
             </tr>
             <tr>
                <td class="celdaTitulo">
                    Número de Frentes:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="numeroFrentes_TBox" runat="server">
                    </asp:TextBox>
                </td>
                <td class="celdaTitulo">
                    Superficie del Terreno:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="superficieTerreno_TBox" runat="server">
                    </asp:TextBox>
                </td>
             </tr>
             <tr>
                <td class="celdaTitulo">
                    Superficie Construida:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="superficieConstruida_TBox" runat="server">
                    </asp:TextBox>
                </td>
                <td class="celdaTitulo">
                    Clase:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="clase_DDList" runat="server">
                    </asp:DropDownList>
                </td>
             </tr>
             <tr>
                <td class ="celdaTitulo">
                    Antigüedad:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="antiguedad_TBox" runat="server">
                    </asp:TextBox>
                </td>
                <td class ="celdaTitulo">
                    Conservación:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="conservacion_DDList" runat="server">
                    </asp:DropDownList>
                </td>
             </tr>
             <tr>
                <td class="celdaTitulo">
                    Calidad del Proyecto:
                </td>
                <td class="celdaValor">
                    <asp:DropDownList ID="calidadProyecto_DDList" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="celdaTitulo">
                    Avance de la Obra:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="avanceObra_TBox" runat="server">
                    </asp:TextBox>
                </td>
             </tr>
             <tr>
                <td class="celdaTitulo">
                    Fecha de Creación:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="fechaCreacion_TBox" runat="server" Enabled="false" ReadOnly="true">
                    </asp:TextBox>
                </td>
                <td class="celdaTitulo">
                    Fecha de Actualización:
                </td>
                <td class="celdaValor">
                    <asp:TextBox ID="fechaActualizacion_TBox" runat="server" Enabled="false" ReadOnly="True">
                    </asp:TextBox>
                </td>
             </tr>
         </table>
         <h2>
            Datos de ubicación
         </h2>
            <SIGEA:DatosDireccion ID="direccion_Ctrl" runat="server" />
         <h2>
            Datos de contacto
         </h2>
            <SIGEA:DatosContacto ID="usuario_Ctrl" runat="server" />
    </div>
    <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
    </div>
</asp:Content>