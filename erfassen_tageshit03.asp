RS("KWId")          = Request.Form("txtKWid")<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


if Request.Form("txtBezeichnung") = "" then
    Response.Redirect "erfassen_tagesbestellung01.asp?Meldung=Bitte Felder ausfüllen!&Art=" & Request.Form("txtArt") & "" 
end if

SQL = "Select * from tbTagesHit"
RS.Open SQL,conn,3,3

RS.AddNew

strReplace = replace(Request.Form("txtPreis"),".",",")

RS("Art")           = Request.Form("txtArt")
RS("KW")            = Request.Form("txtKW")
RS("Jahr")          = Request.Form("txtJahr")
RS("Tag")           = Request.Form("txtTag")
RS("TagesName")     = Request.Form("txtBezeichnung")
RS("Einheit")       = Request.Form("txtEinheit")
RS("Preis")         = strReplace



RS.Update
RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=Tageshit erfasst!"

%>


<html>
<body>


</body>
</html>
