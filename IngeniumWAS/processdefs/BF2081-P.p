# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2081-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2081-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2081";
        BusinessFunctionName = "Upload Defined Field Table Create";
        BusinessFunctionType = "Create";
        MirName = "ACWM2080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-UPLD-FLD-APEX-NM
    {
        Key;
        Mandatory;
        Length = "20";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "APEX Field";
    }

    IN MIR-UPLD-FLD-STRUCT-NM
    {
        Key;
        Mandatory;
        Length = "20";
        DBTableName = "TUFLD";
        SType = "Text";
        Label = "Structure Name";
    }

}

