<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")

KWId = Request.Form("txtKWId")
Tag = Request.Form("txtTag")
Art = Request.Form("txtArt")


'-- Duplikatscheck -------------------------------------------------------------- START

'1=Tageshit
'200=Schnittlauch
'300=Fleischkäs
'500=Käsefleischkäs
'600=Peperonifleischkäs
'700=Tagessuppe


'if Art = 1 or Art = 200 or Art = 300 or Art = 500 or Art = 600 or Art = 700 then
'    SQL = "Select * from tbTagesBestellung where UserId = " & Session("UserId") & " and Art = " & Art & " and Tag = '" & Tag & "' and KWId = " & KWId & ""
'end if


'if Art = 100 then
'    MenuArtId = 1
'    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & "" _
'        & " and KWId = " & Request.Form("txtKWId") & " and Tag = '" & Request.Form("txtTag") & "' and MenuArtId = " & MenuArtId & " and Suppe <> 0"
'end if


'If Art = 400 then
'    MenuArtId = 2
'    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & "" _
'        & " and KWId = " & Request.Form("txtKWId") & " and Tag = '" & Request.Form("txtTag") & "' and MenuArtId = " & MenuArtId & " and Wellness <> 0"
'end if 

'RS.Open SQL,conn,3,3

'if RS.Recordcount <> 0 then
'    RS.Close
'    response.Redirect "notfound.asp?Meldung=Datensatz bereits vorhanden!"
'end if
'RS.Close
'-- Duplikatscheck -------------------------------------------------------------- END



'---------------------------------------
'Art = 100 => Bestellung Menü Suppe
'if Art = 100 then

'    Einheit = "Liter"
'    TagesId = 1
'    TagesName = "Menü Suppe"

'end if
'---------------------------------------

'Art = 200 => Bestellung Schittlauch
'if Art = 200 then

'    Einheit = "Bund"
'    TagesId = 2
'    TagesName = "Schittlauch"

'end if
'---------------------------------------

'Art = 300 => Bestellung Fleischkäs
'if Art = 300 then

'    Einheit = "kg"
'    TagesId = 3
'    TagesName = "Fleischkäs"

'end if

'Art = 500 => Bestellung Fleischkäs
'if Art = 500 then

'   Einheit = "kg"
'    TagesId = 38
'    TagesName = "Käsefleischkäs"

'end if

'Art = 600 => Bestellung Fleischkäs
'if Art = 600 then

'    Einheit = "kg"
'    TagesId = 39
'    TagesName = "Peperonifleischkäs"

'end if
'---------------------------------------

'Art = 400 => Bestellung Wellness Drink
'if Art = 400 then

'    Einheit = "Liter"
'    TagesId = 4
'    TagesName = "Wellness Drink"

'end if
'---------------------------------------

'Art = 700 => Bestellung Tagessuppe
'if Art = 700 then

'    Einheit = "Liter"
'    TagesId = 41
'    TagesName = "Tagessuppe"

'end if
'---------------------------------------

' Art = 1 => Tageshit

'if Art = 1 then

    'SQL = "Select * from tbTages where Tag = '" & Tag & "' and Art = " & Art & " and KWId = " & KWId & ""

    SQL = "Select * from tbTages where Art = " & Art & ""
    RS.Open SQL,conn,3,3

    'Einheit = RS("Einheit")
    'TagesId = RS("TagesId")
    'TagesName = RS("TagesName")
    
'end if

%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>

<body>

<B>Tagesbestellung bestellen</B>
<hr size="1">
<br />

<% = getKW(KWId) %>
<B> <% = Tag %></B>
<br />



<% 
if Meldung <> "" then
    Response.write Meldung & "<P>"
end if
%>

<form method="POST" action="erfassen_bestellung_tagesbestellung03.asp">
<input type="hidden" name="txtKWId" value=<% = KWId %> />
<input type="hidden" name="txtTag" value="<% = Tag %>" />
<input type="hidden" name="txtArt" value="<% = Art %>" />


<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<% do while not rs.eof %>

<tr><td><% = RS("TagesName") %></td><td><input type="text" name="txtTagesbestellung" size="5"> <% = RS("Einheit") %></td></tr>


<% rs.movenext
loop %>

</table>

  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

<BR />
<BR />

<% if Art = 100 Or Art = 400 then ' Bei Suppe und bei Wellnessdrink wird Menuplan angezeigt %>

    <!--#INCLUDE FILE="anzeigen_menu_plan02.asp"-->

<% end if %>


</body>
</html>
