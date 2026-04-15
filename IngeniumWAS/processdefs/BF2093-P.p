# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2093-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2093-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2093";
        BusinessFunctionName = "Upload Translation Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "ACWM2090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-UPLD-TTBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Table Name";
    }

    IN MIR-UPLD-TTBL-VALU-ID
    {
        Key;
        Mandatory;
        Length = "25";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Value";
    }

}

