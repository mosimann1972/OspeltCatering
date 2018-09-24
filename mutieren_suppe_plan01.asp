<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

'-----------------------------------------------------
'Da bereits Bestellungen erfasst sein können, kann der Menüplan nicht gelöscht werden
if Request.QueryString("M") = "Lo" then

	response.Redirect "notfound.asp?Meldung=Suppenplan kann nicht gelöscht werden!"	

    'SQL = "Delete * from tbMenuPlan where Jahr = " & Request.QueryString("Jahr") & " and KW = " & Request.QueryString("KW") & " And MenuArtId = " & Request.QueryString("MenuArtId") & ""
    'RS.Open SQL,conn,3,3

end if

'-----------------------------------------------------

SQL = "Select * from tbMenuPlan Where MenuArtId = 5 Order by Jahr Desc, KW Desc"
RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if


%>

<html>

<link href="ospelt.css" rel="stylesheet" type="text/css" />


<head>
<title>------</title>
</head>


<body>

<B>Suppenplan mutieren/löschen</B>
<hr size="1">

<br />

<table  cellpadding="5" cellspacing="0" border="0">


<% 

Counter = 1
FirstFlag = True

do while not RS.eof

if FirstFlag = true then

    %>
        
        <tr>
            <td><% = getKW(RS("KW"),RS("Jahr")) %></td>
            <td><a href="mutieren_suppe_plan02.asp?Jahr=<% = RS("Jahr") %>&Kw=<% = RS("KW") %>&MenuArtId=<% = RS("MenuArtId") %>&M=Mu">mutieren</a></td>
            <td><a onclick="return confirm('Wirklich loeschen?')" href="mutieren_menu_plan01.asp?Jahr=<% = RS("Jahr") %>&Kw=<% = RS("KW") %>&MenuArtId=<% = RS("MenuArtId") %>&M=Lo">löschen</a></td>
        </tr>
    
        <% 
        MenuArtIdAlt = RS("MenuArtId")
        KWAlt = RS("KW")
        FirstFlag = False

else

    if MenuArtIdAlt <> RS("MenuArtId") Or KWAlt <> RS("KW") then
    
    %>

        <% if Counter <= 14 then %>
    
        <tr>
            <td><% = getKW(RS("KW"),RS("Jahr")) %></td>
            <td><a href="mutieren_suppe_plan02.asp?Jahr=<% = RS("Jahr") %>&Kw=<% = RS("KW") %>&MenuArtId=<% = RS("MenuArtId") %>&M=Mu">mutieren</a></td>
            <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_menu_plan01.asp?Jahr=<% = RS("Jahr") %>&Kw=<% = RS("KW") %>&MenuArtId=<% = RS("MenuArtId") %>&M=Lo">löschen</a></td>
        </tr>
    
        <%
        
        end if

        MenuArtIdAlt = RS("MenuArtId")
        KWAlt = RS("KW")
        Counter = Counter + 1


    end if
   
end if

RS.MoveNext
Loop
RS.Close


%>


   

</table>

</body>

</html>
