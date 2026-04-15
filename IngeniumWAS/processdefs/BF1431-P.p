# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1431-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create US account with location when Cdn signon     *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*******************************************************************************

P-STEP BF1431-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1431";
        BusinessFunctionName = "General Ledger Account Create";
        BusinessFunctionType = "Create";
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
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

}

