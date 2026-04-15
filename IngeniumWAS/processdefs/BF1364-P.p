# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF1364-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00288  PH1      Change label of MIR-APPL-CTL-PRCES-DT                     *
#*  M319A3  CTS      FXWL 3DD WAIVER CHANGES                                   *
#*  Q91588  CTS      FIX FOR FXWL WAIVER CHANGES                               *
#*  Q91714  CTS      FIX FOR FXWL WAIVER VIRTUAL UNDO CHANGES                  *
#*  MPC115  CTS      DELAY INTEREST CALCULATION FOR FXWL WAIVER CHANGES        *
#*  UY3146  CTS      ADDED NEW FIELD IN WAIVER SCREEN                          *
#*******************************************************************************

P-STEP BF1364-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1364";
        BusinessFunctionName = "Service Transaction - Put on Waiver";
        BusinessFunctionType = "Waiver";
        MirName = "CCWM0661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-WP-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WP-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Waiver Type";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    
 #M319A3 CHANGES START HERE
 
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
        {
                Length = "1";
                CodeSource = "DataModel";
#Q91588 CHANGES START HERE
                #CodeType = "DV-TRNXT-PAYO-MTHD-CD";
                CodeType = "DV-PAYO-MTHD-CD";
#Q91588 CHANGES END HERE
                DBTableName = "Derived";
                SType = "Selection";
                Label = "Pay Out Method";
        }
         
        INOUT MIR-DV-HO-RECV-DT
        {
                Length = "10";
                SType = "Date";
                Label = "Head Office Received Date";
        }
         
        INOUT MIR-DV-PAYO-JPY-BNFT-CD
        {
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "PAYO-JPY-BNFT-CD";
            SType = "Selection";
            Label = "JPY Benefit Rider";
        }
         
        OUT MIR-UNEARN-PREM-AMT
        {
            Signed;
            Length = "20";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Unearned Premium";
        }
         
        OUT MIR-OVR-SHRT-PREM-AMT
        {
             Signed;
             Length = "20";
             DBTableName = "TPOL";
             SType = "Currency";
             Label = "Excess/Shortage in Premium";
         }
         
        OUT MIR-POL-BT-SUSP-AMT 
        {
            Signed;
            Length = "20";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Bank Transfer Suspense";
        }
         
        OUT MIR-POL-PD-SUSP-AMT
        {
            Signed;
            Length = "20";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Payroll Deduction Suspense";
        }
         
        OUT MIR-POL-CC-SUSP-AMT
        {
            Signed;
            Length = "20";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Cash Collection Suspense";
        }
     #UY3146 CHANGES START HERE    
        OUT MIR-POL-CNVR-BAL-AMT
        {
            Signed;
            Length = "20";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Converted Balance Payout Amount";
        }
     #UY3146 CHANGES END HERE
         
        OUT MIR-TOT-PAYOUT-AMT
        { 
            
            DBTableName = "Derived";
            SType = "Currency";
            Label = "Total Payout amount";
        }  
         
        INOUT MIR-PAYE-CLI-FRST-NM 
        {
            Length = "25";
            SType = "Text";
            Label = "Payee's First Name";
        }
        
        INOUT MIR-PAYE-CLI-LAST-NM 
        {
            Length = "25";
            SType = "Text";
            Label = "Payee's Last Name";
        }
        
        INOUT MIR-PAYE-CO-NM 
        {
            Length = "50";
            SType = "Text";
            Label = "Company Name";
        }
        
        INOUT MIR-CLI-ADDR-LOC-CD 
        {
            Length = "8";
            SType = "Text";
            Label = "Address Code";
        }
             
        INOUT MIR-CLI-PSTL-CD 
        {
            
            Length = "9";
            SType = "Text";
            Label = "Postal Code";
        }
           
        INOUT MIR-DV-CLI-ADDR 
        {
            
            Length = "50";
            SType = "Text";
            Label = "Kanji Address";
        }
        
        INOUT MIR-CLI-ADDR-ADDL-TXT
        {
            Length = "60";
            SType = "Text";
            Label = "Samakata-bu";
        }
         
        INOUT MIR-MRF-IND
        {
            Length = "1";
            SType = "Indicator";
            Label = "MRF Indicator";
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
    
        INOUT MIR-BNK-ID
        {
            Length = "4";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Bank Number";
        }
        
        INOUT MIR-BNK-BR-ID
        {
            Length = "5";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Branch Number";
        }
        
        INOUT MIR-BNK-ACCT-ID
        {
            Length = "17";
            DBTableName = "TBNKA";
            SType = "Text";
            Label = "Bank Account Number";
        }
        
        INOUT MIR-BNK-ACCT-HLDR-NM
        {
            Length = "50";
            DBTableName = "TBNKA";
            SType = "Text";
            Label = "Account Holder Name";
        }
        
        INOUT MIR-BNK-ACCT-TYP-CD
        {
            Length = "3";
            CodeSource = "EDIT";
            CodeType = "FBACC";
            DBTableName = "TCLRL";
            SType = "Selection";
            Label = "Account Type";
        }
        
        INOUT MIR-PMT-CRCY-CD
        {       
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
        } 
        
        INOUT MIR-POL-CRCY-CD
        {       
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
        }  
        
        INOUT MIR-PAYO-CRCY-CD
        {       
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
        }  
     
 #M319A3 CHANGES END HERE
 #Q91714 CHANGES START HERE
      INOUT MIR-DV-UNDO-VALID-CD
      {
            Length = "1";
            SType="Hidden";
      }
      
      INOUT MIR-DV-COMMIT-CD
      {
            Length = "1";
            SType="Hidden";
      }
 #Q91714 CHANGES END HERE
 #MPC115 CHANGES START HERE
       INOUT MIR-DLAY-INT-STRT-DT
     {
         Length = "10";
         SType = "Date";
         Label = "Delay Interest Calc. Start Date";
     }
 #MPC115 CHANGES END HERE   
}

