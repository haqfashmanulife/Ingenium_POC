# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1030-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B10158  KRW      Max length of Bank Account ID is 7                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF1030-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1030";
        BusinessFunctionName = "Bank Account Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM5080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        MixedCase;
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
    }

    OUT MIR-BNK-ACCT-MICR-IND
    {
        Length = "1";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

}

