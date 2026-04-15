# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9248-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   ASSOCIATE OTHER MASTER CLAIM                              *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *                                                                             *
#*******************************************************************************

P-STEP BF9248-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9248";
        BusinessFunctionName = "Associate Other Claim Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9248";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    OUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
    }
    OUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    OUT MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    OUT MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
    #UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {    
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
    #UYSDMC CHANGES ENDS HERE

    OUT MIR-CLMA-ASSOC-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    
    INOUT MIR-START-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Start Master Claim ID";
    }
    
    OUT MIR-DIS-MAJ-CD-T[5]
    {
        Length = "10";                  
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
    }
    OUT MIR-DIS-MAJ-DESC-T[5]
    {
        Length = "60";                
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
    OUT MIR-DIS-MINR-DESC-T[5]
    {
        Length = "60";                
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }

    OUT MIR-SELECT-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table2";
        SType = "Indicator";
        Label = " ";
        Index = "1";
        }

    OUT MIR-CLM-ID-T[50]
    {
        Length = "8";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }

    OUT MIR-CLMA-CLM-STAT-CD-T[50]
    {
        Length = "4";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
        Index = "1";
    }

    OUT MIR-CLMA-ASSOC-CLM-ID-T[50]
    {
        Length = "8";                  
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim ID";
        Index = "1";
    }
    
    OUT MIR-CLMA-INCID-TYP-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "INCID-TYP-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Incident Type";
        Index = "1";
    }
    
    OUT MIR-CLMA-INCID-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Incident Date";
        Index = "1";
    }

    OUT MIR-OTHR-DIS-MAJ-CD-T[50]
    {
        Length = "10";                  
        FieldGroup = "Table2";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
    }
    OUT MIR-OTHR-DIS-MAJ-DESC-T[50]
    {
        Length = "60";                
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
    OUT MIR-OTHR-DIS-MINR-DESC-T[50]
    {
        Length = "60";                
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }

}
