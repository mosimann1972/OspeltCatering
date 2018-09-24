
<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<html>

<script type="text/javascript" language="JavaScript">
<!-- Begin
// print

function printrechts() {
window.parent.main.focus();
window.print();
}

//  End -->
</script>

<head>

<LINK rel="stylesheet" type="text/css" href="ospelt.css">

<base target="main">
</head>

<body class="NavigationAdmin">
 

<B>Auswahl Papeterie:</B>
<hr size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_papeterie" target=_self>Jahr mutieren</a>

<br /><br />


<table width="250">

	<tr>
		<td><a href="anzeigen_conv01.asp?Art=23">Papeterie</a></td>
		<td><a href="erfassen_bestellung_conv00.asp?Art=23">erfassen</a></td>
		<td><a href="mutieren_bestellung_conv00.asp?Art=23">mutieren</a></td>
	</tr>

</table>

<br /><br />

<table width="250">
<tr>
	<td>Lieferschein</td>
	<td><a href="Lieferschein_print05.asp">Allgemein</a></td>
</table>

<br />


<form ID="Form1">
<input type="button" value="drucken" onClick="printrechts()" ID="Button1" NAME="Button1">
</form>

<P>
<a target="_top" href="ende.asp"><B>Beenden</b></a></p>

Eingeloggt als:<br />
<B><% = Session("UserName") %></B>
<br /><br />
<img src="ospelt.jpg" />

</body>
</html>