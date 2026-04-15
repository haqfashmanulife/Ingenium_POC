# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0882-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0882-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-FED-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    IN MIR-PROV-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
    }

    IN MIR-T4RSP-PNSN-SRC-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Text";
        Label = "Registered Pension Source";
    }

    IN MIR-T4RSP-RHST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-TAXBL-PAYO-YTD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion";
    }

    IN MIR-TAX-GAIN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gain Amount";
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

    IN MIR-T4RSP-RHST-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-T[4]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Address";
        Index = "1";
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

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identifier";
    }

    IN MIR-DV-ANUTNT-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Annuitant Name";
    }

    IN MIR-DV-SPOUS-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Spouse's Name";
    }

    IN MIR-OWN-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        Label = "Policyowner's Current Location";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Registered";
    }

    IN MIR-POL-REG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    IN MIR-SPOUS-SIN-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Spouse's SIN/SSN";
    }

    IN MIR-T4RSP-RHST-ORIG-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Original T4RSP Receipt Date";
    }

    IN MIR-T4RSP-RHST-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "T4RSP-RHST-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-T4RSP-RHST-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Taxation Year Receipt Applies";
    }

}

