# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF9E90-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1668  CTS      Initial Version                      *
#*  M271B4  CTS      ADDITION OF 8 FIELDS AS PART OF FRA                       *
#*  M319B4  CTS      ADDITION OF 3 FIELDS AS PART OF FXWL                      * 
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*******************************************************************************

P-STEP BF9E90-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E90";
        BusinessFunctionName = "Inquiry - Reinstatement Premiums";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9E90";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT  MIR-REINST-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Reinstatement Date";
    }   
       
    INOUT  MIR-ADD-PREM-MTH
    {
        Length = "2";
        SType = "Text";
        Label = "Addition of premium for the following month";
    }
    
    #CHANGES FOR UYS033 STARTS
    OUT  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
    #CHANGES FOR UYS033 ENDS
    
    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }
    
    OUT MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "Premium for the following month";
    }    
    
    OUT  MIR-DV-DELINQ-PREM
    {
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Premium";
    }
       
    OUT  MIR-DV-DELINQ-INT
    {
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Interest";
    }
       
    OUT  MIR-DV-TOT-AMT
    {
        Length = "18";
        SType = "Currency";
        Label = "Total Amount to be Paid";
    }
#M319B4 CHANGES START HERE
    OUT  MIR-DV-DELINQ-FRCY-PREM
    {
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Premium(Policy Curr)";
    }
       
    OUT  MIR-DV-DELINQ-FRCY-INT
    {
        Length = "15";
        SType = "Currency";
        Label = "Delinquent Interest(Policy Curr)";
    }
       
    OUT  MIR-DV-TOT-FRCY-AMT
    {
        Length = "18";
        SType = "Currency";
        Label = "Total Amount to be Paid(Policy Curr)";
    }
#M319B4 CHANGES ENDS HERE 
#M271B4 CHANGES START HERE     
    OUT MIR-DV-POL-PREM-MO-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Premium Month";
        Index = "1";
    }
    OUT MIR-POL-YEN-PREM-AMT-T[05]
    {
        Length = "18";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "Yen Premium";
        Index = "1";
    }
    OUT MIR-DV-PREM-CRCY-XCHNG-DT-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Date";
        Label = "Base date of Exchange to  Policy's Currency";
        Index = "1";
    }
    OUT MIR-DV-PREM-CRCY-XCHNG-RT-T[05]
    {
        Length = "12";
        FieldGroup = "Table05";
        SType = "Number";
        Label = "Exchange Rate to Policy's Currency";
        Decimals = "2";         
        Index = "1";
    }
    OUT MIR-DV-POL-CRCY-PREM-AMT-T[05]
    {
        Length = "18";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "Premium Foreign Currecny Denominated";
        Index = "1";
    }
    OUT MIR-DV-POL-CRCY-XCHNG-DT-T[05]
    {
        Length = "10";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "JPY Conversion Base Date";
        Index = "1";
    }
    OUT MIR-DV-POL-CRCY-XCHNG-RT-T[05]
    {
        Length = "12";
        FieldGroup = "Table05";
        SType = "Number";
        Label = "JPY Conversion Rate";
        Decimals = "2";         
        Index = "1";
    }
    OUT MIR-DV-OVERDUE-PREM-AMT-T[05]
    {
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
    
    
    
    