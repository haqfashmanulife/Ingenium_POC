# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0900-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0900-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0900";
        BusinessFunctionName = "U.S. Policy Taxable Event Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USTX-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TUSTX";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TUSTX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TUSTX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-USTX-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TUSTX";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Recipient Client Number";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Identifier";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-USTX-ACB-AMT
    {
        Length = "15";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Adjusted Cost Basis";
    }

    OUT MIR-USTX-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    OUT MIR-USTX-FORM-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-FORM-TYP-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Form Type";
    }

    OUT MIR-USTX-GRS-DSTRB-AMT
    {
        Length = "15";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Gross Distribution Amount";
    }

    OUT MIR-USTX-GRS-DSTRB-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TUSTX";
        SType = "Percent";
        Label = "Percentage of Total Distribution";
    }

    OUT MIR-USTX-INT-AMT
    {
        Length = "13";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Interest Amount";
    }

    OUT MIR-USTX-IRA-SEP-IND
    {
        Length = "1";
        DBTableName = "TUSTX";
        SType = "Indicator";
        Label = "Policy is an IRA or SEP";
    }

    OUT MIR-USTX-IRS-DSTRB-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "USTX-IRS-DSTRB-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Distribution Type";
    }

    OUT MIR-USTX-ORIG-FORM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-ORIG-FORM-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Record Type";
    }

    OUT MIR-USTX-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-STAT-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-USTX-TAXBL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Taxable Gross Distribution Amount";
    }

    OUT MIR-USTX-TAXBL-EVNT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "USTX-TAXBL-EVNT-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Reporting Event";
    }

    OUT MIR-USTX-TAX-DTRMN-IND
    {
        Length = "1";
        DBTableName = "TUSTX";
        SType = "Indicator";
        Label = "Tax amount determined";
    }

    OUT MIR-USTX-TOT-DSTRB-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-TOT-DSTRB-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "U.S. tax record reflects the total policy distributions";
    }

}

