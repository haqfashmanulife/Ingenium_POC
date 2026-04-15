# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0842-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0842-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0842";
        BusinessFunctionName = "Variable Comments Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DOC-COMNT-EFF-DT
    {
        Length = "10";
        DBTableName = "TDOCC";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DOC-COMNT-END-DT
    {
        Length = "10";
        DBTableName = "TDOCC";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-DOC-COMNT-TXT
    {
        Mandatory;
        MixedCase;
        Length = "250";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Text";
    }

    IN MIR-DOC-COMNT-COND-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DOC-COMNT-COND-CD";
        DBTableName = "TDOCC";
        SType = "Selection";
        Label = "Condition";
    }

    IN MIR-DOC-COMNT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TDOCC";
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
        DBTableName = "TDOCC";
        SType = "Selection";
        Label = "Sub Company";
    }

}

