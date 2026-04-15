# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1592-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02AD12           Add assumed interest rate                                 *
#*  P00944           Add average asset yield rate                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF1592-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1592";
        BusinessFunctionName = "Interest Rate Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0031";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    INOUT MIR-MKTVAL-ADJ-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Market Value Adjustment";
    }

    INOUT MIR-ROLOVR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Rollover Deposit";
    }

    INOUT MIR-ASSUMED-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Assumed Interest Rate";
    }

    INOUT MIR-AVG-ASSET-YLD-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Average Asset Yield Rate";
    }

    IN MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TIR";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    IN MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TIR";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    IN MIR-INT-RT-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TIR";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-INT-RT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TIR";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-INT-RT-MAX-AMT
    {
        Key;
        Mandatory;
        Length = "13";
        Decimals = "0";
        DBTableName = "TIR";
        DefaultConstant = "9999999999999";
        SType = "Currency";
        Label = "Maximum Amount";
    }

}

