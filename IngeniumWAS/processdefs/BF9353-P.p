#*******************************************************************************
#*  Component:   BF9353-P.p                                                    *
#*  Description: Major Question Delete                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*******************************************************************************

P-STEP BF9353-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9353";
        BusinessFunctionName = "Major Question Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9353";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-INCID-TYP-CD
    {
        Key;
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "QSTN-INCID-TYP-CD";
        DBTableName = "TCQDR";
        SType = "Text";
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
        SType = "Text";
        Label = "Benefit Category";
    }
    
    INOUT MIR-BNFT-NM-ID       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQDR";
        SType = "Text";
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
        SType = "Text";
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
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Text";
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
    
    INOUT MIR-QSTN-ID-T[50]
    {
        DBTableName = "TCQDR";
        Length = "9";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "";
    }
        
    OUT MIR-QSTN-DESC-T[50]
    {
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQDS";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "";
    }    

}
