# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1924-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1924-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1924";
        BusinessFunctionName = "Previous Name List";
        BusinessFunctionType = "List";
        MirName = "CCWM1924";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-INDV-GIV-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-INDV-MID-NM-T[50]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Middle Name";
        Index = "1";
    }

    OUT MIR-CLI-INDV-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CLI-INDV-SFX-NM-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-CLI-INDV-SUR-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-INDV-TITL-TXT-T[50]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    OUT MIR-ENTR-GIV-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-ENTR-SUR-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table2";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

}

