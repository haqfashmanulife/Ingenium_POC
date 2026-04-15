# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9800-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Who      Description                                               *
#*                                                                             *
#*  02NB64  WBP      Initial version                                           *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M319O1  CTS      FXWL FOREGIN CURRENCY FORMATTING                          *
#*                                                                             *
#*******************************************************************************

P-STEP BF9800-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9800";
        BusinessFunctionName = "Admin Coverage Create";
        BusinessFunctionType = "List";
        MirName = "CCWM9800";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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
 
    INOUT MIR-CVG-NUM-START
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
 
    INOUT MIR-CVG-NUM-END
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
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

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-POL-PLAN-ID  
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
    }
 
    OUT MIR-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }
#* M213K1 Changes begin

    OUT MIR-PRIM-1-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 1";
        Index = "1";
    }
    
    OUT MIR-PRIM-2-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 2";
        Index = "1";
    }

    OUT MIR-CVG-PRIM-GR-ID-T[10]
     {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Group ID";
        Index = "1";
     }

#* M213K1 Changes end

    OUT MIR-INSRD-CLI-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[10]
    {
        Length = "75";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[10]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }

    OUT MIR-NEW-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-NEW-PLAN-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }
#* M213K1 Changes begin
    
    OUT MIR-NEW-PRIM-1-CVG-NUM-T[25]    
    {
        Length = "2";   
        FieldGroup = "Table25";   
        DBTableName = "TCVG";   
        SType = "Text";   
        Label ="Base Rider Coverage Number 1"; 
        Index = "1";
    }   
       
    OUT MIR-NEW-PRIM-2-CVG-NUM-T[25]   
    {   
        Length = "2";   
        FieldGroup = "Table25";   
        DBTableName = "TCVG";   
        SType = "Text";   
        Label ="Base Rider Coverage Number 2";  
        Index = "1";
    }   
   
    OUT MIR-NEW-CVG-PRIM-GR-ID-T[25]   
     {   
        Length = "2";   
        FieldGroup = "Table25";   
        DBTableName = "TCVG";   
        SType = "Text";   
        Label ="Group ID";   
        Index = "1";
     }   
   
#* M213K1 Changes end   
   
    OUT MIR-NEW-INSRD-CLI-ID-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-NEW-DV-INSRD-CLI-NM-T[25]
    {
        Length = "75";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }

    OUT MIR-NEW-CVG-ISS-EFF-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-NEW-CVG-FACE-AMT-T[25]
    {
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-NEW-CVG-CSTAT-CD-T[25]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }

    OUT MIR-NEW-CVG-SETL-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Future Settle Ind";
        Index = "1";
    }
#M319O1 CHANGES START HERE
     INOUT MIR-POL-CRCY-CD
     {
         
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
#M319O1 CHANGES END HERE
}

