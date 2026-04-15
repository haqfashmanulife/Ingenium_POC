# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0462-P.p                                                    *
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
#*  NWLLRP  CTS      CHANGES FOR LOAN REPAYMENT                                *
#*  NWLLTC  CTS      CHANGES FOR LOAN PROCESSING                               *
#*  Q02506  CTS      CHANGES DONE TO MAKE THE REASON FIELD MANDETORY           *
#*******************************************************************************

P-STEP BF0462-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0462";
        BusinessFunctionName = "Policy Payment Reversal";
        BusinessFunctionType = "Reversal";
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
        Length = "13";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Loan Repayment";
    }

    INOUT MIR-DIR-BILL-PDF-AMT
    {
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
        CodeType = "AGT-REASN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-DV-CF-DEP-SEQ-NUM
    {
        Length = "3";
        DefaultConstant = "000";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Deposit Sequence Number";
    }

    INOUT MIR-DV-CF-PREM-SEQ-NUM
    {
        Length = "3";
        DefaultConstant = "000";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Premium Sequence Number";
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

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        DBTableName = "Derived";
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
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Reason";
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

    INOUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

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
# NWLLTC CHANGES ENDS HERE
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

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess/Short Interest:";
    }
# Changes for NWLLRP ends here
}

