# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8074-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8074-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-ENTR-BUS-FCN-ID";
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

    INOUT MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Business Function";
    }

    IN MIR-BUS-FCN-AUD-IND-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Audit Indicator";
        Index = "1";
    }

    IN MIR-BUS-FCN-CONN-IND-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Connection Indicator";
        Index = "1";
    }

    IN MIR-BUS-FCN-ID-T[100]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Business Function";
        Index = "1";
    }

    IN MIR-BUS-FCN-PDRVR-ID-T[100]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Process Driver";
        Index = "1";
    }

}

