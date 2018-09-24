<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Art = Request.Form("txtArt")

'-----------------------------------
'Bestellung Suppe Oder Wellness

if Art = 100 then

    MenuArtId = 1

    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & "" _
        & " and KWId = " & Request.Form("txtKWId") & " and Tag = '" & Request.Form("txtTag") & "' and MenuArtId = " & MenuArtId & ""
    RS.Open SQL,conn,3,3

    if RS.Recordcount = 0 then
	    response.Redirect "notfound.asp?Meldung=Kein Menü in Datenbank gefunden!"
    end if
    
    RS("Suppe") = Request.Form("txtTagesbestellung")

    RS.Update

RS.Close
Set RS = nothing

end if

'-----------------------------------
'Bestellung Suppe Oder Wellness

if Art = 400 then

    MenuArtId = 2

    SQL = "Select * from tbBestellung where UserId = " & Session("UserId") & "" _
        & " and KWId = " & Request.Form("txtKWId") & " and Tag = '" & Request.Form("txtTag") & "' and MenuArtId = " & MenuArtId & ""
    RS.Open SQL,conn,3,3


    if RS.Recordcount = 0 then
	    response.Redirect "notfound.asp?Meldung=Kein Menü in Datenbank gefunden!"
    end if


    RS("Wellness") = Request.Form("txtTagesbestellung")

    RS.Update

    RS.Close


end if

'-----------------------------------
'Bestellung Tageserfassung

if Art <> 100 and Art <> 400 then

SQL = "Select * from tbTagesBestellung"
RS.Open SQL,conn,3,3

    RS.AddNew

    RS("UserId")                  = Session("UserId")
    RS("KWId")                    = Request.Form("txtKWId")
    RS("Tag")                     = Request.Form("txtTag")
    RS("Art")                     = Request.Form("txtArt")
    RS("TagesId")                 = Request.Form("txtTagesId")
    RS("TagesBestellWert")        = Request.Form("txtTagesbestellung")
                   
    RS.Update

    RS.Close
    Set RS = nothing

end if

response.Redirect "main.asp?Meldung=Tages Bestellung erfasst!"

'-----------------------------------

%>


<html>
<body>


</body>
</html>
