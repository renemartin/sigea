﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoViasAcceso.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosViasAcceso" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillEntornoViasAccesoData() {
        fillImportanciaVialidad("<%= importanciaVia_DDList.ClientID %>");
    }   
</script>

<table>
    <tr>
        <td class="celdaHeader">
            Nombre de vía
        </td>
        <td class="celdaHeader">
            Importancia
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="via_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="importanciaVia_DDList" runat="server"></asp:DropDownList>
        </td>
    </tr>
</table>