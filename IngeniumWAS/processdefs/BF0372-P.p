# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0372-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0372-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0372";
        BusinessFunctionName = "Defined Field Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0370";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FLD-DCML-LEN-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Number OF Decimal Places";
        Index = "1";
    }

    INOUT MIR-FLD-DESC-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Defined Field Description";
        Index = "1";
    }

    INOUT MIR-FLD-FILE-CD-T[12]
    {
        Mandatory;
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "FLD-FILE-CD";
        DBTableName = "TDFLD";
        SType = "Selection";
        Label = "File Resides";
        Index = "1";
    }

    INOUT MIR-FLD-LEN-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Defined Field Length";
        Index = "1";
    }

    INOUT MIR-FLD-OFFST-LEN-T[12]
    {
        Mandatory;
        Length = "4";
        FieldGroup = "Table12";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Byte-offset";
        Index = "1";
    }

    INOUT MIR-FLD-TYP-CD-T[12]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "FLD-TYP-CD";
        DBTableName = "TDFLD";
        SType = "Selection";
        Label = "Defined Field Type";
        Index = "1";
    }

    IN MIR-FLD-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Defined Field Name";
    }

}

