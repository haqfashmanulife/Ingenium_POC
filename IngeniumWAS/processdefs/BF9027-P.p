# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT
#*******************************************************************************
#*  Component:   BF9027-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9027-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9027";
        BusinessFunctionName = "NB Cut-off Dates Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-APP-RECV-CUT-DT
    {
        Length = "10";
        DBTableName = "TNBDT";
        SType = "Date";
        Label = "App Received Cut-off Date";
    }

    INOUT MIR-POL-ISS-CUT-DT
    {
        Length = "10";
        DBTableName = "TNBDT";
        SType = "Date";
        Label = "Pol Issued Cut-off Date";
    }


}

