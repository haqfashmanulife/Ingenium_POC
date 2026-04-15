# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF0941-P.p                                                    *
#*  Description: Pending Policy Reversal Payment                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  01nb31           new for procees flow BF9040                               *
#*  B10325  SRO      Add Journal Date                                          *
#*  02GL57  CSS      CWA SUSPENSE ACCOUNT AND REFUND                           *
#*  02GL57           - Removed Application Form Id, Miscellaneous Balance      *
#*  02GL57           - Added Type of Refund, CWA Suspense Balance              *
#*  02GL57           - Renamed function from Pending Policy Reversal Payment   *
#*  02GL57             to CASH REFUND                                          *
#*  P00929  ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*  MP168D  CTS      ADDED NEW FIELDS FOR HANDLING FIRM BANKING PAYOUT         *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9041-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9041";
        BusinessFunctionName = "Pending Policy Reversal Payments";
        BusinessFunctionType = "Payment";
        MirName = "NCWM9041";
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

    INOUT MIR-DV-TYP-CSH-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TYP-CSH-RFND-CD";
        DBTableName = "Derived";
        Mandatory;
        SType = "Selection";
        Label = "Type of Refund";
    }
       
    INOUT MIR-RECPT-NBR
    {
#*P00929    Length = "10";
        Length = "8";
        SType = "Number";
        Label = "Receipt Number";
    }
    
    INOUT MIR-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Settlement Date";
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
#M245B2 CHANGES START HERE         
#        Length = "15";
        Length = "16"; 
#M245B2 CHANGES END HERE        
        Mandatory;
        SType = "Currency";
        Label = "Settlement Amount";
    }



    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
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
        Label = "Cash With App Suspense Balance";
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
# MP168D Changes Starts
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRFND-PAYO-MTHD-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payout Method";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder's Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {    
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-BNK-NM        
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-NM     
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Branch Name";
    }     
# MP168D Changes Ends    
#M245B2 CHANGES START HERE
    INOUT MIR-PMT-CRCY-CD
    {
        Mandatory;
        Length = "5";
        DBTableName = "Derived";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Selection";  
        Label = "Currency";
    }
#M245B2 CHANGES END HERE       
}


