#*******************************************************************************
#*  Component:   BF9306-I.s                                                    *
#*  Description: NEW SCREEN FOR ADVANCE PAYMENT QUOTE                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP1  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9306-I
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
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-CALC-DATE
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    INOUT MIR-ADV-PMT-YR
    {
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        Length = "2";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    }

    INOUT MIR-ADV-PMT-MO
    {
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        Length = "2";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    }
}