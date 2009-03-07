<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValuadorFoto.aspx.cs" Inherits="Cuentas_Administracion_ValuadorFoto" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Fotografía del valuador</title>
    <base target="_self" />
    
    <script type="text/javascript" src="../../Scripts/Utils.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="modulo">
        <br />
        <div class="formulario">
            <span class="textoInstruccion">Seleccione una imagen para el valuador y presione el
                icono de guardar para cargarla </span>
            <div class="foto">
                <asp:Image ID="foto_Ima" runat="server" Visible="false" />
            </div>
            <asp:FileUpload ID="file_Fup" runat="server" />
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" 
                onclick="save_ImBtn_Click" />
        </div>
    </div>
    </form>
</body>
</html>
