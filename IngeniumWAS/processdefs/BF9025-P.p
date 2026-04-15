# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9025-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9025-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9025";
        BusinessFunctionName = "NB Cut-off Dates Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

    OUT MIR-APP-RECV-CUT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "App Received Cut-off Date";
    }

    OUT MIR-POL-ISS-CUT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Pol Issued Cut-off Date";
    }


}

