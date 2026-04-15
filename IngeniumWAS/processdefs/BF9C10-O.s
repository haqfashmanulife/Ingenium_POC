# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9C10-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*          Initial Version                                                                   *
#*******************************************************************************

S-STEP BF9C10-O
{
    ATTRIBUTES
    {
	BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

   
    IN MIR-PLAN-ID
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
    
    IN MIR-DV-INSRD-CLI-NM
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
    
    IN MIR-CVG-PRIM-GR-ID
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
            SType = "Text";
            DBTableName = "TCVG";
            Label = "Coverage Number";
            Index = "1";
    }
    
    
    IN  MIR-BNFT-NM-ID-T[5]
    {
            DisplayOnly;
            Length = "40";
            CodeSource = "EDIT";
            CodeType = "BENNM";
            SType = "Text";
            DBTableName = "TBENS";
            Label = "Benefit";
            FieldGroup = "Table5";            
            Index = "1";

    }
    
    IN  MIR-BNFT-AMT-T[5]
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