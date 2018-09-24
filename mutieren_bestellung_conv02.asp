   
<%

Response.CacheControl = "no-cache"


%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<!--#INCLUDE FILE="deadlinecheck.asp"-->

<%

Dim ConvArt

ConvArt = Request.QueryString("Art")

Meldung = Request.QueryString("Meldung")

CateringNummer = 0
CateringNummer = Request.QueryString("CateringNummer")
If CateringNummer = "" then
	CateringNummer = 0
end if


CateringMother = 0
CateringMother = Request.QueryString("CateringMother")


if Request.QueryString("M") = "Az" then
    ZeigenFlag = true
else
    ZeigenFlag = false
end if


UserId = Session("UserId")

if UserId = 15 then    '15 = Admin
    AdminFlag = True
    UserId = Request.QueryString("UserId")
else
    AdminFlag = false
end if


Dat = getDatum(Request.QueryString("Datum"))
SuchDatum = "#" & Month(Dat) & "/" & Day(Dat) & "/" & Year(Dat) & "#"
'SQL = "Select * from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " and Datum = " & SuchDatum & " Order by ConvMenu"


if ZeigenFlag <> true and AdminFlag = false then
    deadlinecheck(Dat)
end if


if ZeigenFlag = true then

	SQL = "SELECT * FROM tbConvBestellung INNER JOIN tbConv ON tbConvBestellung.ConvMenu = tbConv.ConvId" _
        & " where tbConvBestellung.ConvArt = " & ConvArt & "" _
        & " and tbConvBestellung.UserId = " & UserId & "" _
		& " and tbConvBestellung.CateringNummer = " & CateringNummer & "" _
        & " and tbConvBestellung.ConvMenuAnzahl <> 0 " _
        & " and tbConvbestellung.Datum = " & SuchDatum & " Order by ConvId"

else

    SQL = "SELECT * FROM tbConvBestellung INNER JOIN tbConv ON tbConvBestellung.ConvMenu = tbConv.ConvId" _
        & " where tbConvBestellung.ConvArt = " & ConvArt & "" _
		& " and tbConvBestellung.CateringNummer = " & CateringNummer & "" _
        & " and tbConvBestellung.UserId = " & UserId & "" _
        & " and tbConvbestellung.Datum = " & SuchDatum & " Order by ConvId"

end if


RS.Open SQL,conn,3,3

%>

<!--#INCLUDE FILE="titel.asp"-->

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">


<head>
<title>Ospelt Catering</title>
</head>

<body>
<B>Bestellung mutieren</B> <% if AdminFlag = true then %><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% = getRestaurantName(RS("UserId")) %></b></font><% end if %>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>




<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form action="mutieren_bestellung_conv03.asp" method=POST>
    <input type="hidden" name="Datum" value="<% = getDatum(RS("Datum")) %>" /> 
    <input type="hidden" name="UserId" value="<% = UserId %>" />
    <input type="hidden" name="CateringNummer" value="<% = CateringNummer %>" />
    <input type="hidden" name="Art" value="<% = ConvArt %>" />
    

    <% if ConvArt = 19 or ConvArt = 20 or ConvArt = 21 then %>
        <!--#INCLUDE FILE="check.asp"-->
    <% end if%>

   <tr>
        <td>Liefertag: <B>
        <% if ConvArt = 26 then %>
            Mo-Fr
        <% else %>
            <% = getWochentag(getDatum(RS("Datum"))) %>, <% = getDatum(RS("Datum")) %>
        <% end if %></B></td>

        <td>Anzahl</td><td>EinzelPreis</td>
   </tr>
   
	<% 	'Wird nur bei Catering angezeigt
		if ConvArt = 19 or ConvArt = 20 or ConvArt = 21 or ConvArt = 22 or ConvArt = 27 then %>
		<tr><td><B><% = getEventName(RS("CateringNummer")) %> / <% = getEventBezeichnung(RS("CateringNummer")) %></B></td>
		<td colspan="2">Bemerkung: <% = getEventBemerkung(RS("CateringNummer")) %></td></tr>
	<% end if %>
		

   <% Do while not RS.EOF 
   
   strModdate = RS("Moddate")

   %>
      
   <tr>
        <td><% = getConvMenu(RS("ConvMenu")) %></td>
        
   
        <% if ZeigenFlag = false then %>         
        
            <td>
			
                <% 
                
                if GetCheckFeld(RS("ConvMenu")) = "CF" then 'Es ist ein Checkfeld

                    if RS("ConvMenuAnzahl") = 0 then %>
                        <input type="checkbox" name="Conv<% = RS("ConvId") %>" />
                    <% else %>
                        <input type="checkbox" checked name="Conv<% = RS("ConvId") %>" />
                    <% end if %>

                <% else %>

                    <input type="text" value="<% = RS("ConvMenuAnzahl") %>" name="Conv<% = RS("ConvMenu") %>" size="5"> <% = getConvEinheit(RS("ConvMenu")) %> 

                <% end if %>
                
                               
							
            </td>

            <td>
			
				<% Response.write getPreisProConv(RS("ConvMenu")) %>
			
            </td>
            
            <% 
            'Dauerauftrag
            if int(ConvArt) = 26 then
            
                if RS("Montag") = true then checkedMo = "checked"
                if RS("Dienstag") = true then checkedDi = "checked"
                if RS("Mittwoch") = true then checkedMi = "checked"
                if RS("Donnerstag") = true then checkedDo = "checked"
                if RS("Freitag") = true then checkedFr = "checked"
                        
                %>

                <td>Mo: <input type="checkbox" <% = checkedMo %> name="Mo<% = RS("ConvId") %>" /></td>
                <td>Di: <input type="checkbox" <% = checkedDi %> name="Di<% = RS("ConvId") %>" /></td>
                <td>Mi: <input type="checkbox" <% = checkedMi %> name="Mi<% = RS("ConvId") %>" /></td>
                <td>Do: <input type="checkbox" <% = checkedDo %> name="Do<% = RS("ConvId") %>" /></td>
                <td>Fr: <input type="checkbox" <% = checkedFr %> name="Fr<% = RS("ConvId") %>" /></td>
            
                <%

                checkedMo = ""
                checkedDi = "" 
                checkedMi = ""
                checkedDo = ""
                checkedFr = ""

            end if %>    



            <% if RS("TextFeldAktiv") = true then %>
                <td><input type="text" value="<% = RS("TextFeld") %>" name="txtTextFeld<% = RS("ConvMenu") %>" size="50"></td>
            <% end if %>
        
        <% else %>
        
            <td>
                
                
                <% if GetCheckFeld(RS("ConvMenu")) = "CF" then 'Es ist ein Checkfeld

                    if RS("ConvMenuAnzahl") = 0 then %>
                        <input type="checkbox" name="Conv<% = RS("ConvId") %>" />
                    <% else %>
                        <input type="checkbox" checked name="Conv<% = RS("ConvId") %>" />
                    <% end if %>

                <% else %>

                    <% = RS("ConvMenuAnzahl") %>&nbsp;<% = getConvEinheit(RS("ConvMenu")) %> 

                <% end if %>

            </td>
			            
       <td><% Response.write getPreisProConv(RS("ConvMenu")) %></td>
       

       <% 
       'Dauerauftrag
        if int(ConvArt) = 26 then
       
           if RS("Montag") = true then checkedMo = "checked"
           if RS("Dienstag") = true then checkedDi = "checked"
           if RS("Mittwoch") = true then checkedMi = "checked"
           if RS("Donnerstag") = true then checkedDo = "checked"
           if RS("Freitag") = true then checkedFr = "checked"
                   
            %>

           <td>Mo: <input type="checkbox" <% = checkedMo %> name="Mo<% = RS("ConvId") %>" /></td>
           <td>Di: <input type="checkbox" <% = checkedDi %> name="Di<% = RS("ConvId") %>" /></td>
           <td>Mi: <input type="checkbox" <% = checkedMi %> name="Mi<% = RS("ConvId") %>" /></td>
           <td>Do: <input type="checkbox" <% = checkedDo %> name="Do<% = RS("ConvId") %>" /></td>
           <td>Fr: <input type="checkbox" <% = checkedFr %> name="Fr<% = RS("ConvId") %>" /></td>

           <% 

           checkedMo = ""
           checkedDi = "" 
           checkedMi = ""
           checkedDo = ""
           checkedFr = ""

        end if %>  


            <% if RS("TextFeldAktiv") = true then %>
                <td>&nbsp;&nbsp;&nbsp;Text: <% = RS("TextFeld") %></td>
            <% end if %>

            <%
            if int(ConvArt) = 9 then %>
              <td> <% Response.Write " (" & getTagesHitName(Dat) & ")" %> </td>
            <% end if   %>

        
            </td>
        <% end if %>
   
   </tr>
   
   
   
   
   <% RS.MoveNext
   Loop %>
   
   
  </table>
  <br />
  <font size="1"><% = strModdate %></font>
  <br />
  
  <% if ZeigenFlag = false then %>
        <p><input type="submit" value="speichern" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>
  <% else %>
        <P></P>
        <a href="javascript:history.back()">zur&uuml;ck</a>
  <% end if  %>

</form>
</body>

</html>
