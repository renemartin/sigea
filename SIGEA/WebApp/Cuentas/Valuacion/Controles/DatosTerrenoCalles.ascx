﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerrenoCalles.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerrenoCalles" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillTerrenoCallesData() {
        fillOrientacion("<%= orientacion1_DDList.ClientID %>");
        fillOrientacion("<%= orientacion2_DDList.ClientID %>");
        fillOrientacion("<%= orientacion3_DDList.ClientID %>");
    }   
    
    //mostrar datos 
    function setDatos(data) {
        $get("<%= calleTrans1_TBox.ClientID %>").value = data.calleTrans1;
        $get("<%= calleTrans2_TBox.ClientID %>").value = data.calleTrans2;
        $get("<%= calleLimitrofe_TBox.ClientID %>").value = data.calleLimitrofe;
        $get("<%= orientacion1_DDList.ClientID %>").selectedValue = data.orientacion1;
        $get("<%= orientacion2_DDList.ClientID %>").selectedValue = data.orientacion2;
        $get("<%= orientacion3_DDList.ClientID %>").selectedValue = data.orientacion3;
    }
    
    //guardar datos
    function getDatos() {
        var data = new Object();
        
        data.calleTrans1 = $get("<%= calleTrans1_TBox.ClientID %>").value;
        data.calleTrans2 = $get("<%= calleTrans2_TBox.ClientID %>").value;
        data.calleLimitrofe = $get("<%= calleLimitrofe_TBox.ClientID %>").value;
        data.orientacion1 = $get("<%= orientacion1_DDList.ClientID %>").selectedValue;
        data.orientacion2 = $get("<%= orientacion2_DDList.ClientID %>").selectedValue;
        data.orientacion3 = $get("<%= orientacion3_DDList.ClientID %>").selectedValue;
    
        return data;
    }
</script>

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
                        Calle transversal:                     </td>
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
                        Calle limítrofe:                     </td>
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
