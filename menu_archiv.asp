
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
 

<B>Auswahl Archiv:</B>
<hr size="1">
<br /><br< />


<table width="250">
<tr><td><a href="anzeigen_archiv_menu01.asp">Menu</a></td><td>(pro Tag, alle Menu)</td></tr>
<tr><td><a href="anzeigen_archiv_menu00.asp?Run=A">Menu</a></td><td>(pro AS/DK, pro Menu)</td></tr>

</table>

<br />
<br />

<table width="250">
<tr><td><a href="anzeigen_archiv_conv01.asp">Conv</a></td><td>(Archiv, pro Tag, Diverse)</td></tr>
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