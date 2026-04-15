# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6950-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6950-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reg";
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

    IN MIR-DV-ANNTNT-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-REG-CNTRB-YTD-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Total Contributions YTD";
        Index = "1";
    }

    IN MIR-DV-REG-RECPT-YTD-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Total Contributions Receipted YTD";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-PNSN-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Text";
        Label = "Registered Pension Source";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Jurisdiction Policy Registered";
    }

    IN MIR-POL-REG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Registered Date";
    }

    IN MIR-POL-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Text";
        Label = "Registered Fund Source";
    }

    IN MIR-POL-REG-TOT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    IN MIR-REG-CNTRB-1-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: March - December";
        Index = "1";
    }

    IN MIR-REG-CNTRB-2-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: January - February";
        Index = "1";
    }

    IN MIR-REG-CNTRB-RECPT-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Last Receipt Requested Date";
        Index = "1";
    }

    IN MIR-REG-CNTRB-SPCL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Special Receipt Amount - Annuitant";
    }

    IN MIR-REG-CNTRB-SPCL-AMT-2
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Special Receipt Amount - Spouse";
    }

    IN MIR-REG-CNTRB-XFER-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Contribution / Transfer Date";
    }

    IN MIR-REG-RECPT-1-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: March - December";
        Index = "1";
    }

    IN MIR-REG-RECPT-2-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: January - February";
        Index = "1";
    }

    IN MIR-REG-SAV-PORTN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    IN MIR-REG-SAV-PORTN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        SType = "Text";
        Label = "Savings Indicator";
    }

    IN MIR-REG-SPCL-HNDL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        SType = "Text";
        Label = "Special Handling Type";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

}

