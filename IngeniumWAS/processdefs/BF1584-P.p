# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1584-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *#*                                                                             *
#*******************************************************************************

P-STEP BF1584-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1584";
        BusinessFunctionName = "Amendment or Exclusion List";
        BusinessFunctionType = "List";
        MirName = "NCWM1870";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AMEX-REC-TYP-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        DBTableName = "TAMEX";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-AMEX-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TAMEX";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TAMEX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TAMEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Insured Client Id";
    }

    OUT MIR-AMEX-PRT-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TAMEX";
        SType = "Indicator";
        Label = "Print amendment, endorsement or exclusion as part of contract";
        Index = "1";
    }

    OUT MIR-AMEX-REC-RETEN-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-RETEN-CD";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Record Retention Period";
        Index = "1";
    }

    OUT MIR-AMEX-REC-TYP-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Record Type";
        Index = "1";
    }

    OUT MIR-AMEX-SEQ-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-AMEX-TRXN-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TAMEX";
        SType = "Date";
        Label = "Date Created";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-DOC-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

}

