# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0210-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0210-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0210";
        BusinessFunctionName = "Print Request Activity Log";
        BusinessFunctionType = "Actlog";
        MirName = "NCWM0210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-DV-CNTRCT-RQST-IND-T[17]
    {
        Length = "1";
        FieldGroup = "Table17";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPRTX";
        SType = "Text";
        Label = "Number of Copies";
    }

    IN MIR-TRNXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-TRNXT-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Printer";
    }

}

