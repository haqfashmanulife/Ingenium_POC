# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0591-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0591-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0591";
        BusinessFunctionName = "Submit For Clear Case Processing - All";
        BusinessFunctionType = "Allcc";
        MirName = "NCWM0590";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLI-BTH-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    OUT MIR-CLI-BTH-LOC-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Birth Location";
        Index = "1";
    }

    OUT MIR-CLI-CMPLT-CCAS-IND-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Clear case processing attempted";
        Index = "1";
    }

    OUT MIR-CLI-CRNT-LOC-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Residence Location";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-CD-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "UW Decision Changed Date";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[11]
    {
        Length = "30";
        FieldGroup = "Table11";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-POL-MIB-SIGN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "MIB Signature";
    }

}

