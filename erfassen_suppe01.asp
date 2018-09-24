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


<B>Suppe erfassen</B>
<hr size="1">


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>


<form method="POST" action="erfassen_suppe02.asp">
    <table border="0" cellpadding="3" cellspacing="0" ID="Table1">

      <tr>
      <td>Suppe:</td><td><!--#INCLUDE FILE="drp_menusuppe01.asp"--></td>
    </tr>

    <tr>
      <td>Einlage:</td><td><!--#INCLUDE FILE="drp_menusuppe02.asp"--></td>
    </tr>

    <tr>  
      <td>Preis EK:</td><td><input type="text" name="txtPreis" size="50"></td>
    </tr>  

    <tr>  
      <td>Preis VK:</td><td><input type="text" name="txtPreisMwst" size="50"></td>
    </tr>  

    <tr>  
      <td>Preis Inhouse:</td><td><input type="text" name="txtPreisInhouse" size="50"></td>
    </tr>

    <tr>  
      <td>Suppe Bezeichnung (Opt.):</td><td><input type="text" name="txtBezeichnung" size="50"></td>
    </tr>  
      
      
     </table>
<p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
 </form>

 </body>
 </html>

