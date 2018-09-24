
<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Response.CacheControl = "no-cache"

Meldung = Request.QueryString("Meldung")

Art = Request.QueryString("Art")

%>

<!--#INCLUDE FILE="titel.asp"-->

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">

<head>
<title>----</title>
</head>

<body>

<B><% = SeitenTitel %></B>
<hr size="1">
<br />

<% if Meldung <> "" then %>
<b><font color="red"><% = Meldung %></font></b>
<% end if %>

<form method="POST" action="erfassen_conv02.asp">
    <input type="hidden" name="txtConvArt" value="<% = Art %>" />
    <table  cellpadding="5" cellspacing="0" border="0">

    <tr>
      <td>Aktiv:</td>
      <td><input id="Checkbox2" name="txtAktiv" type="checkbox" /></td>  
	</tr>
    <tr>        
		<td><% = Produkttitel %>:</td>
		<td><input type="text" name="txtConv" size="80"></td>
	</tr>
    <tr>
		<td>Einheit:</td>
		<td><!--#INCLUDE FILE="drp_Einheit.asp"--></td>
    </tr>
	<tr>
		<td>Herkunftsland:</td>
		<td><!--#INCLUDE FILE="drp_Herkunftsland.asp"--></td>
    </tr>

	<tr>
		<td>Check Feld:</td>
		<td><input id="Checkbox16" type="checkbox" name="txtCheckFeld" /></td>        
    </tr>

	<tr>
		<td>Catering Titel:</td>
		<td><input id="Checkbox17" type="checkbox" name="txtCatTitel" /></td>
	</tr>


	<tr>
	<td>Gehört zu:</td>

	<%  if Art = "20" then 'Business Catering %>
		<td><!--#INCLUDE FILE="drp_CateringTitel_20.asp"--></td>
	<% end if %>
		
	<%  if Art = "21" then 'Breze/Meterbrot %>
		<td><!--#INCLUDE FILE="drp_CateringTitel_21.asp"--></td>
	<% end if %>
			

	</tr>
	<tr>
		<td>Preis EK:</td>
		<td><input type="text" name="txtPreis" size="5"> <font size="1">pro Einheit</font></td>        
    </tr>

      <td>Preis VK:</td>
      <td><input type="text" name="txtPreisMwst" size="5"> <font size="1">Preis auf Lieferschein</font></td>        
      </tr>

      <td>Max Anzahl:</td>
      <td><input type="text" name="txtMaxWertBestellung" size="3"> <font size="1">Max. Anzahl Beilagen</font></td>        
      </tr>


      <% if Art = 10 then ' Salat %>
      <td>WochenTag:</td>
      <td><input type="text" name="txtWochenTag" size="80"> <font size="1">Montag, Dienstag usw.</font></td>        
      </tr>
      <tr>
      <td>WochenArt:</td>
      <td><input type="text" name="txtWochenArt" size="2"> <font size="1">1=gerade, 0=ungerade</font></td>        
      </tr>
      <% end if %>
      
      <tr>
      <td>Textfeld:</td>
      <td><input id="Checkbox1" name="txtTextfeld" type="checkbox" /></td>        
      </tr>
    
    </tr>
    
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

</body>

</html>
