#*******************************************************************************
#*  Component:   BF9562VIR-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9562VIR-I
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
        SType="Hidden";
    }

    IN MIR-POL-ID-BASE 
    {
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }


    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }
     

    INOUT MIR-VIR-ACTV-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Active";
    }
    
    INOUT MIR-VIR-LOAN-AMT
    {   
      
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Policy loan balance:";
    }  
    
    INOUT MIR-VIR-INT-STR-DT
    {

        Length = "10";
        SType = "Date";
        Label = "Interest start date";
    }  
    

    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }    
}
