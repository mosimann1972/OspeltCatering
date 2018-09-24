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

   SQL = "Select * from tbBestellung where BestellId = " & Request.QueryString("BestellId") & ""
   RS.Open SQL,conn,3,3
   
   if Art = 100 then
        RS("Suppe") = 0
   end if
        
   if Art = 400 then
        RS("Wellness") = 0
   end if
   
   RS.Update
   RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbBestellung where BestellId = " & Request.Form("BestellId") & ""
    RS.Open SQL,conn,3,3
    
    if Art = 100 then
        RS("Suppe") = Request.Form("txtLitermenge")
    end if
        
    if Art = 400 then
        RS("Wellness") = Request.Form("txtLitermenge")
    end if
    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

If Art = 100 then 'Suppe
    MenuArtId = 1
    MenuText = "Suppe"
    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & " and MenuArtId = " & MenuArtId & " And Suppe <> 0 Order By BestellId"
end if

if Art = 400 then 'Wellness
    MenuArtId = 2
    MenuText = "Wellness"
    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & " and MenuArtId = " & MenuArtId & " And Wellness <> 0 Order By BestellId"
end if

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

<B><% = MenuText %> mutieren/löschen</B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

    <% if Art = 100 then
        Litermenge = RS("Suppe")
    else
        Litermenge = RS("Wellness")
    end if %>

   <tr>
   
    <% if Request.QueryString("M") = "Mu" then %>
   
        <% if int(RS("BestellId")) = int(Request.QueryString("BestellId")) then %>
    
            <form method="POST" action="mutieren_bestellung_SuppeWellness01.asp">
            <input type="hidden" name="Speichern" value="Ja" />
            <input type="hidden" name="BestellId" value=<% = RS("BestellId") %> />
            <input type="hidden" name="Art" value="<% = Art %>" />
            
            <td><% = getKW(RS("KWId")) %></td>
            <td><B><% = RS("Tag") %></B></td>
            <td><input type="text" name="txtLitermenge" size="5" value="<% = Litermenge %>"> Liter&nbsp;</td>
            <td><input type="submit" value="speichern" name="B1"></td>
            </form>
        
        <% else %>  
   
            <td><% = getKW(RS("KWId")) %></td>
            <td><B><% = RS("Tag") %></B></td>
            <td><% = Litermenge %> Liter</td>
      
            <td><a href="mutieren_bestellung_SuppeWellness01.asp?BestellId=<% = RS("BestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
            <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_SuppeWellness01.asp?BestellId=<% = RS("BestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
   
        <% end if %>  
   
   
   <% else %>
   
        <td><% = getKW(RS("KWId")) %></td>
        <td><B><% = RS("Tag") %></B></td>
        <td><% = Litermenge %> Liter</td>
        

        <td><a href="mutieren_bestellung_SuppeWellness01.asp?BestellId=<% = RS("BestellId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_SuppeWellness01.asp?BestellId=<% = RS("BestellId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
       
<% end if %>










   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>




</body>

</html>
