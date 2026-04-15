#*******************************************************************************
#*  Component:   BF9C24-P.p                                                    *
#*  Description: TD Reinstatement Information (REIN) List step                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*******************************************************************************

P-STEP BF9C24-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C24";
        BusinessFunctionName = "TD Reinstatement Information List";
        BusinessFunctionType = "List";
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
        SType = "Date";
        DefaultSession = "MIR-PRCES-DT";
        Label = "Processing Date";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Client Number";
        Index = "1";
    }   
    
    OUT MIR-OVRDU-PREM-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Premium";
        Index = "1";
    }   
    
    OUT MIR-DV-INSRD-NM-T[20]
    {
        Length = "50";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }   
    
    OUT MIR-OVRDU-INT-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Delinquent Interest";
        Index = "1";
    }   
    
    OUT MIR-SELF-DSCLSRE-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Self Disclosure Date";
        Index = "1";
    }   
    
    OUT MIR-TOT-REQIR-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Currency";
        Label = "Total Amount to be paid";
        Index = "1";
    }   
    
    OUT MIR-APCHD-LOC-CD-T[20]
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "APLOC";        
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Approached Location";
        Index = "1";
    }   
    
    OUT MIR-PREM-DUE-MO-NUM-T[20]
    {
        Length = "7";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Premium Due Month";
        Index = "1";
    }   
    
    OUT MIR-UWG-RSLT-CD-T[20]
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWRES";        
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Underwriting Result";
        Index = "1";
    }   
        
    OUT MIR-PREM-DUE-QTY-T[20]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Number";
        Label = "Number of Premiums Due";
        Index = "1";
    }   
        
    OUT MIR-EXCL-INFO-TXT-T[20]
    {
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Exclusion Information";
        Index = "1";
    }   
       
# NWLLR3 CHANGES STARTS HERE       
#    OUT MIR-DV-EXP-DT-T[20]
    OUT MIR-REINST-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Expiry Date";
        Index = "1";
    } 
# NWLLR3 CHANGES ENDS HERE    
        
    OUT MIR-UWG-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Underwriting Date";
        Index = "1";
    }   
                
    OUT MIR-PRCES-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Processing Date";
        Index = "1";
    }

    OUT MIR-REINST-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Reinstatement Date";
        Index = "1";
    }

    OUT MIR-INFO-STAT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ISTAT";
        DBTableName = "TREIN";
        SType = "Text";
        Label = "Information Status";
        Index = "1";
    }
# C13892 CHANGES STARTS HERE     
    OUT MIR-LAPS-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Lapse Date";
        Index = "1";
    }
# C13892 CHANGES ENDS HERE


}

