<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSintesisAvaluo.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSintesisAvaluo" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td colspan="2">
            <h2>
                Datos generales
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fecha del avalúo
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="fecha_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            No. del paq. INFONAVIT / No. vivienda
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="paqInfonavit_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Propósito del avalúo
        </td>
        <td class="celdaValor">
            <asp:Label ID="proposito_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clave y nombre de la entidad que otorga el crédito
        </td>
        <td class="celdaValor">
            <asp:Label ID="entidadCredito_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Datos del solicitante</h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Nombre
        </td>
        <td class="celdaValor">
            <asp:Label ID="nombreSolicitante_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Folio INFONAVIT
        </td>
        <td class="celdaValor">
            <asp:Label ID="folioInfonavit_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            NSS
        </td>
        <td class="celdaValor">
            <asp:Label ID="nss_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Datos del inmuble
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tipo de inmueble a valuar
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="tipoInmueble_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Calle y número
        </td>
        <td colspan="2" class="celdaValor">
            <asp:Label ID="calle_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Nombre del condominio (de ser aplicable)
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="condominio_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Colonia
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="colonia_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Código postal
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="cp_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Delegación o municipio conforme a catálogo INEGI
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="municipio_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entidad federativa conforme a catálogo INEGI
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="estado_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de cuenta predial
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="predial_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Georeferencia del inmueble</h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Longitud W
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="longitud_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Latitud N
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="latitud_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Altitud (M.S.N.M.)
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="altitud_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Datos de entorno
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Referencia de proximidad urbana
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="proximidadUrbana_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Acometida al inmueble del suministro telefónico
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="telefono_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Nivel de infraestructura urbana
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="nivelInfraestructura_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Nivel de equipamiento urbano
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="nivelEquipamiento_lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Uso actual
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de espacios de estacionamiento
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="cupoEstacionamiento_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Elevador
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="elevador_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de baños
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="baños_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de 1/2 baños
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="mediosBaños_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de recamaras
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="recamaras_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <h2>
                Datos de construcciones
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clase del inmueble
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="clase_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="unidadesRentables_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Número de niveles
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="niveles_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Constructor para el caso de vivienda nueva
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="constructor_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Vida útil remanente en años
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="vidaUtil_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Año de terminación o remodelación de la obra
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="añoTerminacion_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <%--<tr>
                <td class="ResumenTitulo" style="width: 350px">
                    UNIDADES RENTABLES GENERALES
                </td>
                <td class="ResumenContenido" colspan="2">
                    <asp:Label ID="rentablesGenerales_lbl" runat="server" Text=""></asp:Label>
                </td>
          </tr>--%>
    <tr>
        <td colspan="2">
            <h2>
                Superficies
            </h2>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superficie de terreno en m²
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="superficieTerreno_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superficie construida en m²
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="superficieConstruida_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superfice accesoria en m²
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="superficieAccesoria_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Superficie vendible en m²
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="superficieVendible_Lbl" runat="server" Text=""></asp:Label>
        </td>
    </tr>
  
    <tr>
        <td colspan="2">
            <h2>
                Valores concluidos
            </h2>
        </td>
    </tr>
     <tr>
        <td class="celdaTitulo">
            Valor comparativo de mercado
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="valorMercado_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Valor físico del terreno
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="valorTerreno_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
             Valor físico de la construcción 
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="valorConstruccion_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
             Valor físico de instalaciones y elementos comunes
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="valorInstalaciones_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Valor concluido
        </td>
        <td class="celdaValor" colspan="2">
            <asp:Label ID="valorConcluido_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
</table>
