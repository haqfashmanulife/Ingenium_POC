# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9339-P.p                                                    *
#*  Description: Approval Reversal List                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL109  HIN/CL   CLAIM PAYMENT                                              *
#* CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

P-STEP BF9339-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9339";
        BusinessFunctionName = "Approval Reversal";
        BusinessFunctionType = "List";
        MirName = "CCWM9339";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        SType = "Text";
        DefaultSession = "MIR-CLM-ID";	        
        Label = "Claim ID";
    }
    
    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Insured Full Name";
        Index = "1";
    } 
    
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "01";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";        
        Label = "Master Claim Status";
    }
    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Previous Update Date";
    }

    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Previous Update User ID";
    }     

    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim:";
    }
#UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim:";
    }
#UYSDMC CHANGES ENDS HERE
    OUT MIR-APROV-SEQ-NUM-T[10]
    {
        FieldGroup = "Table1";
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }     
    
    OUT MIR-BNFT-PMT-AMT-T[10]
    {
        FieldGroup = "Table1";
        Length = "15";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }     
    
    OUT MIR-REMIT-AMT-T[10]
    {
        FieldGroup = "Table1";
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
    }     

    INOUT MIR-CLM-CTR
    {
        Length = "2";
        SType = "Hidden";
        Label = "Claim Counter";
    }     


}
