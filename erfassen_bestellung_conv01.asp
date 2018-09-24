
<%

Response.CacheControl = "no-cache"

%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

ConvArt = Request.QueryString("Art")
if ConvArt = "" then
    ConvArt = Request.Form("Art")
end if

'---------------------------------------------------------------------
Select Case ConvArt
    Case 20
    FooterMeldung = "5 Varianten zur Auswahl inkl., jede weitere Variante wird extra verrechnet"
    Case 21
    FooterMeldung = "Bretze: 5 Beläge zur Wahl, Meterbrot: 3 Belege zur Wahl"
    Case else
    FooterMeldung = ""
end select
'---------------------------------------------------------------------

CateringMother = Request.QueryString("CateringMother")
if CateringMother = "" then
	CateringMother = Request.Form("txtCateringTitelMother") 
end if

'Response.Write ">>>>>>>>>" & CateringMother & "<BR>"

SetLocale("de-DE")
Meldung = Request.QueryString("Meldung")


UserId = Session("UserId")
AdminFlag = false

if UserId = 15 then    '15 = Admin
    AdminFlag = true
    UserId = Request.Form("txtUserId")

    if UserId = "" then
        UserId = Request.QueryString("UserId")
    end if

end if

'Response.Write ">>>>>>1 " & UserId & "<BR>"
'Response.Write ">>>>>>2 " & AdminFlag & "<BR>"    

'---------------------------------------------------------------------

AnzeigeNormal = true
Set RS_Kalender      = Server.CreateObject("ADODB.Recordset")
SuchArt = "WD"

DatumSeach = cDate(Date())
DatumSearchAdmin = cDate(Date()) - 20 ' Admin kann 4 Tage Rückwärts einbuchen

xDate = "#" & Month(DatumSeach) & "/" & Day(DatumSeach) & "/" & Year(DatumSeach) & "#"

if AdminFlag = true then
    xDate = "#" & Month(DatumSearchAdmin) & "/" & Day(DatumSearchAdmin) & "/" & Year(DatumSearchAdmin) & "#"
end if


'--- Neu ab 24.05.2018 wegen Anpassung DeadLine
'--- Dienstag Kalender für Wochenbestellung (11), ConvBestellung(1) und Papeterie(23)
if ConvArt = "1" or ConvArt = "11" or ConvArt = "23" then 
    SQL_Kalender = "SELECT * FROM tbKalender WHERE tbKalender.Datum > " & xDate  & "" _
        & " AND tbKalender.Tag = 'Dienstag' AND  tbKalender.Art = 'WD'"
    AnzeigeNormal = False
end if 


If AnzeigeNormal = True then
    SQL_Kalender = "Select * from tbKalender where Art = '" & SuchArt & "' and Datum > " & xDate & " Order By KalenderId"
end if

'Response.Write ">>>>>>2 " & SQL_Kalender & "<BR>"

'---------------------------------------------------------------------


RS_Kalender.Open SQL_Kalender,conn,3,3

if Request.QueryString("Dat") = "" then
    Liefertag = RS_Kalender("Datum")
    First = true
else
    First = false
    Liefertag = cDate(Request.QueryString("Dat"))
end if


'---------------------------------------------------------------------

if ConvArt = "10" then 'Salatbestellung
    
    '--------------------------
    'Gerade und ungerade Wochen festlegen

    if getWochenArt(getWochenNummer(Liefertag)) = true then   'True = gerade
        WochenArt = 1
    else 
        WochenArt = 0
    end if

    '--------------------------
   
    SQL = "Select * from tbConv Where ConvArt = " & ConvArt & " and Aktiv = true And WochenArt = " & WochenArt & " and Tag = '" & getWochentag(getDatum(Liefertag)) & "' Order by ConvText ASC"
else

	if int(ConvArt) = 20 or int(ConvArt) = 21 then	
		SQL = "Select * from tbConv Where ConvArt = " & ConvArt & " and Aktiv = true and CheckFeld = true and CateringMother = " & CateringMother & " Order by ConvText ASC"
		'Response.Write "111>>>>" & SQL & "<BR>"
	else
	    SQL = "Select * from tbConv Where ConvArt = " & ConvArt & " and Aktiv = true Order by ConvText ASC"
		'Response.Write "222>>>>" & SQL & "<BR>"
	end if

end if


RS.Open SQL,conn,3,3

Art = ConvArt


%>

<!--#INCLUDE FILE="titel.asp"-->


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">

<head>
<title>Ospelt Catering</title>
</head>

<body>

<B><% = SeitenTitel %></B> <% if AdminFlag = true then %><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% = getRestaurantName(UserId) %></b></font><% end if %>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>




<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<% 

dim strLDat
strLDat = Cstr(Liefertag)

%>

<form name="bestellung" action="erfassen_bestellung_conv02.asp" method=POST>
<input type="hidden" name="Art" value="<% = ConvArt %>" />
<input type="hidden" name="BestellDatum" value="<% = strLDat %>" />
<input type="hidden" name="txtUserId" value="<% = UserId %>" />
<input type="hidden" name="txtCateringTitelMother" value ="<% = CateringMother %>" />

<% if Art = 19 or Art = 20 or Art = 21 Then %>
    <!--#INCLUDE FILE="check.asp"-->
<% end if %>

   <tr>
   <td>Liefertag: </td>
     
   <td colspan="10">

    
    <%
    '--------------------------------------------------------------'    
    if int(ConvArt) = 26 then %>
        Mo - Fr
    <% else %>
        <select name="txtKalenderTag" onChange="location.href=this.options[this.selectedIndex].value">  

        <% 
        
        do while not RS_Kalender.eof and Counter <= 34         'Extra wegen Jahreswechsel
        'do while not RS_Kalender.eof and Counter <= 16

            counter = counter + 1

            if First = true then 
                First = false
                TextSelected = "selected"
            else

                if cDate(RS_Kalender("Datum")) = cDate(Request.QueryString("Dat")) then
                    TextSelected = "selected"
                else
                    TextSelected = ""
            end if
                
            end if %>
                    
            <option <% = TextSelected %> value="erfassen_bestellung_conv01.asp?CateringMother=<% = CateringMother %>&UserId=<% = UserId %>&Art=<% = ConvArt %>&Dat=<% = getDatum(RS_Kalender("Datum")) %>"><% = getWochentag(getDatum(RS_Kalender("Datum"))) %>, <% = getDatum(RS_Kalender("Datum")) %></option>
        
            
            <%
            if Weekday(getDatum(RS_Kalender("Datum")),0) = 5 then
                Response.Write "<option>-------------</option>"
            end if
            %>


        <% RS_Kalender.movenext
        loop
        RS_Kalender.close


        %>
        </select>
   
    <% end if
    '--------------------------------------------------------------'
    %>    
    
   
   </td>
      
   <% 
	
	'Bei Catering Bestellung werden zusätzliche Felder angezeigt
	if int(ConvArt) = 19 or int(ConvArt) = 20 or int(ConvArt) = 21 or int(ConvArt) = 22 or int(ConvArt) = 27 then %>
	   
		<tr>
		  <td>Eventname</td>
		  <td><input type="text" name="txtEventName" size="40"></td>
		</tr>

		<tr>
		  <td>Eventbezeichnung</td>
		  <td><input type="text" name="txtEventBezeichnung" size="40"></td>
		</tr>
	   
	   <tr>
		  <td>Bemerkungen</td>
		  <td colspan="2"><input type="text" name="txtEventBemerkung" size="80"></td>
		</tr>
	   
	   <% if CateringMother <> "" then %>
	   <tr>
		  <td><B><% = getConvMenu(CateringMother) %></B></td>
		  <td><input type="text" name="Conv<% = CateringMother %>" size="10"></td>
		</tr>
	   <% end if %>

	<% end if %>



    </tr>
   
   
    
    <%
    'Quick Lieferschein und Catering Quick
    if int(ConvArt) = 24 or int(ConvArt) = 27 then %>
    <tr>
        <td colspan="2">
            <font size="1">Text: </font><input type="text" name="txtQuickText" size="30">
            <!--#INCLUDE FILE="drp_Einheit.asp"-->
            <font size="1">Preis: </font><input type="text" name="txtQuickPreis" size="5">
            <font size="1">Anzahl: </font><input type="text" name="txtQuickAnzahl" />
        </td>
    </tr>    
    <% end if %>

     
    <% do while not RS.eof %>
  
		
	<tr>

				
		<td>
            <% = RS("ConvText") %>
        </td>
        
        <td>
			
			<%  if RS("CheckFeld") = true then %>
				<input type="checkbox" name="Conv<% = RS("ConvId") %>" /> 
            <% else %>
                <input type="text" name="Conv<% = RS("ConvId") %>" size="5"> <% = RS("Einheit") %>
            <% end if %>

		</td>

        
        <% 
        'Dauerauftrag
        if int(ConvArt) = 26 then %>

            <td>Mo: <input type="checkbox" name="Mo<% = RS("ConvId") %>" /></td>
            <td>Di: <input type="checkbox" name="Di<% = RS("ConvId") %>" /></td>
            <td>Mi: <input type="checkbox" name="Mi<% = RS("ConvId") %>" /></td>
            <td>Do: <input type="checkbox" name="Do<% = RS("ConvId") %>" /></td>
            <td>Fr: <input type="checkbox" name="Fr<% = RS("ConvId") %>" /></td>

        <% end if %>




		<% if RS("TextFeldAktiv") = true then %>
			<td>&nbsp;&nbsp;&nbsp;Text: <input type="text" name="txtTextFeld<% = RS("ConvId") %>" size="65"></td>
		<% end if %>
        
		


      <% 
      
      if int(ConvArt) = 9 then %>
      <td><% Response.Write "(" & getTagesHitName(Liefertag) & ")" %> </td>
      <% end if  
        
      %>
   
      </tr>
  
      
      <% RS.MoveNext
      Loop %>
    
  </table>
    
  
  <p><input type="submit" value="speichern" name="bestellung"><input type="reset" value="Zuruecksetzen" name="B2"></p>

</form>

<BR>
<BR>

<font color="red"><B><% = FooterMeldung %></B></font>


</body>

</html>
