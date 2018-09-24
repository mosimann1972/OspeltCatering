<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

SQL = "Select * from tbJahr"
RS.Open SQL,conn,3,3

RS.AddNew

RS("Jahr")           = Request.Form("txtJahr")

RS.Update
RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=Jahr erfasst!"

%>


