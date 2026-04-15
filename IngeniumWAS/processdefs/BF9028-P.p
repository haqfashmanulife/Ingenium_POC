# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9028-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9028-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9028";
        BusinessFunctionName = "NB Cut-off Dates Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PRCES-DT-YYYY
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Month";
    }

}

