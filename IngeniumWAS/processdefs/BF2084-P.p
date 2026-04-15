# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2084-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2084-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2084";
        BusinessFunctionName = "Upload Defined Field Table List";
        BusinessFunctionType = "List";
        MirName = "ACWM2080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UPLD-FLD-APEX-NM
    {
        Key;
        Length = "20";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "APEX Field";
    }

    IN MIR-UPLD-FLD-STRUCT-NM
    {
        Key;
        Mandatory;
        Length = "20";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Structure Name";
    }

    OUT MIR-UPLD-FLD-APEX-NM-T[12]
    {
        Length = "20";
        FieldGroup = "Table12";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "APEX Field";
        Index = "1";
    }

    OUT MIR-UPLD-FLD-FILE-CD-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-FILE-CD";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    OUT MIR-UPLD-FLD-NM-T[12]
    {
        Length = "18";
        FieldGroup = "Table12";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Field Name";
        Index = "1";
    }

    OUT MIR-UPLD-FLD-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-TYP-CD";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Data Type";
        Index = "1";
    }

    OUT MIR-UPLD-TTBL-TYP-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Translate Table";
        Index = "1";
    }

}

