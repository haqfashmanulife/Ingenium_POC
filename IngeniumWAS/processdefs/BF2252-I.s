# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2252-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2252-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-DI-OINS-IND";
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

    INOUT MIR-CLI-DI-ELIG-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-DI-ELIG-IND";
        SType = "Selection";
        Label = "Eligible for STD or LTD Benefits Soon";
    }

    INOUT MIR-CLI-DI-ELIG-MO
    {
        Length = "2";
        SType = "Month";
        Label = "Benefits Commence - Month";
    }

    INOUT MIR-CLI-DI-ELIG-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Benefits Commence - Year";
    }

    INOUT MIR-CLI-DI-OINS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-DI-OINS-IND";
        SType = "Selection";
        Label = "Other Health Insurance Inforce / Pending";
    }

    INOUT MIR-CLI-DI-REFUS-1-YR-T[2]
    {
        Length = "4";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Year";
        Label = "Year";
        Index = "1";
    }

    INOUT MIR-CLI-ELIG-BP-DUR
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Benefit Period";
    }

    INOUT MIR-CLI-ELIG-EP-DUR
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Elimination Period";
    }

    INOUT MIR-CLI-OINS-ADB-AMT-T[6]
    {
        Length = "14";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "AD & D Amount";
        Index = "1";
    }

    INOUT MIR-CLI-OINS-CO-NM-T[6]
    {
        Length = "15";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-OINS-ISS-YR-T[6]
    {
        Length = "4";
        FieldGroup = "Table6";
        SType = "Year";
        Label = "Issue Year";
        Index = "1";
    }

    INOUT MIR-CLI-OINS-TOT-AMT-T[6]
    {
        Length = "16";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Monthly Benefit Amount";
        Index = "1";
    }

    INOUT MIR-DI-ELIG-AMT
    {
        Length = "12";
        Decimals = "0";
        SType = "Currency";
        Label = "Monthly Amount";
    }

    INOUT MIR-DI-INS-REFUS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DI-INS-REFUS-IND";
        SType = "Selection";
        Label = "Non-standard Issue Previously";
    }

    INOUT MIR-DI-OINS-BP-DUR-T[6]
    {
        Length = "5";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Benefit Period";
        Index = "1";
    }

    INOUT MIR-DI-OINS-EP-DUR-T[6]
    {
        Length = "3";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Elimination Period";
        Index = "1";
    }

    INOUT MIR-DI-OINS-INS-TYP-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-INS-TYP-CD";
        SType = "Selection";
        Label = "Type of Business";
        Index = "1";
    }

    INOUT MIR-DI-OINS-REPL-IND-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-REPL-IND";
        SType = "Selection";
        Label = "Internal Replacement";
        Index = "1";
    }

    INOUT MIR-DI-OINS-TAXBL-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "DI-OINS-TAXBL-CD";
        SType = "Selection";
        Label = "Taxable / Non-taxable";
        Index = "1";
    }

    INOUT MIR-DI-REFUS-1-TXT-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RREAS";
        SType = "Selection";
        Label = "Reason for Non-standard Issue";
        Index = "1";
    }

    INOUT MIR-DI-REFUS-CO-1-IND-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "DI-REFUS-CO-IND";
        SType = "Selection";
        Label = "Refused / Substandard Insurance - This Company";
        Index = "1";
    }

    INOUT MIR-DI-REFUS-CO-1-NM-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Refused / Substandard Insurance - Name of Company";
        Index = "1";
    }

    INOUT MIR-OINS-BUS-PERS-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "OINS-BUS-PERS-CD";
        SType = "Selection";
        Label = "Business / Personal";
        Index = "1";
    }

    INOUT MIR-OINS-INFC-PEND-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-INFC-PEND-CD";
        SType = "Selection";
        Label = "Inforce / Pending";
        Index = "1";
    }

    INOUT MIR-OINS-THIS-CO-IND-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-THIS-CO-IND";
        SType = "Selection";
        Label = "Insurance is with Company";
        Index = "1";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

}

