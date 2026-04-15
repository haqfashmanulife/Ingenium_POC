# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9B82Key-I.s                                                 *
#*  Description: Birth Date/ Sex Modification Process                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS91B  CTS      Initial Version                                           *
#*******************************************************************************

S-STEP BF9B82Key-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "BthSxChng";
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
        SType = "Text";
        DefaultSession = "MIR-POL-ID-BASE";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        DefaultSession = "MIR-POL-ID-SFX";        
        Label = "Suffix";
    }
    
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
    
}

