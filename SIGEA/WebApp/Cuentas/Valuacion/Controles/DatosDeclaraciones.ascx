<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDeclaraciones.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosDeclaraciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    
    //mostrar datos
    function setDataDeclaraciones(data) {
        if ( data.declaracionIdentificacion == true ){
                $get("<%= identificacionCoincide_RBtn.ClientID %>").checked = true;
                $get("<%= identificacionNOCoincide_RBtn.ClientID %>").checked = false;
        }
        else {
            $get("<%= identificacionCoincide_RBtn.ClientID %>").checked = false;
            $get("<%= identificacionNOCoincide_RBtn.ClientID %>").checked = true;
        }
    
        if ( data.declaracionSuperficies == true ){
                $get("<%= superficiesCoinciden_RBtn.ClientID %>").checked = true;
                $get("<%= superficiesNOCoinciden_RBtn.ClientID %>").checked = false;
        }
        else {
            $get("<%= superficiesCoinciden_RBtn.ClientID %>").checked = false;
            $get("<%= superficiesNOCoinciden_RBtn.ClientID %>").checked = true;
        }
        
        if ( data.declaracionConstrucciones == true ){
                $get("<%= contruccionCumple_RBtn.ClientID %>").checked = true;
                $get("<%= contruccionNOCumple_RBtn.ClientID %>").checked = false;
        }
        else {
            $get("<%= contruccionCumple_RBtn.ClientID %>").checked = false;
            $get("<%= contruccionNOCumple_RBtn.ClientID %>").checked = true;
        }
        
        if ( data.declaracionMonumento == true ){
                $get("<%= inmuebleMonumento_RBtn.ClientID %>").checked = true;
                $get("<%= inmuebleNOMonumento_RBtn.ClientID %>").checked = false;
        }
        else {
            $get("<%= inmuebleMonumento_RBtn.ClientID %>").checked = false;
            $get("<%= inmuebleNOMonumento_RBtn.ClientID %>").checked = true;
        }
        
        if ( data.declaracionPatrimonio == true ){
                $get("<%= inmueblePatrimonio_RBtn.ClientID %>").checked = true;
                $get("<%= inmuebleNOPatrimonio_RBtn.ClientID %>").checked = false;
        }
        else {
            $get("<%= inmueblePatrimonio_RBtn.ClientID %>").checked = false;
            $get("<%= inmuebleNOPatrimonio_RBtn.ClientID %>").checked = true;
        }
    }
    
     //guardar datos
    function getDataDeclaraciones() {
        var data  = new Object();
        
        if ( $get("<%= identificacionCoincide_RBtn.ClientID %>").checked == true )
                data.declaracionIdentificacion = true;
        else 
            data.declaracionIdentificacion = false;
    
        if ( $get("<%= superficiesCoinciden_RBtn.ClientID %>").checked == true )
                data.declaracionSuperficies = true;
        else 
            data.declaracionSuperficies = false;
            
        if ( $get("<%= contruccionCumple_RBtn.ClientID %>").checked == true )
                data.declaracionConstrucciones = true;
        else 
            data.declaracionConstrucciones = false;
            
        if ( $get("<%= inmuebleMonumento_RBtn.ClientID %>").checked == true )
                data.declaracionMonumento = true;
        else 
            data.declaracionMonumento = false;
        
        if ( $get("<%= inmueblePatrimonio_RBtn.ClientID %>").checked == true )
                data.declaracionPatrimonio = true;
        else
            data.declaracionPatrimonio = false;
            
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
