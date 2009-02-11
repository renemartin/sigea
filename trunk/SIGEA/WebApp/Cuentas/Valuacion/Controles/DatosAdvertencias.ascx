<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAdvertencias.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAdvertencias" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<ol>
    <li>
        <asp:CheckBox ID="sinDocumentacion_CBox" runat="server" Text="NO SE DISPUSO DE DOCUMENTACIÓN RELEVANTE" />
    </li>
    <li>
        <asp:CheckBox ID="sinOferta_CBox" runat="server" Text="NO SE ENCUENTRAN OFERTAS DEL MERCADO EN LA ZONA SUFICIENTES PARA CONSIDERAR EL ENFOQUE COMPARATIVO DEL MERCADO" />
    </li>
    <li>
        <asp:CheckBox ID="dudaUso_CBox" runat="server" Text="EXISTE DUDA SOBRE EL USO DEL INMUEBLE O DE ALGUNA SECCION DEL MISMO" />
    </li>
    <li>
        <asp:CheckBox ID="obrasAfectacion_CBox" runat="server" Text="EXISTEN OBRAS PUBLICAS O PRIVADAS QUE AFECTAN LOS SERVICIOS EN LA COLONIA" />
    </li>
</ol>
<span>Otras advertencias:</span>
<br />
<asp:TextBox ID="otrasAdvertencias_TBox" runat="server" TextMode="MultiLine"></asp:TextBox>
