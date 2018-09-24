<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


if Request.form("Art") = "200" then

	if Request.Form("txtConvTitel") = "" then
		Response.Redirect "erfassen_cont_titel01.asp?Meldung=Bitte ContTitel ausfüllen!" 
	end if

	SQL = "Select * from tbConvTitel"
	RS.Open SQL,conn,3,3

	RS.AddNew

	RS("ConvTitelId")           = Request.Form("txtConvTitelId")
	RS("ConvTitel")             = Request.Form("txtConvTitel")

	RS.Update
	RS.Close
	Set RS = nothing

	response.Redirect "main.asp?Meldung=ConvTitel erfasst!"

end if

if Request.form("Art") = "300" then

	if Request.Form("txtHerkunftsland") = "" then
		Response.Redirect "erfassen_cont_titel01.asp?Meldung=Bitte Land ausfüllen!" 
	end if

	SQL = "Select * from tbHerkunftsland"
	RS.Open SQL,conn,3,3

	RS.AddNew

	RS("Herkunftsland")             = Request.Form("txtHerkunftsland")

	RS.Update
	RS.Close
	Set RS = nothing

	response.Redirect "main.asp?Meldung=Herkunftsland erfasst!"

end if


'Response.Write SQL


%>


