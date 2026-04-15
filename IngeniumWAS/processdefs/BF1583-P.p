# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1583-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *#*                                                                             *
#*                                                                             *
#*******************************************************************************

P-STEP BF1583-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1583";
        BusinessFunctionName = "Amendment or Exclusion Delete";
        BusinessFunctionType = "Delete";
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

}

