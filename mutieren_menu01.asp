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

	response.Redirect "notfound.asp?Meldung=Menü kann nicht gelöscht werden!"	

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


    if Request.Form("txtSuppe") <> "" then 
        RS("Suppe")                 = Request.Form("txtSuppe")
    end if

    if Request.Form("txtWellness") <> "" then
        RS("Wellness")              = Request.Form("txtWellness")
    end if

    if Request.Form("txtHS") <> "" then
        RS("HS")                    = Request.Form("txtHS")
    end if 

    if Request.Form("txtSB1") <> "" then
        RS("SB1")                   = Request.Form("txtSB1")
    end if 

    if Request.Form("txtSB2") <> "" then
        RS("SB2")                   = Request.Form("txtSB2")
    end if 

    if Request.Form("txtPreis") <> "" then
        RS("Preis")           = Request.Form("txtPreis")
    Else
        RS("Preis") = 0
    end if

    if Request.Form("txtPreisMwSt") <> "" then
        RS("PreisMwSt")           = Request.Form("txtPreisMwSt")
    else
        RS("PreisMwSt") = 0
    end if

    if Request.Form("txtPreisInhouse") <> "" then
        RS("PreisInhouse")           = Request.Form("txtPreisInhouse")
    else
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

SQL = "Select * from tbMenu Order By MenuArtId, Bezeichnung, Aktiv"
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

<B>Menu mutieren/löschen</B>
<hr size="1">

<br />

<% '-----------------------------------------------------  %>

<% if Request.QueryString("M") <> "Mu" then %>

<table  cellpadding="5" cellspacing="0" border="0">

<% 


TitelFlag = true


do while not RS.eof %>


    <% 
    
    if TitelAltId <> RS("MenuArtId") then 
        Response.Write "<tr bgcolor=""#feb1a6""><td colspan=""6""><B>" &   getMenuArt(RS("MenuArtId")) & "</B></td></tr>"
        TitelAltId = RS("MenuArtId")
    end if

    %>


    <tr> 
      
    <td><% = RS("Bezeichnung") %></td>
                <td> <font size="1">
                    <% = getZutatenName(RS("Suppe")) %>, <% = getZutatenName(RS("Wellness")) %><br />
                    <B><% = getZutatenName(RS("HS")) %></B><BR />
                    <% = getZutatenName(RS("SB1")) %>,<% = getZutatenName(RS("SB2")) %></font></td>
                <td><% = FormatNumber(RS("Preis"),2) %></td>
            <td>
            <% 
            if RS("Aktiv") = true then
                check = "checked"
            else 
                check = ""
            end if
            %>
            <input value="ON" name="aktiv" id="Checkbox2" type="checkbox" <% = check %> /><br /><font size="1"><% = RS("MenuId") %></font>
            </td>
            <td><a href="mutieren_menu01.asp?MenuId=<% = RS("MenuId") %>&M=Mu">mutieren</a></td>
            <td><a onclick="return confirm('Wirklich loeschen?')"  href="mutieren_menu01.asp?MenuId=<% = RS("MenuId") %>&M=Lo">löschen</a></td>
      
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

<form method="POST" action="mutieren_menu01.asp">
<input type="hidden" name="MenuId" value="<% = RS("MenuId") %>" />
    
    <tr>
      <td>Suppe:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 5 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtSuppe" ID="Select5">
        <option selected value=<% = RS("Suppe") %>><% = getZutatenName(RS("Suppe")) %></option>

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
      <td>Wellness:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 1 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtWellness" ID="Select2">
        <option selected value=<% = RS("Wellness") %>><% = getZutatenName(RS("Wellness")) %></option>

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
      <td>Hauptspeise:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 2 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtHS" ID="Select1">
        <option selected value="<% = RS("HS") %>"><% = getZutatenName(RS("HS")) %></option>

	        <% do while not rsdd.eof %>
		        <option value="<% = RSDD("ZutatenId") %>"><% = RSDD("ZutatenName")%></option>
	        <%
	        rsdd.movenext
	        loop
	        rsdd.close
            %>
            </select>
      </td>
    </tr>
    
     <tr>
      <td>SB:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 3 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtSB1" ID="Select3">
        <option selected value="<% = RS("SB1") %>"><% = getZutatenName(RS("SB1")) %></option>

	        <% do while not rsdd.eof %>
		        <option value="<% = RSDD("ZutatenId") %>"><% = RSDD("ZutatenName")%></option>
	        <%
	        rsdd.movenext
	        loop
	        rsdd.close
            %>
            </select>
      </td>
    </tr>
    
         <tr>
      <td>Ge/Sa:</td>
      <td>
      <%
        SQLDD = "Select * from tbZutaten where ZutatenArt = 4 Order By ZutatenName"
        RSDD.Open SQLDD,conn,3,3
      %>

        <select size="1" name="txtSB2" ID="Select4">
        <option selected value="<% = RS("SB2") %>"><% = getZutatenName(RS("SB2")) %></option>

	        <% do while not rsdd.eof %>
		        <option value="<% = RSDD("ZutatenId") %>"><% = RSDD("ZutatenName")%></option>
	        <%
	        rsdd.movenext
	        loop
	        rsdd.close
            %>
            </select>
      </td>
    </tr>
    
        <tr>  
      <td>Preis:</td><td><input type="text" value="<% = RS("Preis") %>"  name="txtPreis" size="50"></td>
      
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
