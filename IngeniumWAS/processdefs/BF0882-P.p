# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0882-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0882-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0882";
        BusinessFunctionName = "T4RSP Receipt History Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3800";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FED-TAXWH-YTD-AMT
    {
        Length = "15";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    INOUT MIR-PROV-TAXWH-YTD-AMT
    {
        Length = "15";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
    }

    INOUT MIR-T4RSP-PNSN-SRC-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        DBTableName = "TTHST";
        SType = "Selection";
        Label = "Registered Pension Source";
    }

    INOUT MIR-T4RSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TTHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-TAXBL-PAYO-YTD-AMT
    {
        Length = "15";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Taxable Portion";
    }

    INOUT MIR-TAX-GAIN-AMT
    {
        Length = "15";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Gain Amount";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-T4RSP-RHST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table4";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TUSTX";
        SType = "Text";
        Label = "Tax Identifier";
    }

    OUT MIR-DV-ANUTNT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }

    OUT MIR-DV-SPOUS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse's Name";
    }

    OUT MIR-OWN-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Policyowner's Current Location";
    }

    OUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Registered";
    }

    OUT MIR-POL-REG-DT
    {
        Length = "10";
        DBTableName = "TTHST";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    OUT MIR-SPOUS-SIN-ID
    {
        Length = "9";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Spouse's SIN/SSN";
    }

    OUT MIR-T4RSP-RHST-ORIG-DT
    {
        Length = "9";
        DBTableName = "TTHST";
        SType = "Date";
        Label = "Original T4RSP Receipt Date";
    }

    OUT MIR-T4RSP-RHST-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "T4RSP-RHST-STAT-CD";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-T4RSP-RHST-TAX-YR
    {
        Length = "4";
        DBTableName = "TTHST";
        SType = "Year";
        Label = "Taxation Year Receipt Applies";
    }

}

