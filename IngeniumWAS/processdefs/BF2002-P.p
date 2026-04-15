# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2002-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2002-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2002";
        BusinessFunctionName = "Security Edit Table Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ETBL-DESC-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Edit Table Value Description";
    }

    IN MIR-ETBL-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TXTAB";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "XTAB";
        DBTableName = "TXTAB";
        SType = "Selection";
        Label = "Edit Table Name";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        Mandatory;
        Length = "15";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Valid Value";
        MixedCase;
    }

}

