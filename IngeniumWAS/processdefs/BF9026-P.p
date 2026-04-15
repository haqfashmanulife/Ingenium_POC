# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT
#*******************************************************************************
#*  Component:   BF9026-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9026-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9026";
        BusinessFunctionName = "NB Cut-off Dates Table Create";
        BusinessFunctionType = "Create";
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

}

