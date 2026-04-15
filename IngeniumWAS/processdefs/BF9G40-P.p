# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF9G40-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB15C   CTS      REINSURANCE CHANGES                                      *
#*  CD200R   CTS      CHANGES DONE AS PART OF ONTARIO REINSURANCE              *
#*******************************************************************************

P-STEP BF9G40-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G40";
        BusinessFunctionName = "Reinsurance Retrieve Screen";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9G40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Client Id";
    }

    INOUT MIR-RECORD-CTR1
    {
        Length = "1";
        SType = "Hidden";
        Label = "Rec Count";
    }
    
    INOUT MIR-POL-CRCY-CD-T[13]
    {
        Length = "2";           
        SType = "Hidden";
        Label = "Currency";
    }

    OUT MIR-POL-ID-T[13]
    {
        Key;
        Length = "10";
        FieldGroup = "Table13";
        KeyColumn;
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[13]
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

    OUT MIR-REINS-CO-ID-T[13]
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
    
    OUT MIR-REINS-TRTY-NUM-T[13]
    {
        Length = "5";
        DisplayOnly;
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TRINS";
        SType = "Text";
        Label = "Treaty Number";
        Index = "1";
    }
    
    OUT MIR-REINS-CED-PCT-T[13]
    {
        Length = "3";
        DisplayOnly;
        FieldGroup = "Table13";    
        CodeSource = "EDIT";    
        CodeType = "CDPCT";
        DBTableName = "TRINS";
        SType = "Text";    
        Label = "Ceding Percentage";    
        Index = "1";    
    }

    OUT MIR-REINS-INIT-CED-AMT-T[13]
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

    OUT MIR-REINS-TYP-CD-T[13]
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
    
    OUT MIR-SMALL-TYP-CD-T[13]
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
    OUT MIR-POL-ISS-EFF-DT-T[13]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table13";
        DBTableName = "TRINS";
        SType = "Date";    
        Label = "Effective Date";    
        Index = "1";    
    }
    OUT MIR-PLAN-CD-T[13]
    {
        Length = "6";
        DisplayOnly;
        FieldGroup = "Table13";
        DBTableName = "TRINS";
        SType = "Text";    
        Label = "Plan ID";    
        Index = "1";    
    }
#CD200R CHANGES START HERE
    OUT MIR-HIST-RETN-AMT-T[13]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        Decimals = "2";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "SPWL History In-force Amount";
        Index = "1"; 
    }
    OUT MIR-HIST-RETN-TERM-AMT-T[13]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        Decimals = "2";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "General History In-force Amount";
        Index = "1"; 
    }
    OUT MIR-SELF-RETN-AMT-T[13]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        Decimals = "2";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "MLJ Retention Amount";
        Index = "1"; 
    }
#CD200R CHANGES END HERE
}