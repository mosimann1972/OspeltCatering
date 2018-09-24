
<%

'-- DeadLineCheck -------------------------------------------------------------- START

SetLocale("de")


'Stundenzahl wird plus 24 gezählt => Deadline nächster Tag
'DatumJetzt = Now()

'Datum = Now()

D1 = "28.04.2014 00:00:00"
D2 = "27.04.2014 08:00:00"

'D1 = "03.04.2014 17:00:00"
'D2 = "08.04.2014 00:00:00"



'StundenZahl = DateDiff("h",#1/1/2014#,Datum)
StundenZahl = DateDiff("h",D1,D2)

'StundenZahl = DateDiff("h",D1,Datum)

Response.Write ">>>>>>>>" & StundenZahl & "<BR>"
Response.Write ">>>>>>>>" & D1 & "<BR>"
Response.Write ">>>>>>>>" & D2 & "<BR>"

'StundenZahl = StundenZahl + 24

'DatumBestellung = getDatum(Request.QueryString("Datum"))
'xDateBestellung = "#" & Month(DatumBestellung) & "/" & Day(DatumBestellung) & "/" & Year(DatumBestellung) & "#"



 %>

</body>

</html>
