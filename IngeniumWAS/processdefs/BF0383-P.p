# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0383-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0383-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0383";
        BusinessFunctionName = "Event Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM0380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-EVNT-ACT-CD
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Action Type";
    }

    IN MIR-EVNT-ACTV-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Activity Type";
    }

    IN MIR-EVNT-SRC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Source of Log Entry";
    }

}

