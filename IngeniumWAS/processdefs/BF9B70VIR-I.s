#*******************************************************************************
#*  Component:   BF9B70VIR-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      VIRTUAL QUOTE SCREEN                                      *
#*******************************************************************************

S-STEP BF9B70VIR-I
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
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }


    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
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
    
    INOUT MIR-VIR-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Selection";
        Label = "Payment frequency";
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
    
    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }    
    
    IN MIR-VIR-CVG-NUM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }

    IN MIR-VIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }

    IN MIR-VIR-CVG-FACE-AMT-T[99] 
    {       
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    } 
}
