# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9249-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   ASSOCIATE OTHER MASTER CLAIM     (HCL106D)                *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *                                                                             *
#*******************************************************************************

S-STEP BF9249-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-SELECT-CD-T";
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

    INOUT index
    {
        SType = "Hidden";
    }

    IN MIR-CLM-ID 
    {
       Key;
       DisplayOnly;
       Length = "8";
       DefaultSession = "MIR-CLM-ID";
       SType = "Text";
       Label = "Master Claim ID";
    }

    IN MIR-DV-INS-CLI-NM 
    {
       DisplayOnly;
       Length = "75";
       SType = "Text";
       Label = "Insured Name";
    }

    IN MIR-CLMA-CLM-STAT-CD 
    {
       DisplayOnly;
       Length = "04";
       CodeSource = "DataModel";
       CodeType = "CLMA-CLM-STAT-CD";
       SType = "Text";
       Label = "Master Claim Status";
    }

    IN MIR-CLMA-INSRD-CLI-ID 
    {
       DisplayOnly;
       Length = "10";
       SType = "Text";
       Label = "Insured Client ID";
    }

    IN MIR-CLI-BTH-DT 
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Date of Birth";
    }

    IN MIR-CLI-SEX-CD 
    {
       DisplayOnly;
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "CLI-SEX-CD";
       SType = "Text";
       Label = "Sex";
    }

    IN MIR-INS-MORAL-RISK-IND 
    {
       DisplayOnly;
       Length = "1";
       SType = "Indicator";
       Label = "Insured Moral Risk";
    }

    IN MIR-CLAIM-NOTE-IND 
    {
       DisplayOnly;
       Length = "1";
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
       DisplayOnly;
       Length = "8";
       SType = "Text";
       Label = "Associated Master Claim";
    }

    IN MIR-DIS-MAJ-CD-T[5] 
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table1";
       SType = "Text";
       Label = "Major Disease Code";
       Index = "1";
    }

    IN MIR-DIS-MAJ-DESC-T[5] 
    {
       DisplayOnly;
       Length = "60";
       FieldGroup = "Table1";
       SType = "Text";
       Label = "Minor Disease Code Description";
       Index = "1";
    }
    
    IN MIR-DIS-MINR-DESC-T[5] 
    {
       DisplayOnly;
       Length = "60";
       FieldGroup = "Table1";
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
       DisplayOnly;
       Length = "8";             
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Master Claim ID";
       Index = "1";
    }

    IN  MIR-CLMA-CLM-STAT-CD-T[50]
    {
       DisplayOnly;
       Length = "4";
       CodeSource = "DataModel";
       CodeType = "CLMA-CLM-STAT-CD";
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Master Claim Status";
       Index = "1";
    }

    IN  MIR-CLMA-ASSOC-CLM-ID-T[50]
    {
       DisplayOnly;
       Length = "8";             
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Associated Master Claim ID";
       Index = "1";
    }
    
    IN  MIR-CLMA-INCID-TYP-CD-T[50]
    {
       DisplayOnly;
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "INCID-TYP-CD";
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Incident Type";
       Index = "1";
    }
    
    IN  MIR-CLMA-INCID-DT-T[50]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table2";
       SType = "Date";
       Label = "Incident Date";
       Index = "1";
    }

    IN  MIR-OTHR-DIS-MAJ-CD-T[50]
    {
       DisplayOnly;
       Length = "10";             
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Major Disease Code";
       Index = "1";
    }

    IN  MIR-OTHR-DIS-MAJ-DESC-T[50]
    {
       DisplayOnly;
       Length = "60";           
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Major Disease Code Description";
       Index = "1";
    }
    IN  MIR-OTHR-DIS-MINR-DESC-T[50]
    {
       DisplayOnly;
       Length = "60";           
       FieldGroup = "Table2";
       SType = "Text";
       Label = "Minor Disease Code Description";
       Index = "1";
    }

}

