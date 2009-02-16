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