<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<!--#INCLUDE FILE="deadlinecheck.asp"-->

<%

UserId = Session("UserId")
AdminFlag = false
Jahr = Year(now())


if UserId = 15 then    '15 = Admin
    UserId = ""
    AdminFlag = true
    UserId = Request.Form("txtUserId")

    if UserId = "" then
        UserId = Request.QueryString("UserId")
    end if

end if

'---Löschen und DeadLineCheck--------------------------------------------------

if Request.QueryString("M") = "Lo" then

    KW = Request.QueryString("KW")
    Jahr = Request.QueryString("Jahr")

    
    if Adminflag = false then
        deadlinecheck(getStartDatum(KW,Jahr))
    end if 
    
    SQL = "Select * from tbBestellUebersicht where BestellUebersichtId = " & Request.QueryString("BestellUebersichtId") & ""
    RS.Open SQL,conn,3,3

    
    '---------------------------------------------------------------
        'Für Log---------------'
        KW = RS("KW")
        UserId = RS("UserIdent")
        Jahr = RS("Jahr")
        BestelluebersichtId = RS("BestelluebersichtId")
        MenuArtId = RS("Menu")
    '---------------------------------------------------------------


    RS.Delete
    RS.Close
              
    SQL = "Delete * from tbBestellung where BestellUebersichtId = " & Request.QueryString("BestellUebersichtId") & ""
    RS.Open SQL,conn,3,3


    '----------------------------------------------------------
    'Log---------------

    SQL = "Select * from tbLog"
    RS.Open SQL,conn,3,3

    RS.AddNew

        RS("UserIdent")         = Session("UserId")
        RS("KW")                = KW
        RS("Jahr")              = Jahr
        RS("Menu")              = MenuArtId
        RS("String1")           = "mutieren_bestellung_menu01"
        RS("String2")           = BestellUebersichtId
        RS("String3")           = "gelöscht"
        RS("Moddate")           = NOW()

        RS.Update
        
    RS.Close

    '----------------------------------------------------------
       
end if

'-----------------------------------------------------

AktuellesJahr = GetAktuellesJahr(Session("UserId"))
SQL = "Select * from tbBestellUebersicht where Menu <> 5 and Jahr = " & AktuellesJahr & " and UserIdent = " & UserId & " Order By KW Desc,Menu"

RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if

Counter = 1

%>

<html>

<link href="ospelt.css" rel="stylesheet" type="text/css" />


<head>
<title>------</title>
</head>


<body>

<B>Menü mutieren/löschen</B> <% if AdminFlag = true then %><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% = getRestaurantName(UserId) %></b></font><% end if %>
<hr size="1">

<br />

<table  cellpadding="5" cellspacing="0" border="0">

<% do while not RS.eof and Counter < 50 %>

    <tr> 
      
    <td><% = getKW(RS("KW"),RS("Jahr")) %></td><td><B><% = getMenuArt(RS("Menu")) %></B></td>
    <td><a href="mutieren_bestellung_menu02.asp?Jahr=<% = Jahr %>&KW=<% = RS("KW") %>&Menu=<% = RS("Menu") %>&BestellUebersichtId=<% = RS("BestellUebersichtId") %>&M=Mu">mutieren</a></td>
    <td><a href="anzeigen_bestellung_menu01.asp?Jahr=<% = Jahr %>&KW=<% = RS("KW") %>&Menu=<% = RS("Menu") %>&BestellUebersichtId=<% = RS("BestellUebersichtId") %>&M=Az">anzeigen</a></td>
    <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_bestellung_menu01.asp?Jahr=<% = Jahr %>&KW=<% = RS("KW") %>&UserId=<% = UserId %>&BestellUebersichtId=<% = RS("BestellUebersichtId") %>&M=Lo">löschen</a></td>
      
   </tr>

<% 

Counter = Counter + 1

RS.MoveNext
Loop
RS.Close
%>

</table>


</body>

</html>
