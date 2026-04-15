#*******************************************************************************
#*  Component:   BF9C94KC-O.s                                                  *
#*  Description: Output Step for Kata Change Request List Process    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  S15287  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C94KC-O
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

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "selection";
        Label = "Activity Type";
    }

    IN MIR-FTRQ-PREV-UPDT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Survivorship Benefit Request Process date";
    } 

    IN MIR-POL-ID-BASE-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }    
 
    IN MIR-PBRQ-EFF-DT-T[20]
    {
         DisplayOnly;
         FieldGroup = "Table1";
         Length = "10";
         SType = "Date";
         Label = "Survivorship Benefit request Effective Date";
    }
    
    IN MIR-POL-FUT-ACTV-STAT-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
       SType = "Selection";
        Label = "Activity Status";
    }
       
}    