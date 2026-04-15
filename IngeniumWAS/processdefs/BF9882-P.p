# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9882-P.p                                                    *
#*  Description: MCAT Medical Category Table Update                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9882-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9882";
        BusinessFunctionName = "Medical Category Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9882";
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

    INOUT MIR-MCAT-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
    }


    INOUT MIR-MEDIC-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Disease/Surgery";
    }
    
    INOUT MIR-MEDC-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDC-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Defined By";
    }

}

