
<%

Response.CacheControl = "no-cache"


%>



<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%




response.Write ">>>> " & Request.Form("myName")



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



'----------------1 = Tageshit

if Art = 1 then
    DatumSeach = cDate(Liefertag)
    xDate = "#" & Month(DatumSeach) & "/" & Day(DatumSeach) & "/" & Year(DatumSeach) & "#"
    SQL = "Select * from tbFutter where Art = " & Art & " and Datum = " & xDate & ""
else
    SQL = "Select * from tbFutter where Art = " & Art & ""
end if

RS.Open SQL,conn,3,3


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
%> bestellen</B>
<hr size="1">

<br />
<% if Meldung <> "" then %>
<b><% = Meldung %></b>
<% end if %>







<table border="0" cellpadding="3" cellspacing="0" ID="Table1">

<form name=bestellung action="erfassen_bestellung_tb02.asp" method=POST>
<input type="hidden" name="txtArt" value="<% = Art %>" />
<input type="hidden" name="txtFutterId" value="<% = RS("FutterId") %>" />


<form name=frmTest action="erfassen_bestellung_tb01.asp" method=POST>
   

   
   
   <tr>
   <td>Liefertag: </td>
   
   
   <td>
   
   
   <select name=ComboName size=1 onChange="javascript:document.frmTest.submit( );">
    
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
    
    
    <% do while not RS.eof %>
  
      <tr>
      <td><% = RS("FutterName") %></td>
      <td><input type="text" name="txtFutterWert" size="5"> <% = RS("Einheit") %></td>
      </tr>
      
      <% RS.MoveNext
      Loop %>
    
  </table>
    
  
  <p><input type="submit" value="speichern" name="bestellung"><input type="reset" value="Zurücksetzen" name="B2"></p>

</form>
</form>
</body>

</html>
