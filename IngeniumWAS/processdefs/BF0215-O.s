# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0215-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P01249  AT       ADD AGENT ID                                              *
#*  MP176C  CTS      ADDED NEW FIELD BULK APPLICATION ID                       *
#*******************************************************************************

S-STEP BF0215-O
{
    ATTRIBUTES
    {
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

    IN LSIR-USER-MSG-TEXT-T[10]
    {
        DisplayOnly;
        Message;
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-AGT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        DefaultSession = "MIR-AGT-ID";
        SType = "Text";
        Label = "Agent Id";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
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

    IN MIR-TRNXT-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }
# MP176C CHANGES STARTS HERE       
    IN MIR-POL-BULK-APP-ID
    {
            Key;
            DisplayOnly;
            Length = "15";            
            SType = "Text";
            Label = "Bulk Application Id";
    }
# MP176C CHANGES ENDS HERE   

}

