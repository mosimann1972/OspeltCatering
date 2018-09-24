
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
<a href="update_jahr.asp?Seite=menu_admin" target=_self>Jahr mutieren</a>

<br /><br />

<table width="250">
<tr><td><a href="anzeigen_bestellung00.asp">Menu</a></td><td>(pro Tag, alle Menu)</td></tr>
<tr><td><a href="anzeigen_conv01.asp?ShowAll=289">Menu</a></td><td>(Suppe,Tageshit,W-Drink)</td></tr>
<tr><td><a href="anzeigen_bestellung01.asp">Menu</a></td><td> (alle, pro KW)</td></tr>
<tr><td><a href="anzeigen_bestellung_proRestaurant01.asp">Menu</a></td><td> (einzeln)</td></tr>
<tr><td><a href="anzeigen_bestellung01.asp?Show=Prod">Menu</a></td><td> (Produktion, pro Woche)</td></tr>
<tr><td><a href="erfassen_bestellung_menu01.asp?Admin=1">Menu</td><td>(erfassen)</td></tr>
<tr><td><a href="mutieren_bestellung_menu00.asp?Art=1">Menu</a></td><td>(mutieren)</td></tr>
</table>

<br />
<br />



<table width="250">
<tr><td><a href="erfassen_bestellung_suppe01.asp?Admin=1">Menü-Suppe</td><td>(erfassen)</td></tr>
<tr><td><a href="mutieren_bestellung_suppe00.asp?Art=1">Menü-Suppe</a></td><td>(mutieren)</td></tr>
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
<td><a href="anzeigen_conv01.asp?Art=11">W-Bestellung</a></td>
<td><a href="erfassen_bestellung_conv00.asp?Art=11">erfassen</a></td>
<td><a href="mutieren_bestellung_conv00.asp?Art=11">mutieren</a></td>
</tr>

<tr>
<td><a href="anzeigen_conv01.asp?Art=16">T-Salat</a></td>
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


<tr>
	<td><a href="anzeigen_conv01.asp?Art=23">Papeterie</a></td>
	<td><a href="erfassen_bestellung_conv00.asp?Art=23">erfassen</a></td>
	<td><a href="mutieren_bestellung_conv00.asp?Art=23">mutieren</a></td>
</tr>

<tr>
	<td><a href="anzeigen_conv01.asp?Art=24">Quick</a></td>
	<td><a href="erfassen_bestellung_conv00.asp?Art=24">erfassen</a></td>
	<td><a href="mutieren_bestellung_conv00.asp?Art=24">mutieren</a></td>
</tr>

<tr>
	<td><a href="anzeigen_conv01.asp?Art=25">Inhouse</a></td>
	<td><a href="erfassen_bestellung_conv00.asp?Art=25">erfassen</a></td>
	<td><a href="mutieren_bestellung_conv00.asp?Art=25">mutieren</a></td>
	</tr>

<tr>
		<td><a href="anzeigen_conv01.asp?Art=26">Dauerauftrag</a></td>
		<td><a href="erfassen_bestellung_conv00.asp?Art=26">erfassen</a></td>
		<td><a href="mutieren_bestellung_conv00.asp?Art=26">mutieren</a></td>
</tr>	


</table>

<br /><br />


<table width="250">
	<tr><td><a href="anzeigen_conv01.asp?Art=19">Cat-Brötle</a></td><td><a href="erfassen_bestellung_conv00.asp?Art=19">erf</a></td><td><a href="mutieren_bestellung_conv00.asp?Art=19">mut</a></td></tr>
	<tr><td><a href="anzeigen_conv00.asp?Art=20">Cat-Business</a></td><td><a href="erfassen_bestellung_conv00.asp?Art=20">erf</a></td><td><a href="mutieren_bestellung_conv00.asp?Art=20">mut</a></td></tr>
	<tr><td><a href="anzeigen_conv00.asp?Art=21">Cat-Breze/Met</a></td><td><a href="erfassen_bestellung_conv00.asp?Art=21">erf</a></td><td><a href="mutieren_bestellung_conv00.asp?Art=21">mut</a></td></tr>
	<tr><td><a href="anzeigen_conv01.asp?Art=22">Cat-Non-Food</a></td><td><a href="erfassen_bestellung_conv00.asp?Art=22">erf</a></td><td><a href="mutieren_bestellung_conv00.asp?Art=22">mut</a></td></tr>
	<tr><td><a href="anzeigen_conv01.asp?Art=27">Cat-Quick</a></td><td><a href="erfassen_bestellung_conv00.asp?Art=27">erf</a></td><td><a href="mutieren_bestellung_conv00.asp?Art=27">mut</a></td></tr>
</table>


<br /><br />
	

<table width="250">
<tr>
	<td>Lieferschein</td>
	<td><a href="Lieferschein_print01.asp">Allgemein</a></td>
	<td><a href="Lieferschein_print00.asp">Catering</a></td>
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
	<td>tbConfig</td><td><a href="erfassen_tbConfig01.asp?">erfassen</a></td><td><a href="mutieren_tbConfig01.asp?">mutieren</a></td>
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