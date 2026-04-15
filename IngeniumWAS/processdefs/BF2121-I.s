# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2121-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2121-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Lbillchg";
        Type = "Input";
        FocusField = "MIR-BILL-LEAD-TIME-DUR";
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

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Billing Lead Time";
        Index = "1";
    }

    INOUT MIR-DV-OWN-CLI-NM-T[100]
    {
        Length = "30";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

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
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-MODE-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Selection";
        Label = "Premium Mode";
        Index = "1";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-POL-BILL-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        Label = "Billing Type";
        Index = "1";
    }

    INOUT MIR-POL-CSTAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    INOUT MIR-POL-ID-SFX-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    INOUT MIR-POL-PAC-DRW-DY-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    INOUT MIR-POL-PD-TO-DT-NUM-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Listbill Client Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

}

