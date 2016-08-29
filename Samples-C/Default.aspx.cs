using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class _breaddocsession
{
    public string code;
    public string message;
    public string createdAt;
    public _data data;
}

public class _data
{
    public string sessionid;
    public string breaddocid;
}
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}