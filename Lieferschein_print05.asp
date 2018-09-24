
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
   <td>Restaurant:</td><td><!--#INCLUDE FILE="drp_user.asp"--></td>
    </tr>

       <tr>
   <td>Gruppe:</td>
        <td>
            AS: <input type="checkbox" name="CheckGruppe" value="AS">&nbsp;
            DK: <input type="checkbox" name="CheckGruppe" value="DK">
        </td>
    </tr>


    <tr>
   <td>Datum:</td><td><input type="text" name="txtDatum" size="10"> (TT.MM.JJJJ)</td>
    </tr>       

        <tr>
    <td>Papeterie</td>
    <td><input checked type="checkbox" name="list1" value="23">&nbsp;</td>
    </tr>
    
    </table>

     
  <p><input type="submit" value="drucken" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>


</form>
</body>

</html>
