# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1582-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *                                                                             *
#*  B10317  DPK      See comments below                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF1582-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1582";
        BusinessFunctionName = "Amendment or Exclusion Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM1870";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

# Caution - If this P-Step ever gets changed in the future for Japanese only
#           please be aware the field MIR-AMEX-COMNT-INFO-T which has a length 
#           of 79 bytes is defined as 39 bytes in the Japanese HTML page BF1592-I.htm.
#           This is because Kanji characters are double-byte characters.  HTML pages
#           do not detect this, therefore you could exceed the number of bytes sent
#           down and therefore corrupt the data.  If this P-Step in the future is used
#           to regenerate the HTML for Japanese only keep this in mind that the field
#           MIR-AMEX-COMNT-INFO-T will have to get changed back to 39 bytes.
#
 
    INOUT MIR-AMEX-COMNT-INFO-T[10]
    {
        MixedCase;
        Length = "79";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Comments";
        Index = "1";
    }

    INOUT MIR-AMEX-PRT-IND
    {
        Length = "1";
        DBTableName = "TAMEX";
        SType = "Indicator";
        Label = "Print amendment, endorsement or exclusion as part of contract";
    }

    INOUT MIR-AMEX-REC-RETEN-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-RETEN-CD";
        DBTableName = "TAMEX";
        SType = "Selection";
        Label = "Record Retention Period";
    }

    INOUT MIR-AMEX-TRXN-DT
    {
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Date";
        Label = "Date Created";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DOC-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TAMEX";
        SType = "Selection";
        Label = "Document Name";
    }

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

}

