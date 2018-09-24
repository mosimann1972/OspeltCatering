<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Dim TagesMenu
Dim TagesMenuAnzahl



'-- Duplikatscheck -------------------------------------------------------------- START


DatumSeach = cDate(Request.Form("ComboName"))
xDate = "#" & Month(DatumSeach) & "/" & Day(DatumSeach) & "/" & Year(DatumSeach) & "#"

SQL = "Select * from tbFutterBestellung where UserId = " & Session("UserId") & " and Datum = " & xDate & ""
RS.Open SQL,conn,3,3

if RS.Recordcount <> 0 then
    RS.Close
    response.Redirect "notfound.asp?Meldung=Datensatz bereits vorhanden!"'
end if
RS.Close


'-- Duplikatscheck -------------------------------------------------------------- END


SQL = "Select * from tbFutterBestellung"
RS.Open SQL,conn,3,3

RS.AddNew

RS("FutterId") = Request.Form("txtFutterId")
RS("UserId") = Session("UserId")
RS("Datum") = Request.Form("ComboName")
RS("Art") = Request.Form("txtArt")
RS("FutterWert") = Request.Form("txtFutterWert")
RS("Moddate") = Now()

RS.Update

RS.Close



response.Redirect "main.asp?Meldung=Tagesbestellung erfasst!"

%>


<html>
<body>


</body>
</html>
