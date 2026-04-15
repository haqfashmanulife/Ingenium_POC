# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9800-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Who      Description                                               *
#*                                                                             *
#*  02NB64  WBP      Initial version                                           *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M319O1  CTS      FXWL CURRENCY CODE CHANGES                                *                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9800-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "nextButton";
        FocusFrame = "ButtonFrame";
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

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }
 
    IN MIR-CVG-NUM-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[10]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[10]
    {
#M319O1 CHANGES START HERE CHANGING CURRENCY CODE       
        CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES END HERE
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[10]
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }
#* M213K1 Changes begin

    IN MIR-PRIM-1-CVG-NUM-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Base Rider Coverage Number 1";
        Index = "1";
    }
    
    IN MIR-PRIM-2-CVG-NUM-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Base Rider Coverage Number 2";
        Index = "1";
    }
    
    IN MIR-CVG-PRIM-GR-ID-T[10] 
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }

#* M213K1 Changes end    

    IN MIR-NEW-CVG-NUM-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-NEW-PLAN-ID-T[25]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-NEW-INSRD-CLI-ID-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-NEW-DV-INSRD-CLI-NM-T[25]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }

    IN MIR-NEW-CVG-ISS-EFF-DT-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-NEW-CVG-FACE-AMT-T[25]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-NEW-CVG-CSTAT-CD-T[25]
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        Length = "3";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }

    IN MIR-NEW-CVG-SETL-IND-T[25]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Future Settle Ind";
        Index = "1";
    }
#* M213K1 Changes begin

    IN MIR-NEW-PRIM-1-CVG-NUM-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Base Rider Coverage Number 1";
        Index = "1";
    }
    
    IN MIR-NEW-PRIM-2-CVG-NUM-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Base Rider Coverage Number 2";
        Index = "1";
    }
    
    IN MIR-NEW-CVG-PRIM-GR-ID-T[25] 
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }

#* M213K1 Changes end
#M319O1 CHANGES START HERE
     INOUT MIR-POL-CRCY-CD
     {
         
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
#M319O1 CHANGES END HERE
}       
