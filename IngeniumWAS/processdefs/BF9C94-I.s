#*******************************************************************************
#*  Component:   BF9C94-I.s                                                    *
#*  Description: Input Step for Future Billing Request List Process            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      Survivorship Benefit Request Screen                       *
#*******************************************************************************

S-STEP BF9C94-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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
        Mandatory;
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
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
#MP142F CHANGES STARTS         
        DefaultConstant = "BC";
#MP142F CHANGES ENDS        
        SType = "Selection";
        Label = "Activity Type";
    }

#MP142F CHANGES STARTS    
    INOUT MIR-FTRQ-PREV-UPDT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Survivorship Benefit Request Process date";
    } 
    
#MP142F CHANGES ENDS       
}

