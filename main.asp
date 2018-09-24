    
<%

Response.CacheControl = "no-cache"

Meldung = Request.QueryString("Meldung")

%>

<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>----</title>
</head>


<body>

<B>Ospelt Catering</B>
<hr size="1">
<BR>


<% if Meldung <> "" then %>
<b><% = Meldung %></font></b>
<% end if %>




</body>

</html>
