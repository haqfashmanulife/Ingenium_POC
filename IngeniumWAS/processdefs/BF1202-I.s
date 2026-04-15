# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1202-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1202-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-RH-RT-TYP-CD";
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

    INOUT MIR-RH-AGE-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-AGE-TYP-CD";
        SType = "Selection";
        Label = "Type of Age";
    }

    INOUT MIR-RH-BAND-1-AMT-T[6]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Band Amount 1";
        Index = "1";
    }

    INOUT MIR-RH-BAND-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-TYP-CD";
        SType = "Selection";
        Label = "Banding Type";
    }

    INOUT MIR-RH-BAND-USE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-USE-CD";
        SType = "Selection";
        Label = "Banding Use";
    }

    INOUT MIR-RH-DB-OPT-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Death benefit option will be used as part of the key to Rate Load file";
    }

    INOUT MIR-RH-DPOS-TRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Deposit term";
    }

    INOUT MIR-RH-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DT-TYP-CD";
        SType = "Selection";
        Label = "Type of Date";
    }

    INOUT MIR-RH-DUR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DUR-TYP-CD";
        SType = "Selection";
        Label = "Type of Duration";
    }

    INOUT MIR-RH-JNT-LIFE-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Joint type code";
    }

    INOUT MIR-RH-LOC-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-DT-TYP-CD";
        SType = "Selection";
        Label = "Type of Location Date";
    }

    INOUT MIR-RH-LOC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-TYP-CD";
        SType = "Selection";
        Label = "Type of Location";
    }

    INOUT MIR-RH-MAX-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Duration";
    }

    INOUT MIR-RH-PAR-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Dividend participation will be used as part of the key to Rate Load file";
    }

    INOUT MIR-RH-PNSN-QUALF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Pension qualifier";
    }

    INOUT MIR-RH-RT-TYP-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Selection";
        Label = "Rate Type";
    }

    INOUT MIR-RH-SELCT-PERI-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Select Period";
    }

    INOUT MIR-RH-SEX-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Sex code will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RH-SMKR-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Smoker status will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RH-STBL-1-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 1 will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RH-STBL-2-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 2 will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RH-STBL-3-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 3 will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RH-STBL-4-CD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Sub-table 4 will be used as part of the key to the Rate Load file";
    }

    INOUT MIR-RTBL-1-ID-T[6]
    {
        Length = "6";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        SType = "Selection";
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

