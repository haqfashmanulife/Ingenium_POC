# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF9C10-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9C10-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C10";
        BusinessFunctionName = "Benefit  List";
        BusinessFunctionType = "List";
        MirName = "CCWM9C10";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    OUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Plan Name";
    }
    
    OUT MIR-DV-INSRD-CLI-NM
    {
            DisplayOnly;
            Length = "75";
            SType = "Text";
            Label = "Insured Name";
            Index = "1";
    }
    
    INOUT MIR-POL-ID-BASE
    {
            DisplayOnly;
            Length = "9";
            DefaultSession = "MIR-POL-ID-BASE";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy ID";
    }
    
    IN MIR-POL-CSTAT-CD
    {
            DisplayOnly;
            Length = "40";
            CodeSource = "DataModel";
            CodeType = "POL-CSTAT-CD";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy Status";
    }
    
    OUT MIR-CVG-PRIM-GR-ID
    {
            DisplayOnly;
            Length = "2";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Group ID";
            Index = "1";
    }
    
    INOUT MIR-POL-ID-SFX
    {
            DisplayOnly;
            Length = "1";
            DefaultSession = "MIR-POL-ID-SFX";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Suffix";
    }
    
    IN MIR-CVG-NUM
    {
            DisplayOnly;
            Length = "2";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Coverage Number";
    }
    
    OUT MIR-BNFT-NM-ID-T[5]
    {
            DisplayOnly;
            Length = "40";
            CodeSource = "EDIT";
            CodeType = "BENNM";
            DBTableName = "TBENS";
            SType = "Text";
            Label = "Benefit";
            FieldGroup = "Table5";            
            Index = "1";
            
    }
    
        
    OUT MIR-BNFT-AMT-T[5]
    {
            DisplayOnly;
            Label = "Benefit Amount";
            FieldGroup = "Table5";            
            Index = "1";    
            Signed;
            Length = "16";
            DBTableName = "TCVG";
            SType = "Currency";            
    }     
        
    
}