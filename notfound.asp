<%

Response.CacheControl = "no-cache"

strMeldung = Request.QueryString("Meldung")

%>

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>----</title>
</head>


<body>

<B>Allgemeine Info</B>
<hr size="1">
<p></p>
<font color="red"><b><% Response.write strMeldung %></b></font>   

</body>
</html>