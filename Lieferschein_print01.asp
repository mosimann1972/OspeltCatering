
<%

Response.CacheControl = "no-cache"

%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

%>


<script type="text/javascript" language="JavaScript"> 
<!--    Begin
    var checkflag1 = "false";
 
    function check1(field) {
        if (checkflag1 == "false") {
            for (i = 0; i < field.length; i++) {
                field[i].checked = true;
            }
            checkflag1 = "true";
            return " keine ";
        }
        else {
            for (i = 0; i < field.length; i++) {
                field[i].checked = false;
            }
            checkflag1 = "false";
            return " alle ";
        }
    }
 
//  End -->
 

</script>



<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<link rel="stylesheet" type="text/css" href="tcal.css" />
<script type="text/javascript" src="tcal.js"></script> 

</head>
<body>
 


<head>
<title>Ospelt Catering</title>
</head>

<body>

<B>Lieferscheine drucken</B>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>


<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form method="POST" action="Lieferschein_print02.asp" ID="Form1">

    <tr>
        <td>Restaurant:</td><td colspan="4"><!--#INCLUDE FILE="drp_user.asp"--></td>
    </tr>

    <tr>
        <td>Datum:</td><td colspan="4"><input type="text" name="txtDatum" class="tcal" value="" /></td>
    </tr> 

    <tr>
        <td>Gruppe:</td>
        <td colspan="4">
            AS: <input type="checkbox" name="CheckGruppe" value="AS">&nbsp;
            DK: <input type="checkbox" name="CheckGruppe" value="DK">
        </td>
    </tr>
         
    <tr>
    <td>Auswahl:</td>
    <td colspan="4">
    <input type="button" value="alle" onClick="this.value=check1(this.form.list1)">
    </td>
    </tr>
    
 
    <tr>
        <td>Menu</td>
        <td><input type="checkbox" name="list1" value="0">&nbsp;</td>
        <td>Menü-Suppe</td>
        <td><input type="checkbox" name="list1" value="2">&nbsp;</td>
    </tr>
     
    <tr>
        <td>Conv</td>
        <td><input type="checkbox" name="list1" value="1">&nbsp;</td>
        <td>Tageshit</td>
        <td><input type="checkbox" name="list1" value="9">&nbsp;</td>
    </tr>
    
    <tr>
        <td>Fleisch</td>
        <td><input type="checkbox" name="list1" value="5">&nbsp;</td>
        <td>Fisch</td>
        <td><input type="checkbox" name="list1" value="17">&nbsp;</td>
    </tr>
    
	<tr>
        <td>W-Bestellung</td>
        <td><input type="checkbox" name="list1" value="11">&nbsp;</td>
        <td>T-Best Salat</td>
        <td><input type="checkbox" name="list1" value="16">&nbsp;</td>
    </tr>
    
    <tr>
        <td>Dessert</td>
        <td><input type="checkbox" name="list1" value="14">&nbsp;</td>
        <td>Menü-Obst</td>
        <td><input type="checkbox" name="list1" value="15">&nbsp;</td>
    </tr>

	<tr>
        <td>Non-Food</td>
        <td><input type="checkbox" name="list1" value="18">&nbsp;</td>
        <td>Papeterie</td>
        <td><input type="checkbox" name="list1" value="23">&nbsp;</td>
    </tr>

    <tr>
        <td>Quick Lieferschein</td>
        <td><input type="checkbox" name="list1" value="24">&nbsp;</td>
    </tr>
 
    </table>

     
  <p><input type="submit" value="drucken" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>


</form>
</body>

</html>

     