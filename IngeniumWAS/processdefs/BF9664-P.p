# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9664-P.p                                                    *
#*  Description: Benefit Support Table (BENS) List step                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*  RP211d  RP2      ADDED SUBTABLE 4 CODE                                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9664-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9664";
        BusinessFunctionName = "Benefit Support Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9664";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Plan Name";
    }

    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Benefit Name";
    }
    
    INOUT MIR-STBL-2-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-STBL-4-CD
    {
        Key;
        Mandatory;
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 4";
    }
    
    OUT MIR-PLAN-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table1";        
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Plan Name";
        Index = "1";        
    } 

    OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table1";        
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";        
    }
    
    OUT MIR-STBL-2-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table1";               
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";          
    }    
     
    OUT MIR-STBL-4-CD-T[50]
    {
        Length = "02";
        FieldGroup = "Table1";               
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";          
    }    
 
    OUT MIR-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";               
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Effective Date";
        Index = "1";          
    }    
    
    OUT MIR-INIT-DEDBL-UNITS-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "BNFT-AMT-CALC-CD";
        Index = "1";
    }

  
    OUT MIR-MIN-HOSP-UNITS-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Minimum Hospitalisation Units";
        Index = "1";
    }

    OUT MIR-MAX-CLM-UNITS-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Maximum Claim Units";
        Index = "1";
    }

    OUT MIR-MAX-RIDER-UNITS-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = " Maximum Rider Units";
        Index = "1";
    }

}
