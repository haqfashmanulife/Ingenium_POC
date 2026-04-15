# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0122-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0122-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0122";
        BusinessFunctionName = "Copy Lab Test";
        BusinessFunctionType = "Copy";
        MirName = "NCWM0120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "COMP";
        DBTableName = "TRT";
        DefaultSession = "MIR-CO-ID";
        SType = "Selection";
        Label = "To Company";
    }

    IN MIR-DV-RQST-KEY-1-TXT-T[6]
    {
        Key;
        Length = "11";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "From Key";
        Index = "1";
    }

    IN MIR-DV-RQST-KEY-2-TXT-T[6]
    {
        Key;
        Length = "11";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "To Key";
        Index = "1";
    }

    OUT MIR-DV-FILE-KEY-TXT
    {
        Length = "56";
        DBTableName = "Derived";
        SType = "Text";
        Label = "System generated key fields";
    }

}

