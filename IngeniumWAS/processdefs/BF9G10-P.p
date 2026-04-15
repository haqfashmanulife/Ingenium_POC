# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9G10-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

P-STEP BF9G10-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G10";
        BusinessFunctionName = "Bulk Bundle Application Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G10";
    }

    INOUT LSIR-RETURN-CD;

    INOUT MIR-RETRN-CD;
    
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
    
    INOUT MIR-APP-UPLD-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }
       
    INOUT MIR-OWN-CLI-NM
    {
        Length = "100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    INOUT MIR-BULK-BUNDLE-APP-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "(Bulk) Application ID/Bundle Application ID";
        Index = "1";
    }
    
    INOUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product application type";
    }
    
    INOUT MIR-APP-CAT-CD
    {
        Length = "01";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bulk Application Policy/Bundle Application Policy/Other";
    }
    
    
    OUT MIR-NUM-T[30]
    {
        Length = "02";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "No";
        Index = "1";
    }
    
    OUT MIR-SPCL-APROV-IND-T[30]
    {
        Length = "01";
        FieldGroup = "Table30";
        SType = "Indicator";
        Label = "Special approval indicator";
        Index = "1";
    }
    
    OUT MIR-POL-APP-UPLD-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }
       
    OUT MIR-OWN-CLI-ID-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Client Number";
        Index = "1";
    }
    
    OUT MIR-POL-APP-ID-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application ID";
        Index = "1";
    }
    
    OUT MIR-POL-ID-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
     
    OUT MIR-INSRD-NM-T[30]
    {
        Length = "100";
        FieldGroup = "Table30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured name";
        Index = "1";
    }
    
    OUT MIR-SELCT-MTHD-CD-T[30]
    {
        Length = "25";
        CodeSource = "DataModel";
	CodeType = "UW-TYP-CD";
	DBTableName = "TCLIU";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Selection method";
        Index = "1";
    }
    
    OUT MIR-CVG-FACE-AMT-T[30]
    {
        Length = "16";
        FieldGroup = "Table30";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face amount/Daily benefit";
        Index = "1";
    }
    
    OUT MIR-POL-STAT-CD-T[30]
    {
        Length = "40";
        FieldGroup = "Table30";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy status";
        Index = "1";
    }
    
    OUT MIR-PHYS-COND-CD-T[30]
    {
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Physical condition";
        Index = "1";
    }
    
    OUT MIR-CLI-UWG-UPDT-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Underwriting result date";
        Index = "1";
    }
    
    OUT MIR-NUWRN-CREAT-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last NUWRN creation date";
        Index = "1";
    }
    
    OUT MIR-ISS-PRCES-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue process date";
        Index = "1";
    }
    
    OUT MIR-FAIL-PRCES-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Failure process date";
        Index = "1";
    }
    
    OUT MIR-LATST-UW-USER-ID-T[30]
    {
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Underwriter Initials";
        Index = "1";
    }
    INOUT MIR-RECORD-CTR1
    {
        Length = "1";
        SType = "Hidden";
        Label = "Rec Count";
    }  
    
}