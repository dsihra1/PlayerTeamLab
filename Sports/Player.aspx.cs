using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Player : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        dvPlayer.Visible = true;
    }
    protected void dvPlayer_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        GridView1.Visible = true;
        dvPlayer.Visible = false;
    }

    protected void dsPlayers_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "Error inserting player.";
            e.ExceptionHandled = true;  //stop trying to fix
        }
    }

    protected void dsPlayers_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "Error deleting player.";
            e.ExceptionHandled = true;  //stop trying to fix
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Nothing has changed.";
        }
    }
}