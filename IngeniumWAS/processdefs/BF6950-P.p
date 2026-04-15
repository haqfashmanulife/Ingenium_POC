# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6950-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6950-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6950";
        BusinessFunctionName = "Policy Inquiry - Registered Information";
        BusinessFunctionType = "Reg";
        MirName = "CCWM6950";
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

    OUT MIR-DV-ANNTNT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-REG-CNTRB-YTD-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Total Contributions YTD";
        Index = "1";
    }

    OUT MIR-DV-REG-RECPT-YTD-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Total Contributions Receipted YTD";
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

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Registered Pension Source";
    }

    OUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Jurisdiction Policy Registered";
    }

    OUT MIR-POL-REG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Registered Date";
    }

    OUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Registered Fund Source";
    }

    OUT MIR-POL-REG-TOT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    OUT MIR-REG-CNTRB-1-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Contributions: March - December";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-2-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Contributions: January - February";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-RECPT-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Date";
        Label = "Last Receipt Requested Date";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-SPCL-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Special Receipt Amount - Annuitant";
    }

    OUT MIR-REG-CNTRB-SPCL-AMT-2
    {
        Signed;
        Length = "13";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Special Receipt Amount - Spouse";
    }

    OUT MIR-REG-CNTRB-XFER-DT
    {
        Length = "10";
        DBTableName = "TREGC";
        SType = "Date";
        Label = "Contribution / Transfer Date";
    }

    OUT MIR-REG-RECPT-1-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Amount Receipted: March - December";
        Index = "1";
    }

    OUT MIR-REG-RECPT-2-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Amount Receipted: January - February";
        Index = "1";
    }

    OUT MIR-REG-SAV-PORTN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    OUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Savings Indicator";
    }

    OUT MIR-REG-SPCL-HNDL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Special Handling Type";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

}

