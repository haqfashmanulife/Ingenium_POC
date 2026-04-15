# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6985DIA-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR10  EKM      SURRENDER VALUES - ADD SHORTAGE AMOUNT                    *
#*  B00518  SRO      Reverse data for gross amount & net amount                *
#*  1CPR03  EKM      CONVERSION PROCESSING - SURRENDER VALUES                  *
#*  MP5002  CTS      ADD FLEX-FUND-SURR-CHARGE-TYP                             *
#*  FEGL05  CTS      ADD LAPSE START DATE AND PREMIUM NECESSARY TO EXTEND GRACE*
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271PV  CTS      FRA Policy Value Management Changes                       *
#*  M271A8  CTS      Online Screen Changes done as part of FRA                 *
#*  R10762  CTS      UL CHANGES- ADD NEW FIELD EXPECTED LAPSE DT               *
#*  M319I3  CTS      CHANGES FOR FXWL ADD NEW FIELD EXCHANGE RATE BASE DATE    *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UY3063  CTS      STREAM 3 VARIABLE LIFE BENEFIT CHANGES                    *
#*  UY304A  CTS       CALL CENTER SCREEN ENHANCEMENT                            *
#*******************************************************************************

S-STEP BF6985DIA-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valufnd";
        Type = "Output";
        DelEmptyRows;
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

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-ACUM-INT-LTD-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE       
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    IN MIR-CF-FND-TRXN-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CF-EFF-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    IN MIR-DV-FND-BAL-EX-ESC-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
        Index = "1";
    }

    IN MIR-CF-FND-BAL-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    IN MIR-CF-CLI-TRXN-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    IN MIR-CF-INT-PCT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table50";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    IN MIR-CF-MCV-FND-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-LTD-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-TRXN-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Net Amount";
        Index = "1";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-CF-REASN-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    IN MIR-CF-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Cash Flow Seq Number";
        Index = "1";
    }

    IN MIR-CF-STAT-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }

    IN MIR-CF-TRXN-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    IN MIR-CF-UNIT-QTY-T[50]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
        Index = "1";
    }

    IN MIR-CVG-CF-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Coverage Cash Flow Type Code";
    }

    IN MIR-CVG-WTHDR-ORDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    IN MIR-DV-MCV-ACUM-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    IN MIR-DV-MTHV-ADJ-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-BASE-CV-EX-ESC-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
    }

    IN MIR-DV-POL-BASE-CV-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-POL-CSV-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-POL-UL-SHRT-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-LOAN-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Loan";
    }

    IN MIR-MCV-ACUM-INT-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
        Index = "1";
    }

    IN MIR-MCV-GUAR-INT-PCT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table50";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
        Index = "1";
    }

    IN MIR-NXT-CF-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Next Cash Flow - Date";
        Index = "1";
    }
#M271PV CHANGES START HERE  

    IN MIR-CF-XCHNG-RT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        Index = "1";
        DisplayOnly;
        Label = "Exchange Rate";
        Decimals = "2";      		     
        SType = "Number";  
    }

    IN MIR-CF-FEE-RT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        Index = "1";
        DisplayOnly;
        Label = "Fee Rate";
        Decimals = "2";      		     
        SType = "Number";        
    }

    IN MIR-INT-ACUM-PREM-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accmulated Amount";
        Index = "1";
    }
#M271PV CHANGES ENDS HERE   

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Co";
    }
# MP5002 
    
    IN MIR-SURR-CHRG-TYP-CD
    {
            DisplayOnly;
            Length = "1";
            CodeSource = "EDIT";
            CodeType = "MVAL";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "FlexFund Surrender Charge Type";
    }
    
# FEGL05
   
    IN MIR-GRACE-EXT-PREM-AMT
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
           DisplayOnly;
           Signed;
           Length = "17";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Premium necessary to extend grace";
    }
#M271A8 CHANGES START HERE  

    IN MIR-DTH-CVG-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         DBTableName = "TCFLW";
         SType = "Currency";
         Label = "Death Coverage Amount";  
    }
    
    IN MIR-DV-JP-DTH-CVG-AMT 
     {  
        DisplayOnly;  
        Signed;  
        Length = "17";  
        SType = "Currency";  
        Label = "Death Coverage Amount in JPY"; 
     }  
     
   IN MIR-DV-XCHNG-RT
    {
        Length = "18";
        DisplayOnly;
        Label = "Conversion Rate";
        Decimals = "2";      		     
        SType = "Number";  
    }
    
    IN MIR-FWD-GAIN-LOSS-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gain/Loss amount in Forward processing";
        Index = "1";
    } 
    
    IN MIR-REVRS-GAIN-LOSS-AMT-T[50]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gain/Loss amount in Reversal processing";
        Index = "1";
    }                              
#M271A8 CHANGES END HERE     
    IN MIR-UL-LAPS-STRT-DT
    {
            DisplayOnly;
            Length = "10";
            DBTableName = "TPOL";
            SType = "Date";
            Label = "Lapse Start Date";
    }    

#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE

#M271A8 CHANGES START HERE  

    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M271A8 CHANGES END HERE  
    
# R10762 Chnages starts here  

    IN MIR-EXPCT-LAPS-DT
    {
            DisplayOnly;
            Length = "10";
            DBTableName = "Derived";
            SType = "Date";
            Label = "Expected Lapse Date";
    }
    
# R10762 Changes ends here    
# M319I3 Changes starts here  

    IN MIR-XCHNG-RT-BASE-DT
    {
            DisplayOnly;
            Length = "10";
            DBTableName = "Derived";
            SType = "Date";
            Label = "Exchange Rate Base Date";
    }
    
# M319I3 Changes ends here 
#UY3063 CHANGES STARTS HERE     
    IN MIR-ADDL-FACE-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Variable Face amount";
        Index = "1";
    }        
    IN MIR-MO-END-CV-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Month End CV";
        Index = "1";
    }
    IN MIR-XFER-CV-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Transfer CV";
        Index = "1";
    }
    IN MIR-REFLCT-CV-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Reflex CV";
        Index = "1";
    }
    IN MIR-LOAN-FND-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Loan Fund";
        Index = "1";
    }
#UY3063 CHANGES END HERE     
#UY304A CHANGES STARTS HERE    
    IN MIR-RSK-PREM-AMT-T[50]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Risk Premium Amount";
        Index = "1";
    }
#UY304A CHANGES END HERE
}

