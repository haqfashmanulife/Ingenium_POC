# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1790-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1790-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1790";
        BusinessFunctionName = "Fund Reversals";
        BusinessFunctionType = "Reversal";
        MirName = "SCWM0090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-REVRS-REASN-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Reversal Reason";
    }

    INOUT MIR-CIA-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        DefaultConstant = "DEP";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TFA";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CIA-EFF-DT-2
    {
        Length = "10";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Activity Effective Date";
    }

    OUT MIR-CIA-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
    }

    OUT MIR-CIA-PRCES-DT
    {
        Length = "10";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Transaction Date";
    }

    OUT MIR-CIA-REASN-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Surrender Reason";
    }

    OUT MIR-CIA-REVRS-PRCES-DT
    {
        Length = "9";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Effective Date of Reversal";
    }

    OUT MIR-CIA-REVRS-REASN-CD-2
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Reversal Reason";
    }

    OUT MIR-CIA-TYP-CD-2
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Activity Type";
    }

}

