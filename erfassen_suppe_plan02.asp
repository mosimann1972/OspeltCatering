<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%


Meldung = Request.Querystring("Meldung")


'----------------------------------------------------------
'Dublikatscheck Menuplan

SQL = "Select * from tbMenuPlan where" _
    & " KW = " & getKWId_ProJahr(Request.Form("txtKWId")) & "" _
    & " and Jahr = " & getKWJahr_ProJahr(Request.Form("txtKWId")) & "" _
    & " and MenuArtId = " & Request.Form("txtMenuArtId") & ""

'Response.Write SQL & "<bR>"

RS.Open SQL,conn,3,3
Anz = RS.RecordCount
RS.Close

if Anz <> 0 then
    response.Redirect "erfassen_menu_plan01.asp?Meldung=Menuplan bereits vorhanden!"
end if

'----------------------------------------------------------

%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>


<body>


<B>Suppenplan erfassen</B>
<hr size="1">


<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>

<form method="POST" action="erfassen_suppe_plan03.asp">

<input type="hidden" name="txtKW" value="<% = getKWId_ProJahr(Request.Form("txtKWId")) %>" />
<input type="hidden" name="txtJahr" value="<% = getKWJahr_ProJahr(Request.Form("txtKWId")) %>" />
<input type="hidden" name="txtMenuArtId" value="5" />

    <table border="0" cellpadding="3" cellspacing="0" ID="Table1">
    <tr>
      <td>Kalenderwoche:</td><td><% = getKW(getKWId_ProJahr(Request.Form("txtKWId")),getKWJahr_ProJahr(Request.Form("txtKWId"))) %></td>
    </tr>

     
    <tr>
      <td>Montag:</td>
      <td>
      <%
        SQL = "Select * from tbMenu where MenuArtId = 5 and Aktiv = true Order By Bezeichnung"
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtSuppeMontag" ID="Select2">
        <option selected></option>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("HS"))%>, <% = getZutatenName(RS("SB1"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr>  
    


    <tr>
      <td>Dienstag:</td>
      <td>
      <%
      SQL = "Select * from tbMenu where MenuArtId = 5 and Aktiv = true Order By Bezeichnung"
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtSuppeDienstag" ID="Select2">
        <option selected></option>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("HS"))%>, <% = getZutatenName(RS("SB1"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr> 
   
 
	<tr>
      <td>Mittwoch:</td>
      <td>
      <%
      SQL = "Select * from tbMenu where MenuArtId = 5 and Aktiv = true Order By Bezeichnung"
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtSuppeMittwoch" ID="Select2">
        <option selected></option>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("HS"))%>, <% = getZutatenName(RS("SB1"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr> 
		

	<tr>
      <td>Donnerstag:</td>
      <td>
      <%
      SQL = "Select * from tbMenu where MenuArtId = 5 and Aktiv = true Order By Bezeichnung"
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtSuppeDonnerstag" ID="Select2">
        <option selected></option>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("HS"))%>, <% = getZutatenName(RS("SB1"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr> 


    <tr>
      <td>Freitag:</td>
      <td>
      <%
      SQL = "Select * from tbMenu where MenuArtId = 5 and Aktiv = true Order By Bezeichnung"
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtSuppeFreitag" ID="Select2">
        <option selected></option>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("HS"))%>, <% = getZutatenName(RS("SB1"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr> 

    
     </table>
<p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zurücksetzen" name="B2"></p>
 </form>

 </body>
 </html>

