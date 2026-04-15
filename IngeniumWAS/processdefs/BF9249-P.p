# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9249-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   ASSOCIATE OTHER MASTER CLAIM                              *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *                                                                             *
#*******************************************************************************

P-STEP BF9249-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9249";
        BusinessFunctionName = "Associate Other Claim Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9249";
    }

    OUT  LSIR-RETURN-CD;

    OUT  MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    IN  MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    IN  MIR-CLMA-CLM-STAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    IN  MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    IN  MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
    }
    IN  MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    IN  MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    IN  MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    IN MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
    #UYSDMC CHANGES STARTS HERE
    IN MIR-CLMA-USYS-CLM-IND
    {    
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
    #UYSDMC CHANGES ENDS HERE
    IN MIR-CLMA-ASSOC-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    IN  MIR-DIS-MAJ-CD-T[5]
    {
        Length = "10";                  
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
    }
    IN  MIR-DIS-MAJ-DESC-T[5]
    {
        Length = "60";                
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
    IN  MIR-DIS-MINR-DESC-T[5]
    {
        Length = "60";                
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }

    INOUT MIR-SELECT-CD-T[50]
    {
        Length = "1";                  
        FieldGroup = "Table2";
        SType = "Indicator";
        Label = " ";
        Index = "1";
        }

    IN MIR-CLM-ID-T[50]
    {
        Length = "8";                  
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }

    IN  MIR-CLMA-CLM-STAT-CD-T[50]
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

    IN  MIR-CLMA-ASSOC-CLM-ID-T[50]
    {
        Length = "8";                  
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim ID";
        Index = "1";
    }
    
    IN  MIR-CLMA-INCID-TYP-CD-T[50]
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
    
    IN  MIR-CLMA-INCID-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Incident Date";
        Index = "1";
    }

    IN  MIR-OTHR-DIS-MAJ-CD-T[50]
    {
        Length = "10";                  
        FieldGroup = "Table2";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
    }
    IN  MIR-OTHR-DIS-MAJ-DESC-T[50]
    {
        Length = "60";                
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
    IN  MIR-OTHR-DIS-MINR-DESC-T[50]
    {
        Length = "60";                
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }

}
