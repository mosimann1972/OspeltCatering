<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%



SQL = "Select * from tbSalatBestellung where SalatBestellId = " & Request.Form("txtSalatBestellId") & ""
RS.Open SQL,conn,3,3

if Request.Form("txtSalat1") = "" then RS("S1") = 0 else RS("S1") = Request.Form("txtSalat1") end if
if Request.Form("txtSalat2") = "" then RS("S2") = 0 else RS("S2") = Request.Form("txtSalat2") end if
if Request.Form("txtSalat3") = "" then RS("S3") = 0 else RS("S3") = Request.Form("txtSalat3") end if
if Request.Form("txtSalat4") = "" then RS("S4") = 0 else RS("S4") = Request.Form("txtSalat4") end if
if Request.Form("txtSalat5") = "" then RS("S5") = 0 else RS("S5") = Request.Form("txtSalat5") end if
if Request.Form("txtSalat6") = "" then RS("S6") = 0 else RS("S6") = Request.Form("txtSalat6") end if
if Request.Form("txtSalat7") = "" then RS("S7") = 0 else RS("S7") = Request.Form("txtSalat7") end if
if Request.Form("txtSalat8") = "" then RS("S8") = 0 else RS("S8") = Request.Form("txtSalat8") end if


RS.Update
RS.Close


response.Redirect "main.asp?Meldung=Bestellung mutiert!"


%>


<html>
<body>


</body>
</html>
