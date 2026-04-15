# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1430-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create US account with location when Cdn signon     *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01GL02  TMC      Add MCL Account Numbers                                   *
#*  B00039  TMC      Remove Mandatory from Sub Company                         *
#*  02GL03  WBP      Add Account Bulk Code                                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund. Add new SUN ind*
#*******************************************************************************

P-STEP BF1430-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1430";
        BusinessFunctionName = "General Ledger Account Retreive";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0091";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-ACCT-BASE-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-ACCT-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Currency";
    }

    IN MIR-ACCT-CRNT-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Current Location";
    }

    IN MIR-ACCT-ISS-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ILOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Issue Location";
    }

    IN MIR-ACCT-YR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TAC";
        SType = "Year";
        Label = "Year";
    }

    IN MIR-BR-OR-DEPT-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Fund";
    #   Label = "Branch / Departments";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-ACCT-BDGT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-BDGT-TYP-CD";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Budget Amount Type";
    }

    OUT MIR-ACCT-BEG-BAL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TAC";
        SType = "Currency";
        Label = "Beginning Balance";
    }

    OUT MIR-ACCT-CTL-IND
    {
        Length = "1";
        DBTableName = "TAC";
        SType = "Indicator";
        Label = "This is a controllable account";
    }

    OUT MIR-ACCT-DESC-TXT
    {
        Length = "20";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Description";
    }

    OUT MIR-ACCT-MCL-BASE-1-ID
    {
        Length = "8";
        DBTableName = "TAC";
        SType = "Text";
        Label = "MLJ Account Number";
    }

    OUT MIR-ACCT-MCL-BASE-2-ID
    {
        Length = "8";
        DBTableName = "TAC";
        SType = "Text";
        Label = "MLJ Account Subsequent Number";
    }

    OUT MIR-ACCT-BULK-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "BULK";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Bulk Code";
    }

    OUT MIR-ACCT-MTHLY-RPT-IND
    {
        Length = "1";
        DBTableName = "TAC";
        SType = "Indicator";
        Label = "Account will be produced in the printed monthly report";
    }

    OUT MIR-ACCT-SUB-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-SUB-TYP-CD";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Bank / Cash Clearing";
    }

    OUT MIR-ACCT-TOT-BDGT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TAC";
        SType = "Currency";
        Label = "Total Budget Amount";
    }

    OUT MIR-ACCT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-TYP-CD";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-DV-ACCT-MO-BAL-AMT-T[12]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TAC";
        SType = "Currency";
        Label = "Monthly Balance - January";
        Index = "1";
    }

    OUT MIR-DV-ACCT-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Balance";
    }

    OUT MIR-DV-MO-BDGT-AMT-PCT-T[12]
    {
        Signed;
        Length = "17";
        Decimals = "2";
        FieldGroup = "Table12";
        DBTableName = "TAC";
        SType = "Number";
        Label = "Budget - January";
        Index = "1";
    }

    OUT MIR-ENTR-IMPCT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ENTR-IMPCT-CD";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Policy Account Updated";
    }

    OUT MIR-MEMO-BDGT-RPT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TAC";
        SType = "Currency";
        Label = "Memo Item";
    }

    OUT MIR-ACCT-SUN-GL-IND
    {
        Length = "1";
        DBTableName = "TAC";
        SType = "Indicator";
        Label = "SUN Account";
    }
}

