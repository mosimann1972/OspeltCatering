
<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Response.CacheControl = "no-cache"

Meldung = Request.QueryString("Meldung")


Art = Request.QueryString("Art")

Select Case Art
Case 1
    ZutatName = "Wellnessdrink"
Case 2
    ZutatName = "Hauptspeise"
Case 3
    ZutatName = "Sättigungsbeilage 1"
Case 4
    ZutatName = "Gemüse/Salat"
Case 5
    ZutatName = "Suppe"
Case 6
    ZutatName = "M-Suppe Suppe"
Case 7
    ZutatName = "M-Suppe Einlage"
Case else
    ZutatName = "Kein Titel"
end select


%>

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">

<head>
<title>----</title>
</head>

<body>

<B>Zutaten erfassen</B>
<hr size="1">

<% if Meldung <> "" then %>
<b><font color="red"><% = Meldung %></font></b>
<% end if %>

<form name="Bezeichnung" method="POST" action="erfassen_zutaten02.asp">
<input type="hidden" name="txtArt" value="<% = Art %>" />
    <table cellpadding="5" cellspacing="0" border="0">

    <tr>
      <td><% = ZutatName %>:</td>
      <td><input type="text" name="txtBezeichnung" size="80"></td>
      </tr>
      <tr>
      <td>Einheit:</td>
      <td><!--#INCLUDE FILE="drp_Einheit.asp"--></td>
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
    
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

</body>

</html>
