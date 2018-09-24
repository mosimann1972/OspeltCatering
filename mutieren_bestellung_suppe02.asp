<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<!--#INCLUDE FILE="deadlinecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")

BestellUebersichtId = Request.QueryString("BestellUebersichtId") 
Mutationsflag = Request.QueryString("M")
KW = Request.QueryString("KW")
Jahr = Request.QueryString("Jahr")
MenuArtId = Request.QueryString("Menu")


'------------------------------------------------------


UserId = Session("UserId")
AdminFlag = false

if UserId = 15 then    '15 = Admin
    AdminFlag = true
end if


SQL = "Select * from tbBestellung where BestellUebersichtId = " & BestellUebersichtId & " Order by BestellId"
'Response.Write ">>>>>>" & SQL & "<bR>"
RS.Open SQL,conn,3,3



if Adminflag = false then
    deadlinecheck(getStartDatum(RS("KW"),RS("Jahr")))
end if 



%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>


<body>

<B>Suppe mutieren</B> <% if AdminFlag = true then %><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% = getRestaurantName(RS("UserId")) %></b></font><% end if %>
<hr size="1">
<br />
<% = getKW(Kw,Jahr) %>
<B> <% = getMenuArt(MenuArtId) %></B>

<br /><br />

<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form method="POST" action="mutieren_bestellung_suppe03.asp">


<tr>
    <td>&nbsp;</td>
    <td><B>Suppe</B></td>
    <td><B>Einlage</B></td>
    <td>Suppe</td>
</tr>

<% do while not rs.eof %>

<input type="hidden" name="txtBestellId" value=<% = RS("BestellId") %> />

<tr>
    <td><% = RS("Tag") %></td>
    <td><input type="text" value=<% = RS("HS") %> name="txtHS<% = RS("Tag") %>" size="5"></td>
    <td>

        <select name="txtSB1PlusMinus<% = RS("Tag") %>">
            <option><% = RS("PM_SB1") %></option>
            <option></option>
            <option>+</option>
            <option>-</option>
        </select>

        <%
        
        p = instr(1,RS("SB1"),"-") 
        if p <> 0 then SB1 = mid(RS("SB1"),2) else SB1 = RS("SB1") end if
        p = 0
        
        %>

        <input type="text" value=<% = SB1 %> name="txtSB1<% = RS("Tag") %>" size="5">
       
    </td>
    <td>
        <font size="1">
            <% = getSuppenName(RS("MenuId")) %>
        </font>
    </td>
</tr>    
    
	
<% RS.Movenext
Loop %>

</table>
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

<BR />
<BR />


</body>
</html>
