
<%

Response.CacheControl = "no-cache"


%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

ConvArt = Request.QueryString("Art")

SetLocale("de")


Meldung = Request.QueryString("Meldung")

DatumGewaehlt = Request.Form("ComboName")

Liefertag = Date() + 1

'Grundsätzlich wird als Liefertag der Tag von morgen 'vorgegeben. Falls der Bestelltag auf einen Freitag
'fällt, ist der Liefertag der kommenden Montag.
if Weekday(Now,0) = 5 then
    Liefertag = Date() + 3
end if


If DatumGewaehlt = "" then
    FirstRun = true
else
    FirstRun = false
end if


'SQL = "Select * from tbConv Order by ConvId"
'RS.Open SQL,conn,3,3
'rs.close
%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">


<head>
<title>Ospelt Catering</title>
</head>

<body>

<B>Bestellung mutieren</B>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>


<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form name=bestellung action="mutieren_bestellung_conv01.asp" method=POST>
<input type="hidden" value="<% = ConvArt %>" name="Art" />
   <tr>
   <td>Restaurant:</td><td><!--#INCLUDE FILE="drp_user.asp"--></td>
    </tr>
    
       
  </table>
  
  
  <p><input type="submit" value="öffnen" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>


</form>
</body>

</html>
