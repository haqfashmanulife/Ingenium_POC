#*******************************************************************************
#*  Component:   BF9C90-I.s                                                    *
#*  Description: Input Step for Future Billing Request Inquiry Process         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C90-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    INOUT MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    INOUT MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "Selection";
        DefaultConstant = "BC";
        Label = "Activity Type";
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
#27549A - Changes Start here
     INOUT MIR-ATO-NOT-APPL-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
  }
#27549A- Changes ends here
}

