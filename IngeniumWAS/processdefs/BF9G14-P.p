# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9G14-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

P-STEP BF9G14-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G14";
        BusinessFunctionName = "Bulk Bundle Application Retrieve";
        BusinessFunctionType = "List";
        MirName = "CCWM9G10";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UPLD-STRT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date(From)";
    }

    INOUT MIR-UPLD-END-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date(To)";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Specify client ID";
    }
    
    OUT MIR-APP-UPLD-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }
    
    OUT MIR-CLI-ID-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-OWN-CLI-NM-T[30]
    {
        Length = "100";
        FieldGroup = "Table30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
    
    OUT MIR-BULK-BUNDLE-APP-ID-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "(Bulk) Application ID/Bundle Application ID";
        Index = "1";
    }
    
    OUT MIR-PROD-APP-TYP-CD-T[30]
    {
        Length = "2";
        FieldGroup = "Table30";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product application type";
        Index = "1";
    }
    
    OUT MIR-APP-CAT-CD-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        CodeSource = "DataModel";
        CodeType = "APP-CAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bulk Application Policy/Bundle Application Policy/Other";
        Index = "1";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "1";
        SType = "Hidden";
        Label = "Rec Count";
    }    
}
