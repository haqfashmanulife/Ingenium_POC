# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1004-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  BMB      Remove Listbill Status and add Payroll Deduction fields   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1004-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    IN MIR-DV-POL-SUM-INS-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Total Sum Insured";
        Index = "1";
    }

    IN MIR-DV-TOT-BILL-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Billed Total";
        Index = "1";
    }

    IN MIR-LBILL-GR-PICK-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Pick Day";
    }

    IN MIR-LBILL-GR-DRW-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Draw Day";
    }

    IN MIR-LBILL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Billing Mode";
    }

    IN MIR-POL-BILL-MODE-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[12]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-POL-SPND-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

