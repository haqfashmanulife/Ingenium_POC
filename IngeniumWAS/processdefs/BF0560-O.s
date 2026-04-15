# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:24 PM EDT

#*******************************************************************************
#*  Component:   BF0560-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0560-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-REL-DTH-AGE-T[4]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age at Death";
        Index = "1";
    }

    IN MIR-CLI-REL-DTH-QTY-T[4]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Dead";
        Index = "1";
    }

    IN MIR-CLI-REL-LVNG-AGE-T[4]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age if Living";
        Index = "1";
    }

    IN MIR-CLI-REL-LVNG-QTY-T[4]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Living";
        Index = "1";
    }

    IN MIR-DISORD-1-DTL-IND-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        SType = "Text";
        Label = "Details (1)";
        Index = "1";
    }

    IN MIR-DISORD-2-DTL-IND-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        SType = "Text";
        Label = "Details (2)";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-HERED-DISORD-1-CD-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Text";
        Label = "Heredity Disorder (1)";
        Index = "1";
    }

    IN MIR-HERED-DISORD-2-CD-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Text";
        Label = "Heredity Disorder (2)";
        Index = "1";
    }

    IN MIR-HERED-DISORD-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HERED-DISORD-IND";
        SType = "Text";
        Label = "Client has family history of hereditary disorders";
    }

    IN MIR-HIST-UNKNWN-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HIST-UNKNWN-IND";
        SType = "Text";
        Label = "Client's family history is unknown";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

    IN MIR-REL-HLTH-STATE-CD-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HLTH";
        SType = "Text";
        Label = "State of Health / Cause of Death";
        Index = "1";
    }

}

