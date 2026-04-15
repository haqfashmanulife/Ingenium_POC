# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1008Money-O.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016053  6.1      New for release 6.1                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1008Money-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Owndtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-APPL-CTL-PRCES-DT";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-CLI-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-JNT-OWN-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Indicator";
        Label = "Joint Owner";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[10]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-ISS-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-DV-TOT-POL-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Client Total Accumulation Value";
    }

    IN MIR-DV-POL-ACUM-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Total Accumulation Value";
        Index = "1";
    }

    IN MIR-DV-TOT-POL-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Full Policy Surrender Value";
    }

    IN MIR-DV-POL-SURR-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Full Policy Surrender Value";
        Index = "1";
    }

    IN MIR-DV-TOT-MAX-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Maximum Loan Amount Available";
    }

    IN MIR-DV-MAX-LOAN-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Maximum Loan Amount Available";
        Index = "1";
    }

}

