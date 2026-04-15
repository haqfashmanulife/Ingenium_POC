#*******************************************************************************
#*  Component:   BF9B50-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP161N  CTS      Underwriting Guidance Tool                                *
#*******************************************************************************

S-STEP BF9B50-O
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

    IN MIR-PREF-MSG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIR-PREF-MSG-CD";
        SType = "Text";
        Label = "Preferred Flag";
    }

    IN MIR-STD-MSG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIR-STD-MSG-CD";
        SType = "Text";
        Label = "Standard Flag";
    }
    
    IN MIR-SMKER-MSG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIR-SMKER-MSG-CD";
        SType = "Text";
        Label = "Smoker Flag";
    }
    
    IN MIR-EVAL-MSG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIR-EVAL-MSG-CD";
        SType = "Text";
        Label = "Evaluate Flag";
    }
    
    IN MIR-ACPT-MSG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIR-ACPT-MSG-CD";
        SType = "Text";
        Label = "Accept Flag";
    }    

    IN MIR-TST-TYP-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "6";
        SType = "Text";
        Label = "Test Type";
    }

    IN MIR-TST-SCORE-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "6";
        SType = "Text";
        Label = "Test Score";
    }
    
    IN MIR-NON-EVA-CD-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "1";
        SType = "Text";
        Label = "Non evaluable code";
    }

}