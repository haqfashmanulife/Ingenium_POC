#*******************************************************************************
#*  Component:   BF9183-P.p                                                    *
#*  Description: P-Step for processing multiple Life rider switches            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFPLI5  CLB      New for ManuFlex Plus multiple Life rider switch          *
#*  BP0051  CLB      Enable text for mode premium value and duration           *
#*  MP185H   CTS     CHANGES DONE TO INCLUDE THE SUBTABLE 3 VALUE FOR LIFE     *
#*                   RIDERS                                                    *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*******************************************************************************
P-STEP BF9183-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9183";
        BusinessFunctionName = "Multiple Rider Switch";
        BusinessFunctionType = "Update";
        MirName = "CCWM9182";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }
     
    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }
     
    INOUT MIR-DV-2-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-DV-2-CVG-NUM
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "#";
    }
     
    INOUT MIR-DV-2-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider";
    }
 
    INOUT MIR-DV-2-CVG-STBL-1-CD
    {
        Length = "40";
        DBTableName = "Derived";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Duration";
    }
     
    INOUT MIR-DV-2-CVG-PREM-CHNG-DT  
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Premium Change Date";
    }

    INOUT MIR-DV-2-CVG-STBL-2-CD  
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Benefit Limit";
    }

    INOUT MIR-DV-2-CVG-FACE-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Face Amount";
    }
 
    INOUT MIR-DV-2-CVG-NEW-FACE-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Face Amount";
    }
     
    INOUT MIR-DV-2-CVG-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Modal Premium";
    }
     
    INOUT MIR-DV-2-KEEP-THIS-CVG-CD
    {
        Length = "1";
        SType = "Indicator";
        Label = "Keep this rider (Original rider face amount must be reduced)";
    }
#M213L1 CHANGES STARTS HERE   
    INOUT  MIR-DV-2-CVG-PRIM-GR-ID
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
    }  
#M213L1 CHANGES ENDS HERE     

    IN MIR-DV-NEW-PLAN-ID-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "LPLAN";
        DBTableName = "TCVG";
   #    DBTableName = "Derived";
        SType = "Selection";
        Label = "Rider Plan";
        Index = "1";
    }
 
    IN MIR-DV-NEW-STBL-1-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TCVG";
   #    DBTableName = "Derived";
        SType = "Selection";
        Label = "Duration";
        Index = "1";
    }
      
    IN MIR-DV-NEW-STBL-2-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
   #    CodeSource = "EDIT";
   #    CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Hidden";
        Label = "Benefit Limit";
        Index = "1";
    }

    IN MIR-DV-NEW-FACE-AMT-T[3]
    {
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TCVG";
   #    DBTableName = "Derived";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-DV-2-CVG-RENEW-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Renewal Code for JS";
    }
 
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
 #* MP185H Changes Begin
 
    INOUT MIR-DV-2-CVG-STBL-3-CD
    {
        Length = "5";
        DBTableName = "Derived";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub Table 3";
     
    }
         
                 
    IN MIR-DV-NEW-STBL-3-CD-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
   #    DBTableName = "Derived";
        SType = "Selection";
        Label = "Sub Table 3";
        Index = "1";
            
   }
   
    
 #* MP185H Changes End 

}
