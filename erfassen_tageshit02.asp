<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")



KWId = Request.Form("txtKWId")

KW      = getKWId_ProJahr(KWId)
Jahr    = getKWJahr_ProJahr(KWId)

Tag = Request.Form("txtTag")
Art = Request.Form("txtArt")

Select Case Art
Case 1
    Tagesbestellung = "Tageshit"
Case 2
    Tagesbestellung = "Wellnessdrink"
Case else
    Tagesbestellung = "Kein Titel"
end select


%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>

<body>

<B>Tagesbestellung erfassen</B>
<hr size="1">
<br />

<% 
if Meldung <> "" then
    Response.write Meldung & "<P>"
end if
%>


<% = getKW(KW,Jahr) %>
<B> <% = Tag %></B>
<br />


<form method="POST" action="erfassen_tageshit03.asp">
<input type="hidden" name="txtKW" value="<% = KW %>" />
<input type="hidden" name="txtJahr" value="<% = Jahr %>" />
<input type="hidden" name="txtTag" value="<% = Tag %>" />
<input type="hidden" name="txtArt" value="<% = Art %>" />

    <table  cellpadding="5" cellspacing="0" border="0">

    <tr>
      <td><% = Tagesbestellung %></td>
      <td><input type="text" name="txtBezeichnung" size="80"></td>
      </tr>
      <tr>
      <td><font size="1">Einheit:</font></td>
      <td><!--#INCLUDE FILE="drp_Einheit.asp"--></td>
      </tr>
      <tr>
      <td><font size="1">Preis pro Einheit</font></td>
      <td><input type="text" name="txtPreis" size="5"></td>        
    </tr>
    
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

<BR />
<BR />


</body>
</html>
