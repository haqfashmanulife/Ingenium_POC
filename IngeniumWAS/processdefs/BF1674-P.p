# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1674-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1674-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1674";
        BusinessFunctionName = "Sub Company Client Relations List";
        BusinessFunctionType = "List";
        MirName = "NCWM3310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Company";
    }

    INOUT MIR-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TSCCL";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-LANG-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TSCCL";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

