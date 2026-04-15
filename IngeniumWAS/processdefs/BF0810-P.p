# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0810-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  NWLLPS  CTS     Added Minimum Laon Amount Field                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0810-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0810";
        BusinessFunctionName = "Plan Location Group Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3040";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-DSCNT-LOAN-CV-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Apply loan discount to maximum loan calculation";
    }

    OUT MIR-FREE-LK-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-DT-CALC-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Look End Date Calculation";
    }

    OUT MIR-FREE-LK-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-FND-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Look Fund Designation";
    }

    OUT MIR-FREE-LK-REQIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-REQIR-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Look Fund Requirement";
    }

    OUT MIR-FREE-WTHDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Provision";
    }

    OUT MIR-FREE-WTHDR-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Period";
    }

    OUT MIR-FREE-WTHDR-QTY
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Number Per Period";
    }

    OUT MIR-FREE-WTHDR-DUR
    {
        Length = "3";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }

    OUT MIR-INIT-GRACE-DY-DUR
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Initial Grace Period - Days";
    }

    OUT MIR-INIT-GRACE-MO-DUR
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Initial Grace Period - Months";
    }

    OUT MIR-MAX-LOAN-CV-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TPLGR";
        SType = "Percent";
        Label = "Maximum Loanable Cash Value Percent";
    }

    OUT MIR-NET-FREE-WTHDR-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Exclude free withdrawal amount from surrender charges";
    }

    OUT MIR-NTU-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "NTU-PRCES-CD";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Look Not Taken Refund Guarantee";
    }

    OUT MIR-SURR-CHRG-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Location surrender charge restrictions apply";
    }

    OUT MIR-UL-NLAPS-DED-QTY
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Number of Months Minimum Payment Target Required for Reinstatement";
    }

    OUT MIR-UL-NLAPS-GUAR-DUR
    {
        Length = "3";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "No Lapse Guarantee Period";
    }
    
#* NWLLPS  Changes Start Here *
   OUT MIR-MIN-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPLGR";
        SType = "Currency";
        Label = "Minimum Loan Amount";
    }
#* NWLLPS  Changes End Here *
}

