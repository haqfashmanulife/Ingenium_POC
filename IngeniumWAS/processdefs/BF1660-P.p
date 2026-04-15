# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1660-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1660-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1660";
        BusinessFunctionName = "Company Client Relationship Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM3300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-CLI-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCOCL";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Company";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
    }

}

