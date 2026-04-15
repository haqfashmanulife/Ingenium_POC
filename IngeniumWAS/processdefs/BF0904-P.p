# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0904-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0904-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0904";
        BusinessFunctionName = "U.S. Policy Taxable Event List";
        BusinessFunctionType = "List";
        MirName = "CCWM4100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TUSTX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TUSTX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-USTX-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TUSTX";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-USTX-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TUSTX";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-USTX-EFF-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-USTX-FED-TAXWH-AMT-T[11]
    {
        Length = "13";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    OUT MIR-USTX-FORM-TYP-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-FORM-TYP-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Form Type";
        Index = "1";
    }

    OUT MIR-USTX-GRS-DSTRB-AMT-T[11]
    {
        Length = "15";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Gross Distribution Amount";
        Index = "1";
    }

    OUT MIR-USTX-INT-AMT-T[11]
    {
        Length = "13";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Interest Amount";
        Index = "1";
    }

    OUT MIR-USTX-SEQ-NUM-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-USTX-STAT-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-STAT-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-USTX-TAXBL-AMT-T[11]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table11";
        DBTableName = "TUSTX";
        SType = "Currency";
        Label = "Taxable Gross Distribution Amount";
        Index = "1";
    }

    OUT MIR-USTX-TAXBL-EVNT-CD-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-TAXBL-EVNT-CD";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Reporting Event";
        Index = "1";
    }

}

