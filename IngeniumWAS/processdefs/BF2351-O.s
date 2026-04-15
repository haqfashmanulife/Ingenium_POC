# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:58 PM EDT

#*******************************************************************************
#*  Component:   BF2351-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2351-O
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

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-EVNT-ACT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Text";
        Label = "Action";
    }

    IN MIR-CPEVNT-POL-CLI-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-CPEVNT-POL-CLI-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CPEVNT-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CPEVNT-TRXN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Record Date";
    }

    IN MIR-CPEVNT-TRXN-TIME
    {
        Key;
        DisplayOnly;
        Length = "6";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Record Time";
    }

    IN MIR-EVNT-ACTV-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Text";
        Label = "Activity";
    }

    IN MIR-CPEVNT-GR-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Group Type";
    }

    IN MIR-DV-MSG-TXT
    {
        DisplayOnly;
        Length = "79";
        SType = "Text";
        Label = "Comment/Information";
    }

}

