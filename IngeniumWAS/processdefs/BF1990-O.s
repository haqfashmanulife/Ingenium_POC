# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF1990-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1990-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Display";
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

    IN MIR-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Individual Company";
    }

    IN MIR-DV-CO-ID-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultConstant = "N";
        SType = "Indicator";
        Label = "All Companies";
    }

    IN MIR-DV-USER-ID-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "All Users";
    }

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Individual User ID";
    }

    IN MIR-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    IN MIR-USER-ID-T[100]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

    IN MIR-USER-SESN-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "USER-SESN-STAT-CD";
        SType = "Text";
        Label = "Session Status";
        Index = "1";
    }

}

