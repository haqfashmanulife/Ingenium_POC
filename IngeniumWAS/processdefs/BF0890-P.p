# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0890-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0890-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0890";
        BusinessFunctionName = "TAMRA Activity History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTAMH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TTAMH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TAMRA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTAMH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Record Created";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-7PAY-ANN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    OUT MIR-POL-7PAY-CUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-POL-MATRL-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Material Change Date";
    }

    OUT MIR-POL-MEC-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    OUT MIR-TAMRA-1035-PD-AMT
    {
        Length = "15";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "1035 Premium Paid";
    }

    OUT MIR-TAMRA-7PAY-ANN-AMT
    {
        Length = "15";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    OUT MIR-TAMRA-7PAY-CUM-AMT
    {
        Length = "17";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    OUT MIR-TAMRA-ACB-AMT
    {
        Length = "15";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
    }

    OUT MIR-TAMRA-CV-AMT
    {
        Length = "15";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "Cash Value";
    }

    OUT MIR-TAMRA-NSP-AMT
    {
        Length = "15";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "Net Single Premium";
    }

    OUT MIR-TAMRA-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-REASN-CD";
        DBTableName = "TTAMH";
        SType = "Text";
        Label = "Reason";
    }

    OUT MIR-TAMRA-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-STAT-CD";
        DBTableName = "TTAMH";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-TAMRA-SUM-INS-AMT
    {
        Length = "17";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "Sum Insured";
    }

}

