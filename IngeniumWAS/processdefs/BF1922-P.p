# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1922-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1922-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1922";
        BusinessFunctionName = "Previous Name Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM1922";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-INDV-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "TableO";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-MID-NM-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Middle Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-SFX-NM-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLNM";
        SType = "Selection";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "TableO";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-TITL-TXT-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLNM";
        SType = "Selection";
        Label = "Title";
        Index = "1";
    }

    INOUT MIR-ENTR-GIV-NM-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-ENTR-SUR-NM-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INDV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Sequence Number";
    }

}

