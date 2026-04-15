# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0962-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  M2025D  CTS      CHANGES AS PART OF FRA RESUMPTION                         *
#*******************************************************************************

S-STEP BF0962-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-ACTV-PRCES-CD-T[1]";
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

    INOUT MIR-POL-ACTV-PRCES-CD-T[12]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-PRCES-CD";
        SType = "Selection";
        Label = "Automatic Undo/Redo";
        Index = "1";
    }

    IN MIR-POL-ACTV-TYP-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Activity Number";
    }

    IN MIR-ETBL-DESC-TXT-T[12]
    {
        DisplayOnly;
# M2025D CHANGES START HERE
#       Length = "40";
        Length = "60";
# M2025D CHANGES END HERE
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-ETBL-VALU-ID-T[12]
    {
        DisplayOnly;
# M2025D CHANGES START HERE
#       Length = "15";
        Length = "21";
# M2025D CHANGES END HERE
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PHSTA";
        SType = "Text";
        Label = "Code Value";
        Index = "1";
    }

    INOUT MIR-POL-ACTV-REDO-CD-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-REDO-CD";
        SType = "Text";
        Label = "Activity Instructions";
        Index = "1";
    }

}

