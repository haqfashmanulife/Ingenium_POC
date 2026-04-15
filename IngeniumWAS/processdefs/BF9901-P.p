# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9901-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006C  26JUN03  New for release                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9901-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9901";
        BusinessFunctionName = "Basic Plan List Retrieve"; 
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9901";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-CODE-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Plan ID";
        Index = "1";
    }

    OUT MIR-DESC-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

