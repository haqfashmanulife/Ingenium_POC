# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1694-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1694-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1694";
        BusinessFunctionName = "Unmatched Client Lab Tests List";
        BusinessFunctionType = "List";
        MirName = "NCWM1690";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-LTST-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TLABU";
        SType = "Hidden";
        Label = "Sequence";
    }

    INOUT MIR-CLI-LTST-SUR-NM
    {
        Key;
        Length = "25";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Last Name";
    }

    OUT MIR-CLI-BTH-DT-T[40]
    {
        Length = "10";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    OUT MIR-CLI-GIV-NM-T[40]
    {
        Length = "25";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-LTST-SEQ-NUM-T[40]
    {
        Length = "3";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Hidden";
        Label = "Sequence";
        Index = "1";
    }

    OUT MIR-CLI-LTST-SUR-NM-T[40]
    {
        Length = "25";
        FieldGroup = "Table40";
        KeyColumn;
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-MID-INIT-NM-T[40]
    {
        Length = "1";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD-T[40]
    {
        Length = "40";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLI-TAX-ID-T[40]
    {
        Length = "9";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Tax Identifier";
        Index = "1";
    }

    OUT MIR-LAB-ID-T[40]
    {
        Length = "3";
        FieldGroup = "Table40";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Laboratory";
        Index = "1";
    }

}

