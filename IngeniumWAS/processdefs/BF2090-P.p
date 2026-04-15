# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2090-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2090-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2090";
        BusinessFunctionName = "Upload Translation Table Retrieve";
        BusinessFunctionType = "Retrieve";
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

    OUT MIR-UPLD-TTBL-TYP-ID-T[1]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    OUT MIR-UPLD-TTBL-VALU-ID-T[1]
    {
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Value";
        Index = "1";
    }

    OUT MIR-UPLD-TTBL-VALU-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

