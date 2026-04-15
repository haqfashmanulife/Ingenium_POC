# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9884-P.p                                                    *
#*  Description: MCAT Medical Category Table List                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9884-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9884";
        BusinessFunctionName = "Medical Category Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9884";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-MCAT-TYP-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
    }
 
    INOUT MIR-MEDIC-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Disease/Surgery";
    }
    
    INOUT MIR-MEDIC-CAT-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category";
    }
    
    OUT MIR-MCAT-TYP-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
        Index = "1";
    }

    OUT MIR-MEDIC-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Disease/Surgery";
        Index = "1";
    }
    
    OUT MIR-MEDIC-CAT-CD-T[100]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Medical Category";
        Index = "1";
    }
    
    OUT MIR-MEDC-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MEDC-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Defined By";
        Index = "1";
    }
    
}

