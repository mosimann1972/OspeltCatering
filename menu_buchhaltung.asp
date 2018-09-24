
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
 

<B>Auswahl Buchhaltung:</B>
<hr size="1">
<br /><br< />

<% ' A=Archiv, B=Buchhaltung %>

<table width="250">
<tr><td><a href="anzeigen_buchhaltung0.asp">Abrechnung1</a></td><td>Menu<bR>(alte Anzeige)</td></tr>
<tr><td><a href="anzeigen_buchhaltung00.asp">Abrechnung1</a></td><td>Menu/Conv<BR>(neue Anzeige)</td></tr>
<tr><td><a href="anzeigen_archiv_menu03.asp">Abrechnung2</a></td><td><Font size="1">(pro Menü, AS <B>UND</B> DK)</Font></td></tr>
<tr><td><a href="anzeigen_archiv_menu05.asp">Abrechnung3</a></td><td><Font size="1">(pro Menüart)</Font></td></tr>
<tr><td><a href="anzeigen_archiv_menu00.asp?Run=B">Abrechnung4</a></td><td><Font size="1">(AS <B>ODER</B> DK, pro Menü)</td></tr>
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