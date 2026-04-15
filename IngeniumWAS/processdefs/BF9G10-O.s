# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9G10-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

S-STEP BF9G10-O
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
    
   INOUT MIR-UPLD-STRT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date(From)";
    }
        
   INOUT MIR-UPLD-END-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date(To)";
    }    
    
    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Specify client ID";
    }

    INOUT MIR-APP-UPLD-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }

    INOUT MIR-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    INOUT MIR-BULK-BUNDLE-APP-ID
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "(Bulk) Application ID/Bundle Application ID";
        Index = "1";
    }
    
    INOUT MIR-PROD-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        Label = "Product application type";
    }
    
    INOUT MIR-APP-CAT-CD
    {
        DisplayOnly;
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "APP-CAT-CD";
        SType = "Text";
        Label = "Bulk Application Policy/Bundle Application Policy/Other";
        Index = "01";
    }
    
    INOUT MIR-NUM-T[30]
    {
       DisplayOnly;
       Length = "02";
       FieldGroup = "Table30";
       SType = "Text";
       Label = "No";
       Index = "1";
    }
    
    INOUT MIR-SPCL-APROV-IND-T[30]
    {  
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table30";
        SType = "Indicator";
        Label = "Special approval indicator";
        Index = "1";
    }
    
    INOUT MIR-POL-APP-UPLD-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }
      
    INOUT MIR-OWN-CLI-ID-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Client Number";
        Index = "1";
    }    
   

    INOUT MIR-POL-APP-ID-T[30]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application ID";
        Index = "1";
    }
    
        
    INOUT MIR-POL-ID-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
       
    INOUT MIR-INSRD-NM-T[30]
    {
        DisplayOnly;
        Length = "100";
        FieldGroup = "Table30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured name";
        Index = "1";
    }
    
    INOUT MIR-SELCT-MTHD-CD-T[30]
    {
         DisplayOnly;
         Length = "25";
         CodeSource = "DataModel";
	 CodeType = "UW-TYP-CD";
	 DBTableName = "TCLIU";
         FieldGroup = "Table30";
         SType = "Text";
         Label = "Selection method";
         Index = "1";
    }
    
    INOUT MIR-CVG-FACE-AMT-T[30]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table30";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face amount/Daily benefit";
        Index = "1";
    }
    
    INOUT MIR-POL-STAT-CD-T[30]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy status";
        Index = "1";
    }
    
    INOUT MIR-PHYS-COND-CD-T[30]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Physical condition";
        Index = "1";
    }
    
    INOUT MIR-CLI-UWG-UPDT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Underwriting result date";
        Index = "1";
    }
       
    INOUT MIR-NUWRN-CREAT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last NUWRN creation date";
        Index = "1";
    }
    
    INOUT MIR-ISS-PRCES-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue process date";
        Index = "1";
    }
    
    INOUT MIR-FAIL-PRCES-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Failure process date";
        Index = "1";
    }
    
    INOUT MIR-LATST-UW-USER-ID-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Underwriter Initials";
        Index = "1";
    }
        INOUT MIR-RECORD-CTR1
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }  
   
}

