#*******************************************************************************
#*  Component:   BF9354-P.p                                                    *
#*  Description: Major Question List                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9354-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9354";
        BusinessFunctionName = "Major Question List";
        BusinessFunctionType = "List";
        MirName = "CCWM9354";
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
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Category";
    }               

    INOUT MIR-HID-QSTN-DTRMN-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "";
    }

    INOUT MIR-HID-INCID-TYP-CD
    {
        Key;
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "QSTN-INCID-TYP-CD";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Incident Type";
    }
    
    INOUT MIR-HID-BNFT-CAT-CD       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Benefit Category";
    }
    
    INOUT MIR-HID-BNFT-NM-ID       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Benefit Name";
    }    
  
    INOUT MIR-HID-DIS-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Code";
    }
    
    INOUT MIR-HID-DIS-GRP-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Major Code";
    }       
    
    INOUT MIR-HID-DIS-MEDC-CAT-CD
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Category";
    }       
        
    INOUT MIR-HID-SUR-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Code";
    }
    
    INOUT MIR-HID-SUR-GRP-MEDC-ID
    {
        Length = "10";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Major Code";
    }       
    
    INOUT MIR-HID-SUR-MEDC-CAT-CD
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        SType = "Hidden";
        Label = "Category";
    } 
   
    OUT MIR-INCID-TYP-CD-T[50]
    {
        Key;
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "QSTN-INCID-TYP-CD";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Incident Type";
    }
   
    OUT MIR-BNFT-CAT-CD-T[50]       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BNCAT";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-BNFT-NM-ID-T[50]       
    {
        Length = "05";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Benefit Name";
    }    

        
    OUT MIR-DIS-MEDC-ID-T[50]
    {
        Length = "10";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-DIS-GRP-MEDC-ID-T[50]
    {
        Length = "10";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Disease Major Code";
    }       
    
    OUT MIR-DIS-MEDC-CAT-CD-T[50]
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Disease Category";
    }       

    OUT MIR-SUR-MEDC-ID-T[50]
    {
        Length = "10";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-GRP-MEDC-ID-T[50]
    {
        Length = "10";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Surgery Major Code";
    }       
    
    OUT MIR-SUR-MEDC-CAT-CD-T[50]
    {
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Surgery Category";
    }               

    OUT MIR-HID-QSTN-DTRMN-ID-T[50]
    {
        Key;
        Length = "10";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
        Label = "";
    }    

        
}
