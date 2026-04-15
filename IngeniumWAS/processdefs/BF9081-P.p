#*******************************************************************************
#*  Component:   BF9081-P.p                                                    *
#*  Description: Benefit Category-Name Table (CQBC) Create step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9081-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9081";
        BusinessFunctionName = "Benefit Category-Name Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9081";
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
        Label = "Benefit Category";
    }
     
}
