#*******************************************************************************
#*  Component:   BF9C91KC-O.s                                                  *
#*  Description: Output step for Family Kata Change                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3095  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C91KC-O
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

    
    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }
    IN MIR-CVG-NO-T[99] 
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
            
    IN MIR-PLAN-ID-T[99] 
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

    IN MIR-CVG-STBL-4-CD-T[99]
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        Index = "1";        
        SType = "Text";
        Label = "Sub-table 4";
        
    }

}    