# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9A01-P.p                                                    *
#*  Description: For Creating a New Plan Payout Method                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD CREATE                             *
#*******************************************************************************

P-STEP BF9A01-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A01";
        BusinessFunctionName = "Policy Payout Method Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9A00";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
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

    INOUT MIR-PAYO-PLAN-MTHD-CD
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

    INOUT MIR-PLAN-ID
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

    OUT MIR-PLAN-MTHD-DFLT-IND
    {
        Length = "1";
        DBTableName = "TPPMS";
        SType = "Indicator";
        Label = "Default";
    }

    OUT MIR-PAYO-PLAN-LEAD-MTHD-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LTMD";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Lead Time Method";
    }
    OUT MIR-PAYO-PLAN-LEAD-DUR
    {
        Length = "3";
        DBTableName = "TPPMS";
        SType = "Text";
        Label = "Lead Time";
    }
    OUT MIR-LEAD-TIME-TYP-CD
    {
    	Length = "2";
    	CodeSource = "EDIT";
	CodeType = "POTYP";
	DBTableName = "TPPMS";
	SType = "Selection";
        Label = "Lead Time Type";
    }
}

