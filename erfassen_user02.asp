<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

if Request.Form("txtName") = "" then
    Response.Redirect "erfassen_user01.asp?Meldung=Bitte Name ausfüllen!" 
end if

SQL = "Select * from tbUser"
RS.Open SQL,conn,3,3

RS.AddNew

RS("Username")           = Request.Form("txtName")
RS("Passwort")           = Request.Form("txtPasswort")
RS("Kurzzeichen")        = Request.Form("txtKurzeichen")
RS("Menuart")            = 0
RS("Gruppe")             = Request.Form("txtAsDk")
RS("Kundennummer")       = Request.Form("txtKundennummer")
RS("Inhouse")            = Request.Form("txtInhouse")

RS.Update
RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=User erfasst!"

%>


