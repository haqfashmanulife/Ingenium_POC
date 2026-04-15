# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9880-P.p                                                    *
#*  Description: MCAT Medical Category Table Retrieve                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9880-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9880";
        BusinessFunctionName = "Medical Category Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9880";
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

    OUT MIR-MCAT-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
    }
    
    OUT MIR-MEDIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Disease/Surgery";
    }
    
    OUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDC-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Defined By";
    }
    
    OUT MIR-ASSOC-CODES-IND
    {
        Length = "1";
        SType = "Text";
        Label = "Associated Codes Indicator";
    }
}
