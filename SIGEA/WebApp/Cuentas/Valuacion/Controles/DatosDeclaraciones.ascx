<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDeclaraciones.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosDeclaraciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    
    //mostrar datos
    function setDataDeclaraciones(data) {
        $get("<%= identificacionCoincide_RBtn.ClientID %>").checked = data.declaracionIdentificacion;
        $get("<%= identificacionNOCoincide_RBtn.ClientID %>").checked = !data.declaracionIdentificacion;
        $get("<%= superficiesCoinciden_RBtn.ClientID %>").checked = data.declaracionSuperficies;
        $get("<%= superficiesNOCoinciden_RBtn.ClientID %>").checked = !data.declaracionSuperficies;
        $get("<%= contruccionCumple_RBtn.ClientID %>").checked = data.declaracionConstrucciones;
        $get("<%= contruccionNOCumple_RBtn.ClientID %>").checked = !data.declaracionConstrucciones;
        $get("<%= inmuebleMonumento_RBtn.ClientID %>").checked = data.declaracionMonumento;
        $get("<%= inmuebleNOMonumento_RBtn.ClientID %>").checked = !data.declaracionMonumento;
        $get("<%= inmueblePatrimonio_RBtn.ClientID %>").checked = data.declaracionPatrimonio;
        $get("<%= inmuebleNOPatrimonio_RBtn.ClientID %>").checked = !data.declaracionPatrimonio;
    }
    
     //guardar datos
    function getDataDeclaraciones() {
        var data  = new Object();
        
         data.declaracionIdentificacion = $get("<%= identificacionCoincide_RBtn.ClientID %>").checked;
         data.declaracionSuperficies = $get("<%= superficiesCoinciden_RBtn.ClientID %>").checked;
         data.declaracionConstrucciones = $get("<%= contruccionCumple_RBtn.ClientID %>").checked;         
         data.declaracionMonumento = $get("<%= inmuebleMonumento_RBtn.ClientID %>").checked         
         data.declaracionPatrimonio = $get("<%= inmueblePatrimonio_RBtn.ClientID %>").checked
            
        return data;
            
    }

</script>

<ol>
    <li>SE VERIFICÓ EL ESTADO DE LA CONSTRUCCIÓN Y CONSERVACIÓN DEL INMUEBLE
        <br />
        (CON EL ALCANCE ESPERADO PARA EFECTOS DE AVALÚO) </li>
    <li>LA IDENTIFICACIÓN FÍSICA DEL INMUEBLE
        <asp:RadioButton ID="identificacionCoincide_RBtn" runat="server" Text="COINCIDE"
            GroupName="declaracion1" CssClass="textoNegritas" />
        &nbsp;
        <asp:RadioButton ID="identificacionNOCoincide_RBtn" runat="server" Text="NO COINCIDE"
            GroupName="declaracion1" CssClass="textoNegritas" />
        &nbsp; CON LO SEÑALADO EN LA DOCUMENTACIÓN </li>
    <li>LAS SUPERFICIES FÍSICAS OBSERVADAS
        <asp:RadioButton ID="superficiesCoinciden_RBtn" runat="server" Text="COINCIDEN" GroupName="declaracion2"
            CssClass="textoNegritas" />
        &nbsp;
        <asp:RadioButton ID="superficiesNoCoinciden_RBtn" runat="server" Text="NO COINCIDEN"
            GroupName="declaracion2" CssClass="textoNegritas" Checked="True" />
        &nbsp; CON LA DOCUMENTACIÓN
        <br />
        <span class="textoCursiva textoChico">(CON EL ALCANCE ESPERADO PARA EFECTOS DEL AVALÚO)</span> </li>
    <li>LA CONSTRUCCIÓN DEL INMUEBLE
        <asp:RadioButton ID="construccionCumple_RBtn" runat="server" Text="CUMPLE" GroupName="declaracion3"
            CssClass="textoNegritas" />
        &nbsp;
        <asp:RadioButton ID="construccionNoCumple_RBtn" runat="server" Text="NO CUMPLE" GroupName="declaracion3"
            CssClass="textoNegritas" />
        &nbsp; CON EL PLAN DE DESARROLLO URBANO VIGENTE
        <br />
        <span class="textoCursiva textoChico">(EN SU CASO)</span></li>
    <li>EL INMUEBLE
        <asp:RadioButton ID="inmuebleMonumento_RBtn" runat="server" Text="ES" GroupName="declaracion4"
            CssClass="textoNegritas" />
        &nbsp;&nbsp;
        <asp:RadioButton ID="inmuebleNoMonumento_RBtn" runat="server" Text="NO ES" GroupName="declaracion4"
            CssClass="textoNegritas" />
        &nbsp; CONSIDERADO MONUMENTO HISTORICO POR EL I.N.A.H. </li>
    <li>EL INMUEBLE &nbsp;&
        <asp:RadioButton ID="inmueblePatrimonio_RBtn" runat="server" Text="ES" GroupName="declaracion5"
            CssClass="textoNegritas" />
        &nbsp;
        <asp:RadioButton ID="inmuebleNoPatrimonio_RBtn" runat="server" Text="NO ES" GroupName="declaracion5"
            CssClass="textoNegritas" />
        &nbsp; CONSIDERADO PATRIMONIO ARQUITECTONICO POR EL I.N.B.A. </li>
</ol>
