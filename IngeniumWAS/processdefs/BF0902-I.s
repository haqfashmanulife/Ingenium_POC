# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0902-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0902-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CLI-ADDR-TYP-CD";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLI-ADDR-TYP-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-CLI-ID
    {
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Recipient Client Number";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Tax Identifier";
    }

    INOUT MIR-USTX-ACB-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis";
    }

    IN MIR-USTX-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-USTX-FED-TAXWH-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    INOUT MIR-USTX-FORM-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-FORM-TYP-CD";
        SType = "Selection";
        Label = "Tax Form Type";
    }

    INOUT MIR-USTX-GRS-DSTRB-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Gross Distribution Amount";
    }

    INOUT MIR-USTX-GRS-DSTRB-PCT
    {
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage of Total Distribution";
    }

    INOUT MIR-USTX-INT-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Interest Amount";
    }

    INOUT MIR-USTX-IRA-SEP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy is an IRA or SEP";
    }

    INOUT MIR-USTX-IRS-DSTRB-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "USTX-IRS-DSTRB-CD";
        SType = "Selection";
        Label = "Distribution Type";
    }

    INOUT MIR-USTX-ORIG-FORM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-ORIG-FORM-CD";
        SType = "Selection";
        Label = "Tax Record Type";
    }

    INOUT MIR-USTX-STAT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-USTX-TAXBL-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Gross Distribution Amount";
    }

    INOUT MIR-USTX-TAXBL-EVNT-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "USTX-TAXBL-EVNT-CD";
        SType = "Selection";
        Label = "Tax Reporting Event";
    }

    INOUT MIR-USTX-TAX-DTRMN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Tax amount determined";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-USTX-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-USTX-TOT-DSTRB-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-TOT-DSTRB-CD";
        SType = "Text";
        Label = "Distributions Reported";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

