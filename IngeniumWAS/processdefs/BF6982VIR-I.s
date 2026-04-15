#*******************************************************************************
#*  Component:   BF6982VIR-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF6982VIR-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Inquiry";
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
        Label = "Active Date";
    }
    
    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }  
    
    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        Length = "07";
        SType = "text";
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
    
    INOUT MIR-VIR-APL-LOAN-AMT
    {   
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "APL balance:";
    }     
    
    INOUT MIR-VIR-POL-LOAN-EFF-DT
    {

        Length = "10";
        SType = "Date";
        Label = "APL date";
    }    
    
    INOUT MIR-VIR-PREPAY-MNG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Prepayment management";
    }
    
    INOUT MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }
}
