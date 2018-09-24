<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<!--#INCLUDE FILE="deadlinecheck.asp"-->


<%


'Response.Write Request.Form("ComboName") & "<BR>"

Dim ConvArt

ConvArt = Request.QueryString("Art")
if ConvArt = "" then
    ConvArt = Request.Form("Art")
end if

CateringNummer = Request.QueryString("CateringNummer")

UserId = Session("UserId")
AdminFlag = false


if UserId = 15 then    '15 = Admin
    AdminFlag = true
    UserId = Request.Form("txtUserId")

    if UserId = "" then
        UserId = Request.QueryString("UserId")
    end if

end if


'-----------------------------------------------------

LoeschDat = "#" & Month(getDatum(Request.QueryString("Datum"))) & "/" & Day(getDatum(Request.QueryString("Datum"))) & "/" & Year(getDatum(Request.QueryString("Datum"))) & "#"


if Request.QueryString("M") = "Lo" then

	'-------------------------------------------------------------------------------------''
	Dat = Request.QueryString("Datum")
	if AdminFlag = false then
		deadlinecheck(Dat)
	end if
	'-------------------------------------------------------------------------------------''

    SQL = "Delete * from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " and Datum = " & LoeschDat & " and CateringNummer = " & CateringNummer & ""
    RS.Open SQL,conn,3,3
	
	'Catering Eintrag löschen
	if ConvArt = 19 or ConvArt = 20 or ConvArt = 21 or ConvArt = 22 or ConvArt = 27 then

		SQL = "Delete * from tbCatering where CateringNummer = " & Request.QueryString("CateringNummer") & ""
		RS.Open SQL,conn,3,3
	
	end if
        
end if

'-----------------------------------------------------

SQL = "Select * from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " Order By Datum Desc, UserId, CateringNummer"
'Response.Write ">>>>>>>>>>>>>>>>>" & SQL & "<BR>"
	
RS.Open SQL,conn,3,3
'Response.Write ">>>>> " & RS.Recordcount & "<BR>"


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

<B><% = Seitentitel %></B> <% if AdminFlag = true then %><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% = getRestaurantName(UserId) %></b></font><% end if %>
<hr size="1">

<br />

<table  cellpadding="5" cellspacing="0" border="0">
	



<% 

'Bei Catering muss die mit der CateringNummer abgefragt werden, da Pro Tag mehrere Caterings bestellt werden knnen
if ConvArt = 19 or ConvArt = 20 or ConvArt = 21 or ConvArt = 22 or ConvArt = 27 then

	
	CateringNummerAlt = ""
	do while not RS.eof

		if CateringNummerAlt <> RS("CateringNummer") Then
			'Response.Write (RS("Datum") & " - " & RS("UserId") & " - " & RS("ConvArt") & " - " & RS("ConvMenu") & " - " & RS("CateringNummer") & "<BR>")
			%>
			
			<tr>
				<td><% = getWochentag(getDatum(RS("Datum"))) %>, <% = getDatum(RS("Datum")) %> </td>
					<td><% = getEventName(RS("CateringNummer")) %></td>
					<td><% = getEventBezeichnung(RS("CateringNummer")) %></td>
					<td><a href="mutieren_bestellung_conv02.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Mu">mutieren</a></td>
				<td><a href="mutieren_bestellung_conv02.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Az">anzeigen</a></td>
				<td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_conv01.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Lo">löschen</a></td>
			</tr>
	
			<%
			CateringNummerAlt = RS("CateringNummer")
		Else
			CateringNummerAlt = RS("CateringNummer")
		end if

	RS.MoveNext
	Loop
	RS.Close


else

	DatumAlt = ""
	do while not RS.eof

		if DatumAlt <> RS("Datum") Then
			'Response.Write (RS("Datum") & " - " & RS("UserId") & " - " & RS("ConvArt") & " - " & RS("ConvMenu") & " - " & RS("CateringNummer") & "<BR>")
			%>
	
			<tr>
				<td>
					<% 	
						if ConvArt = 26 then
							Response.write "Dauerauftrag Mo-Fr"
						else
							Response.write getWochentag(getDatum(RS("Datum"))) & "," 
							Response.write getDatum(RS("Datum"))
						end if
					%>
					</td>
				<td><a href="mutieren_bestellung_conv02.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Mu">mutieren</a></td>
				<td><a href="mutieren_bestellung_conv02.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Az">anzeigen</a></td>
				<td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_conv01.asp?CateringMother=<% = RS("CateringMother") %>&UserId=<% = UserId %>&CateringNummer=<% = RS("CateringNummer") %>&Art=<% = RS("ConvArt") %>&Datum=<% = getDatum(RS("Datum")) %>&M=Lo">löschen</a></td>
			</tr>
			
			<%
			DatumAlt = RS("Datum")
		Else
			DatumAlt = RS("Datum")
		end if

	RS.MoveNext
	Loop
	RS.Close





end if

%>
   

</table>


</body>

</html>
