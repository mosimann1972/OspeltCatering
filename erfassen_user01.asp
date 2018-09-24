
<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->


<%

Response.CacheControl = "no-cache"

Meldung = Request.QueryString("Meldung")

Art = Request.QueryString("Art")

%>

<!--#INCLUDE FILE="titel.asp"-->

<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">

<head>
<title>----</title>
</head>

<body>

<B><% = SeitenTitel %></B>
<hr size="1">
<br />
<% if Meldung <> "" then %>
<b><font color="red"><% = Meldung %></font></b>
<% end if %>

<form method="POST" action="erfassen_user02.asp">
    <table  cellpadding="5" cellspacing="0" border="0">

    <tr>
      <td>Name:</td>
      <td><input type="text" name="txtName" size="80"></td>
    </tr>
    
    <tr>
      <td>Passwort:</td>
      <td><input type="text" name="txtPasswort" size="80"></td>
    </tr>
    
      
    <tr>
      <td>Kurzzeichen:</td>
      <td><input type="text" name="txtKurzeichen" size="80"></td>
    </tr>
      
     <tr>
      <td>AS/DK:</td>
      <td><!--#INCLUDE FILE="drp_AsDk.asp"--> (AS:Aussenstelle, DK:Direktkunde)</td>
    </tr> 
      
    <tr>
      <td>KD-KST-Nummer:</td>
      <td><input type="text" name="txtKundennummer" size="80"></td>
    </tr>

    <tr>
      <td>Inhouse Kunde:</td>
      <td><input type="text" name="txtInhouse" size="80"></td>
    </tr>
          
  </table>
  
  <p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
</form>

</body>

</html>
