<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


if Request.Form("txtBezeichnung") = "" then
    Response.Redirect "erfassen_zutaten01.asp?Meldung=Bitte Felder ausfüllen!&Art=" & Request.Form("txtArt") & "" 
end if

SQL = "Select * from tbZutaten"
RS.Open SQL,conn,3,3

RS.AddNew

'strReplace = replace(Request.Form("txtPreis"),".",",")

RS("ZutatenArt")    = Request.Form("txtArt")
RS("ZutatenName")   = Request.Form("txtBezeichnung")
RS("Einheit")       = Request.Form("txtEinheit")

if Request.Form("txtPreis") <> "" then
    RS("Preis")           = Request.Form("txtPreis")
else
    RS("Preis") = 0
end if

if Request.Form("txtPreisMwSt") <> "" then
    RS("PreisMwSt")           = Request.Form("txtPreisMwSt")
else
    RS("PreisMwSt") = 0
end if

if Request.Form("txtPreisInhouse") <> "" then
    RS("PreisInhouse")           = Request.Form("txtPreisInhouse")
else
    RS("PreisInhouse") = 0
end if


RS.Update
RS.Close
Set RS = nothing

response.Redirect "main.asp?Meldung=Zutaten erfasst!"

%>


<html>
<body>


</body>
</html>
