# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF9044-P.p                                                    *
#*  Description: Pending Policy Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  P00929  ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9044-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9044";
        BusinessFunctionName = "Policy Payment Receipt List";
        BusinessFunctionType = "List";
        MirName = "NCWM9044";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-POL-ID-BASE
    {
        Key;
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

    IN MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
    }
    
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }


    OUT MIR-DV-OWN-CLI-KANA-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Katakana Name";
    }


      OUT MIR-RECPT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCWAR";
        SType = "Date";
        Label = "Receipt Date";
        Index = "1";
    }
    
      OUT MIR-RECPT-NUM-T[20]
    {
#*P00929    Length = "10";
        Length = "8";
        FieldGroup = "Table20";
        Index = "1";
        DBTableName = "TCWAR";
        SType = "Text";
        Label = "Receipt Number";
    }
    

    OUT MIR-RECPT-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        Index = "1";
        DBTableName = "TCWAR";
        SType = "Currency";
        Label = "Receipt Amount";
    }
    

    OUT MIR-CWAR-SRC-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        Index = "1";
        CodeSource = "DataModel";
        CodeType = "CWAR-SRC-CD";
        SType = "Text";
        Label = "Source Code";
    }
#M245B2 CHANGES START HERE  
  
    INOUT MIR-PMT-CRCY-CD-T[20]
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M245B2 CHANGES ENDS HERE     

  
}
 

     
    
 


