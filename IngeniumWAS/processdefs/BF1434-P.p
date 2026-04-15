# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1434-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create US account with location when Cdn signon     *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02GL03  WBP      Add Account Bulk Code                                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund. Add SUN ind.   *
#*******************************************************************************

P-STEP BF1434-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1434";
        BusinessFunctionName = "General Ledger Account List";
        BusinessFunctionType = "List";
        MirName = "CCWM0091";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID
    {
        Key;
        Length = "6";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-CRCY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Current Location";
    }

    INOUT MIR-ACCT-ISS-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ILOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-ACCT-YR
    {
        Key;
        Length = "4";
        DBTableName = "TAC";
        SType = "Year";
        Label = "Year";
    }

    INOUT MIR-BR-OR-DEPT-ID
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-ACCT-BASE-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    OUT MIR-ACCT-CRCY-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ACCT-CRNT-LOC-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Current Location";
        Index = "1";
    }

    OUT MIR-ACCT-DESC-TXT-T[12]
    {
        Length = "20";
        FieldGroup = "Table12";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    OUT MIR-ACCT-ISS-LOC-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Issue Location";
        Index = "1";
    }

    OUT MIR-ACCT-YR-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        DBTableName = "TAC";
        SType = "Year";
        Label = "Year";
        Index = "1";
    }

    OUT MIR-BR-OR-DEPT-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Fund";
    #   Label = "Branch / Departments";
        Index = "1";
    }

    OUT MIR-DV-ACCT-YTD-AMT-T[12]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Balance";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-ACCT-BULK-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "BULK";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Bulk Code";
        Index = "1";
    }

    OUT MIR-ACCT-SUN-GL-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TAC";
        SType = "Indicator";
        Label = "SUN Account";
        Index = "1";
    }

}

