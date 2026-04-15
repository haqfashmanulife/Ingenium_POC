# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A43-P.p                                                    *
#*  Description: Death Benefit Support Table (DBEN) Delete step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A43-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A43";
        BusinessFunctionName = "Death Benefit Support Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9A40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TDBEN";
        SType = "Selection";
        Label = "Plan ID";
    }

    IN MIR-CAUSE-CAT-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DTCAT";
        DBTableName = "TDBEN";
        SType = "Selection";
        Label = "Cause Category Code";
    }


}
