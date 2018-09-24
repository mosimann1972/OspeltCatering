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
    
     response.Redirect "notfound.asp?Meldung=Benutzer können nur deaktiviert, aber nicht gelöscht werden!"

    'Benutzer Löschen nicht mehr möglich wegen Auswertung, 04.02.2015

    'SQL = "Select * from tbUser where UserId = " & Request.QueryString("UserId")& ""
    'RS.Open SQL,conn,3,3
    'RS.Delete
    'RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbUser where UserId = " & Request.Form("UserId") & ""
    RS.Open SQL,conn,3,3
    
    RS("Username")           = Request.Form("txtName")
    RS("Passwort")           = Request.Form("txtPasswort")
    RS("Kurzzeichen")        = Request.Form("txtKurzzeichen")
    RS("Menuart")            = Request.Form("txtMenuArt")
    
    if Request.Form("txtAktiv") = "on" then
        RS("Aktiv") = true
    else
        RS("Aktiv") = false
    end if
    
    RS("Sort")               = Request.Form("txtSort")
    RS("Gruppe")             = Request.Form("txtAsDk")
    RS("Kundennummer")       = Request.Form("txtKundennummer")
    RS("Inhouse")            = Request.Form("txtInhouse")    

    RS.Update
    RS.Close

end if

'-----------------------------------------------------


SQL = "Select * from tbUser Order by Gruppe, Sort"
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


  <% do while not RS.eof 
  
  if RS("Aktiv") = true then
    Aktivchecked = "checked"
  else
    Aktivchecked = ""
  end if
   
  
  %>

  <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     
     if int(RS("UserId")) = int(Request.QueryString("UserId")) then 
    

    %>
   
        <form method="POST" action="mutieren_user01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="UserId" value=<% = RS("UserId") %> />
        <input type="hidden" name="Art" value="100" />
        <td>
        
            <table  cellpadding="0" cellspacing="0" border="0">
            
            <tr>
                <td>Aktiv:</td>
                <td><input id="Checkbox4" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /></td>
            </tr>
            
            <tr>
                <td>Name:</td>
                <td><input type="text" name="txtName" size="50" value="<% = RS("Username") %>"></td>
            </tr>
            <tr>
                <td>Passwort:</td>
                <td><input type="text" name="txtPasswort" size="50" value="<% = RS("Passwort") %>"></td>
            </tr>
            
            <tr>
                <td>Kurzzeichen:</td>
                <td><input type="text" name="txtKurzzeichen" size="50" value="<% = RS("Kurzzeichen") %>"></td>
            </tr>


            <tr>
                <td>Sort:</td>
                <td><input type="text" name="txtSort" size="50" value="<% = RS("Sort") %>"></td>
            </tr>

            <tr>
                <td>As/Dk:</td>
                <td><input type="text" name="txtAsDk" size="50" value="<% = RS("Gruppe") %>"></td>
            </tr>

            <tr>
                <td>KD-KST-Nummer:</td>
                <td><input type="text" name="txtKundenNummer" size="50" value="<% = RS("KundenNummer") %>"></td>
            </tr>
            
            <tr>
                <td>MenuArt:</td>
                <td><input type="text" name="txtMenuArt" size="50" value="<% = RS("MenuArt") %>"></td>
            </tr>

            <tr>
                <td>Inhouse Kunde:</td>
                <td><input type="text" name="txtInhouse" size="50" value="<% = RS("Inhouse") %>"></td>
            </tr>
            


            </table>
        
        </td>
        
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
        
           
    <% else %>  
      
        <td><input id="Checkbox1" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /></td>
        <td><% = RS("Sort") %></td><td><% = RS("Username") %></td><td><% = RS("Passwort") %></td><td><% = RS("Kurzzeichen") %></td><td><% = RS("Gruppe") %></td><td><% =  RS("Kundennummer") %></td><td><% =  RS("MenuArt") %></td><td><% =  RS("Inhouse") %></td>
        <td><a href="mutieren_user01.asp?UserId=<% = RS("UserId") %>&Art=100&M=Mu">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_user01.asp?UserId=<% = RS("UserId") %>&Art=100&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    <td><input id="Checkbox2" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /></td>
    <td><% = RS("Sort") %></td><td><% = RS("Username") %></td><td><% = RS("Passwort") %></td><td><% = RS("Kurzzeichen") %></td><td><% = RS("Gruppe") %></td><td><% =  RS("Kundennummer") %></td><td><% =  RS("MenuArt") %></td><td><% =  RS("Inhouse") %></td>
    <td><a href="mutieren_user01.asp?UserId=<% = RS("UserId") %>&Art=100&M=Mu">mutieren</a></td>
    <td><a href="mutieren_user01.asp?UserId=<% = RS("UserId") %>&Art=100&M=Lo">löschen</a></td>

   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
