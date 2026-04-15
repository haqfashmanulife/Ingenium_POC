# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1242-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1242-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1242";
        BusinessFunctionName = "Document File Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Default Number of Copies";
    }

    INOUT MIR-DOC-ENVRMNT-PRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-ENVRMNT-PRT-CD";
        DBTableName = "TDOCM";
        DefaultConstant = "B";
        SType = "Selection";
        Label = "Online / Batch Printing";
    }

    INOUT MIR-DOC-NB-DOC-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-NB-DOC-CD";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Print System";
    }

    INOUT MIR-RTE-4-PRTR-ID-T[4]
    {
        Length = "8";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Default Routing";
        Index = "1";
    }

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

}

