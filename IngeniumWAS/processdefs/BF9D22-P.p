# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9D22-P.p                                                    *
#*  Description: HEALTH CONGRATULATORY BENEFIT PAYOUT PROCESS-                 *
#*               CONFIRM TRANSACTION                                           *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

P-STEP BF9D22-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D22";
        BusinessFunctionName = "Health Congratulaory Benefit Payout Process";    
        BusinessFunctionType = "HEcngr";
        MirName = "CCWM9D22";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL"; 
        SType = "Text";
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }    

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner name"; 

    }
    INOUT MIR-APPL-CTL-PRCES-DT    
    {    
        Length = "10";    
        DBTableName = "TMAST";      
        SType = "Date";    
        Label = "Process Date";    
    }    

    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
    
    OUT MIR-HLBEN-EFF-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOL";
        Label = "Health Congratulatory Benefit Payout Effective Date";
    }
    
   OUT MIR-HLBEN-PAYO-AMT-A
   {
        Length = "20";
        SType = "Currency";
        Label = "This time's Health Congratulatory Benefit Payout Amount A";
   }
   
   OUT MIR-HLBEN-PAYO-AMT-B
   {
        Length = "20";
        SType = "Currency";
        Label = "This time's Health Congratulatory Benefit Payout Amount B";
   }
    
   OUT MIR-DEFR-HLBEN-PAYO-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Health Congratulatory Payout Amount";
    }
    
    OUT MIR-DEFR-INT-AMT
    {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Interest Amount";
    }
    
    OUT MIR-NET-PAYO-AMT
    {
        Length = "20";            
        SType = "Currency";
        Label = "Net Payout Amount";
    }

    OUT MIR-CLM-POL-ID-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Policy No";
        Index = "1";
    }
    
    OUT MIR-CLM-ID-T[99]
    {
        Length = "8";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Claim Id";
        Index = "1";
    }

    OUT MIR-CLM-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

    OUT MIR-BNFT-NM-T[99]
    {
        Length = "5";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
        CodeSource = "EDIT";
	CodeType = "BENNM";
    }

    OUT MIR-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "Start date";
        Index = "1";
    }

    OUT MIR-END-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "End date";
        Index = "1";
    }
    
    OUT MIR-EVNT-UNIT-QTY-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Paid Units";
        Index = "1";
    }
    
     OUT MIR-MULT-AMT-T[99]
    {
        Length = "7";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Multiplier";
        Index = "1";
    }

    OUT MIR-ELIG-DAYS-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Elligible days";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Face Amount at the end of 5 years";
        Index = "1";
    }

   INOUT MIR-PAYE-CLI-LAST-NM
   { 
        Label = "Payee's Last Name";
        Length = "25";
        SType = "Text";
   }
       
   INOUT MIR-PAYE-CLI-FRST-NM
   {
        Label = "Payee's First Name";
        Length = "25";
        SType = "Text";
   }
       
   INOUT MIR-PAYE-CO-NM
   {
        Label = "Company Name";
        Length = "50";
        SType = "Text";
   }
       
   INOUT MIR-CLI-ADDR-LOC-CD
   {
        Label = "Address Code";
        Length = "8";
        SType = "Text";
   }
       
   INOUT MIR-CLI-PSTL-CD
   {
        Label = "Postal Code";
        Length = "8";
        SType = "Text";
   }
       
   INOUT MIR-DV-CLI-ADDR
   { 
        Label = "Kanji Address";
        Length = "75";
        SType = "Text";
        DisplayOnly;
   }
       
   INOUT MIR-CLI-ADDR-ADDL-TXT
   {
        Label = "Samakata-bu";
        Length = "60";
        SType = "Text";
   }        
   
   INOUT MIR-BNK-ID
   {       
       Label = "Bank Number";
       Length = "4";
       SType = "Text";
   }
       
   OUT MIR-BNK-NM
   {        
       Label = "Bank Name";
       Length = "75";
       SType = "Text";
   } 
       
   INOUT MIR-BNK-BR-ID
   {       
        Label = "Branch Number";
        Length = "3";
        SType = "Text";
   }
       
   INOUT MIR-BNK-BR-NM
   {
        Label = "Branch Name";
        Length = "50";
        SType = "Text";
   }
       
   INOUT MIR-BNK-ACCT-TYP-CD
   {
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";
       SType = "Selection";
       Label = "Account Type";
   }
   
   INOUT MIR-BNK-ACCT-ID
   {
       Label = "Bank Account Number";
       Length = "17";
       SType = "Text";
   }
          
   INOUT MIR-BNK-ACCT-HLDR-NM
   {
       Label = "Account Holder Name";
       Length = "50";
       SType = "Text";
   }

}
