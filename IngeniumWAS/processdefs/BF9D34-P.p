# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF9D34-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UYS304  CTS      DUPLICATE POLICY ID LIST CHANGES                          *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF9D34-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D34";
        BusinessFunctionName = "Policy List Change";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9D34";
    }


    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-POL-COUNT
    {
        Length = "2";
        SType = "number";
        Label = "Policy Count";
    }    

    INOUT MIR-LRG-PROD-CD
    {
        Length = "3";
        SType = "text";
    }

    INOUT MIR-WEBSERV-PROCESS-IND
    {
        Length = "1";
        SType = "text";
    }

    OUT MIR-POL-ID-BASE-T[20]
    {
        Length = "9";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }
    
    OUT MIR-SML-PROD-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TTTAB";
        SType = "Text";
        Label = "Small Product Code";
        Index = "1";
    }


    OUT MIR-PLAN-ID-T[20]
    {
        Length = "6";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Name";
        Index = "1";
    }
 
    OUT MIR-CLI-ID-T[20]
    {
         Length = "10";
         FieldGroup = "Table1";
         SType = "Text";
         DBTableName = "TPOLC";
         Label = "Client ID";
         Index = "1";
    }
 
    OUT MIR-DV-OWN-CLI-NM-T[20]
    {
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
#UY3049 CHANGES STARTS
    INOUT MIR-10-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-10-POL-ID";
        SType = "Hidden";
        Label = "Policy Id";
    }
    INOUT MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "text";
    }
#UY3049 CHANGES ENDS    
}