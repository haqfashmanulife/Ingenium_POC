#*******************************************************************************
#*  Component:   BF9C94-O.s                                                    *
#*  Description: Output Step for Future Billing Request List Process           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*                                                                             *
#*  Q09526  CTS      MP142G-Displaying Process date                            *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF9C94-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";

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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END
    
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-PBRQ-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    INOUT MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "selection";
        Label = "Activity Type";
    }
#Q09526 - Changes start here   
    IN MIR-FTRQ-PREV-UPDT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Process date";
    } 
 
    IN MIR-POL-ID-BASE-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
#Q09526 - Changes end here    
    IN MIR-PBRQ-EFF-DT-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }
    
    IN MIR-POL-FUT-ACTV-STAT-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        SType = "Text";
        Label = "Activity Status";
    }
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD-T[20]
    {
            DisplayOnly;
            FieldGroup = "Table1";
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "PD-GR-TYP-CD";
            SType = "Text";
            Label = "PD group size";
    }   
#UYS133 CHANGES END
}

