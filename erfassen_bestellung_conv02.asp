<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<!--#INCLUDE FILE="deadlinecheck.asp"-->

<%

Dim DatumSearch
Dim ConvMenu
Dim ConvMenuAnzahl
Dim SaveConvMenuAnzahl
Dim ConvArt
Dim UserId
Dim Zufallszahl
Dim Bestelldatum
Dim QuickLieferscheinConvId

ZufallsZahl = 0

Bestelldatum = CDate(Request.Form("BestellDatum"))

CateringMother = Request.Form("txtCateringTitelMother")

UserId = Session("UserId")

AdminFlag = false

if UserId = 15 or UserId = 17 then    '15 = Admin  oder 17=Küche
	UserId = Request.Form("txtUserId")
	AdminFlag = true
end if


ConvArt = Request.Form("Art")

	'MaxWertBestellung Es wird geschaut, wieviele Häckchen gesetzt wurden. Falls zuviel => Abbruch
	if ConvArt = 21 then
		MaxWertBestellung
	end if


	' Catering können mehrere Einträge pro Tag erfasst werden
	if ConvArt <> 19 and ConvArt <> 20 and ConvArt <> 21 and ConvArt <> 22 and ConvArt <> 27 then
		Duplikatscheck
	else
		ZufallsZahlGenerieren
	end if

	'QuickLieferschein und Catering Quick'
	if ConvArt = 24 then
		if Request.form("txtQuickText") <> "" then
			Speichern_tbConv_ConvId_Quick(ConvArt)
			Speichern_tbConvBestellung_ConvId_Quick ConvArt,""	
		end if
	end if

	'Catering Quick'
	if ConvArt = 27 then
		if Request.form("txtQuickText") <> "" then
			Speichern_tbConv_ConvId_Quick(ConvArt)
			Speichern_tbConvBestellung_ConvId_Quick ConvArt,ZufallsZahl	
		end if
	end if

	if AdminFlag = false then
		DeadLineCheck(Bestelldatum)
	end if


	'Wert von Anzahl Bestellungen ermitteln. Wird für Speicherung gebraucht.'
	for n = 1 to Request.Form.Count
	
		fieldName = Request.Form.Key(n)
		fieldValue = Request.Form.Item(n) 
	
		if left(fieldname,4) = "Conv" then
			ConvMenuAnzahl = fieldValue
		
			if left(ConvMenuAnzahl,3) <> "off" then
				SaveConvMenuAnzahl = ConvMenuAnzahl
			end if
	
		end if
	
	next

	
	For i = 1 to Request.Form.Count
    
		fieldName = Request.Form.Key(i)
		fieldValue = Request.Form.Item(i) 

		'Response.Write "0>>>>>>" & i & "<BR>"
		'Response.Write "1>>>>>>" & fieldName & "<BR>"
		'Response.Write "2>>>>>>" & fieldValue & "<BR>"

		
		if left(fieldname,4) = "Conv" then

			ConvMenu = trim(mid(fieldName,5,100))
			ConvMenuAnzahl = fieldValue
			TextFeld = Request.Form("txtTextFeld" & ConvMenu)
		
			'Response.Write "3>>>>>>" & fieldName & "<BR>"
			'Response.Write "4>>>>>>" & fieldValue & "<BR>"
			'Response.Write "-------------------------" & "<BR>"
		
			if ConvMenuAnzahl = "" then
				ConvMenuAnzahl = 0
			end if

			'Response.Write "speichern" & "<BR>"

			Speichern

		end if
    
	Next
	
		'Catering Bestellungen werden noch in der Tabelle tbCatering abgespeichert
		if ConvArt = 19 or ConvArt = 20 or ConvArt = 21 or ConvArt = 22 or ConvArt = 27 then
			SpeichernCatering
		end if
	
'----------------------------------------------------------
Sub speichern

    SQL = "Select * from tbConvBestellung"
    RS.Open SQL,conn,3,3

	RS.AddNew
		
    RS("Datum") = Bestelldatum
    RS("UserId") = UserId
    RS("Gruppe") = getGruppe(UserId)
    RS("Moddate") = Now()

    RS("ConvMenu") = ConvMenu
    RS("ConvArt") = ConvArt
    'RS("ConvMenuAnzahl") = Replace(ConvMenuAnzahl,".",",")
	
	'Bei Catering Brötle wird 1 abgefüllt für Platte oder Teller'
	if ConvArt = 19 then
		SaveConvMenuAnzahl = 1
	end if

	Select Case ConvMenuAnzahl
		Case "off, on"
			RS("ConvMenuAnzahl") = SaveConvMenuAnzahl
		Case "off" 
			RS("ConvMenuAnzahl") = 0
		Case else
			RS("ConvMenuAnzahl") = ConvMenuAnzahl
	end select

	'Dauerauftrag
	if ConvArt = 26 then

		Mon = "Mo" & ConvMenu
			if Request.form(Mon) = "on" then RS("Montag") = True else RS("Montag") = false				

		Die = "Di" & ConvMenu
			if Request.form(Die) = "on" then RS("Dienstag") = True else RS("Dienstag") = false				
		
		Mit = "Mi" & ConvMenu
			if Request.form(Mit) = "on" then RS("Mittwoch") = True else RS("Mittwoch") = false				
		
		Don = "Do" & ConvMenu
			if Request.form(Don) = "on" then RS("Donnerstag") = True else RS("Donnerstag") = false				
		
		Fre = "Fr" & ConvMenu
			if Request.form(Fre) = "on" then RS("Freitag") = True else RS("Freitag") = false				

	end if

	
	RS("TextFeld") = TextFeld
	RS("CateringNummer") = ZufallsZahl

	if CateringMother <> "" then
		RS("CateringMother") = CateringMother
	else
		RS("CateringMother") = 0
	end if
       
    RS.Update

    RS.Close

end sub
'----------------------------------------------------------
Sub SpeichernCatering

    SQL = "Select * from tbCatering"
    RS.Open SQL,conn,3,3

    RS.AddNew

    RS("EventName") = Request.Form("txtEventName")
    RS("EventBezeichnung") = Request.Form("txtEventBezeichnung")
    RS("Bemerkungen") = Request.Form("txtEventBemerkung")
	RS("CateringNummer") = ZufallsZahl
	RS("Moddate") = NOW()
       
    RS.Update

    RS.Close

end sub
'----------------------------------------------------------
'Zufallsnummer für CateringNummer generieren
Sub ZufallsZahlGenerieren

	SetLocale("de-DE")
	strModdate = NOW()

	txtTime = Replace(TIME(),":","")
	txtDate = Replace(DATE(),".","")

	txtIp = Replace(Request.ServerVariables("REMOTE_ADDR"),".","")
	txtIp = right(txtIp,2)

	counter = txtTime
	dim txtZahl
	randomize()
	txtZahl= int(rnd*counter)+1

	s = txtZahl
	j = CLng(txtZahl)  
	For i = 1 To Len(s)  
		erg = erg + CInt(Mid(s, i, 1))  
	Next 

	Zufallszahl = txtTime & erg

end sub

'--------------------------------------------------------
Sub MaxWertBestellung

	'Wert von Anzahl Bestellungen ermitteln. Wird für Speicherung gebraucht.'
	for b = 1 to Request.Form.Count

		fieldName = Request.Form.Key(b)
		fieldValue = Request.Form.Item(b) 

		'Response.write ">>1 "	& fieldName & "<BR>"
		'Response.write ">>2 "	& fieldValue & "<BR>"

		if 	fieldName = "txtCateringTitelMother" then
			MaxAnzahl =  getMaxWertBestellung(fieldValue)
		end if


		if left(fieldname,4) = "Conv" then
			ConvMenuAnzahl = fieldValue
		
			if left(ConvMenuAnzahl,7) = "off, on" then
				counter = counter + 1
				'Response.write ">>>>>>>>>>>>>" & counter  & "<BR>"
			end if

		end if

		

	next


	if counter > MaxAnzahl then
		response.Redirect "notfound.asp?Meldung=Achtung. Zu viele Beilage/Varianten erfasst"
	end if

	'Response.write "----------------->>>>>>>>>>>>1 " & MaxAnzahl & "<BR>"
	'Response.write "----------------->>>>>>>>>>>>2 " & counter & "<BR>"


end sub
'--------------------------------------------------------
Sub Duplikatscheck	

	DatumSearch = Bestelldatum

	SetLocale("de")
	datDatum = CDate(DatumSearch)

	xDate = "#" & Month(datDatum) & "/" & Day(datDatum) & "/" & Year(datDatum) & "#"

	SQL = "Select * from tbConvBestellung where UserId = " & UserId & " and Datum = " & xDate & " and ConvArt = " & ConvArt & ""
	'Response.Write ">>>>>>>" & SQL & "<bR>"
	RS.Open SQL,conn,3,3

	if RS.Recordcount <> 0 then
		RS.Close
		response.Redirect "notfound.asp?Meldung=Bestellung bereits vorhanden!"'
	end if
	RS.Close
end sub
'--------------------------------------------------------
Sub Speichern_tbConv_ConvId_Quick(intConvArt)

	SQL = "Select * from tbConv"
	RS.Open SQL,conn,3,3

	RS.AddNew

	RS("ConvArt")           = intConvArt
	RS("ConvText")          = Request.Form("txtQuickText")
	RS("ConvTextShort")     = Request.Form("txtQuickText")
	RS("Einheit")           = Request.Form("txtEinheit")

	if Request.Form("txtQuickPreis") <> "" then
		RS("PreisMwst")             = Request.Form("txtQuickPreis")
		RS("Preis")             = Request.Form("txtQuickPreis")
	else
		RS("PreisMwst") = 0
		RS("Preis") = 0
	end if
		
	RS("Aktiv") = true

	RS.Update

	QuickLieferscheinConvId = RS("ConvId")
	
	RS.Close
	
end sub
'----------------------------------------------------------
Sub Speichern_tbConvBestellung_ConvId_Quick(intConvArt,intZufallszahl)

    SQL = "Select * from tbConvBestellung"
    RS.Open SQL,conn,3,3

	if intZufallszahl = "" then
		intZufallszahl = 0
	end if


	RS.AddNew
		
    RS("Datum") = Bestelldatum
    RS("UserId") = UserId
    RS("Gruppe") = getGruppe(UserId)
    RS("Moddate") = Now()

    RS("ConvMenu") = QuickLieferscheinConvId
    RS("ConvArt") = intConvArt
	RS("ConvMenuAnzahl") = Request.Form("txtQuickAnzahl")
	RS("CateringNummer") = intZufallszahl
	
	RS.Update
	RS.Close
	
	
end sub
'----------------------------------------------------------


response.Redirect "main.asp?Meldung=Bestellung erfasst!"


%>


<html>
<body>


</body>
</html>
