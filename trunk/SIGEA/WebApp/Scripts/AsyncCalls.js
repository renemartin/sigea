/// <reference name="MicrosoftAjax.js"/>

function asyncCallFail(error) {
    showErrorMessage(error.get_message());
}

function asyncCallResultBack(result, callback) {
    if (callback != null)
        callback(result);
}

function asyncCallSenderBack(result, context) {
    if (context != null) {
        context[1](context[0]);
    }
}

function asyncCallListBack(result, callBackList) {
    if (callBackList != null) {
        if (result != null && result.length != undefined) {
            for (i = 0; i < result.length; i++) {
                callBackList[i + 1](result[i]);
            }
        }
        else {
            callBackList[1](result);
        }

        callBackList[0]();
    }
}

function asyncCallSingleListBack(result, callBackList) {
    if (callBackList != null) {
        callBackList[1](result);
        callBackList[0]();
    }
}

function asyncControlLoad(data, control) {
    control.setData(data);
}

function asyncControlFachada(data, control) {
    control.setFachada(data);
}

function asyncSetTextResult(data, target) {
    if (target != null) {
        hideControlLoading(target.id);
        if (target.value != undefined)
            target.value = data;
        else if (target.innerHTML != undefined)
            target.innerHTML = data;            
    }
}

function asyncSetNumResult(data, target) {
    if (target != null) {
        hideControlLoading(target.id);
        if (target.value != undefined)
            target.value = getNumString(data, 2);
        else if (target.innerHTML != undefined)
            target.innerHTML = getNumString(data, 2);
    }
}