# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1202-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1202-O
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

    IN MIR-RH-AGE-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-AGE-TYP-CD";
        SType = "Text";
        Label = "Type of Age";
    }

    IN MIR-RH-BAND-1-AMT-T[6]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Band Amount 1";
        Index = "1";
    }

    IN MIR-RH-BAND-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-TYP-CD";
        SType = "Text";
        Label = "Banding Type";
    }

    IN MIR-RH-BAND-USE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-USE-CD";
        SType = "Text";
        Label = "Banding Use";
    }

    IN MIR-RH-DB-OPT-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Death benefit option will be used as part of the key to Rate Load file";
    }

    IN MIR-RH-DPOS-TRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Deposit term";
    }

    IN MIR-RH-DT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DT-TYP-CD";
        SType = "Text";
        Label = "Type of Date";
    }

    IN MIR-RH-DUR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DUR-TYP-CD";
        SType = "Text";
        Label = "Type of Duration";
    }

    IN MIR-RH-JNT-LIFE-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Joint type code";
    }

    IN MIR-RH-LOC-DT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-DT-TYP-CD";
        SType = "Text";
        Label = "Type of Location Date";
    }

    IN MIR-RH-LOC-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-TYP-CD";
        SType = "Text";
        Label = "Type of Location";
    }

    IN MIR-RH-MAX-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Duration";
    }

    IN MIR-RH-PAR-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Dividend participation will be used as part of the key to Rate Load file";
    }

    IN MIR-RH-PNSN-QUALF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Pension qualifier";
    }

    IN MIR-RH-RT-TYP-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Text";
        Label = "Override Notification";
    }

    IN MIR-RH-SELCT-PERI-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Select Period";
    }

    IN MIR-RH-SEX-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Sex code will be used as part of the key to the Rate Load file";
    }

    IN MIR-RH-SMKR-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Smoker status will be used as part of the key to the Rate Load file";
    }

    IN MIR-RH-STBL-1-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 1 will be used as part of the key to the Rate Load file";
    }

    IN MIR-RH-STBL-2-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 2 will be used as part of the key to the Rate Load file";
    }

    IN MIR-RH-STBL-3-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 3 will be used as part of the key to the Rate Load file";
    }

    IN MIR-RH-STBL-4-CD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 4 will be used as part of the key to the Rate Load file";
    }

    IN MIR-RTBL-1-ID-T[6]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        SType = "Text";
        Label = "Rate Load Pointer 1";
        Index = "1";
    }

    IN MIR-RH-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RH-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        SType = "Text";
        Label = "Rate Header ID";
    }

}

