# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A32-P.p                                                    *
#*  Description: Death Claim Final Approval                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAFA  CTS      Intial Version                                            *
#*  ABF405  CTS      FIX TO DISPLAY DECLINE REASON FIELD                       *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *   
#*                   CLAIM PAYMENT DUE'                                        *
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  MP159A  CTS      PROMOTED IN WEBSERVICES STREAM FOR MP159                  *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      MP245 DEATH CLAIM CHANGES                                 *
#*  Q61569  CTS      M271O1 - FRA currency code changes			       *
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS              **
#*  M287C9  CTS      CHANGES AS PART OF CR9 PAYEE DETAILS                      *
#*  M319A7  CTS      CHANGES FOR FXWL DEATH CLAIM PROCESSING                   *
#*  M319O1  CTS      FXWL Foreign Currency Formatting                          * 
#*  Q89768  CTS      M319A7-CHANGES FOR SUM OF SUSPENSE DISPLAY                *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                      *
#*  CSCR02  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*  105596  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*******************************************************************************

P-STEP BF9A32-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A32";
        BusinessFunctionName = "Death Claim Final Approval";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A32";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

       IN MIR-DV-PRCES-STATE-CD
         {
             Length = "1";
             DBTableName = "Derived";
             SType = "Hidden";
             Label = "process code";
         }
         INOUT MIR-CLM-ID
         {
             Key;
             Length = "8";
             DBTableName = "TDCLM";
             SType = "Text";
             Label = "Death Master Claim ID";
         }

          INOUT MIR-POL-ID
          {
              Length = "10";
              DBTableName = "TDCLM";
              SType = "Text";
              Label = "Policy ID";

          }                    

          INOUT MIR-INSRD-CLI-ID
          {
              Length = "10";
              DBTableName = "TDCLM";
              SType = "Text";
              Label = "Insured Client ID";
           }

          INOUT MIR-DV-INS-CLI-NM

          {
              Length = "75";
              DBTableName = "Derived";
              SType = "Text";
              Label = "Insured Name";

          }
          INOUT MIR-DV-INS-CLI-NM-1

          {
              Length = "75";
              DBTableName = "Derived";
              SType = "Text";
              Label = "Insured Kanji Name";

          }
          INOUT MIR-CLI-BTH-DT
          {
              Length = "10";
              DBTableName = "TCLI";
              SType = "Date";
              Label = "Insured Date Of Birth";

          }

           INOUT MIR-CLI-SEX-CD
       {
           Length = "40";
           CodeSource = "DataModel";
           CodeType = "CLI-SEX-CD";
           DBTableName = "TCLI";
           SType = "Text";
           Label = "Sex";

       }
       INOUT MIR-CLM-HO-ACPT-DT
       {
           Length = "10";
           DBTableName = "TDCLM";
           SType = "Date";
           Label = "Head Office Acceptance Date";

       }
#M245Q2 CHANGES START HERE

       INOUT MIR-PAYO-MTHD-CD 
       {
           Length = "18";
           CodeSource = "DataModel";
           CodeType = "PAYO-MTHD-CD";
           DBTableName = "TDCBD";
           SType = "Text";
           Label = "Payout Method";  	
        }  
    
        INOUT MIR-PAYO-JPY-BNFT-CD 
        {
           Length = "12";
           CodeSource = "DataModel";
           CodeType = "PAYO-JPY-BNFT-CD";
           DBTableName = "TDCBD";
           SType = "Text";
           Label = "JPY Benefit Rider"; 	
        }  
#M245Q2 CHANGES END HERE       
#M319A7 CHANGES START HERE
        
        INOUT MIR-XCHNG-BASE-DT 
        {
             Length = "10";
             DisplayOnly;  	    
             SType = "Date";
             Label = "Exchange Base Date";   	
        }  
        
#M319A7 CHANGES END HERE
#M287C9 CHANGES START HERE
#        INOUT MIR-PAYEE-NM-TXT-T[30]
        INOUT MIR-PAYEE-NM-TXT-T[20]
#M287C9 CHANGES START HERE
        {
            Length = "50";
            FieldGroup = "table1";
            KeyColumn;
            DBTableName = "Derived";
            SType = "Text";
            Label = "Payee";
            Index = "1";
        }
        INOUT MIR-RO-ID
        {
            Length = "5";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "RO";
         }
         INOUT MIR-SO-ID
         {
             Length = "5";
             SType = "Text";
             Label = "SO";
             Index = "1";
   }
#M287C9 CHANGES START HERE
#        INOUT MIR-BNK-NM-T[30]
        INOUT MIR-BNK-NM-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "36";
            FieldGroup = "table1";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Bank Name";
            Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-BNK-BR-NM-T[30]
        INOUT MIR-BNK-BR-NM-T[20]
#M287C9 CHANGES END HERE        
        {
            Length = "36";
            FieldGroup = "table1";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Branch Name";
            Index = "1";
        }

#M287C9 CHANGES START HERE
#        INOUT MIR-ACCT-TYP-CD-T[30]
        INOUT MIR-ACCT-TYP-CD-T[20]
#M287C9 CHANGES END HERE        
        {
             Length = "3";
             FieldGroup = "table1";
             DBTableName = "DCRL";
             CodeSource = "EDIT";
             CodeType = "FBACC";
             SType = "Text";
             Label = "Account Type";
             Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-BNK-ACCT-ID-T[30]
        INOUT MIR-DCRL-BNK-ACCT-ID-T[20]
#M287C9 CHANGES END HERE
        {
             Length = "7";
             FieldGroup = "table1";
             DBTableName = "DCRL";
             SType = "Text";
             Label = "Account Number";
             Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-ACCT-HLDR-NM-T[30]
        INOUT MIR-DCRL-ACCT-HLDR-NM-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "50";
            FieldGroup = "table1";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Account Holder Name";
            Index = "1";
        }
#M287C9 CHANGES START HERE        
#        INOUT MIR-DCRL-KJ-ADDR-TXT-T[30]
        INOUT MIR-DCRL-KJ-ADDR-TXT-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "50";
            FieldGroup = "table1";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Address";
            Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-SAMAKATA-BU-TXT-T[30]
        INOUT MIR-DCRL-SAMAKATA-BU-TXT-T[20]
#M287C9 CHANGES END HERE
        {
            MixedCase;
            Length = "72";
            SType = "Text";
            Label = "Samakata-bu";
            Index = "1";
            FieldGroup = "table1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-SEND-PMT-NOTI-IND-T[30]
        INOUT MIR-DCRL-SEND-PMT-NOTI-IND-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "1";
            FieldGroup = "Table1";
            DBTableName = "TDCRL";
            SType = "Indicator";
            Label = "Send Notice";
            Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-INSRD-REL-CD-T[30]
        INOUT MIR-DCRL-INSRD-REL-CD-T[20]
#M287C9 CHANGES END HERE
 {
            Length = "40";
            FieldGroup = "Table1";
            CodeSource = "EDIT";
            CodeType = "CLMRL";
            DBTableName = "TDCRL";
            SType = "Selection";
            Label = "Relation to Beneficiary";
            Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-PAYE-STAT-CD-T[30]
        INOUT MIR-DCRL-PAYE-STAT-CD-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "1";
            FieldGroup = "table1";
            CodeSource = "DataModel";
            CodeType = "DCRL-PAYE-STAT-CD";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Payee Status";
            Index = "1";
        }
# M287C9 CHANGES STARTS HERE
    INOUT MIR-INDV-KA-SUR-NM-T[20]
    {
        MixedCase;
        FieldGroup = "table1";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Kana Last Name";
        DBTableName = "TDCRL";
    }

    INOUT MIR-INDV-KA-GIV-NM-T[20]
    {
        MixedCase;
        FieldGroup = "table1";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Kana First Name";
        DBTableName = "TDCRL";
    } 
    INOUT MIR-CO-KA-NM-T[20] 
    {
        MixedCase;
        FieldGroup = "table1";
        Index = "1";        
        Length = "50";
        SType = "Text";
        Label = "Company Kana Name";
        DBTableName = "TDCRL";
    }
    INOUT MIR-PAYEE-CLI-SEX-CD-T[20]
    {
        FieldGroup = "table1";
        Index = "1";
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        DBTableName = "TDCRL";
    }
    INOUT MIR-PAYEE-CLI-BTH-DT-T[20]
    {
        FieldGroup = "table1";
        Index = "1";
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
        DBTableName = "TDCRL";
    } 
    
# M287C9 CHANGES ENDS HERE    
        
#M271C9 CHANGES STARTS HERE
#M287C9 CHANGES START HERE
#        INOUT MIR-BNK-NM-1-T[30]
        INOUT MIR-BNK-NM-1-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "36";
            FieldGroup = "table1";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Bank Name";
            Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-BNK-BR-NM-1-T[30]
        INOUT MIR-BNK-BR-NM-1-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "36";
            FieldGroup = "table1";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Branch Name";
            Index = "1";
        }

#M287C9 CHANGES START HERE
#        INOUT MIR-ACCT-TYP-CD-1-T[30]
        INOUT MIR-ACCT-TYP-CD-1-T[20]
#M287C9 CHANGES END HERE
        {
             Length = "3";
             FieldGroup = "table1";
             DBTableName = "DCRL";
             CodeSource = "EDIT";
             CodeType = "FBACC";
             SType = "Text";
             Label = "Account Type";
             Index = "1";
        }
#M287C9 CHANGES START HERE        
#        INOUT MIR-DCRL-BNK-ACCT-ID-1-T[30]
        INOUT MIR-DCRL-BNK-ACCT-ID-1-T[20]
#M287C9 CHANGES END HERE        
        {
             Length = "7";
             FieldGroup = "table1";
             DBTableName = "DCRL";
             SType = "Text";
             Label = "Account Number";
             Index = "1";
        }
#M287C9 CHANGES START HERE
#        INOUT MIR-DCRL-ACCT-HLDR-NM-1-T[30]
        INOUT MIR-DCRL-ACCT-HLDR-NM-1-T[20]
#M287C9 CHANGES END HERE
        {
            Length = "50";
            FieldGroup = "table1";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Account Holder Name";
            Index = "1";
        }
#M271C9 CHANGES ENDS HERE
        INOUT MIR-CVG-NUM-T[30]
        {
            Length = "2";
            FieldGroup = "Table2";
            DBTableName = "TDCBD";
            SType = "Text";
            Label = "Coverage Number";
            Index = "1";
        }

        INOUT MIR-PLAN-ID-T[30]
        {
            FieldGroup = "Table2";
            Length = "6";
            CodeSource = "EDIT";
            CodeType = "PLAN";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Plan";
            Index = "1";
        }

        INOUT MIR-CVG-ISS-EFF-DT-T[30]
        {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Date";
            Label = "Issue Effective Date";
            Index = "1";
        }

        INOUT MIR-CVG-MAT-XPRY-DT-T[30]
        {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Date";
            Label = "Coverage Maturity/Expiry Date";
            Index = "1";
        }

        INOUT MIR-CVG-CSTAT-CD-T[30]
        {
            Length = "3";
            FieldGroup = "Table2";
            CodeSource = "DataModel";
            CodeType = "CVG-CSTAT-CD";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Coverage Status";
            Index = "1";
        }

        INOUT MIR-CVG-SUB-STAT-CD-T[30]
        {
            Length = "2";
            FieldGroup = "Table2";
            CodeSource = "EDIT";
            CodeType = "SUBSC";
            DBTableName = "TCVG";
            SType = "Selection";
            Label = "Coverage Sub Status";
            Index = "1";
        }

        INOUT MIR-CVG-FACE-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Face Amount";
            Index = "1";
        }

        INOUT MIR-BNFT-NM-ID-T[30]
        {
            Length = "5";
            FieldGroup = "Table2";
            CodeSource = "EDIT";
            CodeType = "BNNM";
            DBTableName = "TDCBD";
            SType = "Text";
            Label = "Benefit Name";
            Index = "1";
        }
# ABF423 The attribute Signed is added

        INOUT MIR-CLM-ADJC-AMT-T[30]
        {
            Signed;
            Length = "15";
            FieldGroup = "Table2";
            DBTableName = "TDCBD";
            SType = "Currency";
            Label = "Amount for Adjudication";
            Index = "1";
         }

         INOUT MIR-CLM-PAYBL-AMT-T[30]
         {
             Signed;
             Length = "15";
             FieldGroup = "Table2";
             DBTableName = "TCBD";
             SType = "Currency";
             Label = "Payable Amount";
             Index = "1";
         }
#M245Q2 CHANGES START HERE
         INOUT MIR-DV-CLM-PAYBL-JPY-AMT-T[30]
         {
             Signed;
             Length = "15";
             FieldGroup = "Table2";
             DBTableName = "Derived";
             SType = "Currency";
             Label = "Payable Amount(Converted to JPY)";
             Index = "1";
         }
#M245Q2 CHANGES END HERE

         INOUT MIR-CLM-OTHR-RFND-AMT-T[30]
         {
             Length = "15";
             FieldGroup = "Table2";
             DBTableName = "TCBD";
             SType = "Currency";
             Label = "Other Refund Amount";
             Index = "1";
         }

          INOUT MIR-CLM-STAT-CD-T[30]
          {
              Length = "40";
              FieldGroup = "Table2";
              CodeSource = "DataModel";
              CodeType = "CLM-STAT-CD";
              DBTableName = "TDCLM";
              SType = "Text";
              Label = "Death Master Claim Status";
              Index = "1";
          }

        INOUT MIR-PAYEE-NM-TXT-1-T[30]
         {
             FieldGroup = "Table2";
             Index = "1";
             KeyColumn;
             Label = "Payee Name";
             Length = "50";
             SType = "Text";
         }
        INOUT MIR-BNFT-DECID-CD-T[30]
         {
             Length = "2";
             FieldGroup = "Table2";
             CodeSource = "DataModel";
             CodeType = "BNFT-DECID-CD";
             DBTableName = "TDCBD";
             SType = "Selection";
             Label = "Decision";
             Index = "1";
         }
# ABF405 CHANGES DTART HERE
        INOUT MIR-BNFT-DCLN-REASN-CD-T[30]
        {
               Length = "2";
               FieldGroup = "Table2";
               CodeSource = "DataModel";
               CodeType = "BNFT-DCLN-REASN-CD";
               DBTableName = "TDCBD";
               SType = "Selection";
               Label = "Decline Reason";
               Index = "1";
         }
# ABF405 CHANGES END HERE         

        INOUT MIR-PREM-DED-AMT-T[30]
         {
             
             Length = "11";
             FieldGroup = "Table3";
             DBTableName = "TCLPS";
             SType = "Currency";
             Label = "Amount to Deduct";
             Index = "1";
         }
         
         
        INOUT MIR-DTH-MTHLY-BNFT-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table4";
            SType = "Currency";
            Label = "Amount to be Paid";
            Index = "1";
        }
        
        INOUT MIR-BNFT-ADDL-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table5";
            SType = "Currency";
            Label = "Amount to be Added";
            Index = "1";
        }
        INOUT MIR-BNFT-DED-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table5";
            SType = "Currency";
            Label = "Amount to be Deducted";
            Index = "1";
        }        
        INOUT MIR-LN-TC-PREM-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table6";
          SType = "Currency";
          Label = "Living Needs/Terminal Care Amount";
          Index = "1";
        }

# ABF419 CHANGES START HERE       
        INOUT MIR-PREM-SUSP-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table7";
            SType = "Currency";
            Label = "Sum of Suspense";
            Index = "1";
        }
# ABF419 CHANGES ENDS HERE        
       
        INOUT MIR-OTHR-RFND-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table8";
            SType = "Currency";
            Label = "Other Refund Amount";
            Index = "1";
        }
 # ABF423 The attribute Signed is added
       
       INOUT MIR-CLM-PAYBL-AMT-1-T[30]
       {
           Signed;
           Length = "15";
       	   FieldGroup = "Table9";
       	   DBTableName = "TCBD";
       	   SType = "Currency";
       	   Label = "Net Payable Amount";
       	   Index = "1";
       }
#M245Q2  CHANGES START HERE       
       INOUT MIR-CLM-JPY-XCHNG-RT-T[30]
       {
           Signed;
           Length = "18";
       	   DBTableName = "TCXRT";
           Decimals = "9";
           SType = "Number";
       	   Label = "Exchange Rate to JPY";
       	   Index = "1";
       } 
       INOUT MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]
       {
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Net Payable Amount (In payout currency)";
           Index = "1";
       }       
#M245Q2  CHANGES END HERE       
       INOUT MIR-DLAY-INT-STRT-DT-T[30]
       {
           Length = "10";
           FieldGroup = "Table9";
           DBTableName = "TDCBD";
           SType = "Date";
           Label = "Delay Interest Start Date";
           Index = "1";
       }
#ISLCLM CHANGES START    
       INOUT MIR-DCLM-DYS-BFR-PMT-DUE-T[30]
       {
           Length = "03";
           FieldGroup = "Table9";
           CodeSource = "DataModel";
           CodeType = "DYS-BFR-PMT-DUE";
           DBTableName = "TDCBD";
           SType = "Selection";
           Label = "Days Before Claim Payment Due";
           Index = "1";
       }
           
#ISLCLM CHANGES END    	       
       
       INOUT MIR-DLAY-INT-ARR-DUR-T[30]
       {
           Length = "4";
           FieldGroup = "Table9";
           DBTableName = "TDCBD";
           SType = "Date";
           Label = "Number of Days of delay Interest";
           Index = "1";
       }
      INOUT MIR-DLAY-INT-AMT-T[30]
       {
           Length = "15";
           FieldGroup = "Table9";
           DBTableName = "TCBD";
           SType = "Currency";
           Label = "Delay Interest Amount";
           Index = "1";
       }
# ABF423 The attribute Signed is added       
      INOUT MIR-REMIT-AMT-T[30]
       {
            Signed;
            Length = "15";
            FieldGroup = "Table9";
            DBTableName = "TCBD";
            SType = "Currency";
            Label = "Net Payable Amount";
            Index = "1";
       }
 #M166P3 CHANGES STARTS HERE
           
        INOUT MIR-DV-CSH-LOAN-BAL-T[30]
            {
                   Signed;
                   Length = "15";
                   FieldGroup = "Table10";
                   DBTableName = "Derived";
                   SType = "Currency";
                   Label = "Cash Loan Balance";
            }
        
        INOUT MIR-DV-APL-BAL-AMT-T[30]
            {
                   Signed;
                   Length = "15";
                   FieldGroup = "Table11";
                   DBTableName = "Derived";
                   SType = "Currency";
                   Label = "APL  Balance";
            } 
               
   #M166P3 CHANGES ENDS  HERE
#CS0008 CHANGES STARTS HERE    
        INOUT MIR-TRMN-NOTI-CD
            {
              Length = "01";
              CodeSource = "DataModel";
              CodeType = "TRMN-NOTI-CD";
              DBTableName = "TDCBD";
              SType = "Text";
              Label = "Policy Continuation/Termination";
            }
        
#CS0008 CHANGES ENDS HERE
#M245B2 CHANGES START HERE    
      INOUT MIR-POL-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
    }
#M245B2 CHANGES END HERE    
#M245B2 CHANGES START HERE    
      INOUT MIR-DISB-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
    }
#M245B2 CHANGES END HERE  
#Q61569 CHANGES START HERE    
      INOUT MIR-PREM-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
    }
#Q61569 CHANGES END HERE
#M319O1 CHANGES START HERE      
     INOUT MIR-PMT-CRCY-CD
       {     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
    }
#M319O1 CHANGES END HERE  
#Q89768 CHANGES START HERE      
     INOUT MIR-SUSP-CRCY-CD
       {     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
    }
#Q89768 CHANGES END HERE 

# CSCR02 CHANGES START HERE
# 105596 CHANGES STARTS HERE
#    OUT MIR-REMIT-DT-T[30]
     INOUT MIR-REMIT-DT-T[30]
     { 
         Length = "10";
         FieldGroup = "Table9";
         DBTableName = "TFBNK";
         SType = "Date";
         Label = "Remittance Date";
         Index = "1";
     
     }
# 105596 CHANGES STARTS HERE
# CSCR02 CHANGES END HERE 
  }
