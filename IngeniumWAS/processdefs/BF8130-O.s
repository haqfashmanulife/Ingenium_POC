# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8130-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8130-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DM-AV-CD-T[250]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Selection Box Values";
        Index = "1";
    }

    IN MIR-DM-AV-DESC-TXT-T[250]
    {
        DisplayOnly;
        Length = "80";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Values Description";
        Index = "1";
    }

    IN MIR-DM-AV-CD
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Allowed Value";
    }

    IN MIR-DM-AV-DESC-TXT
    {
        Key;
        DisplayOnly;
        Length = "80";
        SType = "Text";
        Label = "Values Description";
    }

}

