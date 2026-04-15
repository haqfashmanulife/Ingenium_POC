# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF4902-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF4902-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "4902";
        BusinessFunctionName = "Optional Plans Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4902";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-CODE-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Plan ID";
        Index = "1";
    }

    OUT MIR-DESC-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

