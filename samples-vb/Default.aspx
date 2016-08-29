<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Newtonsoft.Json" %>

<%
    Dim apikey As String = "abcdef" 'Get the API key from Configuration Manager and pass it here. Keep your api key secret
    
    Dim document As String = "test.docx" 'Pass document from your application. This can be url or document name. If passing document name, set network or server document location in Configuration Manager
    Dim userName As String = "John"  'Pass user name from your application
    Dim userColor As String = "FFFF00" 'Pass user color from your application
    Dim userId As String = "123456" 'Pass userid to map to your application. Keep userid same everytime same user comes back to edit the document.
    'Look in developer guide on other parameters that can be passed.
    
    Dim sessionid As String

       
         
    'STEP 1. Get the sessionid
    Dim apiurl As String
    apiurl = "http://localhost:19111/api/1.0.0/createBreadSession?apikey=" & apikey & "&document=" & document & "&userId=" & userId & "&userName=" & userName & "&userColor=" & userColor
    Dim request As HttpWebRequest = HttpWebRequest.Create(apiurl)
    request.Method = WebRequestMethods.Http.Get
    Dim serviceresponse As HttpWebResponse = request.GetResponse()
    Dim reader As New StreamReader(serviceresponse.GetResponseStream())
    Dim resjson As String = reader.ReadToEnd()
   
    Dim responseJson As _breaddocsession
    
    Dim jsonstr As String = ""
       
    responseJson = JsonConvert.DeserializeObject(resjson, GetType(_breaddocsession))
          
    If (responseJson.code.ToString() <> "0") Then
        Response.Write("Some Error Occurred")

    Else
        
        sessionid = responseJson.data.sessionid
        
        
        
        
        'STEP 2. Pass the sessionid to embed code

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

<%    
    End If
           
    serviceresponse.Close()
    
    
%>

 
</body>
</html>
