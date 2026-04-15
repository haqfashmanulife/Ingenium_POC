# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1711-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1711-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PEND-DPOS-EFF-DT";
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

    INOUT MIR-PEND-DPOS-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Date";
    }

    INOUT MIR-PEND-DPOS-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
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

    INOUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    INOUT MIR-FND-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Selection";
        Label = "Fund";
        Index = "1";
    }

    INOUT MIR-PEND-DPOS-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-PEND-DPOS-TAX-YR-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    INOUT MIR-REG-FND-SRC-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Fund Source";
        Index = "1";
    }

}

