# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1860-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1860-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1860";
        BusinessFunctionName = "Valuation Selection Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "VCWM0130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Plan Id";
    }

    OUT MIR-VALN-LBL-ID
    {
        Length = "6";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Valuation Label";
    }

    OUT MIR-VSELC-CVG-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-CVG-PAR-CD";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Participation Code";
    }

    OUT MIR-VSELC-HIGH-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TVS";
        SType = "Number";
        Label = "High Issue Age";
    }

    OUT MIR-VSELC-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-INS-TYP-CD";
        DBTableName = "TVS";
        SType = "Selection";
        Label = "Component Type";
    }

    OUT MIR-VSELC-LOW-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TVS";
        SType = "Number";
        Label = "Low Issue Age";
    }

    OUT MIR-VSELC-POL-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-POL-PAR-CD";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Policy Participation Digit";
    }

    OUT MIR-VSELC-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SEX-CD";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Sex Code";
    }

    OUT MIR-VSELC-SMKR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SMKR-CD";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Smoker Code";
    }

    OUT MIR-VSELC-STBL-1-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Sub-table 1  (STB1)";
    }

    OUT MIR-VSELC-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TVS";
        SType = "Text";
        Label = "Sub-table 2  (STB2)";
    }

}

