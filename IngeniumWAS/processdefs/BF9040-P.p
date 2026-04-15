# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF0940-P.p                                                    *
#*  Description: Pending Policy Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* B00344   KRW      New field will identify user procedure                    *
#* B10325   SRO      Add journal date                                          *
#* 02GL57   DPK      CWA Suspense Account and Refund                           *
#* P00929   ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#* Q18239   CTS      Changes for CWA proces date check                         *  
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9040-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9040";
        BusinessFunctionName = "Pending Policy Payment";
        BusinessFunctionType = "Payment";
        MirName = "NCWM9040";
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

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
    }

       
   
       
    INOUT MIR-RECPT-NBR
    {
#*P00929        Length = "10";
        Length = "8";
        Mandatory;
        SType = "Number";
        Label = "Receipt Number";
    }
    
    INOUT MIR-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Receipt Date";
    }

    
    INOUT MIR-JRNL-DT 
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    
    INOUT MIR-RECPT-AMT
    {
        Length = "15";
        Mandatory;
        SType = "Currency";
        Label = "Cash with Application Amount";
    }



    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-DV-BUS-PRCES-ID
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Business Process";
    }    

    
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    OUT MIR-DV-CWA-SUSP-BAL
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash with App Suspense Balance";
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
    
#* Changes for Q18239 starts here 
    
    IN MIR-CWA-PRCES-CHK-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "CWA process check indicator";
    }       

#* Changes for Q18239 ends here 
#M245B2 CHANGES START HERE     
   INOUT MIR-PMT-CRCY-CD
       {
           Key;
           Mandatory;
           Length = "5";
           SType = "Selection";
           Label = "Currency";
       }
#M245B2 CHANGES END HERE 
}
