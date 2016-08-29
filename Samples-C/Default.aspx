<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Newtonsoft.Json" %>


<%
    string apikey = "abcdef"; //Get your API key from configuration manager. Keep the api key secret and not share with anyone.  
    
    string document = "test.docx"; //Pass document from your application. This can be url or document name. If passing document name, set network or server document location in Configuration Manager
    string userName = "John"; //Pass user name from your application
    string userColor = "FFFF00"; //Pass user color from your application
    string userId = "123456"; //Pass userid to map to your application. Keep userid same everytime same user comes back to edit the document.
    //Look in developer guide on other parameters that can be passed.
    
    string sessionid;

    
    
         
    //STEP 1. Get the sessionid
    
    string apiurl;

    apiurl = "http://localhost:19111/api/1.0.0/createBreadSession?apikey=" + apikey + "&document=" + document + "&userId=" + userId + "&userName=" + userName + "&userColor=" + userColor;
    HttpWebRequest HttpWReq = (HttpWebRequest)WebRequest.Create(apiurl);
    HttpWebResponse HttpWResp = (HttpWebResponse)HttpWReq.GetResponse();
    StreamReader sr = new StreamReader(HttpWResp.GetResponseStream(), System.Text.Encoding.UTF8);
    String resjson = sr.ReadToEnd();

 

    _breaddocsession responseJson = JsonConvert.DeserializeObject<_breaddocsession>(resjson);
  
    if (responseJson.code != "0")
    {
            Response.Write("Some Error Occurred");

    }
    else
    {
        sessionid=responseJson.data.sessionid;
  
     //STEP 2. Pass the sessionid to embed code

 %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bread</title>
</head>
<body>
<style>
.breaddocs{   
	margin: 0 auto;
	display:block;
	
	-moz-border-radius: 5px;   
	-webkit-border-radius: 5px;   
	border-radius: 5px;   
	-moz-box-shadow: 0 0 1em #000;;   
	-webkit-box-shadow: 0 0 1em #000;   
	box-shadow: 0 0 1em #000;   
	
 }
 </style>

 

<script type="text/javascript">

    var _breadurl = "localhost:19111"  // Change this to your website url. Refer to Integration & Deployment Chapter in Dev Guide

    var _breaddoc = [];
    _breaddoc.push(['sessionId', '<%=sessionid %>']);
    _breaddoc.push(['width', '900px']);
    _breaddoc.push(['height', '600px']);

    (function () {
        var bd = document.createElement('script'); bd.type = 'text/javascript'; bd.async = true;
        bd.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://') + _breadurl + '/breaddocs/static/js/breaddocs.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(bd, s);
    })();
</script>
<div id="breaddocs"></div>


</body>
</html>

<%
    
      }
        
    HttpWResp.Close();
    sr.Close();
 %>