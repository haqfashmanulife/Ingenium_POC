
#*******************************************************************************
#*  Component:   BF9G72-I.s                                                    *
#*  Description: Annuity Payout Quotation                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3047  29JAN24  INITIAL VERSION                                           *
#*  UY3149  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G72-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
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

    INOUT MIR-CALC-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }   
	
#UY3149- CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
      }
#UY3149- CHANGES END HERE 
     
}

