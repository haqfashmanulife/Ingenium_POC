# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0683-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0683-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0683";
        BusinessFunctionName = "Edit Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0821";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-ETBL-LANG-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TEDIT";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Table Name";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Value";
    }

}

