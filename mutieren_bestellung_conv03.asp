<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Dim ConvMenu
Dim ConvMenuAnzahl
Dim SaveConvMenuAnzahl
Dim SuchDatum
Dim TextFeld
Dim ConvArt

UserId = Session("UserId")

ConvArt = Request.Form("Art")

CateringNummer = Request.Form("CateringNummer")

if UserId = 15 then    '15 = Admin
    UserId = Request.Form("UserId")
end if


Dat = getDatum(Request.Form("Datum"))
SuchDatum = "#" & Month(Dat) & "/" & Day(Dat) & "/" & Year(Dat) & "#"


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


    if left(fieldname,4) = "Conv" then

        ConvMenu = trim(mid(fieldName,5,100))
        ConvMenuAnzahl = fieldValue
        TextFeld = Request.Form("txtTextFeld" & ConvMenu)

        Speichern

    end if
    
    
Next

SaveConvMenuAnzahl = 0

'----------------------------------------------------------
Sub speichern

    SQL = "Select * from tbConvBestellung where UserId = " & UserId & " and Datum = " & SuchDatum & " And ConvMenu = " & ConvMenu & " and CateringNummer = " & CateringNummer & ""
    'response.Write (">>>>>>>>" & SQL & "<BR>")
    RS.Open SQL,conn,3,3
	
    RS("Moddate") = Now()
   
    'Bei Catering Brötle wird 1 abgefüllt für Platte oder Teller'
	if ConvArt = 19 then
		SaveConvMenuAnzahl = 1
    end if
    
    
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


    
    Select Case ConvMenuAnzahl
    Case "off, on"
        RS("ConvMenuAnzahl") = SaveConvMenuAnzahl
    Case "off" 
        RS("ConvMenuAnzahl") = 0
    Case else
        RS("ConvMenuAnzahl") = ConvMenuAnzahl
    end select

    RS("TextFeld") = TextFeld  
    RS.Update

    RS.Close

end sub
'----------------------------------------------------------

response.Redirect "main.asp?Meldung=Bestellung mutiert!"

%>


<html>
<body>


</body>
</html>
