# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0462-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015902  6.1.1J   Corrected datamodel name for AGT-REASN-CD                 *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  NWLLRP           CHANGES FOR LOAN REPAYMENT PROCESSING                     *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  Q02506  CTS      CHANGES DONE TO MAKE THE REASON FIELD MANDETORY           *
#*******************************************************************************

S-STEP BF0462-I
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

    INOUT MIR-DIR-BILL-APL-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "APL Repayment";
    }

    INOUT MIR-DIR-BILL-DPOS-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    INOUT MIR-DIR-BILL-LOAN-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Loan Repayment";
    }

    INOUT MIR-DIR-BILL-PDF-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    INOUT MIR-DIR-BILL-PREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Premium";
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

    INOUT MIR-DV-CF-DEP-SEQ-NUM
    {
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Sequence Number";
    }

    INOUT MIR-DV-CF-PREM-SEQ-NUM
    {
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Premium Sequence Number";
    }

    INOUT MIR-DV-CR-ACCT-TRXN-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-DB-ACCT-TRXN-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-ENTR-CSH-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-DV-REVRS-REASN-CD
    {
# Q02506 CHANGES STARTS HERE
        Mandatory;
# Q02506 CHANGES ENDS HERE
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REVRS-REASN-CD";
        SType = "Selection";
        Label = "Reason";
    }

    INOUT MIR-PAC-DRW-TOT-AMT
    {
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
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-BT-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }
 
    INOUT MIR-POL-PD-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }
 
    INOUT MIR-POL-CC-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }
 
    INOUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    INOUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    INOUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    INOUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    INOUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    INOUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-OS-DISB-LOAN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }

#NWLLTC CHANGES ENDS HERE
    INOUT MIR-POL-PDF-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {
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
        Label = "MIR-DV-PRCES-STATE-CD";
    }
# Changes for NWLLRP starts here
    INOUT MIR-JRNL-DT
    {
      Length = "10";
	  DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Journal Date";
    }
    INOUT MIR-DV-LOAN-XCES-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess / Short Interest";
    }
# Changes for NWLLRP Ends here
}

