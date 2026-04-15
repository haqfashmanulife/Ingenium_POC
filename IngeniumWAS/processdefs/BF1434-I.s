# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1434-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create a US account with location while Cdn signon  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*******************************************************************************

S-STEP BF1434-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-ACCT-BASE-ID";
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

}

