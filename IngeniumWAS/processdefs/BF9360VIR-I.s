#*******************************************************************************
#*  Component:   BF9360VIR-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      INITIAL VERSION                                           *
#*  S25573  CTS      FIX FOR DISPLAY ISSUE                                    **
#*******************************************************************************

S-STEP BF9360VIR-I
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
    
    IN MIR-VIR-INS-TYP-CD
    {
        Length = "5";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "INS-TYP-CD";
        SType = "Text";
        Label = "Type:";	
    }     


    IN MIR-VIR-RPU-POL-CD
    {
        Length = "5";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "RPU-POL-CD";
        SType = "Text";
        Label = "RPU Policy:";	
    }     
        
#S25573
#   IN MIR-VIR-RPU-NEW-OLD-RT
#   {   
#       Signed;
#       DisplayOnly;
#       Length = "13";
#       Decimals = "5";
#       SType = "Number";
#       Label = "RPU new/old rate:";
#   }
    IN MIR-VIR-RPU-NEW-OLD-RT
     {
         Length = "13";
         CodeSource = "DataModel";
         CodeType = "RPU-NEW-OLD-RT";
         SType = "Text";
         Label = "RPU new/old rate:";
     }     
#S25573
    

    IN MIR-VIR-RPU-FACE-AMT
    {   
        Signed;
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Regular death face amount after RPU:";
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
        DisplayOnly;
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
