# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0460-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00422  VAN      ADD OPERATION CATEGORY                                    *
#*  P00198  DPK      Added Journal Date                                        *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  01OCT05 SUG      ADD DV-DPOS-CAT-CD AND SA-XFER-EFF-DT                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  25AUG09 CTS      ADDED NEW FIELDS FOR TRAD POLICIES PROCESSING:            *
#*		     OVR-SHRT-PREM-AMT, TRAD-SO-JRNL-DT, PREM-DUE-MO-NUM       *
#*  NWLCAR  CTS      ADDED NEW FIELD NUM-DEP-REFND FOR COMMISSION & REFUND     *
#*  ATF185  CTS      UPDATED THE DEPOSIT EFF DATE FIELD TO OPTIONAL FIELD      *
#*  NWLPP3  CTS      PREMIUM DEPOSIT FUND FIELD MADE AS SIGNED FIELD           *
#*  NWLLRP  CTS      CHANGES FOR LOAN REPAYMENT PROCESSING                     *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  Q07587  CTS      CHANGES FOR ADDING NEW FIELD OUTSTANDING DISBURSEMENTS    *
#*                   SURVIVOR BENEFIT IN POLICY PAYMENT SCREEN                 *
#*  Q29850  CTS      CHANGES TO REMOVE DEFUALT SESSION FOR SA EFFECTIVE DATE   *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  FFF10R  CTS      CHANGES FOR PROCESSING CURRENCY
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UY3049  CTS      STREAM 3 - ANNUITY PAYOUT                                 *
#*******************************************************************************

S-STEP BF0460-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ACCT-BASE-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Current Location";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
        Index = "1";
    }

    INOUT MIR-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Selection";
        Label = "Fund";
    #   Label = "Branch / Departments";
        Index = "1";
    }

    INOUT MIR-CF-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-CF-TAX-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-DIR-BILL-APL-AMT
    {        
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Length = "13";
        SType = "Currency";
        Label = "APL Repayment";
    }

    INOUT MIR-DIR-BILL-DPOS-AMT
    {       
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    INOUT MIR-DIR-BILL-LOAN-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE       
    #NWLLRP CHANGES BEGIN
    #   Length = "13";
        Length = "15";
    #NWLLRP CHANGES END     
        SType = "Currency";
        Label = "Loan Repayment";
    }

    INOUT MIR-DIR-BILL-PDF-AMT
    {  
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
    #NWLPP3 CHANGES BEGIN
        Signed;
    #NWLPP3 CHANGES END
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    INOUT MIR-DIR-BILL-PREM-AMT
    {        
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        Label = "Premium";
    }

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[2]
    {
        Length = "20";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-AGT-REASN-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-DV-CR-ACCT-TRXN-AMT-T[2]
    {
 #FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-DB-ACCT-TRXN-AMT-T[2]
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-ENTR-CSH-AMT
    {            
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }
    
    INOUT MIR-OPER-CAT-CD
    {
        Mandatory;    
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
    }    

    INOUT MIR-DV-POL-RCOMM-AMT
    {        
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Length = "13";
        SType = "Currency";
        Label = "Retained Commission";
    }

    INOUT MIR-DV-PRCES-DT
    {
# Changes for ATF185 starts here	    
    #    Mandatory;
# Changes for ATF185 ends here	    
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process date";
    }

    INOUT MIR-PAC-DRW-TOT-AMT
    {      
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "PAC Amount";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-MISC-SUSP-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-BT-SUSP-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }
 
    INOUT MIR-POL-PD-SUSP-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }
 
    INOUT MIR-POL-CC-SUSP-AMT
    {         
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }
    
# Changes for NWLBCA starts here     
    INOUT MIR-OVR-SHRT-PREM-AMT
    {         
 #FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Over / Short Premium";
    }
# Changes for NWLBCA ends here

    INOUT MIR-POL-OS-DISB-AMT
    {        
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

# Changes for NWLLRP starts here     
    INOUT MIR-DV-LOAN-XCES-SHRT-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Excess / Short Interest";
    }
# Changes for NWLLRP ends here

    INOUT MIR-OS-DISB-SURR-AMT
    {       
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    INOUT MIR-OS-DISB-MAT-AMT
    {
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    INOUT MIR-OS-DISB-DTH-AMT
    {     
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    INOUT MIR-OS-DISB-CLM-AMT
    {       
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    INOUT MIR-OS-DISB-AD-AMT
    {       
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-OS-DISB-LOAN-AMT
    {       
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
# NWLLTC CHANGES ENDS HERE

    INOUT MIR-OS-DISB-SRVBEN-AMT
    {           
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - UL Survivor Benefit";
    }

#UYS025 CHANGES START HERE

    INOUT MIR-ADV-PMT-RSRV-AMT
    {    
        Signed;
        Length = "13";
        SType = "Currency";
        CurrencyCode = "MIR-GLOB-CRCY-CD";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE
    
#M271A7 CHANGES START HERE 

    INOUT MIR-OS-DISB-RFND-AMT
    {     
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        DisplayOnly;
    	Signed;
    	Length = "15";
    	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    } 
    
#M271A7 CHANGES END HERE  
  
    INOUT MIR-POL-PDF-SUSP-AMT
    {  
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {    
#FFF10R CHANGES START HERE    
        CurrencyCode = "MIR-PRCES-CRCY-CD";
#FFF10R CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    INOUT MIR-SBSDRY-CO-ID-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
 
    INOUT MIR-DV-DPOS-CAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DPOS-CAT-CD";
        SType = "Selection";
        Label = "Type of Deposit";
    }
    
    INOUT MIR-DV-SA-XFER-EFF-DT
    {
        Length = "10";
# CHANGES FOR Q29850 STARTS HERE        
#        DefaultSession = "LSIR-PRCES-DT";
# CHANGES FOR Q29850 ENDS HERE        
        SType = "Date";
        Label = "SA Effective Date";
    }
    
# Changes for NWLBCA starts here 
    INOUT MIR-TRAD-SO-JRNL-DT
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "SO Journal Date";
    }
    
    INOUT MIR-PREM-DUE-MO-NUM
    {
        Length = "07";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Premium Due Month";
    }
# Changes for NWLBCA ends here

#NWLCAR CHANGES BEGINS

    INOUT MIR-DV-DPOS-RFND-QTY
    {
      DisplayOnly;
      Length = "3";
      SType = "Text";
      Label = "Number of Deposits/Refunds";
    }

#NWLCAR CHANGES END. 


#FFF10R CHANGES STARTS
    INOUT MIR-PRCES-CRCY-CD
    {      
      Length = "3";
      CodeSource = "DataModel";
      CodeType = "PRCES-CRCY-CD";
      SType = "Selection";
      Label = "Currency";
    }
#FFF10R CHANGES ENDS

#FFF10R CHANGES START HERE 
    INOUT MIR-GLOB-CRCY-CD
     {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    } 
#FFF10R CHANGES END HERE
#UY3049 CHANGES START HERE
    INOUT MIR-UNPAY-ANTY-PREM-AMT
    {    
        Signed;
        Length = "13";
        SType = "Currency";
        CurrencyCode = "MIR-GLOB-CRCY-CD";
        Label = "Receivable Premium Amount";
    } 
#UY3049 CHANGES ENDS HERE
}

