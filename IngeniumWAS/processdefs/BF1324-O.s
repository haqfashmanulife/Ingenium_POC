# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1324-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P01844  BP       Increase size of MIR-CLI-CNTCT-SUB-CD                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF1324-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-CNTCT-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    INOUT MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-CLI-CNTCT-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Activity Date";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-RETEN-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        SType = "Text";
        Label = "Retention Period";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-SEQ-NUM-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-SUB-CD-T[11]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-TYP-CD-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        SType = "Text";
        Label = "Activity";
        Index = "1";
    }

    IN MIR-CLI-ID-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-FOLWUP-TXT-IND-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Indicator";
        Label = "Comments";
        Index = "1";
    }

    IN MIR-FOLWUP-ACT-CD-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        SType = "Text";
        Label = "Action";
        Index = "1";
    }

    IN MIR-FOLWUP-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    IN MIR-FOLWUP-USER-ID-T[11]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[11]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

