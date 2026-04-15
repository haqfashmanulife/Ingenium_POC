# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8111-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8111-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8111";
        BusinessFunctionName = "Data Model Allowed Value Subset Create";
        BusinessFunctionType = "Create";
        MirName = "XCWM8111";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DM-AV-CD
    {
        Key;
        Mandatory;
        Length = "15";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value";
    }

    IN MIR-DM-AV-SUBSET-CD
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Subset";
    }

    IN MIR-DM-AV-TBL-CD
    {
        Key;
        Mandatory;
        Length = "30";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

}

