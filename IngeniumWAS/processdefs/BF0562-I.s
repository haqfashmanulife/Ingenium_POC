# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0562-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0562-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-HIST-UNKNWN-IND";
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

    INOUT MIR-CLI-REL-DTH-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age at Death";
        Index = "1";
    }

    INOUT MIR-CLI-REL-DTH-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Dead";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age if Living";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Living";
        Index = "1";
    }

    INOUT MIR-DISORD-1-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        SType = "Selection";
        Label = "Details (1)";
        Index = "1";
    }

    INOUT MIR-DISORD-2-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        SType = "Selection";
        Label = "Details (2)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-1-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Selection";
        Label = "Heredity Disorder (1)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-2-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Selection";
        Label = "Heredity Disorder (2)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HERED-DISORD-IND";
        SType = "Selection";
        Label = "Client has family history of hereditary disorders";
    }

    INOUT MIR-HIST-UNKNWN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HIST-UNKNWN-IND";
        SType = "Selection";
        Label = "Client's family history is unknown";
    }

    INOUT MIR-REL-HLTH-STATE-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HLTH";
        SType = "Selection";
        Label = "State of Health / Cause of Death";
        Index = "1";
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

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

}

