# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8100-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016071  602J     make language a selection box                             *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8100-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8100";
        BusinessFunctionName = "Data Model Allowed Value Desc. Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM8100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DM-AV-CD
    {
        Key;
        Mandatory;
        Length = "15";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value";
    }

    IN MIR-DM-AV-DESC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TDMAD";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-DM-AV-TBL-CD
    {
        Key;
        Mandatory;
        Length = "30";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

    OUT MIR-DM-AV-DESC-TXT
    {
        Length = "80";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Description";
    }

}

