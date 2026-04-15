# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0892-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0892-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-TAMRA-REASN-CD";
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

    INOUT MIR-POL-7PAY-ANN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current 7-Pay Annual Premium";
    }

    INOUT MIR-POL-7PAY-CUM-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Current 7-Pay Cumulative Premium";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-POL-MATRL-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Material Change Date";
    }

    INOUT MIR-POL-MEC-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    INOUT MIR-TAMRA-1035-PD-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "1035 Premium Paid";
    }

    INOUT MIR-TAMRA-7PAY-ANN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "7-Pay Annual Premium at Time of change";
    }

    INOUT MIR-TAMRA-7PAY-CUM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium at Time of change";
    }

    INOUT MIR-TAMRA-ACB-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
    }

    INOUT MIR-TAMRA-CV-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Cash Value";
    }

    INOUT MIR-TAMRA-NSP-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Net Single Premium";
    }

    INOUT MIR-TAMRA-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-REASN-CD";
        SType = "Selection";
        Label = "Reason";
    }

    INOUT MIR-TAMRA-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-TAMRA-SUM-INS-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Sum Insured";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TAMRA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Record Created";
    }

}

