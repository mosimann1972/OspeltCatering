
<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Response.CacheControl = "no-cache"

Meldung = Request.QueryString("Meldung")

Art = Request.QueryString("Art")

%>

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">

<head>
<title>----</title>
</head>

<body>

<B>tbConfig</B>
<hr size="1">
<br />
<% if Meldung <> "" then %>
<b><font color="red"><% = Meldung %></font></b>
<% end if %>

<form method="POST" action="erfassen_tbConfig02.asp">
	  <table  cellpadding="5" cellspacing="0" border="0">

		<tr>
		  <td>Wert1:</td>
		  <td><input type="text" name="txtWert1" size="80"></td>
		</tr>
		<tr>
		  <td>Wert2:</td>
		  <td><input type="text" name="txtWert2" size="80"></td>
		</tr>

		<tr>
				<td>Wert3:</td>
				<td><input type="text" name="txtWert3" size="80"></td>
		</tr>

		<tr>
			<td>Wert4:</td>
				<td><input type="text" name="txtWert4" size="80"></td>
		</tr>

		<tr>
				<td>Bezeichnung:</td>
				<td><input type="text" name="txtBezeichnung" size="80"></td>
			</tr>
  
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

</body>

</html>
