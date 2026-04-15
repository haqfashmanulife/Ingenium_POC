# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8102-P.p                                                    *
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

P-STEP BF8102-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8102";
        BusinessFunctionName = "Data Model Allowed Value Desc. Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM8102";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DM-AV-DESC-TXT
    {
        MixedCase;
        Length = "80";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Description";
    }

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

}

