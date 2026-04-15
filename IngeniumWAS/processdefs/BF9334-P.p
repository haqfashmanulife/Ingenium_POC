# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9334-P.p                                                    *
#*  Description: Manager Approval                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL109  HIN/CL   CLAIM PAYMENT                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9334-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9334";
        BusinessFunctionName = "Manager Approval";
        BusinessFunctionType = "List";
        MirName = "CCWM9334";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PREV-UPDT-USER-ID
    {
        Key;
        Length = "08";
        SType = "Text";
        Label = "Previous Update User ID";
    }
    
    INOUT MIR-STATUS-CD
    {
        Key;
        Length = "1";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-APROV-CD";        
        Label = "Status";
    }
    
    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        SType = "Text";
        DefaultSession = "MIR-CLM-ID";	        
        Label = "Claim ID";
    }
    
    INOUT MIR-PRIOR-PREV-UPDT-USER-ID
    {
        SType = "Hidden";
    }     
    
    INOUT MIR-PRIOR-STATUS-CD
    {
        SType = "Hidden";
    }     

    INOUT MIR-PRIOR-CLM-ID
    {
        SType = "Hidden";
    }     

    INOUT MIR-MORE-CLM-ID
    {
        SType = "Hidden";
    }     

    OUT MIR-CLM-ID-T[20]
    {
        KeyColumn;
        FieldGroup = "Table1";
        Length = "8";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }        
    
    OUT MIR-DV-INS-CLI-NM-T[20]
    {
        FieldGroup = "Table1";
        Length = "75";
        SType = "Text";
        Label = "Insured Full Name";
        Index = "1";
    } 
    
    OUT MIR-BNFT-PMT-AMT-T[20]
    {
        FieldGroup = "Table1";
        Length = "15";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }     
    
    OUT MIR-REMIT-AMT-T[20]
    {
        FieldGroup = "Table1";
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
    }     

    OUT MIR-PREV-UPDT-DT-T[20]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-USER-ID-T[20]
    {
        FieldGroup = "Table1";
        Length = "8";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
    }     

    OUT MIR-CLMA-CLM-STAT-CD-T[20]
    {
        FieldGroup = "Table1";
        Length = "01";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";        
        Label = "Master Claim Status";
        Index = "1";
    }

    OUT MIR-CLMA-HO-ACPT-DT-T[20]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
        Index = "1";
    }    
}
