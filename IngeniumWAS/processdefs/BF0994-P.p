# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0994-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0994-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0994";
        BusinessFunctionName = "Branch Detail List";
        BusinessFunctionType = "List";
        MirName = "CCWM5030";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BR-ID
    {
        Key;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TBRCH";
        SType = "Selection";
        Label = "Branch Number";
    }

    OUT MIR-BR-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TBRCH";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TBRCH";
        SType = "Text";
        Label = "Address Type";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TBRCH";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

}

