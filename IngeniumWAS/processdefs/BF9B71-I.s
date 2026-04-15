#*******************************************************************************
#*  Component:   BF9B71-I.s                                                    *
#*  Description: Rider Surrender/Rider FA reduction for TVI                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TVI15B  CTS      New screen for TVI face amount reducion process           *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9B71-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        FocusField = "MIR-POL-ID-BASE";
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
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }

    IN MIR-POL-ID-SFX 
    {
        DefaultSession = "MIR-POL-ID-SFX";
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    IN  MIR-POL-SNDRY-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
         DisplayOnly;
         Signed;
         Length = "14";
         SType = "Currency";
         Label = "Sundry Amount";
    }

    IN  MIR-DV-OWN-CLI-NM
    {
         DisplayOnly;
         Length = "75";
         SType = "Text";
         Label = "Owner Name";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }
    IN MIR-POL-MPREM-AMT 
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DisplayOnly;
        DBTableName = "TPOL";
        Label = "Mode Premium Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    INOUT MIR-NEW-POL-MPREM-AMT 
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DBTableName = "Derived";
        Label = "New Mode Premium Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }    
  IN MIR-DV-EFF-DT
  {
     DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Undo Indicator";
    }

    IN MIR-DV-COMMIT-CD
    {
        Length = "1";
        SType = "Hidden";
    }
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
    }
}
