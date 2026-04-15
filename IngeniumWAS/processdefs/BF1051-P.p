# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1051-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01Cl06  KRW      Designate Beneficiary by Insured                          *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*******************************************************************************

P-STEP BF1051-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1051";
        BusinessFunctionName = "Beneficiary Information Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM5100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-BNFY-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured's Client Id";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

