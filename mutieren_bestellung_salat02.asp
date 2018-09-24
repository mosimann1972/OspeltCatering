<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")

SalatBestellUebersichtId = Request.QueryString("SalatBestellUebersichtId") 
Mutationsflag = Request.QueryString("M")
KWId = Request.QueryString("KWId")
Tag = Request.QueryString("Tag")

'---------------------------------------------------------------

if getWochenArt(KWId) = true then
    WochenArt = 1
else
    WochenArt = 0
End if


Set RSSalat  = Server.CreateObject("ADODB.Recordset")
SQLSalat = "Select * from tbSalat where Tag = '" & Tag & "' and WochenArt = " & WochenArt & ""
RSSalat.Open SQLSalat,conn,3,3

Counter = 1
Do while not RSSalat.EOF

    Select Case Counter 
    Case 1
    SBez1 = RSSalat("Bezeichnung")
    Case 2
    SBez2 = RSSalat("Bezeichnung")
    Case 3
    SBez3 = RSSalat("Bezeichnung")
    Case 4
    SBez4 = RSSalat("Bezeichnung")
    Case 5
    SBez5 = RSSalat("Bezeichnung")
    Case 6
    SBez6 = RSSalat("Bezeichnung")
    Case 7
    SBez7 = RSSalat("Bezeichnung")
    Case 8
    SBez8 = RSSalat("Bezeichnung")
    Case Else
    response.Redirect "main.asp?Meldung=Fehler 3399"
    End select


Counter = Counter + 1

RSSalat.MoveNext
Loop



'---------------------------------------------------------------


SQL = "Select * from tbSalatBestellung where SalatBestellId = " & SalatBestellUebersichtId & " Order by SalatBestellId"
RS.Open SQL,conn,3,3


%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>


<body>

<B>Salat bestellen ändern</B>
<hr size="1">
<br />
<% = getKW(KWId) %>
<B> <% = Tag %></B>
<br />
<hr align=left width=400 />
<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form method="POST" action="mutieren_bestellung_salat03.asp">

<input type="hidden" name="txtSalatBestellId" value=<% = RS("SalatBestellId") %> />

<tr><td><% = SBez1 %></td><td><input type="text" value=<% = RS("S1") %> name="txtSalat1" size="5"> kg</td>
<tr><td><% = SBez2 %></td><td><input type="text" value=<% = RS("S2") %> name="txtSalat2" size="5"> kg</td>
<tr><td><% = SBez3 %></td><td><input type="text" value=<% = RS("S3") %> name="txtSalat3" size="5"> kg</td>
<tr><td><% = SBez4 %></td><td><input type="text" value=<% = RS("S4") %> name="txtSalat4" size="5"> kg</td>
<tr><td><% = SBez5 %></td><td><input type="text" value=<% = RS("S5") %> name="txtSalat5" size="5"> kg</td>
<tr><td><% = SBez6 %></td><td><input type="text" value=<% = RS("S6") %> name="txtSalat6" size="5"> kg</td>
<tr><td><% = SBez7 %></td><td><input type="text" value=<% = RS("S7") %> name="txtSalat7" size="5"> kg</td>
<tr><td><% = SBez8 %></td><td><input type="text" value=<% = RS("S8") %> name="txtSalat8" size="5"> kg</td>

</tr>    
    
	
</table>
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

<BR />
<BR />

</body>
</html>
