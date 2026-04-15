# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1554-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1554-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1554";
        BusinessFunctionName = "Matched Client Lab Tests List";
        BusinessFunctionType = "List";
        MirName = "NCWM1380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-LTST-DT
    {
        Key;
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Test Performed";
    }

    INOUT MIR-CLI-LTST-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Sequence";
    }

    INOUT MIR-LTST-ID
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Test Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-ALPHA-RESP-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LABTN";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
        Index = "1";
    }

    OUT MIR-CLI-LTST-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Test Performed";
        Index = "1";
    }

    OUT MIR-CLI-LTST-RSLT-CD-T[11]
    {
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Range Result";
        Index = "1";
    }

    OUT MIR-CLI-LTST-SEQ-NUM-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Sequence";
        Index = "1";
    }

    OUT MIR-CLI-LTST-STAT-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Status";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CO-MAX-NRNG-QTY-T[11]
    {
        Length = "7";
        FieldGroup = "Table11";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Maximum - Company";
        Index = "1";
    }

    OUT MIR-CO-MIN-NRNG-QTY-T[11]
    {
        Length = "7";
        FieldGroup = "Table11";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Minimum - Company";
        Index = "1";
    }

    OUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Document Name";
    }

    OUT MIR-DV-CLI-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Age";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-LTST-ID-T[11]
    {
        Length = "4";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Number";
        Index = "1";
    }

    OUT MIR-RSLT-REC-CREAT-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RSLT-REC-CREAT-CD";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Creation Type";
        Index = "1";
    }

    OUT MIR-STAT-CHNG-REASN-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Reason Status Changed";
        Index = "1";
    }

}

