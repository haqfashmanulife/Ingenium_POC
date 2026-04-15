#*******************************************************************************
#*  Component:   BF9C90AP-O.s                                                  *
#*  Description: Output Step for Advance Payment Inquiry Process               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS025  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C90AP-O
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
        Label = "Policy billing request Effective Date";
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
    
    IN MIR-POL-ADV-PMT-DUR 
    {
    
         Length = "3";
         SType = "Text";
          DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }
    
    IN MIR-POL-ADV-PMT-TYP-CD 
    {
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "ADV-PMT-TYP-CD";
            DBTableName = "TFTRQ";
            SType = "Text";
            Label = "Advance Payment Type Code";
    }   
    
    IN MIR-POL-ADV-PMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Amount";
    }       
    
    
    IN MIR-POL-FUT-ACTV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        SType = "Text";
        Label = "Activity Status";
    }    

}    