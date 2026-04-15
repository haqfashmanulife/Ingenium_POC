# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1244-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1244-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1244";
        BusinessFunctionName = "Document File List";
        BusinessFunctionType = "List";
        MirName = "NCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DOC-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    INOUT MIR-DOC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Language";
    }

    OUT MIR-DOC-ID-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

    OUT MIR-DOC-LANG-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

}

