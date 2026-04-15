# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0812-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  NWLLPS  CTS    Added Minimum Laon Amount Field                             *
#*  MP162A  CTS      OWL SERVER ENHANCEMENTS                                   *
#*******************************************************************************

P-STEP BF0812-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0812";
        BusinessFunctionName = "Plan Location Group Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3040";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DSCNT-LOAN-CV-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Apply loan discount to maximum loan calculation";
    }

    INOUT MIR-FREE-LK-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-DT-CALC-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Free Look End Date Calculation";
    }

    INOUT MIR-FREE-LK-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-FND-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Free Look Fund Designation";
    }

    INOUT MIR-FREE-LK-REQIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-REQIR-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Free Look Fund Requirement";
    }

    INOUT MIR-FREE-WTHDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Provision";
    }

    INOUT MIR-FREE-WTHDR-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Period";
    }

    INOUT MIR-FREE-WTHDR-QTY
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Number Per Period";
    }

    INOUT MIR-FREE-WTHDR-DUR
    {
        Length = "3";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }


    INOUT MIR-INIT-GRACE-DY-DUR
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Initial Grace Period - Days";
    }

    INOUT MIR-INIT-GRACE-MO-DUR
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Initial Grace Period - Months";
    }

    INOUT MIR-MAX-LOAN-CV-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TPLGR";
        SType = "Percent";
        Label = "Maximum Loanable Cash Value Percent";
    }

    INOUT MIR-NET-FREE-WTHDR-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Exclude free withdrawal amount from surrender charges";
    }

    INOUT MIR-NTU-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "NTU-PRCES-CD";
        DBTableName = "TPLGR";
        SType = "Selection";
        Label = "Free Look Not Taken Refund Guarantee";
    }

    INOUT MIR-SURR-CHRG-IND
    {
        Length = "1";
        DBTableName = "TPLGR";
        SType = "Indicator";
        Label = "Location surrender charge restrictions apply";
    }

    INOUT MIR-UL-NLAPS-DED-QTY
    {
        Length = "2";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Number of Months Minimum Payment Target Required for Reinstatement";
    }

    INOUT MIR-UL-NLAPS-GUAR-DUR
    {
        Length = "3";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "No Lapse Guarantee Period";
    }

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

#* NWLLPS  Changes Start Here *    
    INOUT MIR-MIN-LOAN-AMT
    {
        Signed;
        Length ="15";
        DBTableName = "TPLGR";
#       MP162A Changes Starts Here        
#        Stype = "Currency";
        SType = "Currency";
#       MP162A Changes Ends Here   
        Label = "Minimum Loan Amount";
    }        
#* NWLLPS  Changes End Here *

}

