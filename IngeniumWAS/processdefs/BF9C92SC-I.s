#*******************************************************************************
#*  Component:   BF9C92SC-I.s                                                  *
#*  Description: Input Edit Step Sundry amount change request                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142G  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************
    S-STEP BF9C92SC-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusField = "MIR-NEW-SNDRY-AMT";
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
    Label = "Sundry amount change request Effective Date";
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
    
     IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current COI";
    }

    IN MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Sundry Amount";
    }        
        
     IN MIR-DV-NEW-COI
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "New COI";
    }
    
    INOUT MIR-NEW-SNDRY-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "New Sundry Amount";
    }        

    
    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Staus";
    }

}    