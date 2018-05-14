using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teams : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void dvTeam_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        //handle insert, update, delete
        //ignore cancel, add, etc etc
        if (e.CommandName == "Insert" ||
            e.CommandName == "Delete")
        {
            ddlSelectTeam.DataSourceID = "dsTeamList";
        }
        else if (e.CommandName == "Update")
        {
            string bookmark = ddlSelectTeam.SelectedValue;
            ddlSelectTeam.DataSourceID = "dsTeamList";
            ddlSelectTeam.SelectedValue = bookmark;
        }
    }
}