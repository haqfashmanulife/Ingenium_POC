# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2094-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2094-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2094";
        BusinessFunctionName = "Upload Translation Table List";
        BusinessFunctionType = "List";
        MirName = "ACWM2090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UPLD-TTBL-VALU-ID
    {
        Key;
        Length = "25";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Value";
    }

    IN MIR-UPLD-TTBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Table Name";
    }

    OUT MIR-UPLD-TTBL-TYP-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    OUT MIR-UPLD-TTBL-VALU-ID-T[12]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Value";
        Index = "1";
    }

    OUT MIR-UPLD-TTBL-VALU-TXT-T[12]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

