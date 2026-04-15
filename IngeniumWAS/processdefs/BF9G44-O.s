# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF9G44-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB15C   CTS      REINSURANCE CHANGES                                      *
#*  TL0906   CTS      DEFECT FIX FOR MORE BUTTON                               *
#*  TL1052   CTS      DEFECT FIX FOR TLB-1052                                  *
#*  NVCR01   CTS      CHANGES DONE AS PART OF ONTARIO REINSURANCE              *
#*******************************************************************************

S-STEP BF9G44-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-POL-ID
    {
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }
    IN MIR-CLI-ID 
    {
        Label = "Client Id";
        Length = "10";
        SType = "Text";
    }
       
    IN MIR-POL-CRCY-CD-T[13]
    {
        Length = "2";           
        SType = "Hidden";
        Label = "Currency";
    }

    IN MIR-POL-ID-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[13]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-REINS-CO-ID-T[13]
    {
        Length = "2";
        DisplayOnly;
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Reinsurance Company";
        Index = "1";
    }
    
    IN MIR-REINS-TRTY-NUM-T[13]
    {
        Length = "3";
        DisplayOnly;
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Treaty Number";
        Index = "1";
    }
    
    IN MIR-REINS-CED-PCT-T[13]
    {
        Length = "5"; 
        DisplayOnly;
        FieldGroup = "Table13";    
        CodeSource = "EDIT";    
        CodeType = "CDPCT";
        DBTableName = "TRINS";
        SType = "Text";    
        Label = "Ceding Percentage";    
        Index = "1";    
    }

    IN MIR-REINS-INIT-CED-AMT-T[13]
    {   
	CurrencyCode = "MIR-POL-CRCY-CD-T[]";
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Ceded Amount";
        Index = "1";
    }

    IN MIR-REINS-TYP-CD-T[13]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RETYP";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Type";
        Index = "1"; 
    }
    
    IN MIR-REINS-CVG-XIST-IND-T[13]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TRINS";
        SType = "Indicator";
        Label = "Rider Exists";
        Index = "1";
    }
   
    IN MIR-SMALL-TYP-CD-T[13]
    {
        Length = "3";
        DisplayOnly;
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "PRSML";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Small Type Code";
        Index = "1";    
    }
    IN MIR-POL-ISS-EFF-DT-T[13]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table13";
        DBTableName = "TRINS";
        SType = "Date";    
        Label = "Effective Date";    
        Index = "1";    
    }
#NVCR01 CHANGES START HERE
    IN MIR-CVG-WP-TYP-CD-T[13]
    {
        Length = "06";
        DisplayOnly;
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "WoP Type";
        Index = "1"; 
    }
#NVCR01 CHANGES END HERE
#  TL1052 CHANGES STARTS HERE
#  TL0906 CHANGES STARTS HERE 
#    INOUT MIR-MORE-EXISTS-FLAG
#    {
#        Length = "1";
#        SType = "Hidden";
#        Label = "Rec Count";
#    }
#  TL0906 CHANGES ENDS HERE 
#  TL1052 CHANGES ENDS HERE
}