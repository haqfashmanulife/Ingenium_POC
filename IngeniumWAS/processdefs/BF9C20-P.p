#*******************************************************************************
#*  Component:   BF9C20-P.p                                                    *
#*  Description: TD Reinstatemenent Information (REIN) Retrieve step           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*******************************************************************************

P-STEP BF9C20-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C20";
        BusinessFunctionName = "TD Reinstatement Information Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TREIN";
        DefaultSession = "MIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }
    
  
    OUT MIR-INFO-STAT-CD
    { 
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ISTAT";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Information status";
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
    
    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";                 
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Client Number";
    }
    
    OUT MIR-DV-INSRD-NM
    {
        Length = "50";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Name";
    }
 
    OUT MIR-SELF-DSCLSRE-DT
    {
         Length = "10";
         DBTableName = "TREIN";
         SType = "Date";
         Label = "Self Disclosure Date";
    }
    
    OUT MIR-APCHD-LOC-CD
    { 
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "APLOC";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Approached Loaction";
    }
    
    OUT MIR-UWG-RSLT-CD
    { 
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWRES";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Underwriting Result";
    }
    
    OUT MIR-EXCL-INFO-TXT
    {
        Length = "30";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Exclusion Information";
    }
    
    OUT MIR-UWG-DT
    {
        Length = "10";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Underwriting Date";
    }
    OUT MIR-OVRDU-PREM-AMT
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Premium";
    }

    OUT MIR-OVRDU-INT-AMT
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Interest";
    }
    
    OUT MIR-TOT-REQIR-AMT
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Total Amount to be paid";
    }
    
    OUT MIR-PREM-DUE-MO-NUM
    {
        Length = "07";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Premium Due Month";
    }
    
    OUT MIR-PREM-DUE-QTY
    {
        Length = "03";
        DBTableName = "TREIN";
        SType = "Number";
        Label = "Number of Times";
    }
    
# NWLLR3 CHANGES STARTS HERE	       
#    OUT MIR-DV-EXP-DT
    OUT MIR-REINST-XPRY-DT
    {
        Length = "10";             
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Expiry Date";
    }
# NWLLR3 CHANGES ENDS HERE	       
    
    OUT MIR-REINST-DT
    { 
        Length = "10";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Reinstatement Date";
    } 
# C13892 CHANGES STARTS HERE	       
    OUT MIR-LAPS-DT
    {
        Length = "10";             
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Lapse Date";
    }
# C13892 CHANGES ENDS HERE
           
  }
