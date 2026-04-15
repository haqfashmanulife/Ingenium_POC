#*******************************************************************************
#*  Component:   BF0852Key-I.s                                                 *
#*  Description: Key Input step for Update Coverage Allocations.  Includes     *
#*               1 checkbox for Notice Suppression.                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MFFALL  CLB      Create to support allocation by amount for 2-tier,        *
#*  MFFALL           Cvg-Fund level system.                                    *
#*******************************************************************************

S-STEP BF0852Key-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    INOUT MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        SType = "Selection";
        Label = "Allocation Type";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SUPRES-ALLOC-NOTI-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Allocation Notification";
    }

    INOUT MIR-ALLOC-AUTO-DT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Date Setting";
    }

}

