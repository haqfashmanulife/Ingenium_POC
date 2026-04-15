# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0810-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  NWLLPS  CTS    Added Minimum Laon Amount Field                             *
#*  MP162A   CTS      OWL SERVER ENHANCEMENTS                                   *
#*******************************************************************************

S-STEP BF0810-O
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

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-DSCNT-LOAN-CV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Apply loan discount to maximum loan calculation";
    }

    IN MIR-FREE-LK-DT-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-DT-CALC-CD";
        SType = "Text";
        Label = "Free Look End Date Calculation";
    }

    IN MIR-FREE-LK-FND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-FND-CD";
        SType = "Text";
        Label = "Free Look Fund Designation";
    }

    IN MIR-FREE-LK-REQIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-REQIR-CD";
        SType = "Text";
        Label = "Free Look Fund Requirement";
    }

    IN MIR-FREE-WTHDR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        SType = "Text";
        Label = "Provision";
    }

    IN MIR-FREE-WTHDR-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        SType = "Text";
        Label = "Period";
    }

    IN MIR-FREE-WTHDR-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number Per Period";
    }

    IN MIR-FREE-WTHDR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }

    IN MIR-INIT-GRACE-DY-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Grace Period - Days";
    }

    IN MIR-INIT-GRACE-MO-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Grace Period - Months";
    }

    IN MIR-MAX-LOAN-CV-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Maximum Loanable Cash Value Percent";
    }

    IN MIR-NET-FREE-WTHDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Exclude free withdrawal amount from surrender charges";
    }

    IN MIR-NTU-PRCES-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "NTU-PRCES-CD";
        SType = "Text";
        Label = "Free Look Not Taken Refund Guarantee";
    }

    IN MIR-SURR-CHRG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Location surrender charge restrictions apply";
    }

    IN MIR-UL-NLAPS-DED-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Months Minimum Payment Target Required for Reinstatement";
    }

    IN MIR-UL-NLAPS-GUAR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "No Lapse Guarantee Period";
    }

#* NWLLPS  Changes Start Here *
    IN MIR-MIN-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
#       MP162A Changes Starts Here
#        Stype = "Currency";
        SType = "Currency";
#       MP162A  Changes Ends Here   
        Label = "Minimum Loan Amount";
    }
#* NWLLPS  Changes End Here *
}

