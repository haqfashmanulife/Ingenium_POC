# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0674-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0674-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0674";
        BusinessFunctionName = "Unit Value Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM0811";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UVAL-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "TUV";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-UVAL-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-UVAL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-UVAL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-UVAL-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-UVAL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-UVAL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-UVAL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-UVAL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    INOUT MIR-UVAL-TYP-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Unit Value Type";
    }

    OUT MIR-UVAL-AGE-T[100]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table100";
        DBTableName = "TUV";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    OUT MIR-UVAL-HIGH-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TUV";
        SType = "Text";
        Label = "High Duration Limit";
        Index = "1";
    }

    OUT MIR-UVAL-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-UVAL-LOW-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Low Duration Limit";
        Index = "1";
    }

    OUT MIR-UVAL-PAR-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    OUT MIR-UVAL-SEX-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-UVAL-SMKR-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-UVAL-STBL-1-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    OUT MIR-UVAL-STBL-2-CD-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    OUT MIR-UVAL-STBL-3-CD-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    OUT MIR-UVAL-STBL-4-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

    OUT MIR-UVAL-TYP-CD-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        DBTableName = "TUV";
        SType = "Text";
        Label = "Unit Value Type";
        Index = "1";
    }

}

