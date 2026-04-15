# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9G14-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

S-STEP BF9G14-O
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
        SType = "Date";
        Label = "Upload date(From)";
    }
        
    INOUT MIR-UPLD-END-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Upload date(To)";
    }    
    
    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Specify client ID";
    }

    IN MIR-APP-UPLD-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Upload date";
        Index = "1";
    }

    IN MIR-CLI-ID-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Client Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-OWN-CLI-NM-T[30]
    {
       DisplayOnly;
       Length = "100";
       FieldGroup = "Table30";
       SType = "Text";
       Label = "Owner Name";
       Index = "1";
    }

    IN MIR-BULK-BUNDLE-APP-ID-T[30]
    {
       DisplayOnly;
       Length = "15";
       FieldGroup = "Table30";
       Label = "(Bulk) Application ID/Bundle Application ID";
       SType = "Text";
       Index = "1";
    }
    
    IN MIR-PROD-APP-TYP-CD-T[30]
    {
       DisplayOnly;
       Length = "2";
       FieldGroup = "Table30";
       CodeSource = "DataModel";
       CodeType = "POL-PROD-APP-TYP";
	   DBTableName = "TPOL";
       SType = "Text";
       Label = "Product application type";
       Index = "1";
    }
    
    IN MIR-APP-CAT-CD-T[30]
    {
       DisplayOnly;
       Length = "01";
       FieldGroup = "Table30";
       CodeSource = "DataModel";
       CodeType = "APP-CAT-CD";
       SType = "Text";
       Label = "Bulk Application Policy/Bundle Application Policy/Other";
       Index = "1";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }    
   
}

