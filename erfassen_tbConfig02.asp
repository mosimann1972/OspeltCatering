<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

	SQL = "Select * from tbConfig"
	RS.Open SQL,conn,3,3

	RS.AddNew

	RS("Wert1")             		= Request.Form("txtWert1")
	RS("Wert2")             		= Request.Form("txtWert2")
	RS("Wert3")             		= Request.Form("txtWert3")
	RS("Wert4")             		= Request.Form("txtWert4")
	RS("Bezeichnung")             	= Request.Form("txtBezeichnung")

	RS.Update
	RS.Close
	Set RS = nothing

	response.Redirect "main.asp?Meldung=erfasst!"



%>


