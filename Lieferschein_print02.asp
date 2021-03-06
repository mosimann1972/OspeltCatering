<%
Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

SetLocale("de")

Dim ConvArt
Dim UserId
Dim SuchDatum
Dim Dat
Dim CheckboxList1
Dim CheckboxList2


'-----------------------------------------------------------------------------

UserId = Request.Form("txtUserId")

Dat = getDatum(Request.Form("txtDatum"))

SuchDatum = "#" & Month(Dat) & "/" & Day(Dat) & "/" & Year(Dat) & "#"

CheckboxList1 = Request.Form("list1")
CheckboxList2 = Request.Form("CheckGruppe")

'-----------------------------------------------------------------------------

if UserId = "" then     

Set RSX  = Server.CreateObject("ADODB.Recordset")   

Dim CheckboxListWerte2
CheckboxListWerte2 = Split(CheckboxList2, ",")

        
For x1 = 0 To UBound(CheckboxListWerte2)
    
    strGruppe = trim(CheckboxListWerte2(x1))
    
    SQLX = "Select * from tbUser Where Gruppe = '" & strGruppe & "' Order By Sort"
    RSX.Open SQLX,conn,3,3

	do while not rsX.eof

		'Response.write RSX("UserId") & "-" & RSX("UserName") &  "<bR />"
        UserId = RSX("UserId")
        ReadCheckBoxConv
		%>
			<h5 style="page-break-before:always"></h5>
        <%
	rsX.movenext
	loop
	rsX.close

Next

Else

    ReadCheckBoxConv

end if


'-----------------------------------------------------------------------------

Function ReadCheckBoxConv
        
    Dim CheckboxListWerte1
    CheckboxListWerte1 = Split(CheckboxList1, ",")

    PrintHeader

    For n1 = 0 To UBound(CheckboxListWerte1)
        ConvArt = CheckboxListWerte1(n1)
        
        if ConvArt = 0 then
            SQLSelectMenu
			if RS.RecordCount > 0 then
                PrintLieferscheinMenu
            end if
            DBClose
        Else

			if ConvArt = 2 then	'Men�Suppe
				SQLSelectMenuSuppe
				if RS.RecordCount > 0 then
					PrintLieferscheinMenuSuppe
				end if
			else
				SQLSelect
				if RS.RecordCount > 0 then
					PrintLieferschein
				end if
			end if

            DBClose
        end if


    Next

End Function

'-----------------------------------------------------------------------------
Sub PrintHeader

    Response.Write "<table width=""100%"" border=""0""><tr><td class=""Inhalt"">"
    Response.Write "<B>Lieferschein</B> "
    Response.Write "<B>" & getRestaurantName(UserId) & "</B>"
    Response.Write "</td><td align=""right"" class=""Inhalt"">"
    Response.Write "<b>" & getWochentag(getDatum(Dat)) & "</B>,"
    Response.Write "<b>" & getDatum(Dat) & "</B>"
    Response.Write "</td></tr></table>"
    
end sub
'-----------------------------------------------------------------------------
Sub SQLSelect

    SQL = "SELECT * FROM (tbUser INNER JOIN tbConvBestellung" _
        & " ON tbUser.UserId = tbConvBestellung.UserId) INNER JOIN tbConv" _
        & " ON tbConvBestellung.ConvMenu = tbConv.ConvId WHERE" _
        & " (((tbConvBestellung.Datum)= " & SuchDatum & "" _
        & " and (tbConvBestellung.ConvArt) = " & ConvArt & "" _
        & " and (tbConvBestellung.UserId) = " & UserId & " )) Order By ConvBestellId"

        'Response.Write SQL

    RS.Open SQL,conn,3,3

    
end sub
'-----------------------------------------------------------------------------
Sub SQLSelectMenu

    KW = getKWid(Dat)
    Jahr = year(Dat)
    Tag = getWochentag(Dat)
    
    SQL = "Select * from tbBestellung where UserId = " & UserId & " and Tag = '" & Tag & "' and KW = " & KW & " AND Jahr = "& Jahr & ""
    'Response.Write SQL & "<bR>"
    RS.Open SQL,conn,3,3
    
end sub
'-----------------------------------------------------------------------------
Sub SQLSelectMenuSuppe

    KW = getKWid(Dat)
    Jahr = year(Dat)
    Tag = getWochentag(Dat)
    
    SQL = "Select * from tbBestellung where MenuArtId = 5 and UserId = " & UserId & " and Tag = '" & Tag & "' and KW = " & KW & " AND Jahr = "& Jahr & ""
    'Response.Write SQL & "<bR>"
    RS.Open SQL,conn,3,3
    
end sub
'-----------------------------------------------------------------------------
Sub PrintLieferschein
    
    FirstFlag = true

    Response.write getCateringInfos(RS("CateringNummer"))  & "<BR><BR>"
	
    Do while not rs.eof
    
        if RS("ConvMenuAnzahl") <> 0 then

            if FirstFlag = true then
                Response.Write "<B>" & getConvTitel(ConvArt) & "</B><BR>"
                FirstFlag = False
            end if
        
            Response.Write "<table border=""0"" width=""100%"" class=""Inhalt"">"
            Response.Write "<tr><td class=""Inhalt"">"
            Response.Write getConvMenu(RS("ConvMenu")) 
			
			HL = ""
			HL = getHerkunftsland(RS("HerkunftslandId"))
			if HL <> "" then
				Response.Write "<font size=""1"">&nbsp;&nbsp; Herkunftsland:" & HL & "</font>"
			end if
					
            if RS("Textfeld") <> "" then Response.write " (" & RS("TextFeld") & ")" end if
    
            Response.Write "</td><td align=""right"" class=""Inhalt""><font size=""1"">"
            Response.Write RS("Einheit")
            Response.Write "</font></td><td width=""50"" align=""right"" class=""Inhalt"">"
            'Response.Write RS("ConvMenuAnzahl")
           
            if GetCheckFeld(RS("ConvMenu")) = "CF" then
                if RS("ConvMenuAnzahl") = 0 then
                    Response.write "<input type=""checkbox"" />"
                else
                    Response.write "<input type=""checkbox"" checked />"
                end if
            else
                Response.write RS("ConvMenuAnzahl") 
            end if

            Response.Write "</td></tr></table>"
    
        end if


    rs.moveNext
    Loop
   
end sub

'-----------------------------------------------------------------------------
Sub PrintLieferscheinMenu

    FirstFlag = true

    Do while not rs.eof
    
        if RS("HS") <> 0 or RS("SB1") <> 0 or RS("SB2") <> 0 then

            if FirstFlag = true then
                Response.Write "<B>" & getConvTitel(ConvArt) & "</B><BR>"
                FirstFlag = False
            end if
        
            Response.Write "<table border=""0"" width=""100%"" class=""Inhalt"">"
            Response.Write "<tr><td class=""Inhalt"">"
            Response.Write getMenuArt(RS("MenuArtId")) 
            Response.Write "</td>"
            Response.Write "<td align=""right"" class=""Inhalt"">"
            Response.Write "HS:" & RS("HS")
    
            if RS("SB1") <> 0 then Response.Write " SB:"
            if RS("SB1") > 0 then Response.Write "+"
            if RS("SB1") <> 0 then Response.Write RS("SB1")

            if RS("SB2") <> 0 then Response.Write " Ge/Sa:"
            if RS("SB2") > 0 then Response.Write "+"
            if RS("SB2") <> 0 then Response.Write RS("SB2")
            
            Response.Write "</td></tr>"

            Response.Write "<tr><td colspan=""2""><font size=""1"">"
            Response.Write getMenuName(RS("MenuId"))
            Response.Write "</font>"
            Response.Write "</td></tr></table>"
    
        end if


    rs.moveNext
    Loop
            
   
end sub

'-----------------------------------------------------------------------------
Sub PrintLieferscheinMenuSuppe

    FirstFlag = true

    Do while not rs.eof
    
        if RS("HS") <> 0 or RS("SB1") <> 0 then

            if FirstFlag = true then
                Response.Write "<B>" & getConvTitel(ConvArt) & "</B><BR>"
                FirstFlag = False
            end if
        
            Response.Write "<table border=""0"" width=""100%"" class=""Inhalt"">"
            Response.Write "<tr><td class=""Inhalt"">"
            Response.Write getMenuArt(RS("MenuArtId")) 
            Response.Write "</td>"
            Response.Write "<td align=""right"" class=""Inhalt"">"
            Response.Write "Suppe:" & RS("HS")
    
            if RS("SB1") <> 0 then Response.Write " Einlage:"
            if RS("SB1") > 0 then Response.Write "+"
            if RS("SB1") <> 0 then Response.Write RS("SB1")

            Response.Write "</td></tr>"

            Response.Write "<tr><td colspan=""2""><font size=""1"">"
            Response.Write getSuppenName(RS("MenuId"))
            Response.Write "</font>"
            Response.Write "</td></tr></table>"
    
        end if


    rs.moveNext
    Loop
   
end sub
'-----------------------------------------------------------------------------


Sub DBClose

    RS.Close

end sub
'----------------------------------------------


%>

<!--#INCLUDE FILE="titel.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
<head>
<LINK rel="stylesheet" type="text/css" href="ospeltLieferschein.css">
<title>Lieferschein Ospelt Catering</title>
</head>

<body>

<td align="right"></td>

</body>
</html>


