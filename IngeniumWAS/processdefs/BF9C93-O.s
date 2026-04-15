#*******************************************************************************
#*  Component:   BF9C93-O.s                                                    *
#*  Description: Output Step for Future Billing Request Delete Process         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C93-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Delete";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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
        Mandatory;
        Length = "9";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }


    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
    
    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Type";
    }
}

