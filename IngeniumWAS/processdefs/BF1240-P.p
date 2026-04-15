# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1240-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1240-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1240";
        BusinessFunctionName = "Document File Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Language";
    }

    OUT MIR-DOC-CPY-QTY
    {
        Length = "2";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Default Number of Copies";
    }

    OUT MIR-DOC-ENVRMNT-PRT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-ENVRMNT-PRT-CD";
        DBTableName = "TDOCM";
        DefaultConstant = "B";
        SType = "Text";
        Label = "Online / Batch Printing";
    }

    OUT MIR-DOC-NB-DOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-NB-DOC-CD";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Print System";
    }

    OUT MIR-RTE-4-PRTR-ID-T[4]
    {
        Length = "8";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Default Routing";
        Index = "1";
    }

}

