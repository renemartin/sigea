<%@ Page Title="SIGEA - Notificación de error" Language="C#" MasterPageFile="~/General.master"
    AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <div style="padding: 30px; color: Red; font-size: 1.3em">
        Ocurrió un error al procesar la solicitud, por favor contacte al administrador del
        sistema</div>
</asp:Content>
