# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1459-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1459-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1459";
        BusinessFunctionName = "Termination - Reverse Death";
        BusinessFunctionType = "Rdeath";
        MirName = "CCWM0691";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

