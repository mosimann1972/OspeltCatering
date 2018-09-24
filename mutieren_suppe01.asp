<%

Response.CacheControl = "no-cache"

%>


<!--#INCLUDE FILE="include.asp"-->

<!--#INCLUDE FILE="anmeldecheck.asp"-->




<%

Art = ""
Art = Request.QueryString("Art")
if Art = "" then
    Art = Request.Form("Art")
end if

'-----------------------------------------------------
' Menulöschen ist nicht möglich, da ev. Bestellungen vorhanden

if Request.QueryString("M") = "Lo" then

		response.Redirect "notfound.asp?Meldung=Suppe kann nicht gelöscht werden!"	

'    SQL = "Select * from tbMenu where MenuId = " & Request.QueryString("MenuId") & ""
'    RS.Open SQL,conn,3,3
'    RS.Delete
'    RS.Close

end if

'-----------------------------------------------------

if Request.Form("B1") = "speichern" then

    Aktiv = Request.Form("Aktiv")
    if Aktiv = "ON" then
        Aktiv = "true"
    else
        Aktiv = "false"
    end if    
    
    SQL = "Select * from tbMenu where MenuId = " & Request.Form("MenuId") & ""
    RS.Open SQL,conn,3,3
	
	if Request.Form("txtSuppe01") <> "" then 
		RS("HS")                 = Request.Form("txtSuppe01")
	end if

	if Request.Form("txtSuppe02") <> "" then 
		RS("SB1")                 = Request.Form("txtSuppe02")
	end if

    if Request.Form("txtPreis") <> "" then
        RS("Preis")           = Request.Form("txtPreis")
    Else
        RS("Preis") = 0
    end if

    if Request.Form("txtPreis") <> "" then
        RS("PreisMwst")           = Request.Form("txtPreisMwst")
    Else
        RS("PreisMwst") = 0
    end if

    if Request.Form("txtPreis") <> "" then
        RS("PreisInhouse")           = Request.Form("txtPreisInhouse")
    Else
        RS("PreisInhouse") = 0
    end if

    if Request.Form("txtBezeichnung") <> "" then
        RS("Bezeichnung")           = Request.Form("txtBezeichnung")
    end if
    
    RS("Aktiv")             = Aktiv
    RS.Update
    RS.Close

end if

'-----------------------------------------------------

SQL = "Select * from tbMenu where MenuArtId = 5 Order By MenuId, Bezeichnung, Aktiv"
RS.Open SQL,conn,3,3

if RS.Recordcount = 0 then
	response.Redirect "notfound.asp?Meldung=Keine Einträge in Datenbank gefunden!"
end if


%>

<html>

<link href="ospelt.css" rel="stylesheet" type="text/css" />


<head>
<title>------</title>
</head>


<body>

<B>Suppe mutieren/löschen</B>
<hr size="1">

<br />

<% '-----------------------------------------------------  %>

<% if Request.QueryString("M") <> "Mu" then %>

<table  cellpadding="5" cellspacing="0" border="0">

<% 


TitelFlag = true


do while not RS.eof %>


    <tr> 
		<td><% = RS("Bezeichnung") %></td>
		<td><% = getZutatenName(RS("HS")) %> - <% = getZutatenName(RS("SB1")) %></td>
        <td><% = FormatNumber(RS("Preis"),2) %></td>
        <td>
        <% 
			if RS("Aktiv") = true then
				check = "checked"
			else 
				check = ""
            end if
       %>
            <input value="ON" name="aktiv" id="Checkbox2" type="checkbox" <% = check %> /><br /><font size="1"><center><% = RS("MenuId") %></center></font>
            </td>
            <td><a href="mutieren_suppe01.asp?MenuId=<% = RS("MenuId") %>&M=Mu">mutieren</a></td>
            <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_suppe01.asp?MenuId=<% = RS("MenuId") %>&M=Lo">löschen</a></td>
      
   </tr>

<% RS.MoveNext
Loop
RS.Close
%>

</table>

<% end if %>

<% '-----------------------------------------------------  %>


<% if Request.QueryString("M") = "Mu" then 
RS.Close
SQL = "Select * from tbMenu where MenuId = " & Request.QueryString("MenuId") & ""
RS.Open SQL,conn,3,3

%>


<table  cellpadding="5" cellspacing="0" border="0">

<form method="POST" action="mutieren_suppe01.asp">
<input type="hidden" name="MenuId" value="<% = RS("MenuId") %>" />
    
    <tr>
      <td>Suppe:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 6 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtSuppe01" ID="Select5">
        <option selected value=<% = RS("HS") %>><% = getZutatenName(RS("HS")) %></option>

	        <% do while not rsdd.eof %>
		        <option value=<% = RSDD("ZutatenId") %>><% = RSDD("ZutatenName")%></option>
	        <%
	        rsdd.movenext
	        loop
	        rsdd.close
            %>
            </select>
      </td>
    </tr>


        
    <tr>
      <td>Einlage:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 7 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtSuppe02" ID="Select5">
        <option selected value=<% = RS("SB1") %>><% = getZutatenName(RS("SB1")) %></option>

	        <% do while not rsdd.eof %>
		        <option value=<% = RSDD("ZutatenId") %>><% = RSDD("ZutatenName")%></option>
	        <%
	        rsdd.movenext
	        loop
	        rsdd.close
            %>
            </select>
      </td>
    </tr>
    
	 
    <tr>  
        <td>Preis EK:</td><td><input type="text" value="<% = RS("Preis") %>"  name="txtPreis" size="50"></td>
    </tr> 

    <tr>  
        <td>Preis VK:</td><td><input type="text" value="<% = RS("PreisMwst") %>"  name="txtPreisMwst" size="50"></td>
    </tr> 

    <tr>  
        <td>Preis Inhouse:</td><td><input type="text" value="<% = RS("PreisInhouse") %>"  name="txtPreisInhouse" size="50"></td>
    </tr> 


        <tr>  
      <td>Menu Name (Opt.):</td><td><input type="text" value="<% = RS("Bezeichnung") %>"  name="txtBezeichnung" size="50"></td>
      
      </tr> 
      
      
      <tr>  
      <td>Aktiv:</td>
      <% 
      if RS("Aktiv") = true then
        check = "checked"
        else 
        check = ""
        end if
        %>
       <td><input value="ON" name="aktiv" id="Checkbox1" type="checkbox" <% = check %> /></td>
       </tr> 
       

</table>
    
<p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
 </form>



<% 
RS.Close
end if
%>

<% '-----------------------------------------------------  %>


</body>

</html>
