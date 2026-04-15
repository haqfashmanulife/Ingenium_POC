# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0214-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0214-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Predfnd";
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

    INOUT MIR-DV-CNTRCT-RQST-IND-T[17]
    {
        Length = "1";
        FieldGroup = "Table17";
        CodeSource = "DataModel";
        CodeType = "DV-CNTRCT-RQST-IND";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
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

    INOUT MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Number of Copies";
    }

    INOUT MIR-TRNXT-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Selection";
        Label = "Printer";
    }

    INOUT MIR-TRNXT-RQST-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-TRNXT-RQST-STRT-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Start Date";
    }

}

