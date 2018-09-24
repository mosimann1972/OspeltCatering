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

    SQL = "Select * from tbFutter where FutterId = " & Request.QueryString("FutterId")& ""
    RS.Open SQL,conn,3,3
    RS.Delete
    RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbFutter where FutterId = " & Request.Form("FutterId")& ""
    RS.Open SQL,conn,3,3
    RS("FutterName")     = Request.Form("txtBezeichnung")
    RS("Einheit")       = Request.Form("txtEinheit")
    RS("Preis")         = Request.Form("txtPreis")
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbFutter where Art = " & Art & " Order By FutterName"
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
     if int(RS("FutterId")) = int(Request.QueryString("FutterId")) then 
    %>
   
        <form method="POST" action="mutieren_tb01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="FutterId" value=<% = RS("FutterId") %> />
        <input type="hidden" name="Art" value="<% = Art %>" />
        <td><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></td>
        <td>
            <input type="text" name="txtBezeichnung" size="80" value="<% = RS("FutterName") %>">
        </td>
        <td><input type="text" name="txtEinheit" size="5" value="<% = RS("Einheit") %>"><br /><font size="1">Einheit</font></td>
        <td><input type="text" name="txtPreis" size="5" value="<% = RS("Preis") %>"><br /><font size="1">Preis</font></td>
        
        <td>
            <input type="submit" value="speichern" name="B1">
        </td>
        </form>
        
      
      
    <% else %>  
      
        <td><B><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></td>
        <td><% = RS("FutterName") %></td>
        <td><% = RS("Einheit") %></td>
        <td><% = RS("Preis") %></td>
        
        <td><a href="mutieren_tb01.asp?FutterId=<% = RS("FutterId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_tb01.asp?FutterId=<% = RS("FutterId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><B><% = getWochentag(getDatum(RS("Datum"))) %>, <% = RS("Datum") %></td>
    <td><% = RS("FutterName") %></td>
    <td><% = RS("Einheit") %></td>
    <td><% = RS("Preis") %></td>

    
    <td><a href="mutieren_tb01.asp?FutterId=<% = RS("FutterId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_tb01.asp?FutterId=<% = RS("FutterId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
       
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
