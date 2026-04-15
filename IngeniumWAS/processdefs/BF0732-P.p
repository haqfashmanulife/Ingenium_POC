# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0732-P.p                                                    *
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

P-STEP BF0732-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0732";
        BusinessFunctionName = "Page Format Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0730";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CNTNU-LN-NUM
    {
        Length = "3";
        DBTableName = "TPF";
        SType = "Text";
        Label = "Continuation Line";
    }

    INOUT MIR-DT-FRMT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DT-FRMT-CD";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Date Style";
    }

    INOUT MIR-FORM-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-RPET-CD";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Form Repeat";
    }

    INOUT MIR-FORM-SIZ-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-SIZ-CD";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Page Size";
    }

    INOUT MIR-PATT-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PATT-RPET-CD";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Pattern Repeat";
    }

    INOUT MIR-RPET-DOC-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Coverage/Insurance Document name";
    }

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

}

