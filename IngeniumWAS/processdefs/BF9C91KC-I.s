#*******************************************************************************
#*  Component:   BF9C91KC-I.s                                                  *
#*  Description: Input Edit Step KATA CHANGE REQUEST                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3095  CTS      Intial Version                                            *
#*******************************************************************************
    S-STEP BF9C91KC-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusFrame = "ContentFrame";
    Type = "Input";
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
    SType="Hidden";
    }
    
    OUT index
    {
        SType = "Hidden";
    }
    
    IN MIR-POL-ID-BASE
    {
     DefaultSession = "MIR-POL-ID-BASE";
     Key;
     Label = "Policy ID";
     Length = "9";
     Mandatory;
     SType = "Text";
    }
    
    IN MIR-POL-ID-SFX
    {
     DefaultSession = "MIR-POL-ID-SFX";
     Key;
     Label = "Suffix";
     Length = "1";
     SType = "Text";
    }

    IN MIR-PBRQ-EFF-DT
    {
      Key;
      Label = "Effective Date";
      Length = "10";
      Mandatory;
      SType = "Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
     CodeSource = "DataModel";
     CodeType = "DV-POL-FUT-ACTV-TYP-CD";
     Label = "Activity Type";
     Length = "2";
     Mandatory;
     SType = "Text";
    }
    INOUT MIR-CVG-NO-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage Number";
        Length = "2";
        SType = "Text";
    }

    INOUT MIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan Id";
        Length = "40";
        SType = "Text";
    }
    
    INOUT MIR-CVG-STBL-4-CD-T[99]
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        Index = "1";        
        SType = "Selection";
        Label = "Sub-table 4";
    }

}    