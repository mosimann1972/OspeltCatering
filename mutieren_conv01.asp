<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Dim ConvArt

ConvArt = Request.QueryString("Art")
If ConvArt = "" then
    ConvArt = Request.Form("ConvArt")
end if


if ConvArt = 10 then ' Salat

    Aktiv = ""

    Aktiv = Request.QueryString("Aktiv")    'T= true (aktiv),  A=Alle (aktiv und inaktiv)
    if Aktiv = "" then
        Aktiv = Request.Form("Aktiv")
    end if

        
    Wochentag = Request.QueryString("Wochentag")
    if Wochentag = "" then
        Wochentag = Request.Form("Wochentag")
    end if
    
    WochenArt = Request.QueryString("WochenArt")
    if WochenArt = "" then
        WochenArt = Request.Form("WochenArt")
    end if
    
end if

'-----------------------------------------------------

if Request.QueryString("M") = "Lo" then

    response.Redirect "notfound.asp?Meldung=Es können keine Einträge gelöscht werden. Bitte wenden Sie Sich an den Admin!"

    'SQL = "Select * from tbConv where ConvId = " & Request.QueryString("ConvId")& ""
    'RS.Open SQL,conn,3,3
    'RS.Delete
    'RS.Close

end if

'-----------------------------------------------------

if Request.Form("Speichern") = "Ja" then

    SQL = "Select * from tbConv where ConvId = " & Request.Form("ConvId") & ""
    RS.Open SQL,conn,3,3
    
        
    RS("ConvText")          = Request.Form("txtConv")
    RS("ConvTextShort")     = Request.Form("txtConvTextShort")
    RS("Einheit")           = Request.Form("txtEinheit")

    RS("CateringMother")    = Request.Form("ConvId")
    
    RS("Tag")               = Request.Form("txtWochentag")
    RS("WochenArt")         = Request.Form("txtWochenArt")

	if Request.Form("txtHerkunftslandId") <> "" then
		RS("HerkunftslandId")     = Request.Form("txtHerkunftslandId")
	else
		RS("HerkunftslandId")     = "0"
	end if


    if Request.Form("txtPreis") <> "" then
        RS("Preis")             = Request.Form("txtPreis")
    else
        RS("Preis") = 0
    end if


	if Request.Form("txtPreisMwst") <> "" then
        RS("PreisMwst")             = Request.Form("txtPreisMwst")
    else
        RS("PreisMwst") = 0
    end if



    if Request.Form("txtPreisInhouse") <> "" then
        RS("PreisInhouse")             = Request.Form("txtPreisInhouse")
    else
        RS("PreisInhouse") = 0
    end if




    if Request.Form("txtMaxWertBestellung") <> "" then
        RS("MaxWertBestellung")             = Request.Form("txtMaxWertBestellung")
    else
        RS("MaxWertBestellung") = 0
    end if
    

	
    if Request.Form("txtAktiv") = "on" then
        RS("Aktiv") = true
    else
        RS("Aktiv") = false
    end if

    
	if Request.Form("txtCateringTitel") = "on" then
	    RS("CateringTitel") = true
	else
		RS("CateringTitel") = false
	end if
	
	if Request.Form("txtTextFeld") = "on" then
		RS("TextFeldAktiv") = true
	else
		RS("TextFeldAktiv") = false
	end if


    if Request.Form("txtTextFeld") = "on" then
        RS("TextFeldAktiv") = true
    else
        RS("TextFeldAktiv") = false
    end if

    
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

if ConvArt = 10 then ' Salat

    if Aktiv = "T" then ' Aktiv = true
        SQL = "Select * from tbConv where ConvArt = " & ConvArt & " and Aktiv = true and Tag = '" & WochenTag & "' and WochenArt = " & WochenArt & " Order by Aktiv, ConvText"
    else
        SQL = "Select * from tbConv where ConvArt = " & ConvArt & " and Tag = '" & WochenTag & "' and WochenArt = " & WochenArt & " Order by Aktiv, ConvText"
    end if


else
SQL = "Select * from tbConv where ConvArt = " & ConvArt & " Order by Aktiv, ConvText"
end if

RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if




Art = ConvArt

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


	if RS("CheckFeld") = true then
        CheckFeldchecked = "checked"
    else
        CheckFeldchecked = ""
    end if


	if RS("CateringTitel") = true then
        CateringTitelchecked = "checked"
    else
        CateringTitelchecked = ""
    end if


    if RS("TextFeldAktiv") = true then
        checked = "checked"
    else
        checked = ""
    end if
  
  %>

   <tr>
   
   
   <% if Request.QueryString("M") = "Mu" then
     
     if int(RS("ConvId")) = int(Request.QueryString("ConvId")) then 
    
    %>
   
        <form method="POST" action="mutieren_Conv01.asp">
        <input type="hidden" name="Speichern" value="Ja" />
        <input type="hidden" name="ConvId" value=<% = RS("ConvId") %> />
        <input type="hidden" name="ConvArt" value=<% = RS("ConvArt") %> />
        <input type="hidden" name="WochenTag" value=<% = Wochentag %> />
        <input type="hidden" name="WochenArt" value=<% = WochenArt %> />
        <input type="hidden" name="Aktiv" value=<% = Aktiv %> />

        <td>
        
            <table  cellpadding="0" cellspacing="0" border="0">
            <tr><td>Bezeichnung:</td><td><input type="text" name="txtConv" size="35" value="<% = RS("ConvText") %>"></td></tr>
            <tr><td>Lieferschein:</td><td><input type="text" name="txtConvTextShort" size="35" value="<% = RS("ConvTextShort") %>"></td></tr>
            </table>
        
        </td>
        <td><input id="Checkbox7" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /><br /><font size="1">Aktiv</font></td>
		<td><input id="Checkbox8" name="txtCheckFeld" <% = CheckFeldchecked %> type="checkbox" /><br /><font size="1">CheckFeld</font></td>
		<td><input id="Checkbox9" name="txtCateringTitel" <% = CateringTitelchecked %> type="checkbox" /><br /><font size="1">CateringTitel</font></td>
        <td><input type="text" name="txtEinheit" size="5" value="<% = RS("Einheit") %>"><br /><font size="1">Einheit</font></td>

		<td>
			<% opt00 = "<option selected value=""" & RS("HerkunftslandId") & """>" & getHerkunftsland(RS("HerkunftslandId")) & "</option>" 	%>
			<!--#INCLUDE FILE="drp_Herkunftsland.asp"--><br /><font size="1">Herkunftsland</font>
		</td>


        <td>
            
            <table>
                <tr><td><font size="1">Preis EK</font></td><td><input type="text" name="txtPreis" size="5" value="<% = RS("Preis") %>"></td></tr>
                <tr><td><font size="1">Preis VK</font></td><td><input type="text" name="txtPreisMwst" size="5" value="<% = RS("PreisMwst") %>"></td></tr>
                <tr><td><font size="1">Preis Inhouse</font></td><td><input type="text" name="txtPreisInhouse" size="5" value="<% = RS("PreisInhouse") %>"></td></tr>
            </table>
        </td>
        
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><input type="text" name="txtMaxWertBestellung" size="3" value="<% = RS("MaxWertBestellung") %>"><br /><font size="1">Max Anzahl</font></td>
        

        <% if RS("ConvArt") = 10 then %>
            <td><input type="text" name="txtWochentag" size="15" value="<% = RS("Tag") %>"><br /><font size="1">Montag, Dienstag</font></td>
            <td><input type="text" name="txtWochenArt" size="10" value="<% = RS("WochenArt") %>"><br /><font size="1">1=gerade, 0=ungerade</font></td>
        <% end if %>


        <td><input id="Checkbox1" name="txtTextfeld" <% = checked %> type="checkbox" /><br /><font size="1">Text</font></td>
        <td><input type="submit" value="speichern" name="B1"></td>
        </form>
        
           
    <% else %>  
      

		<td><% = RS("ConvText") %></td>
		<td><input id="Checkbox10" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /></td>
		<td><input id="Checkbox11" name="txtCheckFeld" <% = CheckFeldchecked %> type="checkbox" /></td>
		<td><input id="Checkbox12" name="txtCateringTitel" <% = CateringTitelchecked %> type="checkbox" /></td>
        <td><% = RS("Einheit") %></td>
		<td><% = getHerkunftsland(RS("HerkunftslandId")) %></td>
        <td><% = RS("Preis") %></td>
        <td><% = RS("PreisMwst") %></td>
        <td><% = RS("PreisInhouse") %></td>
        <td><% = RS("MaxWertBestellung") %></td>
        
        <% if RS("ConvArt") = 10 then %>
            <td><% = RS("Tag") %></td>
            <td><% = RS("WochenArt") %></td>
        <% end if %>

        <td><a href="mutieren_Conv01.asp?Art=<% = RS("ConvArt" ) %>&ConvId=<% = RS("ConvId") %>&M=Mu&Wochentag=<% = Wochentag %>&WochenArt=<% = WochenArt %>&Aktiv=<% = Aktiv %>">mutieren</a></td>
        <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_Conv01.asp?Art=<% = RS("ConvArt" ) %>&ConvId=<% = RS("ConvId") %>&M=Lo">löschen</a></td>
      
    <% end if %>  
   
   <% else %>
   
    
	<% if RS("CateringTitel") = true then %>
		<td><B><% = RS("ConvText") %></b></td>
	<% else	%>
		<td><% = RS("ConvText") %></td>
	<% end if %>
	   
    <td><input id="Checkbox13" name="txtAktiv" <% = Aktivchecked %> type="checkbox" /></td>
	<td><input id="Checkbox14" name="txtCheckFeld" <% = CheckFeldchecked %> type="checkbox" /></td>
	<td><input id="Checkbox15" name="txtCateringTitel" <% = CateringTitelchecked %> type="checkbox" /></td>
	<td><% = RS("Einheit") %></td>
	<td><% = getHerkunftsland(RS("HerkunftslandId")) %></td>
	<td><% = getConvMenu(RS("CateringMother")) %></td>
    <td><% = RS("Preis") %></td>
    <td><% = RS("PreisMwst") %></td>
    <td><% = RS("PreisInhouse") %></td>
    <td><% = RS("MaxWertBestellung") %></td>
    <% if RS("ConvArt") = 10 then %>
        <td><% = RS("Tag") %></td>
        <td><% = RS("WochenArt") %></td>
    <% end if %>
    <td><a href="mutieren_Conv01.asp?Art=<% = RS("ConvArt" ) %>&ConvId=<% = RS("ConvId") %>&M=Mu&Wochentag=<% = Wochentag %>&WochenArt=<% = WochenArt %>&Aktiv=<% = Aktiv %>">mutieren</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_Conv01.asp?Art=<% = RS("ConvArt" ) %>&ConvId=<% = RS("ConvId") %>&M=Lo">löschen</a></td>

   
   <% end if %>
   
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>


</table>


</body>

</html>
