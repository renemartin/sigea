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
    if (result != null && callBackList != null) {
        for (i = 0; i < result.length; i++) {
            callBackList[i + 1](result[i]);
        }

        callBackList[0]();
    }
}