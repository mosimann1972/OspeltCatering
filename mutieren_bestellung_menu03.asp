<%

Response.CacheControl = "no-cache"

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

'----------------------------------------------------------------------------------

SB1_Flag = 0
SB2_Flag = 0

if Request.Form("txtSB1Montag") <> "0" then if Request.Form("txtSB1PlusMinusMontag") = "" then  SB1_Flag = 1 end if end if
if Request.Form("txtSB1Dienstag") <> "0" then if Request.Form("txtSB1PlusMinusDienstag") = "" then  SB1_Flag = 1 end if end if
if Request.Form("txtSB1Mittwoch") <> "0" then if Request.Form("txtSB1PlusMinusMittwoch") = "" then  SB1_Flag = 1 end if end if
if Request.Form("txtSB1Donnerstag") <> "0" then if Request.Form("txtSB1PlusMinusDonnerstag") = "" then  SB1_Flag = 1 end if end if
if Request.Form("txtSB1Freitag") <> "0" then if Request.Form("txtSB1PlusMinusFreitag") = "" then  SB1_Flag = 1 end if end if

if Request.Form("txtSB2Montag") <> "0" then if Request.Form("txtSB2PlusMinusMontag") = "" then  SB2_Flag = 1 end if end if
if Request.Form("txtSB2Dienstag") <> "0" then if Request.Form("txtSB2PlusMinusDienstag") = "" then  SB2_Flag = 1 end if end if
if Request.Form("txtSB2Mittwoch") <> "0" then if Request.Form("txtSB2PlusMinusMittwoch") = "" then  SB2_Flag = 1 end if end if
if Request.Form("txtSB2Donnerstag") <> "0" then if Request.Form("txtSB2PlusMinusDonnerstag") = "" then  SB2_Flag = 1 end if end if
if Request.Form("txtSB2Freitag") <> "0" then if Request.Form("txtSB2PlusMinusFreitag") = "" then  SB2_Flag = 1 end if end if


if SB1_Flag = 1 then
    response.Redirect "main.asp?Meldung=<font color=""red"">Fehlendes Vorzeichen bei SB1 oder SB2</font>"
end if 

if SB2_Flag = 1 then
    response.Redirect "main.asp?Meldung=<font color=""red"">Fehlendes Vorzeichen bei SB1 oder SB2</font>"
end if 

'----------------------------------------------------------------------------------


BestellId = Request.Form("txtBestellId")

pos1 = instr(1,BestellId,",")
W1 = mid(BestellId,1,pos1 -1)
pos2 = instr(pos1 + 1,BestellId,",")
W2 = mid(BestellId,pos1 + 2,pos2 - 2 - pos1)
pos3 = instr(pos2 + 1,BestellId,",")
W3 = mid(BestellId,pos2 + 2,pos3 - 2 - pos2)
pos4 = instr(pos3 + 1,BestellId,",")
W4 = mid(BestellId,pos3 + 2,pos4 - 2 - pos3)
W5 = mid(BestellId,pos4 + 2)


SQL = "Select * from tbBestellung where BestellId = " & W1 & ""
RS.Open SQL,conn,3,3

'---------------------------------------------------------------
'Für Log---------------'
    KW = RS("KW")
    Jahr = RS("Jahr")
    BestelluebersichtId = RS("BestelluebersichtId")
    MenuArtId = RS("MenuArtId")

'---------------------------------------------------------------



if Request.Form("txtHSMontag") = "" then RS("HS") = 0 else RS("HS") = Request.Form("txtHSMontag") end if

if Request.Form("txtSB1PlusMinusMontag") = "" then RS("PM_SB1") = "" else RS("PM_SB1") = Request.Form("txtSB1PlusMinusMontag") end if
if Request.Form("txtSB1Montag") = "" then RS("SB1") = 0 else RS("SB1") = Request.Form("txtSB1PlusMinusMontag") & Request.Form("txtSB1Montag") end if

if Request.Form("txtSB2PlusMinusMontag") = "" then RS("PM_SB2") = "" else RS("PM_SB2") = Request.Form("txtSB2PlusMinusMontag") end if
if Request.Form("txtSB2Montag") = "" then RS("SB2") = 0 else RS("SB2") = Request.Form("txtSB2PlusMinusMontag") & Request.Form("txtSB2Montag") end if

RS.Update
RS.Close


SQL = "Select * from tbBestellung where BestellId = " & W2 & ""
RS.Open SQL,conn,3,3
if Request.Form("txtHSDienstag") = "" then RS("HS") = 0 else RS("HS") = Request.Form("txtHSDienstag") end if

if Request.Form("txtSB1PlusMinusDienstag") = "" then RS("PM_SB1") = "" else RS("PM_SB1") = Request.Form("txtSB1PlusMinusDienstag") end if
if Request.Form("txtSB1Dienstag") = "" then RS("SB1") = 0 else RS("SB1") = Request.Form("txtSB1PlusMinusDienstag") & Request.Form("txtSB1Dienstag") end if

if Request.Form("txtSB2PlusMinusDienstag") = "" then RS("PM_SB2") = "" else RS("PM_SB2") = Request.Form("txtSB2PlusMinusDienstag") end if
if Request.Form("txtSB2Dienstag") = "" then RS("SB2") = 0 else RS("SB2") = Request.Form("txtSB2PlusMinusDienstag") & Request.Form("txtSB2Dienstag") end if


RS.Update
RS.Close

SQL = "Select * from tbBestellung where BestellId = " & W3 & ""
RS.Open SQL,conn,3,3
if Request.Form("txtHSMittwoch") = "" then RS("HS") = 0 else RS("HS") = Request.Form("txtHSMittwoch") end if

if Request.Form("txtSB1PlusMinusMittwoch") = "" then RS("PM_SB1") = "" else RS("PM_SB1") = Request.Form("txtSB1PlusMinusMittwoch") end if
if Request.Form("txtSB1Mittwoch") = "" then RS("SB1") = 0 else RS("SB1") = Request.Form("txtSB1PlusMinusMittwoch") & Request.Form("txtSB1Mittwoch") end if

if Request.Form("txtSB2PlusMinusMittwoch") = "" then RS("PM_SB2") = "" else RS("PM_SB2") = Request.Form("txtSB2PlusMinusMittwoch") end if
if Request.Form("txtSB2Mittwoch") = "" then RS("SB2") = 0 else RS("SB2") = Request.Form("txtSB2PlusMinusMittwoch") & Request.Form("txtSB2Mittwoch") end if


RS.Update
RS.Close


SQL = "Select * from tbBestellung where BestellId = " & W4 & ""
RS.Open SQL,conn,3,3
if Request.Form("txtHSDonnerstag") = "" then RS("HS") = 0 else RS("HS") = Request.Form("txtHSDonnerstag") end if

if Request.Form("txtSB1PlusMinusDonnerstag") = "" then RS("PM_SB1") = "" else RS("PM_SB1") = Request.Form("txtSB1PlusMinusDonnerstag") end if
if Request.Form("txtSB1Donnerstag") = "" then RS("SB1") = 0 else RS("SB1") = Request.Form("txtSB1PlusMinusDonnerstag") & Request.Form("txtSB1Donnerstag") end if

if Request.Form("txtSB2PlusMinusDonnerstag") = "" then RS("PM_SB2") = "" else RS("PM_SB2") = Request.Form("txtSB2PlusMinusDonnerstag") end if
if Request.Form("txtSB2Donnerstag") = "" then RS("SB2") = 0 else RS("SB2") = Request.Form("txtSB2PlusMinusDonnerstag") & Request.Form("txtSB2Donnerstag") end if


RS.Update
RS.Close


SQL = "Select * from tbBestellung where BestellId = " & W5 & ""
RS.Open SQL,conn,3,3
if Request.Form("txtHSFreitag") = "" then RS("HS") = 0 else RS("HS") = Request.Form("txtHSFreitag") end if

if Request.Form("txtSB1PlusMinusFreitag") = "" then RS("PM_SB1") = "" else RS("PM_SB1") = Request.Form("txtSB1PlusMinusFreitag") end if
if Request.Form("txtSB1Freitag") = "" then RS("SB1") = 0 else RS("SB1") = Request.Form("txtSB1PlusMinusFreitag") & Request.Form("txtSB1Freitag") end if

if Request.Form("txtSB2PlusMinusFreitag") = "" then RS("PM_SB2") = "" else RS("PM_SB2") = Request.Form("txtSB2PlusMinusFreitag") end if
if Request.Form("txtSB2Freitag") = "" then RS("SB2") = 0 else RS("SB2") = Request.Form("txtSB2PlusMinusFreitag") & Request.Form("txtSB2Freitag") end if


RS.Update
RS.Close


'----------------------------------------------------------
'Log---------------

strString1 = Request.Form("txtHSMontag") & "," _
    & Request.Form("txtHSDienstag") & "," _
    & Request.Form("txtHSMittwoch") & "," _
    & Request.Form("txtHSDonnerstag") & "," _
    & Request.Form("txtHSFreitag")

strString2 = Request.Form("txtSB1Montag") & "," _
    & Request.Form("txtSB1Dienstag") & "," _
    & Request.Form("txtSB1Mittwoch") & "," _
    & Request.Form("txtSB1Donnerstag") & "," _
    & Request.Form("txtSB1Freitag")

strString3 = Request.Form("txtSB2Montag") & "," _
    & Request.Form("txtSB2Dienstag") & "," _
    & Request.Form("txtSB2Mittwoch") & "," _
    & Request.Form("txtSB2Donnerstag") & "," _
    & Request.Form("txtSB2Freitag")


SQL = "Select * from tbLog"
RS.Open SQL,conn,3,3

RS.AddNew

    RS("UserIdent")         = Session("UserId")
    RS("KW")                = KW
    RS("Jahr")              = Jahr
    RS("Menu")              = MenuArtId
    RS("String1")           = "mutieren_bestellung_menu03"
    RS("String2")           = BestellUebersichtId
    RS("String3")           = strString1
    RS("String4")           = strString2
    RS("String5")           = strString3
    RS("Moddate")           = NOW()

    RS.Update
    
RS.Close

'----------------------------------------------------------









response.Redirect "main.asp?Meldung=Bestellung mutiert!"


%>


<html>
<body>


</body>
</html>
