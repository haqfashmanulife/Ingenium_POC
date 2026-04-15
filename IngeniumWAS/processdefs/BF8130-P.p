# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8130-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8130-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8130";
        BusinessFunctionName = "Selection Box Retrieve for DataModel AVT";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM8130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DM-AV-CD-T[250]
    {
        Length = "15";
        FieldGroup = "Table250";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Selection Box Values";
        Index = "1";
    }

    INOUT MIR-DM-AV-DESC-TXT-T[250]
    {
        Length = "80";
        FieldGroup = "Table250";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Values Description";
        Index = "1";
    }

    INOUT MIR-DM-AV-CD
    {
        Key;
        Length = "15";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-DESC-TXT
    {
        Key;
        Length = "80";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Values Description";
    }

    IN MIR-DM-AV-SUBSET-CD
    {
        Length = "4";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Subset";
    }

    IN MIR-DM-AV-TBL-CD
    {
        Length = "30";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

}

