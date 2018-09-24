
<%


Response.expires = 0

Set Conn    = Server.CreateObject("ADODB.Connection")
Set RS      = Server.CreateObject("ADODB.Recordset")

Set RSFunc  = Server.CreateObject("ADODB.Recordset")
Set RSFunc1  = Server.CreateObject("ADODB.Recordset")
Set RSFunc2  = Server.CreateObject("ADODB.Recordset")

Set RSQ  = Server.CreateObject("ADODB.Recordset")

Set RSDD  = Server.CreateObject("ADODB.Recordset")


strPfadDB = Server.MapPath("db\ospelt.mdb")
strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strPfadDB


'Conn.Open "ospelt", "admin", ""
Conn.Open strConn, "admin", ""


'-------------------------------------------------------------------
Public Function GetAktuellesJahr (function_aktuellesJahr)

    if function_aktuellesJahr = "" then
		FK = 0
	else
		FK = int(function_aktuellesJahr)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbJahr where UserId = " & function_aktuellesJahr & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        GetAktuellesJahr = RSFunc("Jahr")
	    end if
		
		RSFunc.close
	end if
    

end function
'-------------------------------------------------------------------

Public Function getZutatenName (function_ZutatenName)

	if function_ZutatenName = "" then
		FK = 0
	else
		FK = int(function_ZutatenName)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbZutaten where ZutatenId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getZutatenName = RSFunc("ZutatenName")
	    end if
		
		RSFunc.close
	end if

end function
'-------------------------------------------------------------------

Public Function getKW (function_KW,function_Jahr)

	if function_KW = "" then
		FK = 0
	else
        FK = 1
		KW = int(function_KW)
        Jahr = int(function_Jahr)
	end if

    
	if FK <> 0 then
		SQLFunc = "Select * FROM tbKW where KW = " & KW & " And Jahr = " & Jahr & ""
        'Response.Write ">>>>>>>>>>>" &  SQLFunc & "<bR>"
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getKW = RSFunc("Kalenderwoche") & " (" &  getDatum(RSFunc("StartDatum")) & "-" &  getDatum(RSFunc("EndDatum")) & ")"
	    end if
		
		RSFunc.close
	end if

end function
'-------------------------------------------------------------------

Public Function getDeadLine (function_Deadline)

	if function_Deadline = "" then
		FK = 0
	else
		FK = int(function_Deadline)
	end if

    response.Write "DL:" & DL & "<BR>"    
    
	if FK <> 0 then
            
        if FK = 1 then
            getDeadLine = 247  '(1.5 Wochen)
            'getDeadLine = 415   '(2.5 Wochen)
        end if

    end if

end function
'-------------------------------------------------------------------

Public Function getStartDatum (function_KW,function_Jahr)

	if function_KW = "" then
		FK = 0
	else
        FK = 1
		KW = int(function_KW)
        Jahr = int(function_Jahr)
	end if

    
	if FK <> 0 then
		SQLFunc = "Select * FROM tbKW where KW = " & KW & " And Jahr = " & Jahr & ""
        'Response.Write ">>>>>>>>>>>" &  SQLFunc & "<bR>"
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getStartDatum = getDatum(RSFunc("StartDatum")) 
	    end if
		
		RSFunc.close

	end if

end function
'-------------------------------------------------------------------

Public Function getKWId_ProJahr (function_KW)

    if function_KW = "" then
		FK = 0
	else
		FK = int(function_KW)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbKW where KWId = " & FK & ""
		
        'Response.Write ">>>>>> " & SQLFunc & "<bR>"
        RSFunc.Open SQLFunc,conn,3,3

        getKWId_ProJahr = RSFunc("KW")

		RSFunc.close
	end if

end function
'-------------------------------------------------------------------

Public Function getPreisProMenu (MenuId)

	if MenuId = "" then
		FK = 0
	else
		FK = int(MenuId)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbMenu where MenuId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3
        'Response.Write ">>>>>> " & SQLFunc & "<bR>"

        getPreisProMenu = RSFunc("Preis")

		RSFunc.close
	end if

end function

'-------------------------------------------------------------------
Public Function getPreisProConv (ConvId)

	if ConvId = "" then
		FK = 0
	else
		FK = int(ConvId)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3
        'Response.Write ">>>>>> " & SQLFunc & "<bR>"

		if RSFunc("PreisMwst") <> "" then
			getPreisProConv = FormatNumber(RSFunc("PreisMwst"),2)
		else
			getPreisProConv = 0
		end if

		RSFunc.close
	end if

end function

'-------------------------------------------------------------------
Public Function getPreisProConvEK (ConvId)

	if ConvId = "" then
		FK = 0
	else
		FK = int(ConvId)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc("Preis") <> "" then
			getPreisProConvEK = FormatNumber(RSFunc("Preis"),2)
		else
			getPreisProConvEK = 0
		end if

		RSFunc.close
	end if

end function
'-------------------------------------------------------------------
Public Function getKWJahr_ProJahr (function_KW)

	if function_KW = "" then
		FK = 0
	else
		FK = int(function_KW)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbKW where KwId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

        getKWJahr_ProJahr = RSFunc("Jahr")

		RSFunc.close
	end if

end function
'-------------------------------------------------------------------

Public Function getDatum_ProJahr (KWId,Tag)

    if KWId = "" then
		FK = 0
	else
		FK = int(KWId)
	end if


	if FK <> 0 then
		SQLFunc = "Select * FROM tbKW where KwId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

        Select Case Tag

        Case "Montag"
            getDatum_ProJahr = RSFunc("DatumMontag")
        Case "Dienstag"
            getDatum_ProJahr = RSFunc("DatumDienstag")
        Case "Mittwoch"
            getDatum_ProJahr = RSFunc("DatumMittwoch")
        Case "Donnerstag"
            getDatum_ProJahr = RSFunc("DatumDonnerstag")
        Case "Freitag"
            getDatum_ProJahr = RSFunc("DatumFreitag")
        Case else
            getDatum_ProJahr.Write "Fehler in der Verarbeitung getKWJahr_ProJahr"
        end select

		RSFunc.close
	end if

end function

'-------------------------------------------------------------------

Public Function getMenuArt (function_MenuArt)

	if function_MenuArt = "" then
		FK = 0
	else
		FK = int(function_MenuArt)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbMenuArt where MenuArtId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getMenuArt = RSFunc("MenuArtBezeichnung")
	    end if
		
		RSFunc.close
	end if

end function
'-------------------------------------------------------------------
Public Function getMenuName (function_MenuName)

	if function_MenuName = "" then
		FK = 0
	else
		FK = int(function_MenuName)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbMenu where MenuId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    Dim SuppeWert
		    Dim WellnessWert
		    Dim HSWert
		    Dim SB1Wert
		    Dim SB2Wert 
		    SuppeWert = RSFunc("Suppe")
		    WellnessWert = RSFunc("Wellness")
		    HSWert = RSFunc("HS")
		    SB1Wert = RSFunc("SB1")
		    SB2Wert = RSFunc("SB2")
		    
		end if
		
		RSFunc.close
				

        'getMenuName = getZutatenName(SuppeWert) & ", " & getZutatenName(WellnessWert) & ", " & getZutatenName(HSWert) & ", " &  getZutatenName(SB1Wert) & ", " & getZutatenName(SB2Wert)

        
        if getZutatenName(SuppeWert) <> "" then
            getMenuName = getMenuName & getZutatenName(SuppeWert) & ", "
        end if
        
        if getZutatenName(WellnessWert) <> "" then
            getMenuName = getMenuName & getZutatenName(WellnessWert) & ", "
        end if
         
         if getZutatenName(HSWert) <> "" then
            getMenuName = getMenuName & getZutatenName(HSWert) & ", "
        end if
        
        if getZutatenName(SB1Wert) <> "" then
            getMenuName = getMenuName & getZutatenName(SB1Wert) & ", "
        end if
        
        if getZutatenName(SB2Wert) <> "" then
            getMenuName = getMenuName & getZutatenName(SB2Wert) & ", "
        end if
        
	end if

end function
'-------------------------------------------------------------------
Public Function getTotal_ProMenu_ProTag (Tag,KW,MenuArt,Anzeige,Gruppe,Jahr)
	
	Set RS_Total = Server.CreateObject("ADODB.Recordset")

        SUM_Tag = Tag
        SUM_KW = int(KW)
        SUM_JAHR = int(Jahr)
        SUM_GRUPPE = Gruppe
        SUM_MenuId = int(MenuArt)

        
        SQL_Total = "Select Sum(tbBestellung.Suppe), Sum(tbBestellung.Wellness), Sum(tbBestellung.HS), Sum(tbBestellung.SB1), Sum(tbBestellung.SB2) from tbBestellung" _
            & " where tbBestellung.Tag = '" & SUM_Tag & "'" _
            & " and KW = " & SUM_KW & "" _
            & " and Jahr = " & SUM_JAHR & "" _
            & " and Gruppe = '" & SUM_GRUPPE & "'" _
            & " and MenuArtId = " & SUM_MenuId & "" 

        'Response.Write ">>>>>>" & SQL_Total & "<BR>"

        RS_Total.Open SQL_Total,conn,3,3
                       
        'Response.Write "Anzeige" & Anzeige & "<bR>"
        
        if Anzeige = "anzeigen_bestellung02" then
        
            Response.Write "<table width=""100%"" border=""0"" class=""ohne""><tr>"
            'Response.Write "<td class=""ohne"">SU:</td>" & "<td class=""ohne"">" & RS_Total(0) & "&nbsp;</td></tr>"
            'Response.Write "<td class=""ohne"">WD:</td>" & "<td class=""ohne"">" & RS_Total(1) & "&nbsp;</td></tr>"
            Response.Write "<td class=""ohne""><B>HS:</B></td>" & "<td class=""ohne"">" & RS_Total(2) & "&nbsp;</td></tr>"
            
            
            
            Response.Write "<td class=""ohne"">SB:</td>" & "<td class=""ohne"">"
            if RS_Total(3) > 0 then Response.Write "+"
            Response.Write RS_Total(3) & "&nbsp;</td></tr>"
                      
            
            Response.Write "<td class=""ohne"">GS:</td>" & "<td class=""ohne"">"
            if RS_Total(4) > 0 then Response.Write "+"
            Response.Write RS_Total(4) & "&nbsp;</td></tr></table>"
        

        end if


        if Anzeige = "anzeigen_bestellung03" then
        
            Response.Write "<td>"
            Response.Write "<B>" & RS_Total(2) & "</B>"
            Response.Write "</td><td>"
            
            Response.Write "<B>" 
            if RS_Total(3) > 0 then Response.Write "+"
            Response.Write  RS_Total(3) & "</B>"
            
            Response.Write "</td><td>"

            Response.Write "<B>"
            if RS_Total(4) > 0 then Response.Write "+"
            Response.Write  RS_Total(4) & "</B>"
                        
            Response.Write "</td>"

            'Response.write RS_Total(2)

        end if



        if Anzeige = "anzeigen_bestellung04" then
            
            Response.Write "<td>"
            Response.Write RS_Total(2)
            Response.Write "</td><td>"
            
            if RS_Total(3) > 0 then Response.Write "+"
            Response.Write RS_Total(3)
            Response.Write "</td><td>"
                        
            if RS_Total(4) > 0 then Response.Write "+"
            Response.Write RS_Total(4)
            Response.Write "</td>"

            'Response.write RS_Total(2)

        end if
                

        RS_Total.Close


        'getTotal_ProMenu_ProTag = RS_Total(0)



end function

'-------------------------------------------------------------------

Public Function getWochentag (function_Wochentag)

    Datum = function_Wochentag

    Select Case Weekday(Datum,0)
	Case 1
	Wochentag = "Montag"
	Case 2
	Wochentag = "Dienstag"
	Case 3
	Wochentag = "Mittwoch"
	Case 4
	Wochentag = "Donnerstag"
	Case 5
	Wochentag = "Freitag"
	Case else
	Wochentag = ""
	end select

    getWochentag = Wochentag

end function

'-------------------------------------------------------------------
Public Function getConvMenu (function_getConvMenu)

	if function_getConvMenu = "" then
		FK = 0
	else
		FK = int(function_getConvMenu)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then

			if RSFunc("CateringTitel") = true then
				getConvMenu = "<B>" & RSFunc("ConvText") & "</B>"	
			else
				getConvMenu = RSFunc("ConvText")
			end if

	        
	    end if
		
		RSFunc.close
	end if

end function

'-------------------------------------------------------------------
Public Function getConvTitel (function_getConvTitel)

	if function_getConvTitel = "" then
		FK = 0
	else
		FK = int(function_getConvTitel)
	end if

	SQLFunc = "Select * FROM tbConvTitel where ConvTitelId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getConvTitel = RSFunc("ConvTitel")
	    end if
		
		RSFunc.close

end function

'-------------------------------------------------------------------
Public Function getEventName (function_getEventName)

	if function_getEventName = "" then
		FK = 0
	else
		FK = int(function_getEventName)
	end if

	SQLFunc = "Select * FROM tbCatering where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getEventName = RSFunc("EventName")
	    end if
		
		RSFunc.close

end function

'-------------------------------------------------------------------
Public Function getEventBezeichnung (function_getEventBezeichnung)

	if function_getEventBezeichnung = "" then
		FK = 0
	else
		FK = int(function_getEventBezeichnung)
	end if

	SQLFunc = "Select * FROM tbCatering where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getEventBezeichnung = RSFunc("EventBezeichnung")
	    end if
		
		RSFunc.close

end function
'-------------------------------------------------------------------
Public Function getEventBemerkung (function_getEventBemerkung)

	if function_getEventBemerkung = "" then
		FK = 0
	else
		FK = int(function_getEventBemerkung)
	end if

	SQLFunc = "Select * FROM tbCatering where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getEventBemerkung = RSFunc("Bemerkungen")
	    end if
		
		RSFunc.close

end function
'-------------------------------------------------------------------

Public Function getGruppe (function_getGruppe)

	if function_getGruppe = "" then
		FK = 0
	else
		FK = int(function_getGruppe)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbUser where UserId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getGruppe = RSFunc("Gruppe")
	    end if
		
		RSFunc.close
	end if

end function

'-------------------------------------------------------------------


Public Function getTotal_ProConv_ProTag (Datum,CMenu,CGruppe)
	
    	Set RS_Total = Server.CreateObject("ADODB.Recordset")

        SuchDatum = "#" & Month(Datum) & "/" & Day(Datum) & "/" & Year(Datum) & "#"
        ConvMenu = CMenu
        Gruppe = CGruppe
        
        SQL_Total = "Select Sum(tbConvBestellung.ConvMenuAnzahl) from tbConvBestellung" _
            & " where tbConvBestellung.Datum = " & SuchDatum & "" _
            & " and tbConvBestellung.ConvMenu = " & ConvMenu & "" _
            & " and tbConvBestellung.Gruppe = '" & Gruppe & "'"

        'Response.Write SQL_Total & "<bR>"

        RS_Total.Open SQL_Total,conn,3,3
        getTotal_ProConv_ProTag = RS_Total(0) 
        
        RS_Total.Close

end function

'-------------------------------------------------------------------

Public Function getDatum (function_Datum)

'Response.Write ">>>>>>>>>>>>>>>>>>>>" & function_Datum & "<br>"

Datum = function_Datum

    if Datum <> "" then
        SetLocale("de")
        datDatum = CDate(Datum)
        deDatum = CStr(datDatum)
        getDatum = deDatum
    end if

end function

'-----------------------------------------------------------------

Public Function getWochenArt(x)

    If x Mod 2 = 0 Then
        getWochenArt = true
    Else
        getWochenArt = false
    End If

End Function

'----------------------------------------------------------------

Function getWochenNummer(Datum)

  Dim tmp
  tmp = DateSerial(Year(Datum + (8 - Weekday(Datum)) Mod 7 - 3), 1, 1)
  getWochenNummer = ((Datum - tmp - 3 + (Weekday(tmp) + 1) Mod 7)) \ 7 + 1

End Function


'----------------------------------------------------------------


Public Function getSalatName (function_SalatName)

	if function_SalatName = "" then
		FK = 0
	else
		FK = int(function_SalatName)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbSalat where SalatId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        getSalatName = RSFunc("Bezeichnung")
	    end if
		
		RSFunc.close
	end if

end function

'----------------------------------------------------------------

Public Function getTagesBestellungName (function_TagesBestellung)

	if function_TagesBestellung = "" then
		FK = 0
	else
		FK = int(function_TagesBestellung)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbTages where TagesId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    getTagesBestellungName =  RSFunc("TagesName")   
		end if
		
		RSFunc.close
		
	end if

end function

'----------------------------------------------------------------

Public Function getTagesBestellungNameEinheit (function_TagesBestellungEinheit)

	if function_TagesBestellungEinheit = "" then
		FK = 0
	else
		FK = int(function_TagesBestellungEinheit)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbTages where TagesId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    getTagesBestellungNameEinheit =  RSFunc("Einheit")   
		end if
		
		RSFunc.close
		
	end if

end function


'----------------------------------------------------------------

Public Function getConvEinheit (function_ConvEinheit)

	if function_ConvEinheit = "" then
		FK = 0
	else
		FK = int(function_ConvEinheit)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    getConvEinheit =  RSFunc("Einheit")   
		end if
		
		RSFunc.close
		
	end if

end function

'----------------------------------------------

Public Function getTagesBestellWert (UserId,KWId,Art,Tag)

    Select Case Tag
	Case "1"
	    T = "Montag"
	Case "2"
	    T = "Dienstag"
	Case "3"
	    T = "Mittwoch"
    Case "4"
        T = "Donnerstag"
    Case "5"
        T = "Freitag"
    Case Else
        Response.Write "Error bei Wochentag"
    end select
	
	    SQLFunc = "Select * FROM tbTagesBestellung where UserId = " & UserId & " And KWId = " & KWId & " And Art = " & Art & " And Tag = '" & T & "'"
		RSFunc.Open SQLFunc,conn,3,3

        'Response.Write ">>>>>>> " & RSFunc.recordcount & SQLFunc

		if RSFunc.recordcount <> 0 then
	        getTagesBestellWert = RSFunc("TagesBestellWert")
	    else
	        getTagesBestellWert = 0
	    end if
		
		RSFunc.close
	'end if

end function

'----------------------------------------------

Public Function getRestaurantName (function_RestaurantName)

	'Response.write ">>>>>>>>>>>" & function_RestaurantName & "<BR>"

	if function_RestaurantName = "" then
		FK = 0
	else
		FK = int(function_RestaurantName)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbUser where UserId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    getRestaurantName =  RSFunc("Username")   
		end if
		
		RSFunc.close
		
	end if

end function

'----------------------------------------------
Public Function getKWid (function_Datum)
    
    Datum = CDate(function_Datum)
   
    dim t
    t = DateSerial(Year(Datum + (8 - Weekday(Datum)) Mod 7 - 3), 1, 1) 
    
    'getKWid = (Datum - t - 3 + (Weekday(t) + 1) Mod 7) \ 7 + 1 & "." & Year(t)
    getKWid = (Datum - t - 3 + (Weekday(t) + 1) Mod 7) \ 7 + 1

End function
'----------------------------------------------
Public Function getTagesHitName (function_Datum)

    
    KW = getKWid(function_Datum)
    Jahr = year(function_Datum)
    Tag = getWochentag(function_Datum)
    
    SQLFunc = "Select * FROM tbTagesHit where KW = " & KW & " and Tag = '" & Tag & "' and Jahr = " & Jahr & ""
	RSFunc.Open SQLFunc,conn,3,3

	if RSFunc.recordcount <> 0 then
		    getTagesHitName =  RSFunc("TagesName")   
	end if
		
	RSFunc.close
	
	
end function
'----------------------------------------------
    
Public Function getTotalBetragProUser (f_ConvArt, f_UserId, f_SDatum, f_EDatum)        

    ConvArt = int(f_ConvArt)
    UserId = int(f_UserId)
    SDatum = f_SDatum
    EDatum = f_EDatum
        
    Set RSFunc1 = Server.CreateObject("ADODB.Recordset")
    SQLFunc1 = "Select * from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " AND Datum >= " & SDatum & " and Datum <= " & EDatum & ""
    RSFunc1.Open SQLFunc1,conn,3,3


	'if UserId = 6 and ConvArt = 20 then
	'	Response.write ">>>>>>>>>> " & SQLFunc1 & "<BR>"
	'	Response.write ">>>>>>>>>> " & RSFunc1.Recordcount & "<BR>"
	'	Response.write ">>>>>>>>>> " & C_Total & "<BR>"
	'	Response.write "---------------------------------------" & "<BR>"
	'end if

    C = 0
    C_Total = 0
    
    Do while not RSFunc1.EOF
        
    if RSFunc1("ConvMenuAnzahl") <> 0 then

		if ConvArt = 20 or ConvArt = 21 then
			'ConvMenu = CateringMother => Diesen Eintrag für die Berechnung verwenden
			if RSFunc1("ConvMenu") = RSFunc1("CateringMother") then
				C = CDbl(RSFunc1("ConvMenuAnzahl")) * CDbl(getPreisProConvEK(RSFunc1("ConvMenu")))
				C_Total = CDbl(C_Total) + CDbl(C)
			end if
		else
			C = CDbl(RSFunc1("ConvMenuAnzahl")) * CDbl(getPreisProConv(RSFunc1("ConvMenu")))
			C_Total = CDbl(C_Total) + CDbl(C)
		end if

    end if

    RSFunc1.MoveNext
    Loop

    getTotalBetragProUser = C_Total
    
    RSFunc1.Close
       
end function
'----------------------------------------------
Public Function getTotalConvBestellung (f_ConvArt, f_UserId, f_SDatum,f_color,f_print,f_AnzahlConv)  
	
    ConvArt = int(f_ConvArt)
    UserId = int(f_UserId)
    SDatum = f_SDatum
    'EDatum = f_EDatum
    
	Color = f_color
	Print = int(f_print)   '0=Anzeige normal, 1=Druckanzeige
	AnzahlConv = int(f_AnzahlConv)

    Set RSFunc1 = Server.CreateObject("ADODB.Recordset")
	'SQLFunc1 = "Select Sum(tbConvBestellung.ConvMenuAnzahl) from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " AND Datum = " & SDatum & ""
	SQLFunc1 = "Select * from tbConvBestellung where ConvArt = " & ConvArt & " and UserId = " & UserId & " AND Datum = " & SDatum & " Order by ConvMenu, Datum"
	RSFunc1.Open SQLFunc1,conn,3,3

    
	'Leere EintrÃ¤ge ausfÃ¼llen fÃ¼r Druckansicht
    if RSFunc1.Recordcount = 0 and Print = 1 then
        counter = 1
		do while counter <= AnzahlConv
            response.Write "<td bgcolor=" & tdColor & "></td>"
            Counter = counter + 1
        loop
	Exit function
    end if

	First = 0
	
    
    Do while not RSFunc1.EOF
    
	if first = 0 then
		first = 1
		Anzahl = RSFunc1("ConvMenuAnzahl")
		ConvMenuAlt = RSFunc1("ConvMenu")
	else
		
		if ConvMenuAlt = RSFunc1("ConvMenu") then
			Anzahl = Anzahl + RSFunc1("ConvMenuAnzahl")
		else
		
			'response.Write "<td bgcolor=" & Color & ">" & Anzahl & "<BR>" & ConvMenuAlt & "</td>"
			response.Write "<td bgcolor=" & Color & ">" & Anzahl & "</td>"
			
			Anzahl = 0
			ConvMenuAlt = RSFunc1("ConvMenu")
			Anzahl = Anzahl + RSFunc1("ConvMenuAnzahl")	
			
		end if

	end if

    RSFunc1.MoveNext
    Loop

	'response.Write "<td bgcolor=" & Color & ">" & Anzahl & "<BR>" & ConvMenuAlt & "</td>"
	response.Write "<td bgcolor=" & Color & ">" & Anzahl & "</td>"
	
    RSFunc1.Close
       
end function
'----------------------------------------------
Public Function getTotalConvBestellungNeu (f_ConvArt, f_UserId, f_SDatum,f_color,f_print,f_AnzahlConv,f_Gruppe)  
	
    ConvMenu = int(f_ConvArt)
    UserId = int(f_UserId)
	SDatum = f_SDatum
	Color = f_color
	Gruppe = f_Gruppe

    Set RSFunc1 = Server.CreateObject("ADODB.Recordset")

	SQLFunc1 = "Select Sum(tbConvBestellung.ConvMenuAnzahl) from tbConvBestellung where ConvMenu = " & ConvMenu & " and UserId = " & UserId & " and Gruppe = '" & Gruppe & "' AND Datum = " & SDatum & ""

	'Response.write ">>>>>>>>>>" & SQLFunc1 & "<BR>"

	RSFunc1.Open SQLFunc1,conn,3,3

		if RSFunc1.Recordcount <> 0 then
			if GetCheckFeld(ConvMenu) = "CF" and RSFunc1(0) <> 0 Then
				getTotalConvBestellungNeu = "<input type=""checkbox"" checked />"
			else
				getTotalConvBestellungNeu =  RSFunc1(0)				
			end if
		else
			getTotalConvBestellungNeu =  "<td bgcolor=" & Color & ">x&nbsp;</td>"
		end if

		RSFunc1.Close
       
end function
'----------------------------------------------
Public Function getTotalConvBestellungNeuTotal (f_ConvArt, f_SDatum,f_color,f_Gruppe)  
	
    ConvMenu = int(f_ConvArt)
    SDatum = f_SDatum
	Color = f_color
	Gruppe = f_Gruppe

    Set RSFunc1 = Server.CreateObject("ADODB.Recordset")

	SQLFunc1 = "Select Sum(tbConvBestellung.ConvMenuAnzahl) from tbConvBestellung where ConvMenu = " & ConvMenu & " and Gruppe = '" & Gruppe & "' AND Datum = " & SDatum & ""

	RSFunc1.Open SQLFunc1,conn,3,3

		if RSFunc1(0) <> 0 then
			getTotalConvBestellungNeuTotal = "<td bgcolor=" & Color & "><center><B>" & RSFunc1(0) & "</B></center></td>"
		Else	
			getTotalConvBestellungNeuTotal =  "<td bgcolor=" & Color & ">&nbsp;</td>"
		end if

    RSFunc1.Close
       
end function
'----------------------------------------------
Public Function GetCheckFeld (function_CheckFeld)

    if function_CheckFeld = "" then
		FK = 0
	else
		FK = int(function_CheckFeld)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then

			if RSFunc("CheckFeld") = true then
				GetCheckFeld = "CF"
			else	
				GetCheckFeld = ""
			end if

	    end if
		
		RSFunc.close
	end if
    

end function
'----------------------------------------------
Public Function getCateringInfos (function_CateringInfos)

	if function_CateringInfos = "" then
		FK = 0
	else
		FK = int(function_CateringInfos)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbCatering where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
			getCateringInfos = "Lieferschein für:  " & RSFunc("EventName") & " / " & RSFunc("EventBezeichnung") 
			
			if RSFunc("Bemerkungen") <> "" then
				getCateringInfos = getCateringInfos & " (Bem: " & RSFunc("Bemerkungen") & ")"
			end if

	    end if
		
		RSFunc.close
	end if

end function
'-------------------------------------------------------------------
Public Function GetHerkunftsland (function_Herkunftsland)

    if function_Herkunftsland = "" then
		FK = 0
	else
		FK = int(function_Herkunftsland)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbHerkunftsland where HerkunftslandId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
	        GetHerkunftsland = RSFunc("Herkunftsland")
	    end if
		
		RSFunc.close
	end if
    

end function
'-------------------------------------------------------------------
Public Function getSuppenName (function_SuppenName)

	if function_SuppenName = "" then
		FK = 0
	else
		FK = int(function_SuppenName)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbMenu where MenuId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
		    Dim Suppe01
		    Dim Suppe02
			S01 = RSFunc("HS")
		    S02 = RSFunc("SB1")
		    
		end if
		
		RSFunc.close

       if getZutatenName(S01) <> "" then
            getSuppenName = getSuppenName & getZutatenName(S01) & ", "
        end if
        
        if getZutatenName(S02) <> "" then
            getSuppenName = getSuppenName & getZutatenName(S02)
        end if
        
	end if

end function
'-------------------------------------------------------------------
Public Function getMaxWertBestellung (function_MaxWertBestellung)

	if function_MaxWertBestellung = "" then
		FK = 0
	else
		FK = int(function_MaxWertBestellung)
	end if

	if FK <> 0 then
		SQLFunc2 = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc2.Open SQLFunc2,conn,3,3

		if RSFunc2.recordcount <> 0 then
			'response.write "-----" & RSFunc2("MaxWertBestellung")
			getMaxWertBestellung = RSFunc2("MaxWertBestellung")
	    end if
		
		RSFunc2.close
	end if

end function
'-------------------------------------------------------------------
Public Function getCateringTitel (function_CateringTitel)

	if function_CateringTitel = "" then
		FK = 0
	else
		FK = int(function_CateringTitel)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then

			if RSFunc("CateringTitel") = true then
				getCateringTitel = true	
			else
				getCateringTitel = false
			end if

	        
	    end if
		
		RSFunc.close
	end if

end function
'-------------------------------------------------------------------
Public Function getPreisProCatering (function_PreisProCatering)

	if function_PreisProCatering = "" then
		FK = 0
	else
		FK = int(function_PreisProCatering)
	end if

	AnzahlVarianten = 0
	FirstRun = true
	PreisConv = 0
	Preis = 0
	AnzahlMenu = 0
	Mehrvarianten = 0
	PreisMehrVarianten = 0
	PreisMitPreisMehrVarianten = 0
		

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConvBestellung where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		
		Do While not RSFunc.eof

			if RSFunc("ConvMenu") = RSFunc("CateringMother") then
				AnzahlMenu = RSFunc("ConvMenuAnzahl")
				Preis = getConvPreis(RSFunc("ConvMenu"))
				MaxWertBestellung = getMaxWertBestellung(RSFunc("ConvMenu"))
			else
				'Preis von Variante wird beim erster Run ermittelt'
				if FirstRun = true then
					PreisConv = getConvPreis(RSFunc("ConvMenu"))
					FirstRun = false
				end if
			end if

			'Es werden die Varianten gezählt. Wenn grösser 0, dann ist die Variante ausgewählt worden'
			if RSFunc("ConvMenuAnzahl") > 0 then
				AnzahlVarianten = AnzahlVarianten + 1
			end if

		RSFunc.MoveNext
		loop

	end if
	
		if AnzahlVarianten - 1 > MaxWertBestellung then
			Mehrvarianten = AnzahlVarianten - 1 - MaxWertBestellung 
			PreisMehrVarianten = PreisConv * Mehrvarianten
			PreisMitPreisMehrVarianten = Preis + PreisMehrVarianten
			Total = AnzahlMenu * PreisMitPreisMehrVarianten
		else
			Total = AnzahlMenu * Preis
		end if

		getPreisProCatering = Total  
 
	RSFunc.close
	
end function
'-------------------------------------------------------------------
Public Function getPreisProCatering19 (function_PreisProCatering19)

	if function_PreisProCatering19 = "" then
		FK = 0
	else
		FK = int(function_PreisProCatering19)
	end if

	Total = 0
	AnzahlMenu = 0
	Preis = 0
	ConvPreisTotal = 0
	
	if FK <> 0 then
		SQLFunc = "Select * FROM tbConvBestellung where CateringNummer = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3
		
		Do While not RSFunc.eof

			AnzahlMenu = 0
			Preis = 0
			ConvPreisTotal = 0

			AnzahlMenu = RSFunc("ConvMenuAnzahl")
			Preis = getConvPreis(RSFunc("ConvMenu"))

			ConvPreisTotal = AnzahlMenu * Preis 

			Total = Total + ConvPreisTotal

		RSFunc.MoveNext
		loop

	end if

	getPreisProCatering19 = Total  
 
	RSFunc.close
	
end function
'-------------------------------------------------------------------
Public Function getConvPreis (function_ConvPreis)

	if function_ConvPreis = "" then
		FK = 0
	else
		FK = int(function_ConvPreis)
	end if

	if FK <> 0 then
		SQLFunc1 = "Select * FROM tbConv where ConvId = " & FK & ""
		RSFunc1.Open SQLFunc1,conn,3,3

		if RSFunc1.recordcount <> 0 then
			'Response.write "--- " & RSFunc1("PreisMwst") 
			getConvPreis =  RSFunc1("PreisMwst")   
		end if
		
		RSFunc1.close
		
	end if

end function
'-------------------------------------------------------------------
Public Function GetInhouseKunde (function_Inhouse)

    if function_Inhouse = "" then
		FK = 0
	else
		FK = int(function_Inhouse)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbUser where UserId = " & FK & ""
		'Response.write ">>>>>" & SQL & "<BR>"
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then

				if RSFunc("Inhouse") = "INHA" then
					GetInhouseKunde = true
				else
					GetInhouseKunde = false
				end if

	    end if
		
		RSFunc.close
	end if
    

end function
'-------------------------------------------------------------------

Public Function getWertSB (function_SB)

	if function_SB = "" then
		FK = 0
	else
		FK = int(function_SB)
	end if

	if FK <> 0 then
		SQLFunc = "Select * FROM tbConfig where ConfigId = " & FK & ""
		RSFunc.Open SQLFunc,conn,3,3

		if RSFunc.recordcount <> 0 then
			getWertSB = RSFunc("Wert3")
	    end if
		
		RSFunc.close
	end if

end function









%>




