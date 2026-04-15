# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9H40-I.s                                                    *
#*  Description: Annuity/Death Lump Sum Quote                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3049  28AUG24  Intial Version                                            *
#*******************************************************************************

S-STEP BF9H40-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "BF9H40Retrieve";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-EFF-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-LMPSM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "LMPSM-TYP-CD";
        SType = "Selection";
        Label = "LumpSum Type";
    }
}
