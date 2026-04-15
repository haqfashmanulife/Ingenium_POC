# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1611-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1611-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1611";
        BusinessFunctionName = "Occupation Class Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM2220";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-OCCP-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TOCTB";
        SType = "Selection";
        Label = "Occupation";
    }

}

