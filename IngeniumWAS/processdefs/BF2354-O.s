# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:58 PM EDT

#*******************************************************************************
#*  Component:   BF2354-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2354-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CPEVNT-POL-CLI-ID-BASE";
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

    INOUT MIR-CPEVNT-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CPEVNT-TRXN-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Record Date";
    }

    INOUT MIR-CPEVNT-TRXN-TIME
    {
        Key;
        Length = "6";
        SType = "Time";
        Label = "Record Time";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Selection";
        Label = "Activity";
    }

    INOUT MIR-CPEVNT-POL-CLI-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-CPEVNT-POL-CLI-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-BUS-FCN-ID-T[25]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Business Function ID";
        Index = "1";
    }

    IN MIR-CPEVNT-GR-CD-T[25]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Group Type";
        Index = "1";
    }

    IN MIR-CPEVNT-POL-CLI-ID-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-CPEVNT-SEQ-NUM-T[25]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CPEVNT-SRC-CD-T[25]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        SType = "Text";
        Label = "Source Code";
        Index = "1";
    }

    IN MIR-CPEVNT-TRXN-DT-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Date";
        Label = "Record Date";
        Index = "1";
    }

    IN MIR-CPEVNT-TRXN-TIME-T[25]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table25";
        SType = "Time";
        Label = "Record Time";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-DV-MSG-TXT-T[25]
    {
        DisplayOnly;
        Length = "79";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Comment/Information";
        Index = "1";
    }

    IN MIR-EVNT-ACT-CD-T[25]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Text";
        Label = "Action";
        Index = "1";
    }

    IN MIR-EVNT-ACTV-CD-T[25]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Text";
        Label = "Activity";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Insured Client";
        Index = "1";
    }

    IN MIR-USER-ID-T[25]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

}

