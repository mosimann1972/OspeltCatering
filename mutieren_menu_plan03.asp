<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%



SQL = "Select * from tbMenuPlan where KW = " & Request.Form("txtKW") & " and Jahr = " & Request.Form("txtJahr") & " and MenuArtId = " & Request.Form("MenuArtId") & " Order By MenuPlanId"
RS.Open SQL,conn,3,3

count = 1

do while not RS.EOF

        if count = 1 then
            RS("MenuId")            = Request.Form("txtMenuIdMontag")
        end if

        if count = 2 then
            RS("MenuId")            = Request.Form("txtMenuIdDienstag")
        end if

        if count = 3 then
           RS("MenuId")            = Request.Form("txtMenuIdMittwoch")
        end if
        
        if count = 4 then
            RS("MenuId")            = Request.Form("txtMenuIdDonnerstag")
        end if

        if count = 5 then
            RS("MenuId")            = Request.Form("txtMenuIdFreitag")
        end if

        RS.Update

        count = count + 1

RS.MoveNext
Loop

RS.Close
Set RS = nothing

'Response.Write SQL
response.Redirect "main.asp?Meldung=Menüplan mutiert!"

%>


<html>
<body>


</body>
</html>
