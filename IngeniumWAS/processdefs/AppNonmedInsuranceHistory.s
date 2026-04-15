# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppNonmedInsuranceHistory.s                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppNonmedInsuranceHistory
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-OINS-INFC-PEND-IND";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Applicant";
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
        Label = "Total Insurance Amount";
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

    INOUT MIR-OINS-INFC-PEND-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OINS-INFC-PEND-IND";
        SType = "YesNoUnanswered";
        Label = "Does the applicant have any existing or pending life insurance?";
    }

    INOUT MIR-OINS-INS-TYP-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-INS-TYP-CD";
        SType = "Selection";
        Label = "Line of Business";
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

    INOUT MIR-OINS-WP-INFC-IND-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "OINS-WP-INFC-IND";
        SType = "Selection";
        Label = "Waiver of Premium";
        Index = "1";
    }

    INOUT MIR-CLI-INS-REFUS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-INS-REFUS-IND";
        SType = "YesNoUnanswered";
        Label = "Has the applicant been refused for insurance or been offered insurance with an extra premium in the last 6 months?";
    }

    INOUT MIR-CLI-INS-REFUS-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    INOUT MIR-CLI-REFUS-CO-1-IND-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-REFUS-CO-IND";
        SType = "Selection";
        Label = "Refused / Substandard Insurance - This Company";
        Index = "1";
    }

    INOUT MIR-INS-REFUS-CO-1-NM-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Refused / Substandard Insurance - Name of Company";
        Index = "1";
    }

    INOUT MIR-REFUS-REASN-1-TXT-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RREAS";
        SType = "Selection";
        Label = "Refused / Substandard Insurance - Reason";
        Index = "1";
    }

}

