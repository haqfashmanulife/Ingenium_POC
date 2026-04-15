# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9881-P.p                                                    *
#*  Description: MCAT Medical Category Table Create                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9881-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9881";
        BusinessFunctionName = "Medical Category Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9881";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    IN MIR-MEDIC-CAT-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category";
    }

}

