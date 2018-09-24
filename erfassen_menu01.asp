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


<B>Menü erfassen</B>
<hr size="1">


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>


<form method="POST" action="erfassen_menu02.asp">
    <table border="0" cellpadding="3" cellspacing="0" ID="Table1">
    <tr>
      <td>Menu:</td><td><!--#INCLUDE FILE="drp_menuArt.asp"--></td>
    </tr>
    <tr>
      <td>Suppe:</td><td><!--#INCLUDE FILE="drp_suppe.asp"--></td>
    </tr>
    <tr>
      <td>Wellnessdrink:</td><td><!--#INCLUDE FILE="drp_wellness.asp"--></td>
    </tr>
    <tr>
      <td>Hauptspeise:</td><td><!--#INCLUDE FILE="drp_hs.asp"--></td>
    </tr>
    <tr>  
      <td>SB:</td><td><!--#INCLUDE FILE="drp_sb1.asp"--></td>
    </tr>
    <tr>  
      <td>Ge/Sa:</td><td><!--#INCLUDE FILE="drp_sb2.asp"--></td>
      
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
      <td>Menu Name (Opt.):</td><td><input type="text" name="txtBezeichnung" size="50"></td>
      
      </tr>  
      
      
     </table>
<p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
 </form>

 </body>
 </html>

