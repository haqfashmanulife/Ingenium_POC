# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2121Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  BMB      Remove Listbill Status and add Payroll Deduction fields   *
#*  B00144  BMB      Correct screen dynamics/flow for Payroll Deduction changes*
#*                   Billing Lead Time removed                                 *
#*                   only Group Master values are allowed as changes           *
#*                   Payroll Deduction fields not needed - removed             *
#*                                                                             *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF2121Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Lbillchg";
        Type = "Input";
        FocusField = "MIR-POL-BILL-TYP-CD";
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

    INOUT ALL-POLICIES;


    INOUT MIR-DV-SELCT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Payroll Deduction Client Number";
    }


    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payroll Deduction Client Name";
    }

    IN MIR-DV-OWN-CLI-NM-T[100]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }


    IN MIR-POL-BILL-MODE-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[100]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-PAC-DRW-DY-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }
##UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
##UYS133 CHANGES ENDS
}

