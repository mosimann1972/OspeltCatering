<%
Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

'SQL = "Select * from tbUser where Art = 0 Order by Kurzzeichen"
'RS.Open SQL,conn,3,3

SetLocale("de")


if Request.Form("txtUserId_as") <> "" then
    UserId = Request.Form("txtUserId_as")
else
    UserId = Request.Form("txtUserId_dk")
end if

'UserId = Request.Form("txtUserId")

Gruppe = Request.QueryString("Gruppe")



if UserId <> "" then
    ConvArt = Request.Form("Art")
    Dat = getDatum(Request.Form("Datum"))
    SuchDatum = "#" & Month(Dat) & "/" & Day(Dat) & "/" & Year(Dat) & "#"

    SQL = "SELECT * FROM (tbUser INNER JOIN tbConvBestellung" _
        & " ON tbUser.UserId = tbConvBestellung.UserId) INNER JOIN tbConv" _
        & " ON tbConvBestellung.ConvMenu = tbConv.ConvId WHERE (((tbConvBestellung.Datum)= " & SuchDatum & " and (tbConvBestellung.ConvArt) = " & ConvArt & "  and (tbConvBestellung.UserId) = " & UserId & " )) Order By ConvBestellId"

        'Response.Write ">>>>>>1 " & SQL & "<BR>"
else
    ConvArt = Request.QueryString("Art")
    Dat = getDatum(Request.QueryString("Datum"))
    SuchDatum = "#" & Month(Dat) & "/" & Day(Dat) & "/" & Year(Dat) & "#"

    SQL = "SELECT * FROM (tbUser INNER JOIN tbConvBestellung" _
        & " ON tbUser.UserId = tbConvBestellung.UserId) INNER JOIN tbConv" _
        & " ON tbConvBestellung.ConvMenu = tbConv.ConvId WHERE (((tbConvBestellung.Datum)= " & SuchDatum & " and (tbConvBestellung.ConvArt) = " & ConvArt & " and (tbConvBestellung.Gruppe) = '" & Gruppe & "' )) Order By ConvBestellId"

        'Response.Write ">>>>>>2 " & SQL & "<BR>"

end if 

RS.Open SQL,conn,3,3

Art = ConvArt

%>

<!--#INCLUDE FILE="titel.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
<head>
<LINK rel="stylesheet" type="text/css" href="ospeltLieferschein.css">
<title>Lieferschein Ospelt Catering</title>
</head>

<body>
<%
FirstRun = true

Do while not RS.EOF 

    '--------------------------------------------------------------------
    if UserIdAlt <> RS("tbUser.UserId") then

        UserIdAlt = RS("tbUser.UserId")

        if FirstRun = false then


            if RS("tbConvBestellung.ConvArt") = 19 then %>

                <tr>
                    <td class="Inhalt">Total</td>
                    <td align="right" class="Inhalt"><font size="1">Preis:</font></td>
                    <td width="50" align="right" class="Inhalt"><B><% response.write getPreisProCatering19(CateringNummerAlt) %></B></td>
                    <td align="right" class="Inhalt"><font size="1">&nbsp;</td>
                    <td width="50" align="right" class="Inhalt">&nbsp;</td>
                </tr>

            <% end if %>


            </table>
            <h5 style="page-break-before:always"></h5>
        <% end if %>

        <table width="100%" border="0">
        <tr><td class="Inhalt"><B><% = Lieferschein %></B></td><td align="right" class="Inhalt"><b><% = getWochentag(getDatum(RS("Datum"))) %>, <% = getDatum(RS("Datum")) %></td></tr>
        </table>
        
        <table class="Titel">
        <tr>
            <td class="Titel"><b><% = RS("Username") %></b></td>
		</tr>

        <% if RS("tbConvBestellung.ConvArt") = 19 or RS("tbConvBestellung.ConvArt") = 20 or RS("tbConvBestellung.ConvArt") = 21 or RS("tbConvBestellung.ConvArt") = 22 or RS("tbConvBestellung.ConvArt") = 27 then %>
			<tr>
				<td class="TitelKlein"><b><% = getCateringInfos(RS("CateringNummer")) %></b></td>
			</tr>
		<% end if %>		

        </table>
        
        <br>
        
        <% 

        FirstRun = false
    
        FirstRunTable = true

    end if
    '--------------------------------------------------------------------
    
	if FirstRunTable = true then %>
		<table border="0" width="100%" class="Inhalt">
		<% 
		FirstRunTable = false
		w = true
	end if


	if w = true then
		w = false
		CateringNummerAlt = RS("CateringNummer")
	else
		if CateringNummerAlt <> RS("CateringNummer") then
			Ende = "JETZT"
		end if
	end if


    if RS("ConvMenuAnzahl") <> 0 then
    
        
        if Ende = "JETZT" then

            if RS("tbConvBestellung.ConvArt") = 19 then %>

                <tr>
                    <td class="Inhalt">Total</td>
                    <td align="right" class="Inhalt"><font size="1">Preis:</font></td>
                    <td width="50" align="right" class="Inhalt"><B><% response.write getPreisProCatering19(CateringNummerAlt) %></B></td>
                    <td align="right" class="Inhalt"><font size="1">&nbsp;</td>
                    <td width="50" align="right" class="Inhalt">&nbsp;</td>
                </tr>

            <% end if %>

            </table> 

            <h5 style="page-break-before:always"></h5>
        
            <table width="100%" border="0">
            <tr><td class="Inhalt"><B><% = Lieferschein %></B></td><td align="right" class="Inhalt"><b><% = getWochentag(getDatum(RS("Datum"))) %>, <% = getDatum(RS("Datum")) %></td></tr>
            </table>
            
            <table class="Titel">
            <tr>
                <td class="Titel"><b><% = RS("Username") %></b></td>
            </tr>

            <% if RS("tbConvBestellung.ConvArt") = 19 or RS("tbConvBestellung.ConvArt") = 20 or RS("tbConvBestellung.ConvArt") = 21 or RS("tbConvBestellung.ConvArt") = 22  then %>
                <tr>
                    <td class="TitelKlein"><b><% = getCateringInfos(RS("CateringNummer")) %></b></td>
                </tr>
            <% end if %>		

            </table>
            
            <br>

            <table border="0" width="100%" class="Inhalt">

        <% end if %>


        <tr>
            <td class="Inhalt"><% = getConvMenu(RS("ConvMenu")) %><% if RS("Textfeld") <> "" then Response.write " (" & RS("TextFeld") & ")" end if %></td>
            <td align="right" class="Inhalt"><font size="1">Preis:</font></td>
            <td width="50" align="right" class="Inhalt"><% = RS("PreisMwst") %></td>

            <td align="right" class="Inhalt"><font size="1"><% = RS("Einheit") %></font></td>
            <td width="50" align="right" class="Inhalt">
                

                    <% if GetCheckFeld(RS("ConvMenu")) = "CF" then 'Es ist ein Checkfeld

                        if RS("ConvMenuAnzahl") = 0 then %>
                            <input type="checkbox" name="Conv<% = RS("ConvId") %>" />
                        <% else %>
                            <input type="checkbox" checked name="Conv<% = RS("ConvId") %>" />
                        <% end if %>

                <% else %>

                        <% = RS("ConvMenuAnzahl") %>

                <% end if %>

                
            </td>
            
            </tr>

            <% 
            
            TotalPrint = false
            
            if getCateringTitel(RS("ConvMenu")) = true then %>

            <tr>
                <td class="Inhalt">Total</td>
                <td align="right" class="Inhalt"><font size="1">Preis:</font></td>
                <td width="50" align="right" class="Inhalt"><B><% response.write getPreisProCatering(RS("CateringNummer")) %></B></td>
                <td align="right" class="Inhalt"><font size="1">&nbsp;</td>
                <td width="50" align="right" class="Inhalt">&nbsp;</td>
            </tr>

            <% 
            
            TotalPrint = true

            end if 

            CateringNummerAlt = RS("CateringNummer")
            ConvArtAlt = RS("tbConvBestellung.ConvArt")

            Ende = ""

    end if
    
       
        
RS.MoveNext
Loop
RS.Close



if TotalPrint = false and ConvArtAlt = 19 then %>

<tr>
    <td class="Inhalt">Total</td>
    <td align="right" class="Inhalt"><font size="1">Preis:</font></td>
    <td width="50" align="right" class="Inhalt"><B><% response.write getPreisProCatering19(CateringNummerAlt) %></B></td>
    <td align="right" class="Inhalt"><font size="1">&nbsp;</td>
    <td width="50" align="right" class="Inhalt">&nbsp;</td>
</tr>

<% end if %>



</table>



</body>
</html>


