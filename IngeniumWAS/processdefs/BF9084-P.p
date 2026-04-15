#*******************************************************************************
#*  Component:   BF9084-P.p                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) List step                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9084-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9084";
        BusinessFunctionName = "Benefit Category-Name Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9084";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    INOUT MIR-BNFT-CAT-CD
    {
        Key;
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQBC";
        SType = "Selection";
        Label = "Benefit Category";
    }

    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQBC";
        SType = "Selection";
        Label = "Benefit Name";
    }

    
    OUT MIR-BNFT-CAT-CD-T[50]
    {
        Length = "05";
        FieldGroup = "Table1";        
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQBC";
        SType = "Text";
        Label = "Benefit Category";
        Index = "1";        
    } 

    OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "05";
        FieldGroup = "Table1";        
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQBC";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";        
    }


 }
