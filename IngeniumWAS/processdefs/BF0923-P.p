# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0923-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0923-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0923";
        BusinessFunctionName = "Annuity Destination Instruction Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM4200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCDSI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

