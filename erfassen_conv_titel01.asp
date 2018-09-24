
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

<form method="POST" action="erfassen_conv_titel02.asp">
	<input type="hidden" name="Art" value="<% = Art %>" />
    <table  cellpadding="5" cellspacing="0" border="0">

	<% if Art = "200" then	'ConvTitel %>

		<tr>
		  <td>ConvTitelId:</td>
		  <td><input type="text" name="txtConvTitelId" size="80"></td>
		</tr>

		<tr>
		  <td>Name:</td>
		  <td><input type="text" name="txtConvTitel" size="80"></td>
		</tr>

	<% end if %>


	<% if Art = "300" then	'Herkunftsland %>

		<tr>
		  <td>Herkunftsland:</td>
		  <td><input type="text" name="txtHerkunftsland" size="80"></td>
		</tr>

	<% end if %>

    
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

</body>

</html>
