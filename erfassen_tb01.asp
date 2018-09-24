
<%

Response.CacheControl = "no-cache"


%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%




Meldung = Request.QueryString("Meldung")

Art = Request.QueryString("Art")

DatumGewaehlt = Request.Form("ComboName")

Liefertag = Date() + 1

'Grundsätzlich wird als Liefertag der Tag von morgen vorgegeben. Falls der Bestelltag auf einen Freitag
'fällt, ist der Liefertag der kommenden Montag.
if Weekday(Now,0) = 5 then
    Liefertag = Date() + 3
end if


If DatumGewaehlt = "" then
    FirstRun = true
else
    FirstRun = false
end if


%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">


<head>
<title>Ospelt Catering</title>
</head>

<body>

<B><%
   if Art = 1 then Response.Write "Tageshit"
   if Art = 2 then Response.Write "Fleischkäs"
   if Art = 3 then Response.Write "Schnittlauch"
%>

erfassen</B>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>



<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form name=bestellung action="erfassen_tb02.asp" method=POST>
<input type="hidden" name="txtArt" value="1" />
<form name=frmTest action="erfassen_tb01.asp" method=POST>
   
   <tr>
   <td>Liefertag: </td>
  
   <td>
   
   <select name=ComboName size=1 onChange="frmTest.submit();">   
    
    <% 
    
    
    
    Do while counter <= 20 
        if counter = 0 then
        
        if FirstRun = True then
            Response.Write "<option selected value=""" & getDatum(Liefertag) & """>" & getWochentag(getDatum(Liefertag)) & ", " & getDatum(Liefertag) & "</option>"
        else
            Response.Write "<option selected value=""" & DatumGewaehlt & """>" & getWochentag(DatumGewaehlt) & ", " & getDatum(DatumGewaehlt) & "</option>"
        end if
    
    else
    
        if Counter = 1 and FirstRun = false then
            Liefertag = Liefertag
        else
            Liefertag = Liefertag + 1 
        end if
        
    
        if Weekday(Liefertag,0) <=5 then
            Response.Write "<option value=""" & getDatum(Liefertag) & """>" & getWochentag(getDatum(Liefertag)) & ", " & getDatum(Liefertag) & "</option>"
        end if
        
        if Weekday(Liefertag,0) = 6 then
            Response.Write "<option>-------------</option>"
        end if
        
    end if
        
    counter = counter + 1
    Loop
  
    %>
    
    </select>

    </td>
    </tr>
    
    <tr>
      <td>
      <%
        if Art = 1 then Response.Write "Tageshit"
        if Art = 2 then Response.Write "Fleischkäs"
        if Art = 3 then Response.Write "Schnittlauch"
       %>
     </td>
      <td><input type="text" name="txtBezeichnung" size="80"></td>
      </tr>
      <tr>
      <td><font size="1">Einheit: Kg,Liter,Portion,Stück usw.</font></td>
      <td><input type="text" name="txtEinheit" size="5"> </td>
      </tr>
      <tr>
      <td><font size="1">Preis pro Einheit</font></td>
      <td><input type="text" name="txtPreis" size="5"></td>        
    </tr>
    
  </table>
  
  <p><input type="submit" value="speichern" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>

</form>
</form>
</body>

</html>
