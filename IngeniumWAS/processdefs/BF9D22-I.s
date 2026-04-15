#*******************************************************************************
#*  Component:   BF9D22-I.s                                                    *
#*  Description: Health Congratulatory Benefit Payout Process                  *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

S-STEP BF9D22-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "HEcngr";
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
        SType="Hidden";
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

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CO-RECV-DT
    {
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Company Received Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Journal Date";
    }
}
