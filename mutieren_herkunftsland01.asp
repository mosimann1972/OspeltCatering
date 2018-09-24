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

    'SQL = "Select * from tbHerkunftsland where HerkunftslandId = " & Request.QueryString("HerkunftslandId")& ""
    'RS.Open SQL,conn,3,3
    'RS.Delete
    'RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbHerkunftsland where HerkunftslandId = " & Request.Form("HerkunftslandId") & ""
    RS.Open SQL,conn,3,3
    
    RS("Herkunftsland")             = Request.Form("txtHerkunftsland")
    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------


SQL = "Select * from tbHerkunftsland Order by Herkunftsland"
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
     
     if int(RS("HerkunftslandId")) = int(Request.QueryString("HerkunftslandId")) then 
    
    %>
   
        <form method="POST" action="mutieren_herkunftsland01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="HerkunftslandId" value=<% = RS("HerkunftslandId") %> />
        <input type="hidden" name="Art" value="300" />
        <td>
        
            <table  cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>Herkunftsland:</td>
                <td>
                <input type="text" name="txtHerkunftsland" size="50" value="<% = RS("Herkunftsland") %>"></td>
            </tr>
            
            </table>
        
        </td>
        
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
        
           
    <% else %>  
      
        <td><% = RS("Herkunftsland") %></td>
        <td><a href="mutieren_Herkunftsland01.asp?HerkunftslandId=<% = RS("HerkunftslandId") %>&Art=300&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_Herkunftsland01.asp?HerkunftslandId=<% = RS("HerkunftslandId") %>&Art=300&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><% = RS("HerkunftslandId") %></td><td><% = RS("Herkunftsland") %></td>
    <td><a href="mutieren_Herkunftsland01.asp?HerkunftslandId=<% = RS("HerkunftslandId") %>&Art=300&M=Mu">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_Herkunftsland01.asp?HerkunftslandId=<% = RS("HerkunftslandId") %>&Art=300&M=Lo">löschen</a></td>
   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
