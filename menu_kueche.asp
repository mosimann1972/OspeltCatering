
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

<body class="NavigationKueche">








<B>Auswahl Küche:</B>
<hr size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_kueche" target=_self>Jahr mutieren</a>

<br /><br />



<table width="250">
<tr><td>Suppe</td><td><a href="erfassen_zutaten01.asp?Art=5">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=5">mutieren</a></td></tr>
<tr><td>Wellnessdrink</td><td><a href="erfassen_zutaten01.asp?Art=1">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=1">mutieren</a></td></tr>
<tr><td>HS</td><td><a href="erfassen_zutaten01.asp?Art=2">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=2">mutieren</a></td></tr>
<tr><td>SB</td><td><a href="erfassen_zutaten01.asp?Art=3">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=3">mutieren</a></td></tr>
<tr><td>Ge/Sa</td><td><a href="erfassen_zutaten01.asp?Art=4">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=4">mutieren</a></td></tr>
</table>

<br /><br />

<table width="250">
<tr><td>Menü</td><td><a href="erfassen_menu01.asp">erfassen</a></td><td><a href="mutieren_menu01.asp">mutieren</a></td></tr>
<tr><td>Menüplan</td><td><a href="erfassen_menu_plan01.asp">erfassen</a></td><td><a href="mutieren_menu_plan01.asp">mutieren</a></td></tr>
<tr><td>Menüplan</td><td colspan="2"><a href="anzeigen_menu_plan01.asp">pro KW</a></td></tr>
</table>

<br /><br />

<table width="250">
<tr><td>M-Su Suppe</td><td><a href="erfassen_zutaten01.asp?Art=6">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=6">mutieren</a></td></tr>
<tr><td>M-Su Einlage</td><td><a href="erfassen_zutaten01.asp?Art=7">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=7">mutieren</a></td></tr>
<tr><td>Suppe-Einlage</td><td><a href="erfassen_suppe01.asp?Art=8">erfassen</td><td><a href="mutieren_suppe01.asp?Art=8">mutieren</a></td></tr>
<tr><td>Suppe pro KW</td><td><a href="erfassen_suppe_plan01.asp?Art=5">erfassen</td><td><a href="mutieren_suppe_plan01.asp?Art=5">mutieren</a></td></tr>
</table>

<br /><br />

<table width="250">
<tr><td>Conv</td><td><a href="erfassen_conv01.asp?Art=1">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=1">mutieren</a></td></tr>
<tr><td>TagesHit</td><td>na</td><td><a href="mutieren_conv01.asp?Art=9">mutieren</a></td></tr>
<tr><td>Fleisch</td><td><a href="erfassen_conv01.asp?Art=5">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=5">mutieren</a></td></tr>
<tr><td>Fisch</td><td><a href="erfassen_conv01.asp?Art=17">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=17">mutieren</a></td></tr>
<tr><td>W-bestellung</td><td><a href="erfassen_conv01.asp?Art=11">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=11">mutieren</a></td></tr>
<tr><td>T-Salat</td><td><a href="erfassen_conv01.asp?Art=16">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=16">mutieren</a></td></tr>
<tr><td>Dessert</td><td><a href="erfassen_conv01.asp?Art=14">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=14">mutieren</a></td></tr>
<tr><td>Menu-Obst</td><td><a href="erfassen_conv01.asp?Art=15">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=15">mutieren</a></td></tr>
<tr><td>Non-Food</td><td><a href="erfassen_conv01.asp?Art=18">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=18">mutieren</a></td></tr>
<tr><td>Papeterie</td><td><a href="erfassen_conv01.asp?Art=23">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=23">mutieren</a></td></tr>
<tr><td>Quick</td><td><a href="erfassen_conv01.asp?Art=24">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=24">mutieren</a></td></tr>
<tr><td>Inhouse</td><td><a href="erfassen_conv01.asp?Art=25">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=25">mutieren</a></td></tr>
<tr><td>Dauerauftrag</td><td><a href="erfassen_conv01.asp?Art=26">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=26">mutieren</a></td></tr>


</table>

<br /><br />

<table width="250">
	<tr><td>Cat-Brötle</td><td><a href="erfassen_conv01.asp?Art=19">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=19">mutieren</a></td></tr>
	<tr><td>Cat-Business</td><td><a href="erfassen_conv01.asp?Art=20">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=20">mutieren</a></td></tr>
	<tr><td>Cat-Breze/Met</td><td><a href="erfassen_conv01.asp?Art=21">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=21">mutieren</a></td></tr>
	<tr><td>Cat-Non-Food</td><td><a href="erfassen_conv01.asp?Art=22">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=22">mutieren</a></td></tr>
	<tr><td>Cat-Quick</td><td><a href="erfassen_conv01.asp?Art=27">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=27">mutieren</a></td></tr>
</table>



<br /><br />

<table width="250">
<tr>
	<td>Tageshit</td>
	<td><a href="erfassen_tagesHit01.asp?Art=1">erfassen</td><td><a href="mutieren_tagesHit01.asp?Art=1">mutieren</a></td></tr>
<tr>
	<td>Herkunfsland</td><td><a href="erfassen_conv_titel01.asp?Art=300">erfassen</a></td><td><a href="mutieren_herkunftsland01.asp?Art=300">mutieren</a></td>
</tr>
<tr>
	<td>SB1/SB2</td><td>-***-</a></td><td><a href="mutieren_tbConfig01.asp">mutieren</a></td>
</tr>

</table>

<br />

<HR size="1">
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