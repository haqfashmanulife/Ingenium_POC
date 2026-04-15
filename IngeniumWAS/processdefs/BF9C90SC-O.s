#*******************************************************************************
#*  Component:   BF9C90SC-O.s                                                  *
#*  Description: Output Step for Sundry Amount Change Inquiry Process          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142G  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C90SC-O
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
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Sundry amount change request Effective Date";
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
    
    IN MIR-TYP-OF-PAYMT-REQ
    {
      DisplayOnly;
      CodeSource = "DataModel";
      CodeType = "TYP-OF-PAYMT-REQ";
      Label = "Type of Payment Requested";
      Length = "1";
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
        DisplayOnly;
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
    
    IN MIR-NEW-SNDRY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "New Sundry Amount";
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