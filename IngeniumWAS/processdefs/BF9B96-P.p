#*******************************************************************************
#*  Component:   BF9B96-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP166A  CTS      APL INTEREST CAPITALIZATION                               *
#*  M319B5  CTS      Changes done for FXWL APL Loan Processing                 *
#*  RPCR11  CTS      Changes done for CR11 RPU Processing                      *
#*******************************************************************************

P-STEP BF9B96-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B96";
        BusinessFunctionName = "APL - Interest Capitalization";
        BusinessFunctionType = "Aplint";
        MirName = "CCWM9B96";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
#RPCR11 CHANGES STARTS HERE
#    INOUT MIR-APPL-CTL-PRCES-DT
     OUT MIR-APPL-CTL-PRCES-DT
    {
#        Mandatory;
#RPCR11 CHANGES ENDS HERE
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
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

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }    

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    OUT MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    OUT MIR-APL-INT-AMT
    {
        Length = "15";
        DBTableName = "TLHST";        
        SType = "Currency";
        Label = "APL Interest Capitalization amount";
    }

    OUT MIR-APL-AMT-AFTR
    {
        Length = "15";
        DBTableName = "TLHST";         
        SType = "Currency";
        Label = "APL Balance After Interest Capitalization";
    }

    OUT MIR-APL-AMT-BEFORE
    {
        Length = "15";
        DBTableName = "TLHST";         
        SType = "Currency";
        Label = "APL Balance Before Interest Capitalization";
    }
#M319B5 CHANGES STARTS HERE    
    OUT MIR-POL-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }     
#M319B5 CHANGES ENDS HERE    
}

