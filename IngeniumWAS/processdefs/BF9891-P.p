# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9891-P.p                                                    *
#*  Description: Disease/Surgery Create                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9891-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9891";
        BusinessFunctionName = "Disease/Surgery Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9891";
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
        DBTableName = "TMEDC";
        SType = "Selection";
        Label = "Medical Type";
    }

    INOUT MIR-MEDC-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Medical ID";
    }

    INOUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Code Medical Type";
    }
}

