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

    SQL = "Select * from tbZutaten where ZutatenId = " & Request.QueryString("ZutatenId")& ""
    RS.Open SQL,conn,3,3
    RS.Delete
    RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbZutaten where ZutatenId = " & Request.Form("ZutatenId")& ""
    RS.Open SQL,conn,3,3
    'strReplace = replace(Request.Form("txtPreis"),".",",")
    
    RS("ZutatenName")   = Request.Form("txtBezeichnung")
    RS("Einheit")       = Request.Form("txtEinheit")
    
    if Request.Form("txtPreis") <> "" then
        RS("Preis")           = Request.Form("txtPreis")
    else
        RS("Preis") = 0
    end if

    if Request.Form("txtPreisMwSt") <> "" then
        RS("PreisMwSt")           = Request.Form("txtPreisMwSt")
    else
        RS("PreisMwSt") = 0
    end if

    if Request.Form("txtPreisInhouse") <> "" then
        RS("PreisInhouse")           = Request.Form("txtPreisInhouse")
    else
        RS("PreisInhouse") = 0
    end if
    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbZutaten where ZutatenArt = " & Art & " Order By ZutatenName"
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

<B>Zutaten mutieren/löschen</B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     if int(RS("ZutatenId")) = int(Request.QueryString("ZutatenId")) then 
    %>
   
        <form method="POST" action="mutieren_zutaten01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="ZutatenId" value=<% = RS("ZutatenId") %> />
        <input type="hidden" name="Art" value="<% = Art %>" />
        <td>
            <input type="text" name="txtBezeichnung" size="80" value="<% = RS("ZutatenName") %>">
        </td>
        <td><input type="text" name="txtEinheit" size="5" value="<% = RS("Einheit") %>"><br /><font size="1">Einheit</font></td>
        <td><input type="text" name="txtPreis" size="5" value="<% = RS("Preis") %>"><br /><font size="1">Preis EK</font></td>
        <td><input type="text" name="txtPreisMwst" size="5" value="<% = RS("PreisMwSt") %>"><br /><font size="1">Preis VK</font></td>
        <td><input type="text" name="txtPreisInhouse" size="5" value="<% = RS("PreisInhouse") %>"><br /><font size="1">Preis Inhouse</font></td>


        <td>
            <input type="submit" value="speichern" name="B1">
        </td>
        </form>
        
      
      
    <% else %>  
      
        <td><% = RS("ZutatenName") %></td>
        <td><% = RS("Einheit") %></td>
        <td><% = RS("Preis") %></td>
        <td><% = RS("PreisMwSt") %></td>
        <td><% = RS("PreisInhouse") %></td>
        <td><a href="mutieren_zutaten01.asp?ZutatenId=<% = RS("ZutatenId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_zutaten01.asp?ZutatenId=<% = RS("ZutatenId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
   
    <td><% = RS("ZutatenName") %></td>
    <td><% = RS("Einheit") %></td>
    <td><% = RS("Preis") %></td>
    <td><% = RS("PreisMwSt") %></td>
    <td><% = RS("PreisInhouse") %></td>
    <td><a href="mutieren_zutaten01.asp?ZutatenId=<% = RS("ZutatenId") %>&Art=<% = Art %>&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_zutaten01.asp?ZutatenId=<% = RS("ZutatenId") %>&Art=<% = Art %>&M=Lo">löschen</a></td>
       
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
