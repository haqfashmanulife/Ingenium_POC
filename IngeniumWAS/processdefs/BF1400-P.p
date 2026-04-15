# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF1400-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1400-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1400";
        BusinessFunctionName = "Disability Claim Irregular Payment";
        BusinessFunctionType = "Irreg";
        MirName = "CCWM0591";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-INSRD-DISAB-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Date Insured Disabled";
    }

    INOUT MIR-PREV-CLM-PMT-AMT
    {
        Mandatory;
        Length = "13";
        DBTableName = "TDCD";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DI-CLM-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TDCL";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

