<%

Response.CacheControl = "no-cache"

%>         

<!--#INCLUDE FILE="include.asp"-->


<!--#INCLUDE FILE="anmeldecheck.asp"-->

<%

Meldung = Request.Querystring("Meldung")


Counter = 1
SQL = "Select * from tbMenuPlan where KW = " & Request.QueryString("KW") & " and Jahr = " & Request.QueryString("Jahr") & " and MenuArtId = " & Request.QueryString("MenuArtId") & " Order By MenuPlanId"
RS.Open SQL,conn,3,3

Do While not RS.EOF


    Set RSX = Server.CreateObject("ADODB.Recordset")
    SQLX = "Select * from tbMenu where MenuId = " & RS("MenuId") & ""
    RSX.Open SQLX,conn,3,3

    Select Case Counter 

    Case 1
        Opt1 = "<option value=""" & RSX("MenuId") & """>" & RSX("Bezeichnung") & " (" & getZutatenName(RSX("Suppe")) & "," & getZutatenName(RSX("Wellness")) & "," & getZutatenName(RSX("HS")) & "," & getZutatenName(RSX("SB1")) & "," & getZutatenName(RSX("SB2")) & ")" & "</option>"
    Case 2
        Opt2 = "<option value=""" & RSX("MenuId") & """>" & RSX("Bezeichnung") & " (" & getZutatenName(RSX("Suppe")) & "," & getZutatenName(RSX("Wellness")) & "," & getZutatenName(RSX("HS")) & "," & getZutatenName(RSX("SB1")) & "," & getZutatenName(RSX("SB2")) & ")" & "</option>"
    Case 3    
        Opt3 = "<option value=""" & RSX("MenuId") & """>" & RSX("Bezeichnung") & " (" & getZutatenName(RSX("Suppe")) & "," & getZutatenName(RSX("Wellness")) & "," & getZutatenName(RSX("HS")) & "," & getZutatenName(RSX("SB1")) & "," & getZutatenName(RSX("SB2")) & ")" & "</option>"
    Case 4
        Opt4 = "<option value=""" & RSX("MenuId") & """>" & RSX("Bezeichnung") & " (" & getZutatenName(RSX("Suppe")) & "," & getZutatenName(RSX("Wellness")) & "," & getZutatenName(RSX("HS")) & "," & getZutatenName(RSX("SB1")) & "," & getZutatenName(RSX("SB2")) & ")" & "</option>"
    Case 5
        Opt5 = "<option value=""" & RSX("MenuId") & """>" & RSX("Bezeichnung") & " (" & getZutatenName(RSX("Suppe")) & "," & getZutatenName(RSX("Wellness")) & "," & getZutatenName(RSX("HS")) & "," & getZutatenName(RSX("SB1")) & "," & getZutatenName(RSX("SB2")) & ")" & "</option>"
    Case else
        Response.Write "Fehler"
    end Select



Counter = Counter + 1
RS.MoveNext
Loop
RS.Close




'Response.Write ">>>>" & RS("KwId") & " " & RS("MenuArtId") & " " & RS("MenuId") & "<BR>"





%>


<html>
<link rel="stylesheet" href="ospelt.css" type="text/css">
<head>
<title>Ospelt Catering</title>
</head>


<body>


<B>Men�plan mutieren</B>
<hr size="1">

<% 

if Meldung <> "" then
Response.write Meldung & "<P>"
end if

%>

<form method="POST" action="mutieren_menu_plan03.asp">
<input type="hidden" name="txtKW" value=<% = Request.QueryString("KW") %> />
<input type="hidden" name="txtJahr" value=<% = Request.QueryString("Jahr") %> />
<input type="hidden" name="MenuArtId" value=<% = Request.QueryString("MenuArtId") %> />

    <table border="0" cellpadding="3" cellspacing="0" ID="Table1">
    <tr>
      <td>Kalenderwoche:</td><td><% = getKW(Request.QueryString("KW"),Request.QueryString("Jahr")) %></td>
    </tr>
    <tr>
      <td>Men� Auswahl:</td><td><% = getMenuArt(Request.QueryString("MenuArtId")) %></td>
    </tr>
     
    <tr>
      <td>Montag:</td>
      <td>
      <%
        SQL = "Select * from tbMenu where MenuArtId = " & Request.QueryString("MenuArtId") & " and Aktiv = true Order By Bezeichnung "
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtMenuIdMontag" ID="Select2">
        <% = Opt1 %>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("Suppe"))%>,<% = getZutatenName(RS("Wellness"))%>,<% = getZutatenName(RS("HS"))%>,<% = getZutatenName(RS("SB1"))%>,<% = getZutatenName(RS("SB2"))%>)</option>
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
        SQL = "Select * from tbMenu where MenuArtId = " & Request.QueryString("MenuArtId") & " and Aktiv = true Order By Bezeichnung "
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtMenuIdDienstag" ID="Select1">
        <% = Opt2 %>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("Suppe"))%>,<% = getZutatenName(RS("Wellness"))%>,<% = getZutatenName(RS("HS"))%>,<% = getZutatenName(RS("SB1"))%>,<% = getZutatenName(RS("SB2"))%>)</option>
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
        SQL = "Select * from tbMenu where MenuArtId = " & Request.QueryString("MenuArtId") & " and Aktiv = true Order By Bezeichnung "
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtMenuIdMittwoch" ID="Select3">
        <% = Opt3 %>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("Suppe"))%>,<% = getZutatenName(RS("Wellness"))%>,<% = getZutatenName(RS("HS"))%>,<% = getZutatenName(RS("SB1"))%>,<% = getZutatenName(RS("SB2"))%>)</option>
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
        SQL = "Select * from tbMenu where MenuArtId = " & Request.QueryString("MenuArtId") & " and Aktiv = true Order By Bezeichnung "
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtMenuIdDonnerstag" ID="Select4">
        <% = Opt4 %>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("Suppe"))%>,<% = getZutatenName(RS("Wellness"))%>,<% = getZutatenName(RS("HS"))%>,<% = getZutatenName(RS("SB1"))%>,<% = getZutatenName(RS("SB2"))%>)</option>
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
        SQL = "Select * from tbMenu where MenuArtId = " & Request.QueryString("MenuArtId") & " and Aktiv = true Order By Bezeichnung "
        RS.Open SQL,conn,3,3
      %>
        <select size="1" name="txtMenuIdFreitag" ID="Select5">
        <% = Opt5 %>

	    <% do while not rs.eof %>
		    <option value="<% = RS("MenuId") %>"><% = RS("Bezeichnung")%> (<% = getZutatenName(RS("Suppe"))%>,<% = getZutatenName(RS("Wellness"))%>,<% = getZutatenName(RS("HS"))%>,<% = getZutatenName(RS("SB1"))%>,<% = getZutatenName(RS("SB2"))%>)</option>
	    <%
	    rs.movenext
	    loop
	    rs.close
        %>
        </select>
      
      </td>
    </tr>    
    
     </table>
<p><input type="submit" value="speichern" name="B1"><input type="reset" value="Zur�cksetzen" name="B2"></p>
 </form>


 </body>
 </html>

