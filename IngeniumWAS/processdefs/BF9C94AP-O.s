#*******************************************************************************
#*  Component:   BF9C94AP-O.s                                                  *
#*  Description: Output Step for Future Advance Payment List Process           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS025  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C94AP-O
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
        Label = "Activity Effective Date";
    }
    

    IN MIR-FTRQ-PREV-UPDT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Advance Payment Process date";
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
         Label = "Advance Payment request Effective Date";
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
    
    IN MIR-POL-ADV-PMT-TYP-CD-T[20]
    {
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "ADV-PMT-TYP-CD";
            DBTableName = "TFTRQ";
            SType = "Text";
            Label = "Advance Payment Type Code";
    }   
    
    IN MIR-POL-ADV-PMT-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Amount";
    } 
    
    IN MIR-POL-ADV-PMT-DUR-T[20]
    {
    
         Length = "3";
         SType = "Text";
		 DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }

}    