# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT
#*******************************************************************************
#*  Component:   BF9F60-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*******************************************************************************

P-STEP BF9F60-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F60";
        BusinessFunctionName = "Coverage Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM9F60";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }
 
    INOUT MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
 
    OUT MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name Kana";
    }
 
    OUT MIR-CVG-NUM-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
 
    OUT MIR-POL-ID-T[99]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";        
    }
  
    OUT MIR-PLAN-ID-T[99]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "New Plan Name";
        Index = "1";   
    }
    OUT MIR-CVG-FACE-AMT-T[99]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    OUT MIR-CVG-STBL-1-CD-T[99]
    {
        Length = "2";
        FieldGroup = "Table20";
#        CodeSource = "CSOM9D27";
        CodeSource = "CSOM9D29";
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#     	FilterField2 = "MIR-CVG-STBL-1-CD-T";          
        SType = "Selection";
        Label = "Sub-Table 1";
        Index = "1";
    }
 
    OUT MIR-CVG-STBL-2-CD-T[99]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-Table 2";
        Index = "1";
    }
 
    OUT MIR-CVG-STBL-3-CD-T[99]
    {
        Length = "5";
        FieldGroup = "Table20";
#        CodeSource = "CSOM9D28";
        CodeSource = "CSOM9D30"; 
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#     	FilterField2 = "MIR-CVG-STBL-3-CD-T";         
        SType = "Selection";
        Label = "Sub-Table 3";
        Index = "1";
    }
 
    OUT MIR-CVG-STBL-4-CD-T[99]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-Table 4";
        Index = "1";
    }
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    OUT MIR-POL-CRCY-CD
    {   
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
                  
    } 
 
}
