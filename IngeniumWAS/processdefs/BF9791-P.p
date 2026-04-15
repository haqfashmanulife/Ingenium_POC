# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT
#*******************************************************************************
#*  Component:   BF9791-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  01MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9791-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9791";
        BusinessFunctionName = "AVE Reformat Control Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9791";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Ingenium Plan Code";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

}

