# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1580-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1580-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1580";
        BusinessFunctionName = "Amendment or Exclusion Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1870";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-AMEX-REC-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        DBTableName = "TAMEX";
        SType = "Selection";
        Label = "Record Type";
    }

    IN MIR-AMEX-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TAMEX";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TAMEX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TAMEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Insured Client Id";
    }

    OUT MIR-AMEX-COMNT-INFO-T[10]
    {
        Length = "79";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Comments";
        Index = "1";
    }

    OUT MIR-AMEX-PRT-IND
    {
        Length = "1";
        DBTableName = "TAMEX";
        SType = "Indicator";
        Label = "Print amendment, endorsement or exclusion as part of contract";
    }

    OUT MIR-AMEX-REC-RETEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-RETEN-CD";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Record Retention Period";
    }

    OUT MIR-AMEX-TRXN-DT
    {
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Date";
        Label = "Date Created";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Document Name";
    }

}

