
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








<B>Auswahl K�che:</B>
<hr size="1">

<br />
<B>Aktuelles Jahr: <font size="4"><% = GetAktuellesJahr(Session("UserId")) %></font></B>
<br />
<a href="update_jahr.asp?Seite=menu_kueche" target=_self>Jahr �ndern</a>

<br /><br />



<table width="250">
<tr><td>Suppe</td><td><a href="erfassen_zutaten01.asp?Art=5">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=5">�ndern</a></td></tr>
<tr><td>Wellnessdrink</td><td><a href="erfassen_zutaten01.asp?Art=1">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=1">�ndern</a></td></tr>
<tr><td>HS</td><td><a href="erfassen_zutaten01.asp?Art=2">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=2">�ndern</a></td></tr>
<tr><td>SB</td><td><a href="erfassen_zutaten01.asp?Art=3">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=3">�ndern</a></td></tr>
<tr><td>Ge/Sa</td><td><a href="erfassen_zutaten01.asp?Art=4">erfassen</td><td><a href="mutieren_zutaten01.asp?Art=4">�ndern</a></td></tr>
</table>

<br /><br />

<table width="250">
<tr><td>Men�</td><td><a href="erfassen_menu01.asp">erfassen</a></td><td><a href="mutieren_menu01.asp">�ndern</a></td></tr>
<tr><td>Men�plan</td><td><a href="erfassen_menu_plan01.asp">erfassen</a></td><td><a href="mutieren_menu_plan01.asp">�ndern</a></td></tr>
<tr><td>Men�plan</td><td colspan="2"><a href="anzeigen_menu_plan01.asp">pro KW</a></td></tr>
</table>

<br /><br />


<table width="250">
<tr><td>Conv</td><td><a href="erfassen_conv01.asp?Art=1">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=1">�ndern</a></td></tr>
<tr><td>W-bestellung</td><td><a href="erfassen_conv01.asp?Art=11">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=11">�ndern</a></td></tr>
<tr><td>T-Best Sonst</td><td><a href="erfassen_conv01.asp?Art=12">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=12">�ndern</a></td></tr>
<tr><td>T-Best Salat</td><td><a href="erfassen_conv01.asp?Art=16">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=16">�ndern</a></td></tr>
<tr><td>Fleisch</td><td><a href="erfassen_conv01.asp?Art=5">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=5">�ndern</a></td></tr>
<tr><td>Fisch</td><td><a href="erfassen_conv01.asp?Art=17">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=17">�ndern</a></td></tr>
<tr><td>Gassner</td><td><a href="erfassen_conv01.asp?Art=7">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=7">�ndern</a></td></tr>
<tr><td>Obst</td><td><a href="erfassen_conv01.asp?Art=6">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=6">�ndern</a></td></tr>
<tr><td>Gem�se</td><td><a href="erfassen_conv01.asp?Art=13">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=13">�ndern</a></td></tr>
<tr><td>Dessert</td><td><a href="erfassen_conv01.asp?Art=14">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=14">�ndern</a></td></tr>
<tr><td>Menu-Obst</td><td><a href="erfassen_conv01.asp?Art=15">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=15">�ndern</a></td></tr>
<tr><td>Non-Food</td><td><a href="erfassen_conv01.asp?Art=18">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=18">�ndern</a></td></tr>
<tr><td>----</td></tr>
<tr><td>Salat</td><td><a href="erfassen_conv01.asp?Art=10">erfassen</td><td><a href="mutieren_conv00.asp?Art=10">�ndern</a></td></tr>
<tr><td>TagesHit</td><td>na</td><td><a href="mutieren_conv01.asp?Art=9">�ndern</a></td></tr>
<tr><td>W-Drink</td><td>na</td><td><a href="mutieren_conv01.asp?Art=8">�ndern</a></td></tr>
<tr><td>M-Suppe</td><td>na</td><td><a href="mutieren_conv01.asp?Art=2">�ndern</a></td></tr>
<tr><td>S-Suppe</td><td>na</td><td><a href="mutieren_conv01.asp?Art=3">�ndern</a></td></tr>
</table>

<br /><br />

<table width="250">
	<tr><td>Catering</td><td><a href="erfassen_conv01.asp?Art=19">erfassen</a></td><td><a href="mutieren_conv01.asp?Art=19">�ndern</a></td></tr>
</table>



<br /><br />

<table width="250">
<tr><td>Tageshit</td><td><a href="erfassen_tagesHit01.asp?Art=1">erfassen</td><td><a href="mutieren_tagesHit01.asp?Art=1">�ndern</a></td></tr>
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