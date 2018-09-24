<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


SQL = "Select * from tbMenuPlan"
RS.Open SQL,conn,3,3

count = 1

do while count <= 5

    RS.AddNew
    RS("KW")                = Request.Form("txtKW")
    RS("Jahr")              = Request.Form("txtJahr")
    RS("MenuArtId")         = Request.Form("txtMenuArtId")

    if count = 1 then
        RS("Tag")               = "Montag"
        RS("MenuId")            = Request.Form("txtMenuIdMontag")
    end if

    if count = 2 then
        RS("Tag")               = "Dienstag"
        RS("MenuId")            = Request.Form("txtMenuIdDienstag")
    end if

    if count = 3 then
        RS("Tag")               = "Mittwoch"
        RS("MenuId")            = Request.Form("txtMenuIdMittwoch")
    end if
    
    if count = 4 then
        RS("Tag")               = "Donnerstag"
        RS("MenuId")            = Request.Form("txtMenuIdDonnerstag")
    end if

    if count = 5 then
        RS("Tag")               = "Freitag"
        RS("MenuId")            = Request.Form("txtMenuIdFreitag")
    end if

    RS.Update

    count = count + 1

loop




RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=Menüplan erfasst!"

%>


<html>
<body>


</body>
</html>
