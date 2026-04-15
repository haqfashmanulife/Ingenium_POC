
#*******************************************************************************
#*  Component:   BF9083-P.p                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) Delete step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9083-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9083";
        BusinessFunctionName = "Benefit CATEGORY-NAME Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9083";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Mandatory;
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQBC";
        SType = "Selection";
        Label = "Benefit Name";
    }

    INOUT MIR-BNFT-CAT-CD
    {
        Key;
        Mandatory;
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQBC";
        SType = "Selection";
        Label = "Benifit Category";
    }
     
}
