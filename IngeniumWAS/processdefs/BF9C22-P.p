#*******************************************************************************
#*  Component:   BF9C22-P.p                                                    *
#*  Description: TD Reinstatement Information Table (REIN) Update step         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*******************************************************************************

P-STEP BF9C22-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C22";
        BusinessFunctionName = "TD Reinstatement Information Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9C20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PRCES-DT
    {
        
        Key;
        Length = "10";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Processing Date";
    }
    
    INOUT MIR-INFO-STAT-CD
    { 
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ISTAT";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Information status";
    }
    
    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";                 
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Client Number";
    }
    
    INOUT MIR-DV-INSRD-NM
    {
        Key;
        Length = "50";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Name";
    }
 
    INOUT MIR-SELF-DSCLSRE-DT
    {
         Length = "10";
         DBTableName = "TREIN";
         SType = "Date";
         Label = "Self Disclosure Date";
    }
    
   INOUT MIR-APCHD-LOC-CD
   { 
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "APLOC";
        DBTableName = "TREIN";
        SType = "Selection";
        Label = "Approached Loaction";
    }
    
    INOUT MIR-UWG-RSLT-CD
    { 
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWRES";
        DBTableName = "TREIN";
        SType = "Selection";
        Label = "Underwriting Result";
    }
    
    INOUT MIR-EXCL-INFO-TXT
    {
        Length = "30";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Exclusion Information";
    }
    
    INOUT MIR-UWG-DT
    {
        Length = "10";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Underwriting Date";
    }
    INOUT MIR-OVRDU-PREM-AMT
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Premium";
    }

    INOUT MIR-OVRDU-INT-AMT
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Interest";
    }
    
    INOUT MIR-TOT-REQIR-AMT 
    {
        Length = "15";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Total Amount to be paid";
    }
    
    INOUT MIR-PREM-DUE-MO-NUM 
    {
        Length = "07";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Premium Due Month";
    }
    
    INOUT MIR-PREM-DUE-QTY
    {
        Length = "03";
        DBTableName = "TREIN";
        SType = "Number";
        Label = "Number of Times";
    }
    
# NWLLR3 CHANGES STARTS HERE	       
#    INOUT MIR-DV-EXP-DT
    INOUT MIR-REINST-XPRY-DT
    {
        Length = "10";             
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Expiry Date";
    }
# NWLLR3 CHANGES ENDS HERE	       
    
    INOUT MIR-REINST-DT
    { 
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Reinstatement Date";
    } 
    
# C13892 CHANGES STARTS HERE	       
    INOUT MIR-LAPS-DT
    {
        Length = "10";             
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Lapse Date";
    }
# C13892 CHANGES ENDS HERE
           
  }
