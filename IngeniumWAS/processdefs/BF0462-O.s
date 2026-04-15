# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0462-O.s                                                    *
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
#*  NWLLTC  CTS      CHANGES DONE TO ADD OS LOAN DISB AMT
#*******************************************************************************

S-STEP BF0462-O
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
        Length = "13";
        SType = "Currency";
        Label = "Loan Repayment";
    }

    IN MIR-DIR-BILL-PDF-AMT
    {
        DisplayOnly;
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

    IN MIR-DV-CF-DEP-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Sequence Number";
    }

    IN MIR-DV-CF-PREM-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Premium Sequence Number";
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
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-ENTR-CSH-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }

    IN MIR-DV-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-DV-REVRS-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REVRS-REASN-CD";
        SType = "Text";
        Label = "Reason";
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
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }
 
    IN MIR-POL-OS-DISB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

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
# NWLLTC CHNAGES STARTS HERE
    IN MIR-OS-DISB-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
# NWLLTC CHNAGES ENDS HERE
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
# Changes for NWLLRP starts here
    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
    IN MIR-DV-LOAN-XCES-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Excess / Short Interest";
    }
# Changes for NWLLRP Ends here
}

