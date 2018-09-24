<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

'-----------------------------------------------------

if Request.QueryString("M") = "Lo" then

    SQL = "Select * from tbSalatBestellUebersicht where SalatBestellUebersichtId = " & Request.QueryString("SalatBestellUebersichtId") & ""
    RS.Open SQL,conn,3,3
    RS.Delete
    RS.Close
              
    SQL = "Delete * from tbSalatBestellung where SalatBestellId = " & Request.QueryString("SalatBestellUebersichtId") & ""
    RS.Open SQL,conn,3,3
        
end if

'-----------------------------------------------------

SQL = "Select * from tbSalatBestellUebersicht where UserId = " & Session("UserId") & " Order By KWId,Tag"
RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if


%>

<html>

<link href="ospelt.css" rel="stylesheet" type="text/css" />


<head>
<title>------</title>
</head>


<body>

<B>Salat mutieren/löschen</B>
<hr size="1">

<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

    <tr> 
      
    <td><% = getKW(RS("KWId")) %></td><td><B><% = (RS("Tag")) %></B></td>
    <td><a href="mutieren_bestellung_salat02.asp?KWId=<% = RS("KWId") %>&Tag=<% = RS("Tag") %>&SalatBestellUebersichtId=<% = RS("SalatBestellUebersichtId") %>&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_salat01.asp?SalatBestellUebersichtId=<% = RS("SalatBestellUebersichtId") %>&M=Lo">löschen</a></td>
      
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
