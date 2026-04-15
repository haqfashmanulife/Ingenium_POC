# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9029-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9029-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9029";
        BusinessFunctionName = "New Business Cut-off Dates Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Month";
    }


    OUT MIR-PRCES-DT-YYYY-T[13]
    {
        Length = "4";
        FieldGroup = "Table13";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Process Date:  Year";
        Index = "1";
    }


    OUT MIR-PRCES-DT-MM-T[13]
    {
        Length = "2";
        FieldGroup = "Table13";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Month";
        Index = "1";
    }


    OUT MIR-APP-RECV-CUT-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TNBDT";
        SType = "Date";
        Label = "App Received Cut-off Date";
        Index = "1";
    }

    OUT MIR-POL-ISS-CUT-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TNBDT";
        SType = "Date";
        Label = "Pol Issued Cut-off Date";
        Index = "1";
    }


}

