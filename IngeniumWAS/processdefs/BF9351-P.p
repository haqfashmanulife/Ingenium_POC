#*******************************************************************************
#*  Component:   BF9351-P.p                                                    *
#*  Description: Major Question Create                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9351-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9351";
        BusinessFunctionName = "Major Question Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-INCID-TYP-CD
    {
        Mandatory;
        Key;
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "QSTN-INCID-TYP-CD";
        DBTableName = "TCQDR";
        SType = "Selection";
        Label = "Incident Type";
    }
    
    INOUT MIR-BNFT-TYP-CD
    {
        Label = "";
        Length = "02";
        SType = "YesNoUnanswered";
    }

    INOUT MIR-BNFT-CAT-CD       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQDR";
        SType = "Selection";
        Label = "Benefit Category";
    }
    
    INOUT MIR-BNFT-NM-ID       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQDR";
        SType = "Selection";
        Label = "Benefit Name";
    }    

    INOUT MIR-DIS-TYP-CD
    {
        Label = "";
        Length = "02";
        SType = "YesNoUnanswered";
    }
    
    INOUT MIR-DIS-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Code";
    }
    
    INOUT MIR-DIS-GRP-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Major Code";
    }       
    
    INOUT MIR-DIS-MEDC-CAT-CD
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Selection";
        Label = "Category";
    }       

    INOUT MIR-SUR-TYP-CD
    {
        Label = "";
        Length = "02";
        SType = "YesNoUnanswered";
    }
        
    INOUT MIR-SUR-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Code";
    }
    
    INOUT MIR-SUR-GRP-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Major Code";
    }       
    
    INOUT MIR-SUR-MEDC-CAT-CD
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDISC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Selection";
        Label = "Category";
    }               

    INOUT MIR-HID-QSTN-DTRMN-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "";
    }        
    
}