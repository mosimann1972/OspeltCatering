<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Dim ConvArt

'ConvArt = Request.QueryString("Art")
'If ConvArt = "" then
'    ConvArt = Request.Form("ConvArt")
'end if

'-----------------------------------------------------

if Request.QueryString("M") = "Lo" then

	response.Redirect "notfound.asp?Meldung=Es können keine Einträge gelöscht werden. Bitte wenden Sie Sich an den Admin!"

    'SQL = "Select * from tbConvTitel where ConvTitelId = " & Request.QueryString("ConvTitelId")& ""
    'RS.Open SQL,conn,3,3
    'RS.Delete
    'RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbConvTitel where ConvTitelId = " & Request.Form("ConvTitelId") & ""
    RS.Open SQL,conn,3,3
    
    RS("ConvTitelId")           = Request.Form("txtConvTitelId")
    RS("ConvTitel")             = Request.Form("txtConvTitel")
    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------


SQL = "Select * from tbConvTitel Order by ConvTitelId"
RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if

Art = Request.QueryString("Art")
if Art = "" then
    Art = Request.Form("Art")
end if

%>

<!--#INCLUDE FILE="titel.asp"-->

<html>

<link href="ospelt.css" rel="stylesheet" type="text/css" />


<head>
<title>------</title>
</head>


<body>

<B><% = SeitenTitel %> </B>
<hr size="1">
<br />

<table  cellpadding="5" cellspacing="0" border="0">


  <% do while not RS.eof %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     
     if int(RS("ConvTitelId")) = int(Request.QueryString("ConvTitelId")) then 
    
    %>
   
        <form method="POST" action="mutieren_conv_titel01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="ConvTitelId" value=<% = RS("ConvTitelId") %> />
        <input type="hidden" name="Art" value="200" />
        <td>
        
            <table  cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>ConvTitelId, ConvTitel:</td>
                <td>
                <input type="text" name="txtConvTitelId" size="10" value="<% = RS("ConvTitelId") %>">&nbsp;
                <input type="text" name="txtConvTitel" size="50" value="<% = RS("ConvTitel") %>"></td>
            </tr>
            
            </table>
        
        </td>
        
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
        
           
    <% else %>  
      
        <td><% = RS("ConvTitelId") %></td><td><% = RS("ConvTitel") %></td>
        <td><a href="mutieren_conv_titel01.asp?ConvTitelId=<% = RS("ConvTitelId") %>&Art=200&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_conv_titel01.asp?ConvTitelId=<% = RS("ConvTitelId") %>&Art=200&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><% = RS("ConvTitelId") %></td><td><% = RS("ConvTitel") %></td>
    <td><a href="mutieren_conv_titel01.asp?ConvTitelId=<% = RS("ConvTitelId") %>&Art=200&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_conv_titel01.asp?ConvTitelId=<% = RS("ConvTitelId") %>&Art=200&M=Lo">löschen</a></td>
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
