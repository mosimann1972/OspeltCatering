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

   SQL = "Select * from tbFutterBestellung where FutterBestellId = " & Request.QueryString("FutterBestellId") & ""
   RS.Open SQL,conn,3,3
   RS.Delete
   RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbFutterBestellung where FutterBestellId = " & Request.Form("FutterBestellId")& ""
    RS.Open SQL,conn,3,3
    RS("FutterWert")     = Request.Form("txtFutterBestellWert")
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbFutterBestellung where UserId = " & Session("UserId") & " and Art = " & Art & ""
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

<B>


<B><%
   if Art = 1 then Response.Write "Tageshit"
   if Art = 2 then Response.Write "Fleischkäs"
   if Art = 3 then Response.Write "Schnittlauch"
%> mutieren/löschen</B>

<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     if int(RS("FutterBestellId")) = int(Request.QueryString("FutterBestellId")) then 
    %>
   
        <form method="POST" action="mutieren_bestellung_tb01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="FutterBestellId" value=<% = RS("FutterBestellId") %> />
        <input type="hidden" name="Art" value="<% = Art %>" />
        <td><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></td>
        <td><% =  RS("FutterId") %></td>
        <td><input type="text" name="txtFutterBestellWert" size="5" value="<% = RS("FutterWert") %>">&nbsp;<% = RS("FutterId") %></td>
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
      
      
    <% else
    
    'getFutterBestellungName(RS("FutterId"))
    ' getFutterBestellungNameEinheit(RS("FutterId"))
     %>  

        <td><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></B></td>
        <td><% = RS("FutterId")  %></td>
        <td><% = RS("FutterWert") %>&nbsp;<% = RS("FutterId") %></td>
        
        <td><a href="mutieren_bestellung_tb01.asp?FutterBestellId=<% = RS("FutterBestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_tb01.asp?FutterBestellId=<% = RS("FutterBestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>

      
    <% end if %>  
   
   <% else %>
   

        <td><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></B></td>
        <td><% = RS("FutterId")  %></td>
        <td><% = RS("FutterWert") %>&nbsp;<% = RS("FutterId") %></td>
        
        <td><a href="mutieren_bestellung_tb01.asp?FutterBestellId=<% = RS("FutterBestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_tb01.asp?FutterBestellId=<% = RS("FutterBestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
      
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>




</body>

</html>
