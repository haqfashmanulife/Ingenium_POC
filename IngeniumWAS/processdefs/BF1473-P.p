# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1473-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1473-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1473";
        BusinessFunctionName = "Page Design Transfer";
        BusinessFunctionType = "Transfer";
        MirName = "CCWM0731";
        Description;
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Document Id";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Language Code";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PG-FRMT-LN-NUM
    {
        Key;
        Length = "2";
        DBTableName;
        SType = "Text";
        Label = "From Line";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-PG-FRMT-LN-NUM-T[16]
    {
        Length = "2";
        FieldGroup = "Table16";
        KeyColumn;
        DBTableName = "TPFLN";
        SType = "Text";
        Label = "Page Scroll";
        Index = "1";
    }

    OUT MIR-PG-FRMT-LN-TXT-T[16]
    {
        Length = "79";
        FieldGroup = "Table16";
        DBTableName = "TPFLN";
        SType = "Text";
        Label = "Documentation Text";
        Index = "1";
    }

}

