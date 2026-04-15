# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1434-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create a US account with location while Cdn signon  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02GL03  WBP      Add Account Bulk Code                                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund. Add SUN ind.   *
#*******************************************************************************

S-STEP BF1434-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MoreButton";
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

    INOUT MIR-ACCT-BASE-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-CRCY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Current Location";
    }

    INOUT MIR-ACCT-ISS-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-ACCT-YR
    {
        Key;
        Length = "4";
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
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-ACCT-BASE-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Account Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-ACCT-CRCY-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ACCT-CRNT-LOC-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Current Location";
        Index = "1";
    }

    IN MIR-ACCT-DESC-TXT-T[12]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-ACCT-ISS-LOC-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Issue Location";
        Index = "1";
    }

    IN MIR-ACCT-YR-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        SType = "Year";
        Label = "Year";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Text";
        Label = "Fund";
    #   Label = "Branch / Departments";
        Index = "1";
    }

    IN MIR-DV-ACCT-YTD-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Current Balance";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-ACCT-BULK-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "BULK";
        SType = "Text";
        Label = "Account Bulk Code";
        Index = "1";
    }

    IN MIR-ACCT-SUN-GL-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "SUN Account";
        Index = "1";
    }
}

