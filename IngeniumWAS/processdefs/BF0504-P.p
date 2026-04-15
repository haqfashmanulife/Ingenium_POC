# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0504-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0504-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0504";
        BusinessFunctionName = "Underwriting Assignment List";
        BusinessFunctionType = "List";
        MirName = "NCWM0500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BR-ID
    {
        Key;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUWAS";
        SType = "Selection";
        Label = "Servicing Branch";
    }

    INOUT MIR-UWAR-ALPHA-CD
    {
        Key;
        Length = "1";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Alphabetical Split";
    }

    INOUT MIR-UWAR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TUWAS";
        SType = "Selection";
        Label = "Line of Business";
    }

    INOUT MIR-UWAR-TCR-AMT
    {
        Key;
        Length = "13";
        Decimals = "0";
        DBTableName = "TUWAS";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-BR-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Servicing Branch";
        Index = "1";
    }

    OUT MIR-USER-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Underwriter's Initials";
        Index = "1";
    }

    OUT MIR-UWAR-ALPHA-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Alphabetical Split";
        Index = "1";
    }

    OUT MIR-UWAR-BUS-CLAS-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Line of Business";
        Index = "1";
    }

    OUT MIR-UWAR-TCR-AMT-T[12]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TUWAS";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

}

