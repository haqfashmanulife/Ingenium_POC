# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0291-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0291-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0291";
        BusinessFunctionName = "Translation Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM0290";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TTTAB";
        SType = "Text";
        Label = "Value Type";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        Mandatory;
        Length = "15";
        DBTableName = "TTTAB";
        SType = "Text";
        Label = "Value";
    }

    IN MIR-TTAB-ADMIN-APPL-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        DBTableName = "TTTAB";
        SType = "Selection";
        Label = "Administration System";
    }

}

