# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2033-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2033-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    IN MIR-ADDL-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Additional Plan";
    }

    IN MIR-ADDL-PLAN-MAND-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADDL-PLAN-MAND-IND";
        SType = "Text";
        Label = "Additional Plan Type";
    }

    IN MIR-BASIC-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Basic Plan";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

}

