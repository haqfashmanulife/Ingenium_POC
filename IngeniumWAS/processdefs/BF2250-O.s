# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2250-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2250-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-DI-ELIG-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-DI-ELIG-IND";
        SType = "Text";
        Label = "Eligible for STD or LTD Benefits Soon";
    }

    IN MIR-CLI-DI-ELIG-MO
    {
        DisplayOnly;
        Length = "2";
        SType = "Month";
        Label = "Benefits Commence - Month";
    }

    IN MIR-CLI-DI-ELIG-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Benefits Commence - Year";
    }

    IN MIR-CLI-DI-OINS-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-DI-OINS-IND";
        SType = "Text";
        Label = "Other Health Insurance Inforce / Pending";
    }

    IN MIR-CLI-DI-REFUS-1-YR-T[2]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Year";
        Label = "Year";
        Index = "1";
    }

    IN MIR-CLI-ELIG-BP-DUR
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Benefit Period";
    }

    IN MIR-CLI-ELIG-EP-DUR
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Elimination Period";
    }

    IN MIR-CLI-OINS-ADB-AMT-T[6]
    {
        DisplayOnly;
        Length = "14";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "AD & D Amount";
        Index = "1";
    }

    IN MIR-CLI-OINS-CO-NM-T[6]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    IN MIR-CLI-OINS-ISS-YR-T[6]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table6";
        SType = "Year";
        Label = "Issue Year";
        Index = "1";
    }

    IN MIR-CLI-OINS-TOT-AMT-T[6]
    {
        DisplayOnly;
        Length = "16";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Monthly Benefit Amount";
        Index = "1";
    }

    IN MIR-DI-ELIG-AMT
    {
        DisplayOnly;
        Length = "12";
        Decimals = "0";
        SType = "Currency";
        Label = "Monthly Amount";
    }

    IN MIR-DI-INS-REFUS-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DI-INS-REFUS-IND";
        SType = "Text";
        Label = "Non-standard Issue Previously";
    }

    IN MIR-DI-OINS-BP-DUR-T[6]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Benefit Period";
        Index = "1";
    }

    IN MIR-DI-OINS-EP-DUR-T[6]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Elimination Period";
        Index = "1";
    }

    IN MIR-DI-OINS-INS-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Business";
        Index = "1";
    }

    IN MIR-DI-OINS-REPL-IND-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-REPL-IND";
        SType = "Text";
        Label = "Internal Replacement";
        Index = "1";
    }

    IN MIR-DI-OINS-TAXBL-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-TAXBL-CD";
        SType = "Text";
        Label = "Taxable / Non-taxable";
        Index = "1";
    }

    IN MIR-DI-REFUS-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RREAS";
        SType = "Text";
        Label = "Reason for Non-standard Issue";
        Index = "1";
    }

    IN MIR-DI-REFUS-CO-1-IND-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DI-REFUS-CO-IND";
        SType = "Text";
        Label = "Refused / Substandard Insurance - This Company";
        Index = "1";
    }

    IN MIR-DI-REFUS-CO-1-NM-T[2]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Refused / Substandard Insurance - Name of Company";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-OINS-BUS-PERS-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "OINS-BUS-PERS-CD";
        SType = "Text";
        Label = "Business / Personal";
        Index = "1";
    }

    IN MIR-OINS-INFC-PEND-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-INFC-PEND-CD";
        SType = "Text";
        Label = "Inforce / Pending";
        Index = "1";
    }

    IN MIR-OINS-THIS-CO-IND-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-THIS-CO-IND";
        SType = "Text";
        Label = "Insurance is with Company";
        Index = "1";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

}

