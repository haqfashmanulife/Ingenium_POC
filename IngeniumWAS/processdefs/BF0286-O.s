# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0286-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0286-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Exception";
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

    IN MIR-LBILL-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Group";
    }

    IN MIR-LBILL-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Billing Date";
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

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Group Name";
    }

    IN MIR-DV-LBILL-PREM-DUE-AMT-T[9]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table9";
        SType = "Currency";
        Label = "Premium Due";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM-T[9]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    IN MIR-DV-TOT-BILL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total Amount of Billing";
    }

    IN MIR-DV-TOT-CRNT-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Total for Group Billing";
    }

    IN MIR-LBILL-POL-LPAY-AMT-T[9]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table9";
        SType = "Currency";
        Label = "Loan payment";
        Index = "1";
    }

    IN MIR-LBILL-POL-SFB-IND-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Indicator";
        Label = "Special Frequency Indicator";
        Index = "1";
    }

    IN MIR-LBILL-POL-STAT-CD-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "DataModel";
        CodeType = "LBILL-POL-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-LBILL-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LBILL-STAT-CD";
        SType = "Text";
        Label = "Group Billing Status Code";
    }

    IN MIR-POL-ID-BASE-T[9]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table9";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-SNDRY-AMT-T[9]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table9";
        SType = "Currency";
        Label = "Sundry Payment";
        Index = "1";
    }

    IN MIR-TOT-BILL-LPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Loan Payment";
    }

    IN MIR-TOT-BILL-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Billable Premium";
    }

    IN MIR-TOT-BILL-SNDRY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Sundry Payment";
    }

    IN MIR-TOT-CRNT-LPAY-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Loan Payment";
    }

    IN MIR-TOT-CRNT-PREM-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Premium Due";
    }

    IN MIR-TOT-CRNT-SNDRY-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Sundry Payment";
    }

}

