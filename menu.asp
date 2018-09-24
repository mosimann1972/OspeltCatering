
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
<a href="erfassen_bestellung_menu01.asp?Art=1">Menü bestellen</a><br />
<a href="mutieren_bestellung_menu01.asp?Art=1">Menü ändern/löschen</a>
<br /><br />
<a href="anzeigen_menu_plan01.asp">Menüplan pro KW</a>
<br /><br />
<HR size="1"><br />
<a href="erfassen_bestellung_conv01.asp">Convenience bestellen</a><br />
<a href="mutieren_bestellung_conv01.asp">Convenience ändern/löschen</a><br />
<br />
<HR size="1">
<br />
Tagesbestellung<br /><br />
<a href="erfassen_bestellung_salat01.asp">Salat bestellen</a><br />
<a href="mutieren_bestellung_salat01.asp">Salat ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=1">Tageshit bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=1">Tageshit ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=400">Wellnessdrink bestellen</a><br />
<a href="mutieren_bestellung_suppewellness01.asp?Art=400">Wellnessdrink ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=100">Menüsuppe bestellen</a><br />
<a href="mutieren_bestellung_suppewellness01.asp?Art=100">Menüsuppe ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=700">Tagessuppe bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=700">Tagessuppe ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=200">Schnittlauch bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=200">Schnittlauch ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=300">Fleischkäs bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=300">Fleischkäs ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=500">Käsefleischkäs bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=500">Käsefleischkäs ändern/löschen</a><br />
<br />
<a href="erfassen_bestellung_tagesbestellung01.asp?Art=600">Peperoniefleischkäs bestellen</a><br />
<a href="mutieren_bestellung_tagesbestellung01.asp?Art=600">Peperoniefleischkäs ändern/löschen</a><br />








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