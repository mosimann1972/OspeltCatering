
<% 

'---------------------------------------------------------------------------------------------------

Public Function getBuchhaltung_Menu01 (f_UserId,f_SDatum,f_EDatum,f_MenuTitelId)


        U = f_UserId
        SD = f_SDatum
        ED = f_EDatum
        M = f_MenuTitelId

        Set RS_Best = Server.CreateObject("ADODB.Recordset")

        SQL_Best = "Select * from tbBestellung where UserId = " & U & "" _
            & "AND MenuArtId = " & M & " AND Datum >= " & SD & " and Datum <= " & ED & " Order by BestellId"

        RS_Best.Open SQL_Best,conn,3,3

        HS_Total1 = 0

           
        Do while not RS_Best.eof
    
            FixPreisSB01 = 0
            FixPreisSB02 = 0

            PreisKomplett_SB1 = 0
            PreisKomplett_SB2 = 0

            PreisMenuTotal = 0
              
        
            HS = 0
            if isNull(RS_Best("HS")) = false then Z1 = CDbl(RS_Best("HS")) else Z1 = 0 end if
            if isNull(getPreisProMenu(RS_Best("MenuId"))) = false then Z2 = CDbl(getPreisProMenu(RS_Best("MenuId"))) else Z2 = 0 end if
        
            HS = CDbl(Z1) * CDbl(Z2)
            
            if RS_Best("PM_SB1") <> "" then 
                FixPreisSB01 = SBeilage1
                PreisKomplett_SB1 = FixPreisSB01 * RS_Best("SB1")
                PreisMenuTotal = HS + PreisKomplett_SB1
            end if
             
            if RS_Best("PM_SB2") <> "" then 
                FixPreisSB02 = SBeilage2
                PreisKomplett_SB2 = FixPreisSB02 * RS_Best("SB2")
                PreisMenuTotal = HS + PreisKomplett_SB1 + PreisKomplett_SB2
            end if
            
            if PreisMenuTotal <> 0 then 
                HS = CDbl(PreisMenuTotal)
            end if
            
            HS_Total1 = CDbl(HS_Total1) + CDbl(HS)
        
    
    RS_Best.Movenext
    Loop

    getBuchhaltung_Menu01 = FormatNumber(HS_Total1,2)

    PrintTotalBetragProUser = PrintTotalBetragProUser + HS_Total1

    Total01 = Total01 + HS_Total1
    Total02 = Total02 + HS_Total2
    Total03 = Total03 + HS_Total3
    Total04 = Total04 + HS_Total4
    
    HS_Total1 = 0
    HS_Total2 = 0
    HS_Total3 = 0
    HS_Total4 = 0
           
    RS_Best.close

end function

'---------------------------------------------------------------------------------------------------

%>