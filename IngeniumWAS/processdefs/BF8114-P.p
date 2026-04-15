# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8114-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8114-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8114";
        BusinessFunctionName = "Data Model Allowed Value Subset List";
        BusinessFunctionType = "List";
        MirName = "XCWM8114";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DM-AV-CD
    {
        Key;
        Length = "15";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-SUBSET-CD
    {
        Key;
        Length = "4";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Subset";
    }

    INOUT MIR-DM-AV-TBL-CD
    {
        Key;
        Length = "30";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

    OUT MIR-DM-AV-CD-T[50]
    {
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value";
        Index = "1";
    }

    OUT MIR-DM-AV-SUBSET-CD-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Subset";
        Index = "1";
    }

    OUT MIR-DM-AV-TBL-CD-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TDMAS";
        SType = "Text";
        Label = "Allowed Value Table Name";
        Index = "1";
    }

}

