# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1594-P.p                                                    *
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

P-STEP BF1594-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1594";
        BusinessFunctionName = "Interest Rate Record List";
        BusinessFunctionType = "List";
        MirName = "CCWM0031";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TIR";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TIR";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-INT-RT-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TIR";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-INT-RT-ID
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

    INOUT MIR-INT-RT-MAX-AMT
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

    OUT MIR-DPOS-TRM-DY-DUR-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    OUT MIR-DPOS-TRM-MO-DUR-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    OUT MIR-INIT-DPOS-INT-PCT-T[12]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
        Index = "1";
    }

    OUT MIR-INT-RT-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-INT-RT-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TIR";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-INT-RT-MAX-AMT-T[12]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Currency";
        Label = "Maximum Amount";
        Index = "1";
    }

    OUT MIR-MKTVAL-ADJ-INT-PCT-T[12]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Market Value Adjustment";
        Index = "1";
    }

    OUT MIR-ROLOVR-INT-PCT-T[12]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Rollover Deposit";
        Index = "1";
    }

    OUT MIR-ASSUMED-INT-PCT-T[12]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Assumed Interest Rate";
        Index = "1";
    }

    OUT MIR-AVG-ASSET-YLD-PCT-T[12]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Average Asset Yield Rate";
        Index = "1";
    }

}

