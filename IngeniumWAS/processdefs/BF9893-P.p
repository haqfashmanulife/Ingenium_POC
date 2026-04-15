# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9893-P.p                                                    *
#*  Description: MEDC Medical Table Delete                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9893-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9893";
        BusinessFunctionName = "Disease/Surgery Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9893";
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
        Label = "Medical ID";
    }

    IN MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDC";
        SType = "Hidden";
        Label = "Code Medical Type";
    }
}

