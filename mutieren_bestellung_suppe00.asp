
<%

Response.CacheControl = "no-cache"

%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">


<head>
<title>Ospelt Catering</title>
</head>

<body>

<B>Bestellungen Suppe mutieren</B>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>


<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form name=bestellung action="mutieren_bestellung_suppe01.asp" method=POST>
<input type="hidden" value="<% = ConvArt %>" name="Art" />
   <tr>
   <td>Restaurant:</td><td><!--#INCLUDE FILE="drp_user.asp"--></td>
    </tr>
       
  </table>
  
  
  <p><input type="submit" value="öffnen" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>


</form>
</body>

</html>
