# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1613-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1613-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1613";
        BusinessFunctionName = "Occupation Class Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM2220";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-OCCP-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TOCTB";
        SType = "Selection";
        Label = "Occupation";
    }

}

