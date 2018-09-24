<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

    '------------------------------------------------------------------------'
    function get_tbConig (f)

    if f = "" then
		FK = 0
	else
		FK = int(f)
	end if

        if FK <> 0 then
            SQLFunc = "Select * FROM tbConfig where ConfigId = " & FK & ""
            RSFunc.Open SQLFunc,conn,3,3
                if RSFunc.recordcount <> 0 then
                    get_tbConig = RSFunc("Wert1")
                end if
            RSFunc.close
        end if

    end function
    '------------------------------------------------------------------------'


    SQL = "Select * from tbJahr where UserId = " & Session("UserId") & ""
    RS.Open SQL,conn,3,3
    
    if RS("Jahr") = get_tbConig(1) then
        RS("Jahr") = get_tbConig(2)
    else
        RS("Jahr") = get_tbConig(1)
    end if
        
    RS.Update
    RS.Close

    Select Case Request.QueryString("Seite")

    Case "menu_bestellung"
        response.Redirect "menu_bestellung.asp"
    Case "menu_admin"
        response.Redirect "menu_admin.asp"
    Case "menu_kueche"
        response.Redirect "menu_kueche.asp"
    Case "menu_catering"
        response.Redirect "menu_catering.asp"
    Case "menu_papeterie"
        response.Redirect "menu_papeterie.asp"        
    Case else
        response.Redirect "menu_bestellung.asp"
    end select

%>


<html>
<body>



</body>
</html>
