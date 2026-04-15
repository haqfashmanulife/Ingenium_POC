#*******************************************************************************
#*  Component:   BF9C92AP-I.s                                                  *
#*  Description: Input Edit Step for Advance Payment activity                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS025  CTS      Intial Version                                            *
#*******************************************************************************
    S-STEP BF9C92AP-I
    {
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusField = "OkButton";
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
    SType="Hidden";
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
    Label = "Policy billing request Effective Date";
    Length = "10";
    Mandatory;
    SType = "Date";
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
    
   INOUT MIR-POL-ADV-PMT-DUR 
    {
    
         Length = "3";
         SType = "Text";
		 DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }
    
    INOUT MIR-POL-ADV-PMT-TYP-CD 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-TYP-CD";
        DBTableName = "TFTRQ";
        SType = "Selection";
        Label = "Advance Payment Type Code";
    }    
    
    INOUT MIR-POL-ADV-PMT-AMT 
    {   
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TFTRQ";
        Label = "Advance Payment Payment Amount";
    }   
    
    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
    CodeSource = "DataModel";
    CodeType = "POL-FUT-ACTV-STAT-CD";
    Label = "Activity Status";
    Length = "1";
    SType = "Selection";
    }    
    
}    