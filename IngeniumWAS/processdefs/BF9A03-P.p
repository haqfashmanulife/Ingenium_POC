# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A03-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD DELETE                             *
#*******************************************************************************

P-STEP BF9A03-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A03";
        BusinessFunctionName = "Policy Payout Method Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9A00";
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
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PAYO-PLAN-MTHD-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-MTHD-CD";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Payout Method";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

}

