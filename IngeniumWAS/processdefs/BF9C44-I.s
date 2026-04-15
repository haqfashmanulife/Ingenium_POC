
#*******************************************************************************
#*  Component:   BF9C44-I.s                                                    *
#*  Description: NEW SCREEN FOR ANNUITY TRANSFER QUOTE                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP113C  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C44-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";    
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

    INOUT MIR-ANTY-ESTB-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Annuity Establishment Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-ANTY-CAP-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Annuity Capital";
    }

}

