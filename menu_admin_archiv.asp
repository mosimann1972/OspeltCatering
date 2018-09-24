
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
 

<B>Auswahl Admin:</B>
<hr size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_admin" target=_self>Jahr ändern</a>

<br /><br />

<table width="250">
<tr><td><a href="anzeigen_bestellung00.asp">Menu</a></td><td>(pro Tag, alle Menu)</td></tr>
<tr><td><a href="anzeigen_conv01.asp?ShowAll=289">Menu</a></td><td>(Suppe,Tageshit,W-Drink)</td></tr>
<tr><td><a href="anzeigen_bestellung01.asp">Menu</a></td><td> (alle, pro KW)</td></tr>
<tr><td><a href="anzeigen_bestellung_proRestaurant01.asp">Menu</a></td><td> (einzeln)</td></tr>
<tr><td><a href="anzeigen_bestellung01.asp?Show=Prod">Menu</a></td><td> (Produktion, pro Woche)</td></tr>
<tr><td><a href="erfassen_bestellung_menu01.asp?Admin=1">Menu</td><td>(erfassen)</td></tr>
<tr><td><a href="mutieren_bestellung_menu00.asp?Art=1">Menü</a></td><td>(mutieren)</td></tr>
</table>

<br />
<br />

<table width="250">
<tr>
<td><a href="anzeigen_conv01.asp?Art=1">Conv</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=1">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=1">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=10">Salat</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=10">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=10">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=9">Tageshit</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=9">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=9">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=5">Fleisch</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=5">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=5">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=17">Fisch</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=17">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=17">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=8">W-Drink</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=8">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=8">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=2">M-Suppe</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=2">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=2">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=3">S-Suppe</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=3">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=3">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=7">Gassner</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=7">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=7">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=6">Obst</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=6">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=6">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=13">Gemüse</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=13">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=13">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=11">W-Bestellung</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=11">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=11">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=12">T-Best Sonst</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=12">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=12">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=16">T-Best Salat</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=16">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=16">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=14">Dessert</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=14">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=14">mutieren</a></td>
</tr>


<tr>
<td><a href="anzeigen_conv01.asp?Art=15">M-Obst</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=15">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=15">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=18">Non-Food</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=18">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=18">mutieren</a></td>
</tr>


</table>

<br /><br />

<table width="250">
<tr>
<td><a href="anzeigen_conv01.asp?Art=19">Catering</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=19">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=19">mutieren</a></td>
</tr>

</table>

<br /><br />
	

<table width="250">
<tr>
<td><a href="Lieferschein_print01.asp">Lieferscheine drucken</a></td>
</tr>
</table>

<br />

<table width="250">
<tr>
<td>Restaurant</td><td><a href="erfassen_user01.asp?Art=100">erfassen</a></td><td><a href="mutieren_user01.asp?Art=100">mutieren</a></td>
</tr>
<tr>
<td>ConvTitel</td><td><a href="erfassen_conv_titel01.asp?Art=200">erfassen</a></td><td><a href="mutieren_conv_titel01.asp?Art=200">mutieren</a></td>
</tr>
<tr>
<td>Jahr pro User</td><td><a href="erfassen_jahr01.asp">erfassen</a></td><td>&nbsp;</td>
</tr>


</table>

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