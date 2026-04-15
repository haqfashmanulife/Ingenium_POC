# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0460-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015902  6.1.1J   Corrected datamodel name for AGT-REASN-CD                 *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00422  VAN      ADD OPERATION CATEGORY                                    *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  01OCT05 SUG      ADD DV-DPOS-CAT-CD AND SA-XFER-EFF-DT                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  25AUG09 CTS      ADDED NEW FIELDS FOR TRAD POLICIES PROCESSING:            *
#*		     OVR-SHRT-PREM-AMT, TRAD-SO-JRNL-DT, PREM-DUE-MO-NUM       *
#*  NWLCAR  CTS      ADDED NEW FIELD NUM-DEP-REFND FOR COLLECTION & REFUND     *
#*  ATF185  CTS      UPDATED THE DEPOSIT EFF DATE FIELD TO OPTIONAL FIELD      *
#*  NWLPP3  CTS      PREMIUM DEPOSIT FUND FIELD MADE AS SIGNED FIELD           *
#*  NWLLRP  CTS      CHANGES FOR LOAN REPAYMENT PROCESSING                     *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  Q07587  CTS      CHANGES FOR ADDING NEW FIELD OUTSTANDING DISBURSEMENTS    *
#*                   SURVIVOR BENEFIT IN POLICY PAYMENT SCREEN                 *
#*  Q29850  CTS      CHANGES TO REMOVE DEFUALT SESSION FOR SA EFFECTIVE DATE   *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  M319AC  CTS      CHANGES DONE FOR FXWL POLICY LOAN PROCESSING              *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UY3049  CTS      STREAM 3 - ANNUITY PAYOUT                                 *
#*******************************************************************************

P-STEP BF0460-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0460";
        BusinessFunctionName = "Policy Payments";
        BusinessFunctionType = "Payment";
        MirName = "CCWM0651";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TAC";
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
        DBTableName = "TAC";
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
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Issue Location";
        Index = "1";
    }

    INOUT MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TAG";
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
        DBTableName = "TAC";
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
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-CF-TAX-YR
    {
        Length = "4";
        DBTableName = "TCFLW";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-DIR-BILL-APL-AMT
    {
        Length = "13";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "APL Repayment";
    }

    INOUT MIR-DIR-BILL-DPOS-AMT
    {
        Length = "15";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    INOUT MIR-DIR-BILL-LOAN-AMT
    {
    #NWLLRP CHANGES BEGIN 
    #   Length = "13";
        Length = "15";
    #NWLLRP CHANGES END       
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Loan Repayment";
    }

    INOUT MIR-DIR-BILL-PDF-AMT
    {
    #NWLPP3 CHANGES BEGIN
        Signed;
    #NWLPP3 CHANGES END
        Length = "13";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    INOUT MIR-DIR-BILL-PREM-AMT
    {
        Length = "15";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Premium";
    }

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[2]
    {
        Length = "20";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-AGT-REASN-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DV-AGT-REASN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-DV-CR-ACCT-TRXN-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-DB-ACCT-TRXN-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-ENTR-CSH-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Amount";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Mandatory;    
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
    }    

    INOUT MIR-DV-POL-RCOMM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
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
        DBTableName = "Derived";
        SType = "Date";
        Label = "Process date";
    }

    INOUT MIR-PAC-DRW-TOT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPDRW";
        SType = "Currency";
        Label = "PAC Amount";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-BT-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    INOUT MIR-POL-PD-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    INOUT MIR-POL-CC-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

# Changes for NWLBCA starts here
    INOUT MIR-OVR-SHRT-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Over / Short Premium";
    }
# Changes for NWLBCA ends here

    INOUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

# Changes for NWLLRP starts here
    INOUT MIR-DV-LOAN-XCES-SHRT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Excess / Short Interest";
    }
# Changes for NWLLRP ends here

    INOUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    INOUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    INOUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    INOUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    INOUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
#NWLLTC CHANGES STARTS HERE
    INOUT MIR-OS-DISB-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
#NWLLTC CHANGES ENDS HERE

#M271A7 CHANGES START HERE  

    INOUT MIR-OS-DISB-RFND-AMT
    {    
        Signed;
    	Length = "15";
    	DBTableName = "TPOL";
    	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    } 

#M271A7 CHANGES END HERE    
    INOUT MIR-OS-DISB-SRVBEN-AMT
    {
            Signed;
            Length = "15";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Outstanding Disbursements - UL Survivor Benefit";
    }
    
#UYS025 CHANGES START HERE

    INOUT MIR-ADV-PMT-RSRV-AMT
    {    
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE    

    INOUT MIR-POL-PDF-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    INOUT MIR-SBSDRY-CO-ID-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
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
    #NWLCAR CHANGES START
    INOUT MIR-DV-DPOS-RFND-QTY
    { 
       Length = "3";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Number of Deposits/Refunds";
    }
    #NWLCAR CHANGES END.

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
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

#FFF10R CHANGES STARTS
    INOUT MIR-PRCES-CRCY-CD
    {      
        Length = "3";       
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
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Receivable Premium Amount";
    } 
#UY3049 CHANGES ENDS HERE

}

