<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


Art = Request.Form("txtArt")


'-- Duplikatscheck bei Tageshit ------------------------------------------------- START


DatumSeach = cDate(Request.Form("ComboName"))
xDate = "#" & Month(DatumSeach) & "/" & Day(DatumSeach) & "/" & Year(DatumSeach) & "#"

SQL = "Select * from tbFutterBestellung where UserId = " & Session("UserId") & " and Art = " & Art & " and Datum = " & xDate & ""
RS.Open SQL,conn,3,3

if RS.Recordcount <> 0 then
    RS.Close
    response.Redirect "notfound.asp?Meldung=Datensatz bereits vorhanden!"'
end if
RS.Close


'-- Duplikatscheck -------------------------------------------------------------- END


SQL = "Select * from tbFutter"
RS.Open SQL,conn,3,3

RS.AddNew

RS("Art") = Art
RS("Datum") = Request.Form("ComboName")
RS("FutterName") = Request.Form("txtBezeichnung")
RS("Einheit") = Request.Form("txtEinheit")
RS("Preis") = Request.Form("txtPreis")

RS.Update

RS.Close


'For Each element in Request.Form

'    if left(element,4) = "Tages" then
'        TagesMenu = trim(mid(element,5,100))
'        TagesMenuAnzahl = Request.Form(element)
'        
'        if TagesMenuAnzahl = "" then
'            TagesMenuAnzahl = 0
'        end if
'        
'        speichern 
'        
'    end if
' 
'Next

'----------------------------------------------------------
'Sub speichern

'end sub
'----------------------------------------------------------

response.Redirect "main.asp?Meldung=Tagesbestellung erfasst!"

%>


<html>
<body>


</body>
</html>
