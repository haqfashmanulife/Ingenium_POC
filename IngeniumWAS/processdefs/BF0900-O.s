# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0900-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0900-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-USTX-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recipient Client Number";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identifier";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-USTX-ACB-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis";
    }

    IN MIR-USTX-FED-TAXWH-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    IN MIR-USTX-FORM-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-FORM-TYP-CD";
        SType = "Text";
        Label = "Tax Form Type";
    }

    IN MIR-USTX-GRS-DSTRB-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gross Distribution Amount";
    }

    IN MIR-USTX-GRS-DSTRB-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage of Total Distribution";
    }

    IN MIR-USTX-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Interest Amount";
    }

    IN MIR-USTX-IRA-SEP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy is an IRA or SEP";
    }

    IN MIR-USTX-IRS-DSTRB-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "USTX-IRS-DSTRB-CD";
        SType = "Text";
        Label = "Distribution Type";
    }

    IN MIR-USTX-ORIG-FORM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-ORIG-FORM-CD";
        SType = "Text";
        Label = "Tax Record Type";
    }

    IN MIR-USTX-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-USTX-TAXBL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Gross Distribution Amount";
    }

    IN MIR-USTX-TAXBL-EVNT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "USTX-TAXBL-EVNT-CD";
        SType = "Text";
        Label = "Tax Reporting Event";
    }

    IN MIR-USTX-TAX-DTRMN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax amount determined";
    }

    IN MIR-USTX-TOT-DSTRB-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTX-TOT-DSTRB-CD";
        SType = "Text";
        Label = "U.S. tax record reflects the total policy distributions";
    }

}

