# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0460-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00422  VAN      ADD OPERATION CATEGORY                                    *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  P00768  CLB      Change MIR-OPER-CAT-CD to DisplayOnly and SType to Text.  *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  01OCT05 SUG      ADD DV-DPOS-CAT-CD AND SA-XFER-EFF-DT                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  25AUG09 CTS      ADDED NEW FIELDS FOR TRAD POLICIES PROCESSING:            *
#*		     OVR-SHRT-PREM-AMT, TRAD-SO-JRNL-DT, PREM-DUE-MO-NUM       *
#*  NWLCAR  CTS      ADDED NEW FIELD NUM-DEP-REFND FOR COMMISSION & REFUND     *
#*  NWLPP3  CTS      PREMIUM DEPOSIT FUND FIELD MADE AS SIGNED FIELD           *
#*  NWLLRP  CTS      CHANGES FOR LOAN REPAYMENT PROCESSING                     *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  Q07587  CTS      CHANGES FOR ADDING NEW FIELD OUTSTANDING DISBURSEMENTS    *
#*                   SURVIVOR BENEFIT IN POLICY PAYMENT SCREEN                 *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  M319AC  CTS      CHANGES DONE FOR FXWL POLICY LOAN PROCESSING              *
#*  Q94510  CTS      FIX FOR FXWL POLICIES                                     *
#*  FFF10R  CTS      FOREIGN CURRENCY - ADDING NEW FILED PROCESSING CURRENCY   *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UY3049  CTS      STREAM 3 - ANNUITY PAYOUT                                 *
#*******************************************************************************

S-STEP BF0460-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-ACCT-BASE-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-ACCT-CRNT-LOC-CD-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Current Location";
        Index = "1";
    }

    IN MIR-ACCT-ISS-LOC-CD-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Issue Location";
        Index = "1";
    }

    IN MIR-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[2]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Text";
        Label = "Fund";
    #   Label = "Branch / Departments";
        Index = "1";
    }

    IN MIR-CF-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Deposit";
    }

    IN MIR-CF-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    IN MIR-DIR-BILL-APL-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "APL Repayment";
    }

    IN MIR-DIR-BILL-DPOS-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    IN MIR-DIR-BILL-LOAN-AMT
    {
        DisplayOnly;
    #NWLLRP CHANGES BEGIN    
    #   Length = "13";
        Length = "15";
    #NWLLRP CHANGES END    
        SType = "Currency";
#M319AC CHANGES STARTS HERE
#Q94510 CHANGES STARTS HERE
#	CurrencyCode = "MIR-POL-CRCY-CD";
#Q94510 CHANGES ENDS HERE	
#M319AC CHANGES ENDS HERE
        Label = "Loan Repayment";
    }

    IN MIR-DIR-BILL-PDF-AMT
    {
        DisplayOnly;
    #NWLPP3 CHANGES BEGIN
        Signed;
    #NWLPP3 CHANGES END
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    IN MIR-DIR-BILL-PREM-AMT
    {

        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Premium";
    }

    IN MIR-DPOS-OVRID-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[2]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    IN MIR-DV-AGT-REASN-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-DV-CR-ACCT-TRXN-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-DB-ACCT-TRXN-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
#M319AC CHANGES STARTS HERE
#Q94510 CHANGES STARTS HERE
#	CurrencyCode = "MIR-POL-CRCY-CD-T[2]";";
#Q94510 CHANGES ENDS HERE	
#M319AC CHANGES ENDS HERE
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-ENTR-CSH-AMT
    {     
#FFF10R CHANGES STARTS HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES ENDS HERE         
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }
    
     IN MIR-OPER-CAT-CD
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Text";
      # SType = "Selection";
        Label = "Operation Category";
    }    

    IN MIR-DV-POL-RCOMM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Retained Commission";
    }

    IN MIR-DV-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process date";
    }

    IN MIR-PAC-DRW-TOT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "PAC Amount";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-BT-SUSP-AMT
    {

        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }
 
    IN MIR-POL-PD-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }
 
    IN MIR-POL-CC-SUSP-AMT
    {
#FFF10R CHANGES STARTS HERE    

        CurrencyCode="MIR-PRCES-CRCY-CD";
#FFF10R CHANGES ENDS HERE        
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }
 
 # Changes for NWLBCA starts here
 
    IN MIR-OVR-SHRT-PREM-AMT
    {
#FFF10R CHANGES STARTS HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES ENDS HERE        
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Over / Short Premium";
    }
# Changes for NWLBCA ends here  

    IN MIR-POL-OS-DISB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }
    
#UYS025 CHANGES START HERE

    IN MIR-ADV-PMT-RSRV-AMT
    {  
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE    


# Changes for NWLLRP starts here    

    IN MIR-DV-LOAN-XCES-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
#M319AC CHANGES STARTS HERE
#Q94510 CHANGES STARTS HERE
#	CurrencyCode = "MIR-POL-CRCY-CD";
#Q94510 CHANGES ENDS HERE
#M319AC CHANGES ENDS HERE        
        Label = "Excess / Short Interest";
    }
# Changes for NWLLRP ends here

    IN MIR-OS-DISB-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
# NWLLTC CHANGES STARTS HERE
    IN MIR-OS-DISB-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
# NWLLTC CHANGES ENDS HERE

    IN MIR-OS-DISB-SRVBEN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - UL Survivor Benefit";
        
    }
    
#M271A7 CHANGES START HERE 

    IN MIR-OS-DISB-RFND-AMT
    {    
        DisplayOnly;
    	Signed;
    	Length = "15";
    	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    } 
    
#M271A7 CHANGES END HERE    
       
    IN MIR-POL-PDF-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
#FFF10R CHANGES STARTS HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES ENDS HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    IN MIR-SBSDRY-CO-ID-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-JRNL-DT 
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
    IN MIR-DV-DPOS-CAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DPOS-CAT-CD";
        SType = "Text";
        Label = "Type of Deposit";
    }

    IN MIR-DV-SA-XFER-EFF-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "SA Effective Date";
    }
    
# Changes for NWLBCA starts here
    IN MIR-TRAD-SO-JRNL-DT
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "SO Journal Date";
    }
    
    IN MIR-PREM-DUE-MO-NUM
    {
        Length = "07";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Premium Due Month";
    }
# Changes for NWLBCA ends here
    #NWLCAR CHANGES BEGIN

    IN MIR-DV-DPOS-RFND-QTY
    {
      DisplayOnly;
      Length = "3";
      SType = "Text";
      Label = "Number of Deposits/Refunds";
    }

#NWLCAR CHANGES END

#FFF10R CHANGES STARTS
    IN MIR-PRCES-CRCY-CD
    {      
      Length = "3";
      CodeSource = "DataModel";
      CodeType = "PRCES-CRCY-CD";           
      SType = "Selection";
      Label = "Currency";
    }
#FFF10R CHANGES ENDS

#FFF10R CHANGES START HERE 
    IN MIR-GLOB-CRCY-CD
     {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    } 
#FFF10R CHANGES END HERE 

# M319AC CHANGES STARTS HERE 
    INOUT MIR-POL-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 

     INOUT MIR-POL-CRCY-CD-T[2]
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     } 
    INOUT  MIR-JPY-TRXN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Actual JPY LOAN Repayment";
    }        
     
# M319AC CHANGES ENDS HERE
#UY3049 CHANGES START HERE8
    IN MIR-UNPAY-ANTY-PREM-AMT
    {  
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Receivable Premium Amount";
    } 
#UY3049 CHANGES ENDS HERE
}

