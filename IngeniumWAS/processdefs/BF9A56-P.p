# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF9623-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A56-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A56";
        BusinessFunctionName = "Policy Loan";
        BusinessFunctionType = "Loan";
        MirName = "CCWM9A56";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-NUM-BUS-DAYS
    {
        Length = "02";
        SType = "Text";
        Label = "Number of business days";
    }

    INOUT MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

}

