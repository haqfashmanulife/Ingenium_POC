# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8124-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8124-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8124";
        BusinessFunctionName = "Country Location List";
        BusinessFunctionType = "List";
        MirName = "XCWM8124";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CTRY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CTRY-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Location";
    }

    INOUT MIR-CTRY-LOC-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Location Type";
    }

    OUT MIR-CO-ID-T[50]
    {
        Length = "2";
        FieldGroup = "Table50";
        DBTableName = "TCTLC";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-CTRY-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table50";
        DBTableName = "TCTLC";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    OUT MIR-CTRY-LOC-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TCTLC";
        SType = "Text";
        Label = "Location";
        Index = "1";
    }

    OUT MIR-CTRY-LOC-TYP-CD-T[50]
    {
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        DBTableName = "TCTLC";
        SType = "Text";
        Label = "Location Type";
        Index = "1";
    }

}

