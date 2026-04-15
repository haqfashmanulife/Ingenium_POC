# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1862-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1862-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1862";
        BusinessFunctionName = "Valuation Selection Record Update";
        BusinessFunctionType = "Update";
        MirName = "VCWM0130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Plan/Rate Scale";
    }

    INOUT MIR-VALN-LBL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Valuation Label";
    }

    INOUT MIR-VSELC-CVG-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-CVG-PAR-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Participation Code";
    }

    INOUT MIR-VSELC-HIGH-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TVS";
        SType = "Number";
        Label = "High Issue Age";
    }

    INOUT MIR-VSELC-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-INS-TYP-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Component Type";
    }

    INOUT MIR-VSELC-LOW-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TVS";
        SType = "Number";
        Label = "Low Issue Age";
    }

    INOUT MIR-VSELC-POL-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-POL-PAR-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Policy Participation Digit";
    }

    INOUT MIR-VSELC-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SEX-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Sex Code";
    }

    INOUT MIR-VSELC-SMKR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SMKR-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Smoker Code";
    }

    INOUT MIR-VSELC-STBL-1-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Sub-table 1  (STB1)";
    }

    INOUT MIR-VSELC-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Sub-table 2  (STB2)";
    }

    IN MIR-VSELC-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "VSBK";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Selection Pointer";
    }

}

