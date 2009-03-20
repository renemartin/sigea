/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveInmuebleAsync(idAvaluo, datosInmueble, datosPropietario, callBack) {
    EntityWrappers.SaveInmueble(
        idAvaluo
        , datosInmueble[0]
        , datosInmueble[1]
        , datosInmueble[2]
        , datosPropietario[0]
        , datosPropietario[1]
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveUbicacionInmuebleAsync(idAvaluo, datosCalles, datosTerreno, callBack) {
    EntityWrappers.SaveUbicacionInmueble(
        idAvaluo
        , datosCalles
        , datosTerreno
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveEntornoInmuebleAsync(idAvaluo, datosEntorno, callBack) {
    EntityWrappers.SaveEntorno(
        idAvaluo
        , datosEntorno[0]
        , datosEntorno[1]
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveInfraestructuraInmuebleAsync(idAvaluo, datosInfraestructura, callBack) {
    EntityWrappers.SaveInfraestructura(
        idAvaluo
        , datosInfraestructura[0]
        , datosInfraestructura[1]
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveEquipamientoInmuebleAsync(idAvaluo, datosEquipamiento, callBack) {
    EntityWrappers.SaveEquipamiento(
        idAvaluo
        , datosEquipamiento
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveUsoActualAsync(idAvaluo, datosDistribucion, datosRecamaras, datosPlantas, callBack) {
    EntityWrappers.SaveUsoActual(
        idAvaluo
        , datosDistribucion
        , datosRecamaras
        , datosPlantas
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}
function saveEscriturasAsync(idAvaluo, datosEscrituras, callBack) {
    EntityWrappers.SaveEscriturasInmueble(
        idAvaluo
        , datosEscrituras
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}
function saveGeolocalizacionAsync(idAvaluo, datosGeolocalizacion, callback) {
    EntityWrappers.SaveGeolocalizacionInmueble(
        idAvaluo
        , datosGeolocalizacion
        , asyncCallResultBack
        , asyncCallFail
        , callback
    );
}

// Carga de datos

function loadInmuebleAsync(idAvaluo, control) {
    EntityWrappers.LoadInmueble(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadPropietarioAsync(idAvaluo, control) {
    EntityWrappers.LoadPropietario(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDatosTerrenoAsync(idAvaluo, control) {
    EntityWrappers.LoadDatosTerreno(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDatosTerrenoCallesAsync(idAvaluo, control) {
    EntityWrappers.LoadDatosTerrenoCalles(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadEntornoInmuebleAsync(idAvaluo, control) {
    EntityWrappers.LoadEntorno(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadInfraestructuraInmuebleAsync(idAvaluo, control) {
    EntityWrappers.LoadInfraestructura(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadEquipamientoInmuebleAsync(idAvaluo, control) {
    EntityWrappers.LoadEquipamiento(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadUsoActualDistribucionAsync(idAvaluo, control) {
    EntityWrappers.LoadUsoActualDistribucion(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadUsoActualRecamarasAsync(idAvaluo, control) {
    EntityWrappers.LoadUsoActualRecamaras(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadUsoActualPlantasAsync(idAvaluo, control) {
    EntityWrappers.LoadUsoActualPlantas(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadEscriturasAsync(idAvaluo, callBack) {
    EntityWrappers.LoadEscrituras(idAvaluo, asyncCallResultBack, asyncCallFail, callBack);
}
function loadGeolocalizacionAsync(idAvaluo, callback) {
    EntityWrappers.LoadGeolocalizacion(idAvaluo, asyncCallResultBack, asyncCallFail, callback);
}

// Datos escalares
function getInmuebleEscondominalAsync(idAvaluo, callBack) {
    EntityWrappers.GetInmuebleEsCondominal(
        idAvaluo, asyncCallResultBack, asyncCallFail, callBack);
}

// Calculos

function calcularNivelInfraestructura(datosInfraestructura, datosServicios) {
    var nivel = new Object();

    var num_nivel = 0;
    var num_nivelSHF = 0;
    var num_nivelSHF1 = 0;
    var num_nivelSHF2 = 0;
    var num_nivelSHF3 = 0;

    if (datosInfraestructura.aguaPotable) {
        num_nivel++;
        num_nivelSHF1++;
    }
    if (datosInfraestructura.drenaje) {
        num_nivel++;
        num_nivelSHF1++;
    }
    if (datosInfraestructura.electrificacion) {
        num_nivel++;
        num_nivelSHF1++;
    }
    if (datosInfraestructura.alumbradoPublico) {
        num_nivel++;
        num_nivelSHF2++;
    }
    if (datosInfraestructura.vialidades) {
        num_nivel++;
        num_nivelSHF2++;
    }
    if (datosInfraestructura.banquetas) {
        num_nivel++;
        num_nivelSHF2++;
    }
    if (datosServicios.gasNatural)
        num_nivelSHF3++;
    if (datosServicios.vigilancia)
        num_nivelSHF3++;

    num_nivel = num_nivel * 100 / 6;
    if (num_nivelSHF1 > 0) {
        if (num_nivelSHF3 == 2 && num_nivelSHF2 == 3 && num_nivelSHF1 == 3)
            num_nivelSHF = 4;
        else if (num_nivelSHF2 == 3 && num_nivelSHF1 == 3)
            num_nivelSHF = 3;
        else if (num_nivelSHF1 == 3)
            num_nivelSHF = 2;
        else
            num_nivelSHF = 1;
    }

    nivel.nivelInfraestructura = num_nivel.toFixed(2);
    nivel.nivelInfraestructuraSHF = num_nivelSHF;

    return nivel;
}
function calcularProximidadGeneral(datosEquipamiento) {
    var proximidad = 0;
    var distancia = 0;
    var cuenta = 0;
    
    if(!isNaN(parseFloat(datosEquipamiento.distanciaIglesia))) {
        distancia += parseFloat(datosEquipamiento.distanciaIglesia);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaMercado))) {
        distancia += parseFloat(datosEquipamiento.distanciaMercado);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaPlaza))) {
        distancia += parseFloat(datosEquipamiento.distanciaPlaza);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaEscuela))) {
        distancia += parseFloat(datosEquipamiento.distanciaEscuela);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaHospital))) {
        distancia += parseFloat(datosEquipamiento.distanciaHospital);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaParque))) {
        distancia += parseFloat(datosEquipamiento.distanciaParque);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaBanco))) {
        distancia += parseFloat(datosEquipamiento.distanciaBanco);
        cuenta++;
    }
    if (!isNaN(parseFloat(datosEquipamiento.distanciaEstacionTransporte))) {
        distancia += parseFloat(datosEquipamiento.distanciaEstacionTransporte);
        cuenta++;
    }

    if(cuenta > 0)
        proximidad = distancia / cuenta;

    return proximidad.toFixed(2);
}
function calcularNivelEquipamiento(datosEquipamiento) {
    var nivel = 1;

    if (!isNaN(parseFloat(datosEquipamiento.distanciaIglesia)) &&
        !isNaN(parseFloat(datosEquipamiento.distanciaMercado)) &&
        !isNaN(parseFloat(datosEquipamiento.distanciaPlaza)) &&
        !isNaN(parseFloat(datosEquipamiento.distanciaParque)) &&
        !isNaN(parseFloat(datosEquipamiento.distanciaEscuela))) {
        nivel = 2
    }
    if (nivel == 2 && !isNaN(parseFloat(datosEquipamiento.distanciaHospital))) {
        nivel = 3;
    }
    if (nivel == 3 && !isNaN(parseFloat(datosEquipamiento.distanciaEstacionTransporte))) {
        nivel = 4;
    }

    return nivel;
}
function calcularGMS(absoluto) {    
//        double[] georeferencia;
//        georeferencia = new double[3];

//        bool negativo = absoluto < 0;
//        absoluto = Math.Abs(absoluto);

//        int parte_entera = (int)absoluto;       
//        double parte_decimal = absoluto - parte_entera;
//        
//        georeferencia[0] = parte_entera * (negativo ? -1 : 1);
//        georeferencia[1] = (int)(parte_decimal * 60);
//        georeferencia[2] = ((parte_decimal * 3600) - (int)(parte_decimal * 60));
//        
//        return georeferencia;
    var georeferencia = new Array();
    var parte_entera;
    var parte_decimal;
    var negativo;
    if (absoluto >= 0)
        negativo = 0;
    else
        negativo = 1;
    absoluto = Math.abs(absoluto);
    parte_entera = parseInt(absoluto);
    parte_decimal = absoluto - parte_entera;
    georeferencia[0] = parte_entera * (negativo ? -1 : 1);
    georeferencia[1] = parseInt(parte_decimal * 60);
    georeferencia[2] = ((parte_decimal * 3600) - parseInt(parte_decimal * 60));

    return georeferencia;
}
function calcularAbs(grados, minutos, segundos) {
    var valorAbsoluto = (Math.abs(grados) + (minutos / 60) + (segundos / 3600)) * (grados > 0 ? 1 : -1);
    return valorAbsoluto;
}