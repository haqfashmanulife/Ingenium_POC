# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1690-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1690-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1690";
        BusinessFunctionName = "Unmatched Client Lab Tests Attach";
        BusinessFunctionType = "Attach";
        MirName = "NCWM1690";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-BCKWRD-SCROLL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Scroll Backward Ind";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Hidden";
        Label = "Client Number";
    }

    INOUT MIR-CLI-LTST-SEQ-NUM
    {
        Mandatory;
        Length = "3";
        DBTableName = "TLABU";
        SType = "Hidden";
        Label = "Sequence";
    }

    INOUT MIR-CLI-LTST-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TLABU";
        SType = "Date";
        Label = "Birth Date";
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

    OUT MIR-CLI-GIV-NM
    {
        Length = "25";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "First Name";
    }

    OUT MIR-CLI-ID-T[40]
    {
        Length = "10";
        FieldGroup = "Table40";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Initial";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Sex";
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

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Tax Identifier";
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

    OUT MIR-DV-INSRD-CLI-NM-T[40]
    {
        Length = "75";
        FieldGroup = "Table40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT MIR-LAB-GEN-REF-ID
    {
        Length = "20";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Lab Reference Number";
    }

}

