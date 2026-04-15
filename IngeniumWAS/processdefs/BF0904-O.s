# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0904-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0904-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-USTX-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-USTX-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-USTX-EFF-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-USTX-FED-TAXWH-AMT-T[11]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    IN MIR-USTX-FORM-TYP-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-FORM-TYP-CD";
        SType = "Text";
        Label = "Tax Form Type";
        Index = "1";
    }

    IN MIR-USTX-GRS-DSTRB-AMT-T[11]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Gross Distribution Amount";
        Index = "1";
    }

    IN MIR-USTX-INT-AMT-T[11]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Interest Amount";
        Index = "1";
    }

    IN MIR-USTX-SEQ-NUM-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-USTX-STAT-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-USTX-TAXBL-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Taxable Gross Distribution Amount";
        Index = "1";
    }

    IN MIR-USTX-TAXBL-EVNT-CD-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "USTX-TAXBL-EVNT-CD";
        SType = "Text";
        Label = "Tax Reporting Event";
        Index = "1";
    }

}

