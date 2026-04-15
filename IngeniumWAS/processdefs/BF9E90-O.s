# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF9E90-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* MP1668 CTS      Initial Version                                             *
#*  M271B4  CTS      ADDITION OF 8 FIELDS AS PART OF FRA                       *
#*  M319B4  CTS      ADDITION OF 3 FIELDS AS PART OF FXWL                      * 
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*******************************************************************************

S-STEP BF9E90-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Inquiry";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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
    
    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
    
    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Premium for the following month";
    }
    
    IN MIR-REINST-DT
    {
        DisplayOnly; 
        Length = "10";        
	SType = "Date";
	 Label = "Reinstatement Date";
    }   

    #CHANGES FOR UYS033 -START
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
    #CHANGES FOR UYS033 -END
    
    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID";
    }
    
    IN MIR-DV-DELINQ-PREM
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Premium";
    }
    
    IN MIR-DV-DELINQ-INT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Interest";
    }
    
    IN MIR-DV-TOT-AMT
    {
        DisplayOnly;
        Length = "18";
        SType = "Currency";
        Label = "Total Amount to be Paid";
    }
#M319B4 CHANGES START HERE
    IN MIR-DV-DELINQ-FRCY-PREM
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Premium(Policy Curr)";
    }
    
    IN MIR-DV-DELINQ-FRCY-INT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Interest(Policy Curr)";
    }
    
    IN MIR-DV-TOT-FRCY-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "18";
        SType = "Currency";
        Label = "Total Amount to be Paid(Policy Curr)";
    }
#M319B4 CHANGES ENDS HERE
#M271B4 CHANGES START HERE     
    IN MIR-DV-POL-PREM-MO-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Premium Month";
        Index = "1";
    }
    IN MIR-POL-YEN-PREM-AMT-T[05]
    {
#M319B4 CHANGES START HERE    
#	CurrencyCode = "MIR-PREM-CRCY-CD";    
        CurrencyCode = "MIR-PMT-CRCY-CD";    
#M319B4 CHANGES ENDS HERE        
        Length = "18";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "Yen Premium";
        Index = "1";
    }
    IN MIR-DV-PREM-CRCY-XCHNG-DT-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Date";
        Label = "Base date of Exchange to  Policy's Currency";
        Index = "1";
    }
    IN MIR-DV-PREM-CRCY-XCHNG-RT-T[05]
    {
        Length = "12";
        FieldGroup = "Table05";
        SType = "Number";
        Label = "Exchange Rate to Policy's Currency";
        Index = "1";
    }
    IN MIR-DV-POL-CRCY-PREM-AMT-T[05]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";    
        Length = "18";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "Premium Foreign Currecny Denominated";
        Index = "1";
    }
    IN MIR-DV-POL-CRCY-XCHNG-DT-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "JPY Conversion Base Date";
        Index = "1";
    }
    IN MIR-DV-POL-CRCY-XCHNG-RT-T[05]
    {
        Length = "12";
        FieldGroup = "Table05";
        SType = "Number";
        Label = "JPY Conversion Rate";
        Index = "1";
    }
    IN MIR-DV-OVERDUE-PREM-AMT-T[05]
    {
#M319B4 CHANGES START HERE        
#	CurrencyCode = "MIR-PREM-CRCY-CD";    
        CurrencyCode = "MIR-PMT-CRCY-CD";    
#M319B4 CHANGES ENDS HERE                
        Length = "18";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "OverDue Premium";
        Index = "1";
    }
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
    INOUT MIR-POL-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }      
#M271B4 CHANGES ENDS HERE     
#M319B4 CHANGES START HERE        
    INOUT MIR-PMT-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M319B4 CHANGES ENDS HERE                    
}  