# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1752-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1752-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-AGT-ID-T[1]";
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

    INOUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-CIA-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Percentage Share";
        Index = "1";
    }

    INOUT MIR-CIA-CLI-TRXN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premium Received";
    }

    INOUT MIR-CIA-CPREM-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    INOUT MIR-COMM-RH-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Pattern Code";
        Index = "1";
    }

    INOUT MIR-OVRID-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent Override Situation";
        Index = "1";
    }

    IN MIR-CIA-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

}

