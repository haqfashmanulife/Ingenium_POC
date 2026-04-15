# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0330-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0330-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0330";
        BusinessFunctionName = "Age & Amount Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0330";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DFLT-REQIR-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TATAB";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-DFLT-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Table Name";
    }

    IN MIR-DFLT-REQIR-TCR-AMT
    {
        Key;
        Mandatory;
        Length = "15";
        Decimals = "0";
        DBTableName = "TATAB";
        SType = "Currency";
        Label = "Maximum Coverage Amount";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Occupation Class";
    }

    OUT MIR-REQIR-10-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 10";
        Index = "1";
    }

    OUT MIR-REQIR-11-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 11";
        Index = "1";
    }

    OUT MIR-REQIR-12-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 12";
        Index = "1";
    }

    OUT MIR-REQIR-13-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 13";
        Index = "1";
    }

    OUT MIR-REQIR-14-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 14";
        Index = "1";
    }

    OUT MIR-REQIR-15-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 15";
        Index = "1";
    }

    OUT MIR-REQIR-16-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 16";
        Index = "1";
    }

    OUT MIR-REQIR-17-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 17";
        Index = "1";
    }

    OUT MIR-REQIR-18-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 18";
        Index = "1";
    }

    OUT MIR-REQIR-19-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 19";
        Index = "1";
    }

    OUT MIR-REQIR-1-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 1";
        Index = "1";
    }

    OUT MIR-REQIR-20-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 20";
        Index = "1";
    }

    OUT MIR-REQIR-21-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 21";
        Index = "1";
    }

    OUT MIR-REQIR-22-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 22";
        Index = "1";
    }

    OUT MIR-REQIR-2-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 2";
        Index = "1";
    }

    OUT MIR-REQIR-3-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 3";
        Index = "1";
    }

    OUT MIR-REQIR-4-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 4";
        Index = "1";
    }

    OUT MIR-REQIR-5-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 5";
        Index = "1";
    }

    OUT MIR-REQIR-6-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 6";
        Index = "1";
    }

    OUT MIR-REQIR-7-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 7";
        Index = "1";
    }

    OUT MIR-REQIR-8-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 8";
        Index = "1";
    }

    OUT MIR-REQIR-9-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TATAB";
        SType = "Text";
        Label = "Requirement 9";
        Index = "1";
    }

}

