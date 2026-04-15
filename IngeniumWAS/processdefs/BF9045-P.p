# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF9045-P.p                                                    *
#*  Description: CASH REFUND REVERSAL                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP168D  CTS      NEW FOR HANDLING CASH REFUND REVERSAL FOR FIRM BANKING    *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9045-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9045";
        BusinessFunctionName = "Cash Refund Reversal";
        BusinessFunctionType = "Payment";
        MirName = "NCWM9045";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    OUT MIR-DV-OWN-CLI-KANA-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name (Kana)";
    }

    INOUT MIR-CSH-RFND-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TYP-CSH-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Type of Refund";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-RECPT-AMT
    {
        Length = "15";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Transaction Amount";
    }

    OUT MIR-JRNL-DT 
    {
        Length = "10";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Journal Date";
    }

    OUT MIR-CWA-SUSP-BAL
    { 
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "CWA Suspense";
    }

    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Account Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Account Holder's Name";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {    
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-BNK-NM        
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM     
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Branch Name";
    }
#M245B2 CHANGES START HERE
    INOUT MIR-PMT-CRCY-CD
    	     {
    	        
    	         Length = "2";
    	         SType = "Hidden";
    	         Label = "Currency";
    	     } 

#M245B2 CHANGES END HERE
}
