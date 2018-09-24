<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%



'-----------------------------------------------------

if Request.QueryString("M") = "Lo" then

	response.Redirect "notfound.asp?Meldung=Es können keine Einträge gelöscht werden. Bitte wenden Sie Sich an den Admin!"

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbConfig where ConfigId = " & Request.Form("ConfigId") & ""
    RS.Open SQL,conn,3,3
    
    RS("Wert1")                 = Request.Form("txtWert1")
    RS("Wert2")                 = Request.Form("txtWert2")
    RS("Wert3")                 = Request.Form("txtWert3")
    RS("Wert4")                 = Request.Form("txtWert4")
    RS("Bezeichnung")           = Request.Form("txtBezeichnung")
    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------


SQL = "Select * from tbConfig Order by ConfigId"
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

<B>tbConfig</B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">


  <% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     
     if int(RS("ConfigId")) = int(Request.QueryString("ConfigId")) then 
    
    %>
   
        <form method="POST" action="mutieren_tbConfig01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="ConfigId" value=<% = RS("ConfigId") %> />

        <td>
        
            <table  cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>Wert1:</td><td><input type="text" name="txtWert1" size="20" value="<% = RS("Wert1") %>"></td>
            </tr>
            <tr>
                <td>Wert2:</td><td><input type="text" name="txtWert2" size="20" value="<% = RS("Wert2") %>"></td>
            </tr>
            <tr>
                <td>Wert3:</td><td><input type="text" name="txtWert3" size="20" value="<% = RS("Wert3") %>"></td>
            </tr>
            <tr>
                <td>Wert4:</td><td><input type="text" name="txtWert4" size="20" value="<% = RS("Wert4") %>"></td>
            </tr>
            <tr>
                <td>Bez:</td><td><input type="text" name="txtBezeichnung" size="20" value="<% = RS("Bezeichnung") %>"></td>
            </tr>
            
            </table>
        
        </td>
        
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
        
           
    <% else %>  
      
        <td><% = RS("ConfigId") %></td>
        <td><% = RS("Wert1") %></td>
        <td><% = RS("Wert2") %></td>
        <td><% = RS("Wert3") %></td>
        <td><% = RS("Wert4") %></td>
        <td><% = RS("Bezeichnung") %></td>
        <td><a href="mutieren_tbConfig01.asp?ConfigId=<% = RS("ConfigId") %>&Art=200&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_tbConfig01.asp?ConfigId=<% = RS("ConfigId") %>&Art=200&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
   <td><% = RS("ConfigId") %></td>
   <td><% = RS("Wert1") %></td>
   <td><% = RS("Wert2") %></td>
   <td><% = RS("Wert3") %></td>
   <td><% = RS("Wert4") %></td>
   <td><% = RS("Bezeichnung") %></td>
    <td><a href="mutieren_tbConfig01.asp?ConfigId=<% = RS("ConfigId") %>&Art=200&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_tbConfig01.asp?ConfigId=<% = RS("ConfigId") %>&Art=200&M=Lo">löschen</a></td>
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
