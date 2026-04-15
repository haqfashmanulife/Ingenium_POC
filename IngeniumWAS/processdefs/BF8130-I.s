# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8130-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8130-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-DM-AV-CD-T[1]";
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

    INOUT MIR-DM-AV-CD-T[250]
    {
        Length = "15";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Selection Box Values";
        Index = "1";
    }

    INOUT MIR-DM-AV-DESC-TXT-T[250]
    {
        Length = "80";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Values Description";
        Index = "1";
    }

    INOUT MIR-DM-AV-CD
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-DESC-TXT
    {
        Key;
        Length = "80";
        SType = "Text";
        Label = "Values Description";
    }

    INOUT MIR-DM-AV-SUBSET-CD
    {
        Length = "4";
        SType = "Text";
        Label = "Allowed Value Subset";
    }

    INOUT MIR-DM-AV-TBL-CD
    {
        Length = "30";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

}

