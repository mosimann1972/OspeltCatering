<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


SQL = "Select * from tbMenu"
RS.Open SQL,conn,3,3

RS.AddNew

RS("MenuArtId")                 = 5

if Request.Form("txtMenuSuppe01") <> "" then 
    RS("HS")                 = Request.Form("txtMenuSuppe01")
end if

if Request.Form("txtMenuSuppe02") <> "" then 
    RS("SB1")                 = Request.Form("txtMenuSuppe02")
end if

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

if Request.Form("txtBezeichnung") <> "" then
    RS("Bezeichnung")           = Request.Form("txtBezeichnung")
end if

RS("Aktiv")                 = true

RS.Update
RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=Suppe erfasst!"

%>


<html>
<body>


</body>
</html>
