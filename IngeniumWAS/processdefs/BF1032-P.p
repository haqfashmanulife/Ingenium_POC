# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1032-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00584  SRO      Accountholder Name should be mandatory                    *
#*                                                                             *
#*******************************************************************************

P-STEP BF1032-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1032";
        BusinessFunctionName = "Bank Account Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM5080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        MixedCase;
        Mandatory;
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
    }

    INOUT MIR-BNK-ACCT-MICR-IND
    {
        Length = "1";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }

    IN MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "17";
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

}


#	OUT MIR-BNK-NM
#	{
#		Length = "36";
#		DBTableName = "TBNKB";
#		SType = "Text": RT;
#		Label = "Bank Name";
#	}

