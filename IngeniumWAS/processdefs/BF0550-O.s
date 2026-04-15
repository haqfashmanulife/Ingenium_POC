# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:24 PM EDT

#*******************************************************************************
#*  Component:   BF0550-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0550-O
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

    IN MIR-CLI-INS-REFUS-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-INS-REFUS-IND";
        SType = "Text";
        Label = "Client refused or offered with extra premium";
    }

    IN MIR-CLI-INS-REFUS-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    IN MIR-CLI-OINS-ADB-AMT-T[6]
    {
        DisplayOnly;
        Length = "14";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "ADB Amount";
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
        Label = "Total Insurance Amount";
        Index = "1";
    }

    IN MIR-CLI-REFUS-CO-1-IND-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-REFUS-CO-IND";
        SType = "Text";
        Label = "Refused / Substandard Insurance - This Company";
        Index = "1";
    }

    IN MIR-CLI-SPOUS-INS-AMT
    {
        DisplayOnly;
        Length = "16";
        Decimals = "0";
        SType = "Currency";
        Label = "Spouse Insured Amount";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-INS-REFUS-CO-1-NM-T[2]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Refused / Substandard Insurance - Name of Company";
        Index = "1";
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

    IN MIR-OINS-INFC-PEND-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OINS-INFC-PEND-IND";
        SType = "Text";
        Label = "Other Insurance Inforce / Pending";
    }

    IN MIR-OINS-INS-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-INS-TYP-CD";
        SType = "Text";
        Label = "Line of Business";
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

    IN MIR-OINS-WP-INFC-IND-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-WP-INFC-IND";
        SType = "Text";
        Label = "Waiver of Premium";
        Index = "1";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

    IN MIR-REFUS-REASN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RREAS";
        SType = "Text";
        Label = "Refused / Substandard Insurance - Reason";
        Index = "1";
    }

}

