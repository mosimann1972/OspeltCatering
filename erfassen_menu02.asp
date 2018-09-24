<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


SQL = "Select * from tbMenu"
RS.Open SQL,conn,3,3

RS.AddNew
RS("MenuArtId")             = Request.Form("txtMenuArtId")


if Request.Form("txtSuppe") <> "" then 
    RS("Suppe")                 = Request.Form("txtSuppe")
end if

if Request.Form("txtWellness") <> "" then
    RS("Wellness")              = Request.Form("txtWellness")
end if

if Request.Form("txtHS") <> "" then
    RS("HS")                    = Request.Form("txtHS")
end if 

if Request.Form("txtSB1") <> "" then
    RS("SB1")                   = Request.Form("txtSB1")
end if 

if Request.Form("txtSB2") <> "" then
    RS("SB2")                   = Request.Form("txtSB2")
end if 

if Request.Form("txtPreis") <> "" then
    RS("Preis")           = Request.Form("txtPreis")
else
    RS("Preis") = 0
end if


if Request.Form("txtPreisMwst") <> "" then
    RS("PreisMwst")           = Request.Form("txtPreisMwst")
else
    RS("PreisMwst") = 0
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
response.Redirect "main.asp?Meldung=Menü erfasst!"

%>


<html>
<body>


</body>
</html>
