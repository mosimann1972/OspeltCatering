
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

<body class="NavigationBestellung">

<B><% = Session("UserName") %></B>

<HR size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_bestellung" target=_self>Jahr mutieren</a>

<BR><BR>

<table width="250">
<tr><td>Menü</td><td><a href="erfassen_bestellung_menu01.asp?Admin=0">bestellen</td><td><a href="mutieren_bestellung_menu01.asp?Art=1">mutieren</td></tr>
<tr><td>Menü</td><td colspan="2"><a href="anzeigen_menu_plan01.asp">Plan pro Woche</td></tr>
</table>

<br /><br />


<table width="250">
<tr><td>Menü-Suppe</td><td><a href="erfassen_bestellung_suppe01.asp?Admin=0">bestellen</td><td><a href="mutieren_bestellung_suppe01.asp?Art=1">mutieren</td></tr>
</table>

<br /><br />


<table width="250">
    <tr><td>Conv</td><td><a href="erfassen_bestellung_conv01.asp?Art=1">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=1">mutieren</td></tr>
    <tr><td>Tageshit</td><td><a href="erfassen_bestellung_conv01.asp?Art=9">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=9">mutieren</td></tr>
    <tr><td>Fleisch</td><td><a href="erfassen_bestellung_conv01.asp?Art=5">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=5">mutieren</td></tr>
	<tr><td>Fisch</td><td><a href="erfassen_bestellung_conv01.asp?Art=17">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=17">mutieren</td></tr>
    <tr><td>Wochenbest.</td><td><a href="erfassen_bestellung_conv01.asp?Art=11">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=11">mutieren</td></tr>
    <tr><td>T-Best Salat</td><td><a href="erfassen_bestellung_conv01.asp?Art=16">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=16">mutieren</td></tr>
    <tr><td>Dessert</td><td><a href="erfassen_bestellung_conv01.asp?Art=14">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=14">mutieren</td></tr>
    <tr><td>Menü-Obst</td><td><a href="erfassen_bestellung_conv01.asp?Art=15">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=15">mutieren</td></tr>
    <tr><td>Non-Food</td><td><a href="erfassen_bestellung_conv01.asp?Art=18">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=18">mutieren</td></tr>
    <tr><td>Papeterie</td><td><a href="erfassen_bestellung_conv01.asp?Art=23">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=23">mutieren</td></tr>

    <% if GetInhouseKunde(Session("UserId")) = true then %>
        <tr><td>Inhouse</td><td><a href="erfassen_bestellung_conv01.asp?Art=25">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=25">mutieren</td></tr>
    <% end if %>

    </table>

<br /><br />

<table width="250">
	<tr><td>Cat-Brötle</td><td><a href="erfassen_bestellung_conv01.asp?Art=19">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=19">mutieren</td></tr>
	<tr><td>Cat-Business</td><td><a href="erfassen_bestellung_conv_catering00.asp?Art=20">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=20">mutieren</td></tr>
	<tr><td>Cat-Brez/Me</td><td><a href="erfassen_bestellung_conv_catering00.asp?Art=21">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=21">mutieren</td></tr>
	<tr><td>Cat-NonFood</td><td><a href="erfassen_bestellung_conv01.asp?Art=22">bestellen</td><td><a href="mutieren_bestellung_conv01.asp?Art=22">mutieren</td></tr>
</table>

<br /><br />

<form ID="Form1">
<input type="button" value="drucken" onClick="printrechts()" ID="Button1" NAME="Button1">
</form>

<P>
<a target="_top" href="ende.asp"><B>Beenden</b></a></p>

<font size="1">Eingeloggt als:<br />
<B><% = Session("UserName") %></B></font>
<br /><br />
<img src="ospelt.jpg" />

</body>
</html>