# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9873-P.p                                                    *
#*  Description: Disease/Surgery Major Code Delete                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9873-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9873";
        BusinessFunctionName = "Major Code Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9873";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-MEDIC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "MEDC";
        SType = "Selection";
        Label = "Medical Table";
    }

    IN MIR-MEDC-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "MEDC";
        SType = "Text";
        Label = "Major Code";
    }

    IN MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDC";
        SType = "Hidden";
        Label = "Group Medical Type";
    }
}

