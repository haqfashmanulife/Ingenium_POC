# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0890-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0890-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-7PAY-ANN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    IN MIR-POL-7PAY-CUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-POL-MATRL-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Material Change Date";
    }

    IN MIR-POL-MEC-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    IN MIR-TAMRA-1035-PD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "1035 Premium Paid";
    }

    IN MIR-TAMRA-7PAY-ANN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    IN MIR-TAMRA-7PAY-CUM-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    IN MIR-TAMRA-ACB-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
    }

    IN MIR-TAMRA-CV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Cash Value";
    }

    IN MIR-TAMRA-NSP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Net Single Premium";
    }

    IN MIR-TAMRA-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-REASN-CD";
        SType = "Text";
        Label = "Reason";
    }

    IN MIR-TAMRA-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAMRA-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-TAMRA-SUM-INS-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Sum Insured";
    }

}

