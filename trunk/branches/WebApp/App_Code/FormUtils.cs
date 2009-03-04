using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for FormUtils
/// </summary>
public class FormUtils
{
    public static void ShowErrorMessage(Page sender, string message)
    { 
        string message_script =
            "if(showErrorMessage == undefined) alert('" + message + "'); " 
            + "else showErrorMessage('"+ message +"');";

        sender.ClientScript.RegisterStartupScript(
            typeof(Page)
            , "errorMessage"
            , message_script
            , true);
    }
}
