# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2092-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2092-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2092";
        BusinessFunctionName = "Upload Translation Table Update";
        BusinessFunctionType = "Update";
        MirName = "ACWM2090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UPLD-TTBL-VALU-TXT-T[1]
    {
        Mandatory;
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TUTTB";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
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

