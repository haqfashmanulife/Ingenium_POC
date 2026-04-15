# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1005-O.s                                                    *
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

S-STEP BF1005-O
{
    ATTRIBUTES
    {
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

    IN MIR-DV-CLI-LBILL-INFC-AMT-T[5]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-LBILL-PEND-AMT-T[5]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-LBILL-SPND-AMT-T[5]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-LBILL-TOT-AMT-T[5]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-LBILL-GR-PICK-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Pick Day";
    }

    IN MIR-LBILL-GR-DRW-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Draw Day";
    }

    IN MIR-LBILL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLIG";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Billing Mode";
    }

}

