
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

<body class="Navigation">

<B>Auswahl:</B>
<hr size="1">
<BR>
<a href="erfassen_bestellung_menu01.asp?Art=1">Men� bestellen</a><br />
<a href="mutieren_bestellung_menu01.asp?Art=1">Men� �ndern/l�schen</a>
<br /><br />
<a href="anzeigen_menu_plan01.asp">Men�plan pro KW</a>
<br /><br />
<HR size="1"><br />
<a href="erfassen_bestellung_conv01.asp">Convenience bestellen</a><br />
<a href="mutieren_bestellung_conv01.asp">Convenience �ndern/l�schen</a><br />
<br />
<HR size="1">
<br />
Tagesbestellung<br /><br />
<a href="erfassen_bestellung_salat01.asp">Salat bestellen</a><br />
<a href="mutieren_bestellung_salat01.asp">Salat �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=1">Tageshit bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=1">Tageshit �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=400">Wellnessdrink bestellen</a><br />
<a href="mutieren_bestellung_suppewellness01.asp?Art=400">Wellnessdrink �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=100">Men�suppe bestellen</a><br />
<a href="mutieren_bestellung_suppewellness01.asp?Art=100">Men�suppe �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=700">Tagessuppe bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=700">Tagessuppe �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=200">Schnittlauch bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=200">Schnittlauch �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=300">Fleischk�s bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=300">Fleischk�s �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=500">K�sefleischk�s bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=500">K�sefleischk�s �ndern/l�schen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=600">Peperoniefleischk�s bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=600">Peperoniefleischk�s �ndern/l�schen</a><br />








<HR size="1">
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