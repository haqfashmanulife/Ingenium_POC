# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1200-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1200-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1200";
        BusinessFunctionName = "Rate Header File Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0131";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-RH-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RH-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TRH";
        SType = "Selection";
        Label = "Rate Header ID";
    }

    OUT MIR-RH-AGE-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-AGE-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Type of Age";
    }

    OUT MIR-RH-BAND-1-AMT-T[6]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table6";
        DBTableName = "TRH";
        SType = "Currency";
        Label = "Band Amount 1";
        Index = "1";
    }

    OUT MIR-RH-BAND-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Banding Type";
    }

    OUT MIR-RH-BAND-USE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-BAND-USE-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Banding Use";
    }

    OUT MIR-RH-DB-OPT-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Death benefit option will be used as part of the key to Rate Load file";
    }

    OUT MIR-RH-DPOS-TRM-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Deposit term";
    }

    OUT MIR-RH-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DT-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Type of Date";
    }

    OUT MIR-RH-DUR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-DUR-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Type of Duration";
    }

    OUT MIR-RH-JNT-LIFE-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Joint type code";
    }

    OUT MIR-RH-LOC-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-DT-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Type of Location Date";
    }

    OUT MIR-RH-LOC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RH-LOC-TYP-CD";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Type of Location";
    }

    OUT MIR-RH-MAX-DUR
    {
        Length = "3";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Maximum Duration";
    }

    OUT MIR-RH-PAR-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Dividend participation will be used as part of the key to Rate Load file";
    }

    OUT MIR-RH-PNSN-QUALF-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Pension qualifier";
    }

    OUT MIR-RH-RT-TYP-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Override Notification";
    }

    OUT MIR-RH-SELCT-PERI-DUR
    {
        Length = "3";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Select Period";
    }

    OUT MIR-RH-SEX-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Sex code will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RH-SMKR-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Smoker status will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RH-STBL-1-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Sub-table 1 will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RH-STBL-2-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Sub-table 2 will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RH-STBL-3-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Sub-table 3 will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RH-STBL-4-CD-IND
    {
        Length = "1";
        DBTableName = "TRH";
        SType = "Indicator";
        Label = "Sub-table 4 will be used as part of the key to the Rate Load file";
    }

    OUT MIR-RTBL-1-ID-T[6]
    {
        Length = "6";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Rate Load Pointer 1";
        Index = "1";
    }

}

