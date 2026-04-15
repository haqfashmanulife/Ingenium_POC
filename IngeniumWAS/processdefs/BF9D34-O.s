# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF9D34-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UYS304  CTS      DUPLICATE POLICY ID LIST CHANGES                          *
#*******************************************************************************

S-STEP BF9D34-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
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

    IN MIR-POL-ID-BASE-T[20]
    {
        Length = "9";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
    
    IN MIR-SML-PROD-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TTTAB";
        SType = "Text";
        Label = "Small Product Code";
        Index = "1";
    }


    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Product Name";
        Index = "1";
    }
 
    IN MIR-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Text";
        DBTableName = "TPOLC";
        Label = "Client ID";
        Index = "1";
    }
 
    IN MIR-DV-OWN-CLI-NM-T[20]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
    
}

