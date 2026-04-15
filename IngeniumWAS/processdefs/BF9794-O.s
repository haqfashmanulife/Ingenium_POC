# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9794-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  07MAY02  Module created                                            *
#*  P00643  11OCT02  fix for mismatch of between s-steps and html for fields   *
#*                                                                             *
#*******************************************************************************

S-STEP BF9794-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PLANC";
        SType = "Selection";
        Label = "Ingenium Plan id";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Ingenium Plan Code";
        Index = "1";
    }

    IN MIR-CVG-STAT-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Text";
        Label = "Coverage Type";
        Index = "1";
    }

    IN MIR-AVE-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "AVE Plan Code";
        Index = "1";
    }


    IN MIR-PLAN-DESC-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Description";
        Index = "1";
    }

}

