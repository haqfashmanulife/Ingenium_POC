
#*******************************************************************************
#*  Component:   BF9070-P.p                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) Retrieve step              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9070-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9070";
        BusinessFunctionName = "Benefit CATEGORY-NAME Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9070";
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
