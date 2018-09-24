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

    SQL = "Select * from tbTagesHit where TagesId = " & Request.QueryString("TagesId")& ""
    RS.Open SQL,conn,3,3
    RS.Delete
    RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbTagesHit where TagesId = " & Request.Form("TagesId")& ""
    RS.Open SQL,conn,3,3
    
    
    RS("TagesName")     = Request.Form("txtBezeichnung")
    RS("Einheit")       = Request.Form("txtEinheit")
    
    if Request.Form("txtPreis") <> "" then
        RS("Preis")         = Request.Form("txtPreis")
    else
        RS("Preis")         = 0
    end if
        
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbTagesHit where Art = " & Art & " Order By Jahr DESC, KW DESC"
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

<B>Tageshit mutieren/löschen</B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     if int(RS("TagesId")) = int(Request.QueryString("TagesId")) then 
    %>
   
        <form method="POST" action="mutieren_tageshit01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="TagesId" value=<% = RS("TagesId") %> />
        <input type="hidden" name="Art" value="<% = Art %>" />
        <td>
            <input type="text" name="txtBezeichnung" size="80" value="<% = RS("TagesName") %>">
        </td>
        <td><input type="text" name="txtEinheit" size="5" value="<% = RS("Einheit") %>"><br /><font size="1">Einheit</font></td>
        <td><input type="text" name="txtPreis" size="5" value="<% = RS("Preis") %>"><br /><font size="1">Preis</font></td>
        
        <td>
            <input type="submit" value="speichern" name="B1">
        </td>
        </form>
        
      
      
    <% else %>  
      
        <td><B><% = getKW(RS("KW"),RS("Jahr")) %></B></td>
        <td><B><% = RS("Tag") %></B></td>
        <td><% = RS("TagesName") %></td>
        <td><% = RS("Einheit") %></td>
        <td><% = RS("Preis") %></td>
        
        <td><a href="mutieren_tageshit01.asp?TagesId=<% = RS("TagesId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_tageshit01.asp?TagesId=<% = RS("TagesId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><B><% = getKW(RS("KW"),RS("Jahr")) %></B></td>
    <td><B><% = RS("Tag") %></B></td>
    <td><% = RS("TagesName") %></td>
    <td><% = RS("Einheit") %></td>
    <td><% = RS("Preis") %></td>

    
    <td><a href="mutieren_tageshit01.asp?TagesId=<% = RS("TagesId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_tageshit01.asp?TagesId=<% = RS("TagesId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
       
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
