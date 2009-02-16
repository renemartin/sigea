/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveInmuebleAsync(idAvaluo, datosInmueble, datosUbicacionInmueble,
        datosDireccionInmueble, datosPropietario, datosDireccionPropietario, callBack) {
    EntityWrappers.SaveInmueble(
        idAvaluo
        , datosInmueble
        , datosUbicacionInmueble
        , datosDireccionInmueble
        , datosPropietario
        , datosDireccionInmueble
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
function saveEntornoInmuebleAsync(idAvaluo, datosEntorno, datosViasAcceso, callBack) {
    EntityWrappers.SaveEntorno(
        idAvaluo
        , datosEntorno
        , datosViasAcceso
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveInfraestructuraInmuebleAsync(idAvaluo, datosInfraestructura, datosServicios, callBack) {
    EntityWrappers.SaveInfraestructura(
        idAvaluo
        , datosInfraestructura
        , datosServicios
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

// Carga de datos

function loadInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadInmueble(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}
function loadUbicacionInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadUbicacionInmueble(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}
function loadEntornoInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadEntorno(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
}
function loadViasAccesoInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadViasAcceso(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
}
function loadInfraestructuraInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadInfraestructura(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}
function loadEquipamientoInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadEquipamiento(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
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