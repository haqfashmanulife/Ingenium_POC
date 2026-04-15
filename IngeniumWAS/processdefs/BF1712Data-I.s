# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1712Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1712Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-DV-OS-DISB-IND";
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

    IN MIR-PEND-DPOS-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Date";
    }

    IN MIR-PEND-DPOS-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
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

    INOUT MIR-DV-OS-DISB-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update O/S Disbursement";
    }

    INOUT MIR-CVG-NUM-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-FND-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    INOUT MIR-PEND-DPOS-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-PEND-DPOS-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PEND-DPOS-STAT-CD";
        SType = "Text";
        Label = "Deposit Status";
        Index = "1";
    }

    INOUT MIR-PEND-DPOS-TAX-YR-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    INOUT MIR-REG-FND-SRC-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Text";
        Label = "Fund Source";
        Index = "1";
    }

}

