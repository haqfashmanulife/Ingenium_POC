# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0290-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0290-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0290";
        BusinessFunctionName = "Translation Table Retrieve";
        BusinessFunctionType = "Retrieve";
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

    OUT MIR-ETBL-DESC-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    OUT MIR-TTBL-VALU-TXT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TTTAB";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

