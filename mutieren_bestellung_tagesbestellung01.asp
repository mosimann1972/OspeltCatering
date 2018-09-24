<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Art = ""
Art = Request.QueryString("Art")
if Art = "" then
    Art = Request.Form("Art")
end if

'-----------------------------------------------------

if Request.QueryString("M") = "Lo" then

   SQL = "Select * from tbTagesBestellung where TagesBestellId = " & Request.QueryString("TagesBestellId")& ""
   RS.Open SQL,conn,3,3
   RS.Delete
   RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbTagesBestellung where TagesBestellId = " & Request.Form("TagesBestellId")& ""
    RS.Open SQL,conn,3,3
    RS("TagesBestellWert")     = Request.Form("txtTagesBestellWert")
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbTagesBestellung where UserId = " & Session("UserId") & " and Art = " & Art & " Order By KWId,Tag"
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

<B>Tagesbestellung mutieren/löschen</B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     if int(RS("TagesBestellId")) = int(Request.QueryString("TagesBestellId")) then 
    %>
   
        <form method="POST" action="mutieren_bestellung_tagesbestellung01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="TagesBestellId" value=<% = RS("TagesBestellId") %> />
        <input type="hidden" name="Art" value="<% = Art %>" />
        
        <td><% = getKW(RS("KWId")) %></td>
        <td><B><% = RS("Tag") %></B></td>
        <td><% = getTagesBestellungName(RS("TagesId")) %></td>
        <td><input type="text" name="txtTagesBestellWert" size="5" value="<% = RS("TagesBestellWert") %>">&nbsp;<% = getTagesBestellungNameEinheit(RS("TagesId")) %></td>
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>

      
      
      
    <% else %>  
      
        <td><% = getKW(RS("KWId")) %></td>
        <td><B><% = RS("Tag") %></B></td>
        <td><% = getTagesBestellungName(RS("TagesId")) %></td>
        <td><% = RS("TagesBestellWert") %>&nbsp;<% = getTagesBestellungNameEinheit(RS("TagesId")) %></td>
        
        <td><a href="mutieren_bestellung_tagesbestellung01.asp?TagesBestellId=<% = RS("TagesBestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_tagesbestellung01.asp?TagesBestellId=<% = RS("TagesBestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><% = getKW(RS("KWId")) %></td>
    <td><B><% = RS("Tag") %></B></td>
    <td><% = getTagesBestellungName(RS("TagesId")) %></td>
    <td><% = RS("TagesBestellWert") %>&nbsp;<% = getTagesBestellungNameEinheit(RS("TagesId")) %></td>

    <td><a href="mutieren_bestellung_tagesbestellung01.asp?TagesBestellId=<% = RS("TagesBestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_tagesbestellung01.asp?TagesBestellId=<% = RS("TagesBestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
       
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>




</body>

</html>
