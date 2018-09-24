
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
 

<B>Auswahl Catering:</B>
<hr size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_catering" target=_self>Jahr mutieren</a>

<br /><br />




<table width="250">
	<tr><td><a href="anzeigen_conv01.asp?Art=19">Cat-Brötle</a></td>
	<tr><td><a href="anzeigen_conv01.asp?Art=20">Cat-Business</a></td>
	<tr><td><a href="anzeigen_conv01.asp?Art=21">Cat-Breze/Met</a></td>
	<tr><td><a href="anzeigen_conv01.asp?Art=22">Cat-Non-Food</a></td>
</table>


<br /><br />
	

<table width="250">
<tr>
<td><a href="Lieferschein_print00.asp">Lieferscheine drucken</a></td>
</tr>
</table>

<br />


<br />
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