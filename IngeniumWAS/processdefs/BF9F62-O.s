# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT
#*******************************************************************************
#*  Component:   BF9F62-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A  6.0      New for release 6.0                                       *
#*  109606   CTS       CHANGES FOR SUB-TABLE1 FIELD                            *
#*******************************************************************************

S-STEP BF9F62-O
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
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }
 
    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
 
    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name Kana";
    }
 
    IN MIR-CVG-NUM-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
 
    IN MIR-POL-ID-T[99]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";        
    }
 
    IN MIR-CVG-FACE-AMT-T[99]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }
     IN MIR-PLAN-ID-T[99]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "New Plan Name";
        Index = "1";   
    }
 
    IN MIR-CVG-STBL-1-CD-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
#109606 CHANGES START HERE 
        CodeSource = "CSOM9D27"; 
#        CodeSource = "CSOM9D29"; 
#109606 CHANGES ENDS HERE          
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#     	FilterField2 = "MIR-CVG-STBL-1-CD-T";
        SType = "Text";
        Label = "Sub-Table 1";
        Index = "1";
    }
 
    IN MIR-CVG-STBL-2-CD-T[99]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-Table 2";
        Index = "1";
    }
 
    IN MIR-CVG-STBL-3-CD-T[99]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table20";
        CodeSource = "CSOM9D28";
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#     	FilterField2 = "MIR-CVG-STBL-3-CD-T";
        SType = "Text";
        Label = "Sub-Table 3";
        Index = "1";
    }
 
    IN MIR-CVG-STBL-4-CD-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-Table 4";
        Index = "1";
    }
    INOUT MIR-POL-CRCY-CD
    {   
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
                  
    } 
      INOUT temp-plan-id
    {
        Length = "5";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "temp-plan-id";
    }

 }
 
