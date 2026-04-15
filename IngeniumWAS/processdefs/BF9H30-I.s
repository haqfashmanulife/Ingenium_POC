# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   B9H30-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*******************************************************************************

S-STEP BF9H30-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Wholelife";
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
    INOUT MIR-PRCS-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    INOUT MIR-PAY-OUT-MTHD-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }
    INOUT MIR-COMP-RECD-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
    
    INOUT MIR-JOUR-EFF-DT 
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
}

