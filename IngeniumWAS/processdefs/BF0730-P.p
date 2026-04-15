# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0730-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Correct lables for repeating lines and forms              *
#*                                                                             *
#*******************************************************************************

P-STEP BF0730-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0730";
        BusinessFunctionName = "Page Format Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0730";
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
        Label = "Document Name";
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
        Label = "Language";
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

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Subsidiary Company";
    }

    OUT MIR-CNTNU-LN-NUM
    {
        Length = "3";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Continuation Line";
    }

    OUT MIR-DT-FRMT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DT-FRMT-CD";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Date Style";
    }

    OUT MIR-FORM-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-RPET-CD";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Form Repeat";
    }

    OUT MIR-FORM-SIZ-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-SIZ-CD";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Page Size";
    }

    OUT MIR-PATT-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PATT-RPET-CD";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Pattern Repeat";
    }

    OUT MIR-RPET-DOC-ID
    {
        Length = "40";
        DBTableName = "TPF";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Coverage/Insurance Document name";
    }

}

