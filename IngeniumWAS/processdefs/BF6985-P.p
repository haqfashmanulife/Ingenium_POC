# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6985-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR10  EKM      SURRENDER VALUES - ADD SHORTAGE AMOUNT                    *
#*  1CPR03  EKM      CONVERSION PROCESSING - SURRENDER VALUES                  *
#*  MP5002  CTS      ADD FLEX-FUND-SURR-CHARGE-TYP                             *
#*  FEGL05  CTS      ADD LAPSE START DATE AND PREMIUM NECESSARY TO EXTEND GRACE*
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271PV  CTS      FRA Policy Value Management Changes                       *
#*  M271A8  CTS      Online Screen Changes done as part of FRA                 *
#*  R10762  CTS      UL CHANGES- ADD NEW FIELD EXPECTED LAPSE DT               *
#*  M319I3  CTS      CHANGES FOR FXWL EXCHANGE RATE BASE DATE                  *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UY3063  CTS      STREAM 3 VARIABLE LIFE BENEFIT CHANGES                    *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*******************************************************************************

P-STEP BF6985-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6985";
        BusinessFunctionName = "Policy Inquiry - Fund Values";
        BusinessFunctionType = "Valufnd";
        MirName = "CCWM6985";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPOL";
        DefaultSession = "MIR-CO-ID";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ACUM-INT-LTD-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    OUT MIR-CF-CLI-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    OUT MIR-CF-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    OUT MIR-DV-FND-BAL-EX-ESC-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Fund Balance Excluding Esc Amount";
        Index = "1";
    }

    OUT MIR-CF-FND-BAL-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    OUT MIR-CF-FND-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    OUT MIR-CF-INT-PCT-T[50]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    OUT MIR-CF-MCV-FND-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
        Index = "1";
    }

    OUT MIR-CF-MCV-INT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
        Index = "1";
    }

    OUT MIR-CF-MCV-INT-LTD-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
        Index = "1";
    }

    OUT MIR-CF-MCV-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Net Amount";
        Index = "1";
    }

    OUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    OUT MIR-CF-REASN-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    OUT MIR-CF-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TCLFW";
        SType = "Text";
        Label = "Cash Flow Seq Number";
        Index = "1";
    }

    OUT MIR-CF-STAT-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }

    OUT MIR-CF-TRXN-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    OUT MIR-CF-UNIT-QTY-T[50]
    {
        Length = "13";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
        Index = "1";
    }

#M271PV CHANGES START HERE  
    OUT MIR-CF-XCHNG-RT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        Index = "1";
        DisplayOnly;
        Label = "Exchange Rate";
        Decimals = "2";      		     
        SType = "Number";  
    }

    OUT MIR-CF-FEE-RT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        Index = "1";
        DisplayOnly;
        Label = "Fee Rate";
        Decimals = "2";      		     
        SType = "Number";        
    }

    OUT MIR-INT-ACUM-PREM-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accmulated Gross Premum Amount";
        Index = "1";
    }
#M271PV CHANGES ENDS HERE  

    OUT MIR-CVG-CF-TYP-CD
    {
        Length = "1";
        DBTableName = "TCFLW";
        SType = "Hidden";
        Label = "Coverage Cash Flow Type Code";
    }

    OUT MIR-CVG-WTHDR-ORDR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    OUT MIR-DV-CVG-UNIT-QTY
    {
        Signed;
        Length = "11";
        Decimals = "5";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Total Units";
    }

    OUT MIR-DV-MCV-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    OUT MIR-DV-MTHV-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-BASE-CV-EX-ESC-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
    }

    OUT MIR-DV-POL-BASE-CV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    OUT MIR-DV-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    OUT MIR-DV-UVAL-RT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Currency";
        Label = "Current Unit Value";
    }

    OUT MIR-DV-UVAL-RT-T[50]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table50";
        DBTableName = "TIR";
        SType = "Currency";
        Label = "Current Unit Value";
        Index = "1";
    }

    OUT MIR-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Total Policy Loan";
    }

    OUT MIR-MCV-ACUM-INT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
        Index = "1";
    }

    OUT MIR-MCV-GUAR-INT-PCT-T[50]
    {
        Signed;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
        Index = "1";
    }

    OUT MIR-NXT-CF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Next Cash Flow - Date";
        Index = "1";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    #TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
     {
     
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
     
     }    
#TDMG24 CHANGES END HERE    

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-ROLOVR-CF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "GIA - Rollover Date";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Co";
    }
# MP5002 
    
    OUT MIR-SURR-CHRG-TYP-CD
    {
            Length = "1";
            CodeSource = "EDIT";
            CodeType = "MVAL";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "FlexFund Surrender Charge Type";
    }    
    
# FEGL05
   
    OUT MIR-GRACE-EXT-PREM-AMT
    {
           Signed;
           Length = "17";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Premium necessary to extend grace";
    }
#M271A8 CHANGES START HERE  

    OUT MIR-DTH-CVG-AMT
    {
         DisplayOnly;
         Signed;
         Length = "17";
         DBTableName = "TCFLW";
         SType = "Currency";
         Label = "Death Coverage Amount";  
    }
    
    OUT MIR-DV-JP-DTH-CVG-AMT 
     {  
        DisplayOnly;  
        Signed;  
        Length = "17";  
        SType = "Currency";  
        Label = "Death Coverage Amount in JPY"; 
     }  
     
   
   OUT MIR-DV-XCHNG-RT
    {
        Length = "18";
        DisplayOnly;
        Label = "Conversion Rate";
        Decimals = "2";      		     
        SType = "Number";  
    } 
    
    OUT MIR-FWD-GAIN-LOSS-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gain/Loss amount in Forward processing";
        Index = "1";
        } 
        
    OUT MIR-REVRS-GAIN-LOSS-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gain/Loss amount in Reversal processing";
        Index = "1";
    }
  
#M271A8 CHANGES END HERE     
    OUT MIR-UL-LAPS-STRT-DT
    {
            Length = "10";
            DBTableName = "TPOL";
            SType = "Date";
            Label = "Lapse Start Date";
    }
    
# R10762 Chnages starts here 

    OUT MIR-EXPCT-LAPS-DT
    {
            Length = "10";
            DBTableName = "Derived";
            SType = "Date";
            Label = "Expected Lapse Date";
    }    

# R10762 Changes ends here 
# M319I3 Chnages starts here 

    OUT MIR-XCHNG-RT-BASE-DT
    {
            Length = "10";
            DBTableName = "Derived";
            SType = "Date";
            Label = "Exchange Rate Base Date";
    }    

# M319I3 Changes ends here 
#M245B2 CHANGES START HERE  
    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE       
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#UY3063 CHANGES STARTS HERE     
    OUT MIR-ADDL-FACE-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Variable Face amount";
        Index = "1";
    }        
    OUT MIR-MO-END-CV-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Month End CV";
        Index = "1";
    }
    OUT MIR-XFER-CV-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Transfer CV";
        Index = "1";
    }
    OUT MIR-REFLCT-CV-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Reflex CV";
        Index = "1";
    }
    OUT MIR-LOAN-FND-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Loan Fund";
        Index = "1";
    }
#UY3063 CHANGES END HERE     
#UY304A CHANGES STARTS HERE    
    OUT MIR-RSK-PREM-AMT-T[50]
    {
        Length = "18";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Risk Premium Amount";
        Index = "1";
    }
#UY304A CHANGES END HERE
}

