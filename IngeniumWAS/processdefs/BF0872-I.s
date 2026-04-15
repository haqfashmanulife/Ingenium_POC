# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0872-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0872-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    INOUT MIR-RRSP-REG-1-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Contribution (March - December)";
    }

    INOUT MIR-RRSP-REG-2-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Contribution (January - February)";
    }

    INOUT MIR-RRSP-REG-SPCL-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Special Receipt Amount";
    }

    INOUT MIR-RRSP-RHST-1-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Receipts (March - December)";
    }

    INOUT MIR-RRSP-RHST-2-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Receipts (January - February)";
    }

    IN MIR-RRSP-RHST-DT
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

    IN MIR-RRSP-RHST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-RRSP-RHST-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        SType = "Text";
        Label = "Receipt Printed For";
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

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
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

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Registered Status";
    }

    IN MIR-POL-REG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    IN MIR-RRSP-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Text";
        Label = "Fund Source";
    }

    IN MIR-RRSP-RECPT-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Receipt Number";
    }

    IN MIR-RRSP-RHST-ORIG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Receipt Originally Printed";
    }

    IN MIR-RRSP-RHST-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-STAT-CD";
        SType = "Text";
        Label = "Status of Receipt";
    }

    IN MIR-RRSP-RHST-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Tax Year Receipt Applicable";
    }

    IN MIR-SPOUS-SIN-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Spouse's SIN / SSN";
    }

}

