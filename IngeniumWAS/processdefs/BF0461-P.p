# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0461-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0461-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0461";
        BusinessFunctionName = "Policy Payment - Turnaround";
        BusinessFunctionType = "Trnano";
        MirName = "CCWM0651";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DIR-BILL-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTA";
        DefaultConstant = "0000000000";
        SType = "Text";
        Label = "Turnaround Number";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    OUT MIR-DIR-BILL-CSH-AMT
    {
        Length = "15";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Cash Amount";
    }

    OUT MIR-DIR-BILL-DUE-DT
    {
        Length = "10";
        DBTableName = "TTA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TTA";
        SType = "Text";
        Label = "Policy Id";
    }

    OUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

}

