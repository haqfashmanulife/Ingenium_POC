# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0502-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0502-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0502";
        BusinessFunctionName = "Underwriting Assignment Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USER-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Underwriter's Initials";
        Index = "1";
    }

    IN MIR-BR-ID
    {
        Key;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUWAS";
        SType = "Selection";
        Label = "Servicing Branch";
    }

    IN MIR-UWAR-ALPHA-CD
    {
        Key;
        Length = "1";
        DBTableName = "TUWAS";
        SType = "Text";
        Label = "Alphabetical Split";
    }

    IN MIR-UWAR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TUWAS";
        SType = "Selection";
        Label = "Line of Business";
    }

    IN MIR-UWAR-TCR-AMT
    {
        Key;
        Length = "13";
        Decimals = "0";
        DBTableName = "TUWAS";
        SType = "Currency";
        Label = "Amount";
    }

}

