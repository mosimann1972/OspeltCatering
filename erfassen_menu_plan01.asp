<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")

%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>


<body>


<B>Menüplan erfassen</B>
<hr size="1">


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>

<form method="POST" action="erfassen_menu_plan02.asp">
    <table border="0" cellpadding="3" cellspacing="0" ID="Table1">
    <tr>
      <td>Kalenderwoche:</td><td><!--#INCLUDE FILE="drp_kw.asp"--></td>
    </tr>
    <tr>
      <td>Menü Auswahl:</td><td><!--#INCLUDE FILE="drp_menuArt.asp"--></td>
    </tr>
            
     </table>
<p><input type="submit" value="öffnen" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
 </form>

 </body>
 </html>

