# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1551-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1551-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1551";
        BusinessFunctionName = "Matched Client Lab Tests Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM1380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-LTST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Test Performed";
    }

    IN MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Test Number";
    }

    OUT MIR-CLI-LTST-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Sequence ";
    }

}

