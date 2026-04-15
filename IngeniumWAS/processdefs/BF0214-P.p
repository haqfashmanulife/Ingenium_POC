# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0214-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0214-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0214";
        BusinessFunctionName = "Print Request Predefined";
        BusinessFunctionType = "Predfnd";
        MirName = "NCWM0210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-CNTRCT-RQST-IND-T[17]
    {
        Length = "1";
        FieldGroup = "Table17";
        CodeSource = "DataModel";
        CodeType = "DV-CNTRCT-RQST-IND";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
    }

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

    IN MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPRTX";
        SType = "Text";
        Label = "Number of Copies";
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

    IN MIR-TRNXT-RQST-END-DT
    {
        Length = "10";
        DBTableName = "TPRTX";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-TRNXT-RQST-STRT-DT
    {
        Length = "9";
        DBTableName = "TPRTX";
        SType = "Date";
        Label = "Start Date";
    }

}

