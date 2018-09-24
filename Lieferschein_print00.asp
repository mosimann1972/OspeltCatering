
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


<H3>Bitte Lieferscheine über die Produktionsübersicht drucken</H3>

<BR>
<br>


<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form method="POST" action="Lieferschein_print04.asp" ID="Form1">

    <tr>
        <td>Restaurant:</td><td colspan="4"><!--#INCLUDE FILE="drp_user.asp"--></td>
    </tr>

    <tr>
        <td>Datum:</td><td colspan="4"><input type="text" name="txtDatum" class="tcal" value="" /></td>
    </tr> 
         
    <tr>
    <td>Auswahl:</td>
    <td colspan="4">
    <input type="button" value="alle" onClick="this.value=check1(this.form.list1)">
    </td>
    </tr>
    
 
    <tr>
        <td>Catering Brötle</td>
        <td><input type="checkbox" name="list1" value="19">&nbsp;</td>
    </tr>

    <tr>
        <td>Catering Business</td>
        <td><input type="checkbox" name="list1" value="20">&nbsp;</td>
    </tr>

    <tr>
        <td>Catering Breze</td>
        <td><input type="checkbox" name="list1" value="21">&nbsp;</td>
    </tr>

    <tr>
        <td>Catering Non-Food</td>
        <td><input type="checkbox" name="list1" value="22">&nbsp;</td>
    </tr>

</table>

  
  

</form>
</body>

</html>




