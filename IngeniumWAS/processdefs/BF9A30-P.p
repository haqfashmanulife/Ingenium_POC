# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A30-P.p                                                    *
#*  Description: Death Claim Final Approval                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAFA  CTS      Intial Version                                            *
#*  ABF405  CTS      FIX TO DISPLAY DECLINE REASON FIELD                       *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABF423  CTS      CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                *
#*                   PAYABLE AMOUNT                                            *
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *   
#*                   CLAIM PAYMENT DUE'                                        *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLES MIR-DLAY-INT-STRT-DT-T,       *
#*                   MIR-DCLM-DYS-BFR-PMT-DUE-T AND MIR-DLAY-INT-ARR-DUR-T     *   
#*                   IN ONE PLACE DUE TO DUPLICATE DECLARATION                 *
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      Foreign Currency Formatting                    *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting                    *
#*  M271A3  CTS      FRA DEATH CLAIMS CHANGES                                  *
#*  Q61687  CTS      FRA DEATH CLAIM FINAL APPROVAL SCREEN CHANGES             *
#*  M287C9  CTS      CHANGES AS PART OF CR9 PAYEE DETAILS                      *
#*  M319A7  CTS      CHANGES FOR FXWL DEATH CLAIM PROCESSING                   *
#*  Q89768  CTS      M319A7-CHANGES FOR SUM OF SUSPENSE DISPLAY                *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  105503  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  UY3054  CTS      DEATH CLAIM SETTLEMENT                                   **
#*  30711D  CTS      CHANGES DONE AS THE PART OF REFUND OF                    **
#*  30711D           UNEARNED PREMIUM PROJ-2025                               **
#*  RUP042  CTS      REFUND PROJ JIRA FIX                                     **
#*******************************************************************************

P-STEP BF9A30-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A30";
        BusinessFunctionName = "Death Claim Final Approval";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A30";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

      INOUT MIR-DV-PRCES-STATE-CD
         {
             Length = "1";
             DBTableName = "Derived";
             SType = "Hidden";
             Label = "process code";
         }
       INOUT MIR-CHK-ADJU-AMT
         {
             Length = "1";
         DBTableName = "Derived";
         SType = "Hidden";
             Label = "Decision Check";
        }  
        INOUT MIR-CHK-OTHR-AMT
         {
             Length = "1";
         DBTableName = "Derived";
         SType = "Hidden";
             Label = "Decision Check2";
         }                     
             
         INOUT MIR-CLM-ID
         {
             Key;
             Length = "8";
             DBTableName = "TDCLM";
             SType = "Text";
             Label = "Death Master Claim ID";
         }

          OUT MIR-POL-ID
          {
              Length = "10";
              DBTableName = "TDCLM";
              SType = "Text";
              Label = "Policy ID";

          }

          OUT MIR-INSRD-CLI-ID
          {
              Length = "10";
              DBTableName = "TDCLM";
              SType = "Text";
              Label = "Insured Client ID";
           }

          OUT MIR-DV-INS-CLI-NM

          {
              Length = "75";
              DBTableName = "Derived";
              SType = "Text";
              Label = "Insured Name";

          }
          OUT MIR-DV-INS-CLI-NM-1

          {
              Length = "75";
              DBTableName = "Derived";
              SType = "Text";
              Label = "Insured Kanji Name";
          }
        OUT MIR-CLI-BTH-DT
          {
              Length = "10";
              DBTableName = "TCLI";
              SType = "Date";
              Label = "Insured Date Of Birth";

          }

        OUT MIR-CLI-SEX-CD
         {
           Length = "40";
           CodeSource = "DataModel";
           CodeType = "CLI-SEX-CD";
           DBTableName = "TCLI";
           SType = "Text";
           Label = "Sex";

        }
       OUT MIR-CLM-HO-ACPT-DT
        {
           Length = "10";
           DBTableName = "TDCLM";
           SType = "Date";
           Label = "Head Office Acceptance Date";

        }
       OUT MIR-DCLM-CLM-STAT-CD 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";        
        SType = "Text";        
        Label = "Death Master Claim Status";
    }    
#Q61687  CHANGES STARTS
#        OUT MIR-PAYEE-NM-TXT-T[30]
#        {
#            Length = "50";
#            FieldGroup = "table3";
#            KeyColumn;
#            DBTableName = "Derived";
#            SType = "Text";
#            Label = "Payee";
#            Index = "1";
#        }
        OUT MIR-PAYEE-NM-TXT-T[20]
        {
            Length = "50";
            FieldGroup = "table3";
            KeyColumn;
            DBTableName = "Derived";
            SType = "Text";
            Label = "Payee";
            Index = "1";
        }
#Q61687  CHANGES ENDS  
# M287C9 CHANGES STARTS HERE
        OUT MIR-INDV-KA-SUR-NM-T[20]
        {
        MixedCase;
        Length = "25";
        FieldGroup = "table3";     
         Index = "1";        
        SType = "Text";
        Label = "Kana Last Name";
        DBTableName = "TDCRL";
        }

        OUT MIR-INDV-KA-GIV-NM-T[20]
        {
        MixedCase;
        Length = "25";
        FieldGroup = "table3";     
         Index = "1";          
        SType = "Text";
        Label = "Kana First Name";
        DBTableName = "TDCRL";
        } 
        OUT MIR-CO-KA-NM-T[20]
        {
        MixedCase;
        Length = "50";
        FieldGroup = "table3";     
         Index = "1";          
        SType = "Text";
        Label = "Company Kana Name";
        DBTableName = "TDCRL";
        }
        OUT MIR-PAYEE-CLI-SEX-CD-T[20]
        {
        Length = "40";
        FieldGroup = "table3";     
         Index = "1";          
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        DBTableName = "TDCRL";
        }
        OUT MIR-PAYEE-CLI-BTH-DT-T[20]
        {
        Length = "10";
         FieldGroup = "table3";     
         Index = "1";         
        SType = "Date";
        Label = "Birth Date";
        DBTableName = "TDCRL";
        } 
    
# M287C9 CHANGES ENDS HERE 

        OUT MIR-RO-ID
        {
            Length = "5";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "RO";
         }
         OUT MIR-SO-ID
         {
             Length = "5";
             SType = "Text";
             Label = "SO";
             Index = "1";
         }

#M245Q2 CHANGES START HERE
      OUT MIR-PAYO-MTHD-CD 
      {
            Length = "18";
            CodeSource = "DataModel";
            CodeType = "PAYO-MTHD-CD";
            DisplayOnly;
            SType = "Text";
            Label = "Payout Method";         
      }  
    
      OUT MIR-PAYO-JPY-BNFT-CD 
      {
            Length = "12";
            CodeSource = "DataModel";
            CodeType = "PAYO-JPY-BNFT-CD";
            DisplayOnly;    
            SType = "Text";
            Label = "JPY Benefit Rider";                       
      }  
#M245Q2 CHANGES END HERE         
#M319A7 CHANGES START HERE
        
        OUT MIR-XCHNG-BASE-DT 
    {
         Length = "10";
         DisplayOnly;          
         SType = "Date";
         Label = "Exchange Base Date";       
        }  
        
#M319A7 CHANGES END HERE
#Q61687  CHANGES STARTS
#        OUT MIR-BNK-NM-T[30]
#        {
#            Length = "36";
#            FieldGroup = "table3";
#            DBTableName = "TBNKB";
#            SType = "Text";
#            Label = "Current Bank Name";
#            Index = "1";
#        }
#
#        OUT MIR-BNK-BR-NM-T[30]
#        {
#            Length = "36";
#            FieldGroup = "table3";
#            DBTableName = "TBNKB";
#            SType = "Text";
#            Label = "Current Branch Name";
#            Index = "1";
#        }
#
#
#        OUT MIR-ACCT-TYP-CD-T[30]
#        {
#             Length = "3";
#             FieldGroup = "table3";
#             DBTableName = "DCRL";
#             CodeSource = "EDIT";
#             CodeType = "FBACC";
#             SType = "Text";
#             Label = "Account Type";
#             Index = "1";
#        }
#        OUT MIR-DCRL-BNK-ACCT-ID-T[30]
#        {
#             Length = "7";
#             FieldGroup = "table3";
#             DBTableName = "DCRL";
#             SType = "Text";
#             Label = "Account Number";
#             Index = "1";
#        }
#
#        OUT MIR-DCRL-ACCT-HLDR-NM-T[30]
#        {
#            Length = "50";
#            FieldGroup = "table3";
#            DBTableName = "TDCRL";
#            Mandatory;
#            SType = "Text";
#            Label = "Account Holder Name";
#            Index = "1";
#        }
#        OUT MIR-DCRL-KJ-ADDR-TXT-T[30]
#        {
#            Length = "50";
#            FieldGroup = "table1";
#            DBTableName = "TDCRL";
#            SType = "Text";
#            Label = "Address";
#            Index = "1";
#        }
#
#        OUT MIR-DCRL-SAMAKATA-BU-TXT-T[30]
#        {
#            MixedCase;
#            Length = "72";
#            SType = "Text";
#            Label = "Samakata-bu";
#            Index = "1";
#            FieldGroup = "table1";
#        }
#
#        OUT MIR-DCRL-INSRD-REL-CD-T[30]
#        {
#            Length = "40";
#            FieldGroup = "Table3";
#            CodeSource = "EDIT";
#            CodeType = "CLMRL";
#            DBTableName = "TDCRL";
#            SType = "Selection";
#            Label = "Relation to Beneficiary";
#            Index = "1";
#        }
        
        
        
        
        OUT MIR-BNK-NM-T[20]
        {
            Length = "36";
            FieldGroup = "table3";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Bank Name";
            Index = "1";
        }

        OUT MIR-BNK-BR-NM-T[20]
        {
            Length = "36";
            FieldGroup = "table3";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Branch Name";
            Index = "1";
        }


        OUT MIR-ACCT-TYP-CD-T[20]
        {
             Length = "3";
             FieldGroup = "table3";
             DBTableName = "DCRL";
             CodeSource = "EDIT";
             CodeType = "FBACC";
             SType = "Text";
             Label = "Account Type";
             Index = "1";
        }
        OUT MIR-DCRL-BNK-ACCT-ID-T[20]
        {
             Length = "7";
             FieldGroup = "table3";
             DBTableName = "DCRL";
             SType = "Text";
             Label = "Account Number";
             Index = "1";
        }

        OUT MIR-DCRL-ACCT-HLDR-NM-T[20]
        {
            Length = "50";
            FieldGroup = "table3";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Account Holder Name";
            Index = "1";
        }
        OUT MIR-DCRL-KJ-ADDR-TXT-T[20]
        {
            Length = "50";
            FieldGroup = "table1";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Address";
            Index = "1";
        }

        OUT MIR-DCRL-SAMAKATA-BU-TXT-T[20]
        {
            MixedCase;
            Length = "72";
            SType = "Text";
            Label = "Samakata-bu";
            Index = "1";
            FieldGroup = "table1";
        }

        OUT MIR-DCRL-INSRD-REL-CD-T[20]
        {
            Length = "40";
            FieldGroup = "Table3";
            CodeSource = "EDIT";
            CodeType = "CLMRL";
            DBTableName = "TDCRL";
            SType = "Selection";
            Label = "Relation to Beneficiary";
            Index = "1";
        }        

#Q61687  CHANGES ENDS
        OUT MIR-POL-ID-1-T[30]
         {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Policy ID"; 
            Index = "1";
          }
#Q61687  CHANGES STARTS          
#        OUT MIR-DCRL-PAYE-STAT-CD-T[30]
#        {
#            Length = "1";
#            FieldGroup = "table1";
#            CodeSource = "DataModel";
#            CodeType = "DCRL-PAYE-STAT-CD";
#            DBTableName = "TDCRL";
#            SType = "Text";
#            Label = "Payee Status";
#            Index = "1";
#        }
        OUT MIR-DCRL-PAYE-STAT-CD-T[20]
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
#Q61687  CHANGES ENDS
        OUT MIR-CVG-NUM-T[30]
        {
            Length = "2";
            FieldGroup = "Table2";
            DBTableName = "TDCBD";
            SType = "Text";
            Label = "Coverage Number";
            Index = "1";
        }
           

        OUT MIR-PLAN-ID-T[30]
        {
            FieldGroup = "Table2";
            Length = "6";
            CodeSource = "EDIT";
            CodeType = "PLAN";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Rider Name:";
            Index = "1";
        }
        OUT MIR-CVG-ISS-EFF-DT-T[30]
        {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Date";
            Label = "Issue Effective Date";
            Index = "1";
        }

        OUT MIR-CVG-MAT-XPRY-DT-T[30]
        {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Date";
            Label = "Coverage Maturity/Expiry Date";
            Index = "1";
        }

        OUT MIR-CVG-CSTAT-CD-T[30]
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

        OUT MIR-CVG-SUB-STAT-CD-T[30]
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

        OUT MIR-CVG-FACE-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table2";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Face Amount";
            Index = "1";
        }

        OUT MIR-BNFT-NM-ID-T[30]
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

        OUT MIR-CLM-ADJC-AMT-T[30]
        {
            Signed;
            Length = "15";
            FieldGroup = "Table2";
            DBTableName = "TDCBD";
            SType = "Currency";
            Label = "Amount for Adjudication";
            Index = "1";
         }
# ABF423 The attribute Signed is added
         
         OUT MIR-CLM-PAYBL-AMT-T[30]
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
         OUT MIR-DV-CLM-PAYBL-JPY-AMT-T[30]
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
         OUT MIR-CLM-OTHR-RFND-AMT-T[30]
         {
             Length = "15";
             FieldGroup = "Table2";
             DBTableName = "TCBD";
             SType = "Currency";
             Label = "Other Refund Amount";
             Index = "1";
         }

          OUT MIR-CLM-STAT-CD-T[30]
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

        OUT MIR-PAYEE-NM-TXT-1-T[30]
         {
             FieldGroup = "Table2";
             Index = "1";
             KeyColumn;
             Label = "Payee Name";
             Length = "50";
             SType = "Text";
         }
        OUT MIR-FINAL-DECID-CD-T[30]
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
        OUT MIR-BNFT-DECID-CD-T[30]
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

# ABF405 CHANGES START HERE
        OUT MIR-BNFT-DCLN-REASN-CD-T[30]
        {
               Length = "2";
               FieldGroup = "Table2";
               CodeSource = "DataModel";
               CodeType = "BNFT-DCLN-REASN-CD";
               DBTableName = "TDCBD";
               SType = "Text";
               Label = "Decline Reason";
               Index = "1";
         }
# ABF405 CHANGES END HERE
             
         OUT MIR-FINAL-APP-DT-T[30]
         {
            Length = "10";
            FieldGroup = "Table2";
            DBTableName = "TDCBD";
            SType = "Date";
            Label = "Final Approval Date";
            Index = "1";
         }                  
     
         
        OUT MIR-POL-ID-2-T[30]
         {
            Length = "10";
            FieldGroup = "Table1";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Policy ID"; 
            Index = "1";
            
         }
       
       OUT MIR-JOURNAL-DT-T[30]
         {
            Length = "10";
            FieldGroup = "Table1";
            DBTableName = "TDCBD";
            SType = "Date";
            Label = "Journal Date";
            Index = "1";
         }                          
        OUT MIR-DTH-MTHLY-BNFT-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table4";
            SType = "Currency";
            Label = "Amount to be Paid";
            Index = "1";
        }
# ABF423 The attribute Signed is added
          
        OUT MIR-CLM-PAYBL-AMT-1-T[30]
         {
           Signed;
           Length = "15";
              FieldGroup = "Table9";
              DBTableName = "TCBD";
              SType = "Currency";
              Label = "Payment Amount";
              Index = "1";
         }          
 
        OUT MIR-PREM-DED-AMT-T[30]
         {
             
             Length = "11";
             FieldGroup = "Table1";
             DBTableName = "TCLPS";
             SType = "Currency";
             Label = "Premium Deducted";
             Index = "1";
          }
#M245Q2  CHANGES START HERE       
       OUT MIR-CLM-JPY-XCHNG-RT-T[30]
       {
           Signed;
           Length = "18";
           FieldGroup = "Table1";           
           SType = "Text";
              DBTableName = "TCXRT";
              Label = "Exchange Rate to JPY";
              Index = "1";
       }
#M245Q2  CHANGES END HERE 
#30711D CHANGES START HERE	
#30711D           OUT MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]   
        OUT MIR-DV-CLM-PAYMNT-JPY-AMT-T[30]
         {
           Signed;
           Length = "15";
              FieldGroup = "Table9";
           FieldGroup = "Table1";                         
              DBTableName = "Derived";
              SType = "Currency";
              Label = "Payment Amount";
              Index = "1";
         }
#30711D  CHANGES END HERE	
#RUP042 CHANGES START HERE	
        OUT MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]   
         {
           Signed;
           Length = "15";
              FieldGroup = "Table9";
           FieldGroup = "Table1";                         
              DBTableName = "Derived";
              SType = "Currency";
              Label = "Payment Amount";
              Index = "1";
         }
#RUP042  CHANGES END HERE		 	 
         
# ISLCLM CHANGES START         
        OUT MIR-DCLM-DYS-BFR-PMT-DUE-T[30]
        {
       Length = "03";
           CodeSource = "DataModel";
           CodeType = "DYS-BFR-PMT-DUE";
       SType = "Text";
       FieldGroup = "Table1";
           Label = "Days Before Claim Payment Due";
       Index = "1";               
    }
    
        OUT MIR-DLAY-INT-STRT-DT-T[30] 
    {
           DisplayOnly;
       Length = "10"; 
       FieldGroup = "Table1";
       Index = "1";
       SType = "Date";
       Label = "Delay Interest Calc. Start Date";
    }

    OUT MIR-DLAY-INT-ARR-DUR-T[30] 
    {
       DisplayOnly;
       Length = "4";
           FieldGroup = "Table1";
       Index = "1";
       SType = "Text";
       Label = "Number of Days to Delay Interest";
    }
#ISLCLM CHANGES END          
          
         OUT MIR-DLAY-INT-AMT-T[30]
         {
             Length = "15";
             FieldGroup = "Table1";
             DBTableName = "TCBD";
             SType = "Currency";
             Label = "Interest Paid";
             Index = "1";
         }

# ABF419 CHANGES START HERE         
         OUT MIR-PREM-SUSP-AMT-T[30]
          {
            Length = "15";
            FieldGroup = "Table1";
            SType = "Currency";
            Label = "Sum of Suspense";
            Index = "1";
          }
# ABF419 CHANGES ENDS HERE  

        OUT MIR-BNFT-ADDL-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table5";
            SType = "Currency";
            Label = "Amount to be Added";
            Index = "1";
        }
        OUT MIR-BNFT-DED-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table5";
            SType = "Currency";
            Label = "Amount to be Added";
            Index = "1";
        }        
        OUT MIR-LN-TC-PREM-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table6";
          SType = "Currency";
          Label = "Living Needs/Terminal Care Amount";
          Index = "1";
        }
# ABF423 The attribute Signed is added         
       OUT MIR-REMIT-AMT-T[30]
        {
            Signed;
            Length = "15";
            FieldGroup = "Table1";
            DBTableName = "TCBD";
            SType = "Currency";
            Label = "Adjusted Payment Amount";
            Index = "1";
        }          
        
#Q61687 CHANGES START
#        OUT MIR-DCRL-SEND-PMT-NOTI-IND-T[30]
#        {
#            Length = "1";
#            FieldGroup = "Table4";
#            DBTableName = "TDCRL";
#            SType = "Indicator";
#            Label = "Send Payment Notice";
#            Index = "1";
#         }
        OUT MIR-DCRL-SEND-PMT-NOTI-IND-T[20]
        {
            Length = "1";
            FieldGroup = "Table4";
            DBTableName = "TDCRL";
            SType = "Indicator";
            Label = "Send Payment Notice";
            Index = "1";
         }         
#Q61687 CHANGES ENDS         
        OUT MIR-OTHR-RFND-AMT-T[30]
        {
            Length = "15";
            FieldGroup = "Table8";
            SType = "Currency";
            Label = "Other Refund Amount";
            Index = "1";
        }
  
          OUT MIR-PREV-UPDT-USER-ID-T[30]
      {
            Length = "8";
            FieldGroup = "Table4";
            SType = "Text";
            Label = "Last Update User ID";
            Index = "1";
       }
             OUT MIR-PREV-UPDT-DT-T[30]
      {
                Length = "10";
          FieldGroup = "Table4";
          DBTableName = "TDCRL";
          SType = "Date";
          Label = "Payee Previous Update Date";
          Index = "1";
      } 
#EN9547 CHANGES START       
#       OUT MIR-DLAY-INT-STRT-DT-T[30]
#       {
#           Length = "10";
#           FieldGroup = "Table9";
#           DBTableName = "TDCBD";
#           SType = "Date";
#           Label = "Delay Interest Start Date";
#           Index = "1";
#       }
#
#
#ISLCLM CHANGES START    
#          OUT MIR-DCLM-DYS-BFR-PMT-DUE-T[30]
#          {
#              Length = "03";
#              FieldGroup = "Table9";
#              CodeSource = "DataModel";
#              CodeType = "DYS-BFR-PMT-DUE";
#              DBTableName = "TDCBD";
#              SType = "Selection";
#              Label = "Days Before Claim Payment Due";
#              Index = "1";
#           }
#           
#ISLCLM CHANGES END   
#
#       OUT MIR-DLAY-INT-ARR-DUR-T[30]
#       {
#           Length = "4";
#           FieldGroup = "Table9";
#           DBTableName = "TDCBD";
#           SType = "Date";
#           Label = "Number of Days of delay Interest";
#           Index = "1";
#       }
#EN9547 CHANGES END   
 #M166P3 CHANGES STARTS HERE
       
       OUT MIR-DV-CSH-LOAN-BAL-T[30]
           {
               Signed;
               Length = "15";
               FieldGroup = "Table10";
               DBTableName = "Derived";
               SType = "Currency";
               Label = "Cash Loan Balance";
           }
           
             
        OUT MIR-DV-APL-BAL-AMT-T[30]
           {
               Signed;
               Length = "15";
               FieldGroup = "Table11";
               DBTableName = "Derived";
               SType = "Currency";
               Label = "APL  Balance";
           } 
           
   #M166P3 CHANGES ENDS  HERE
   
#M271A3 CHANGES STARTS HERE
    OUT MIR-PREM-RFND-AMT-T[30] 
    {
            DisplayOnly;
        FieldGroup = "Table13";
        Index = "1";
        Label = "Premium Refund Amount:";
        Length = "15";
        SType = "Currency";
        }        
    
    OUT MIR-PREM-RFND-DLAY-INT-DUR-T[30] 
    {
        DisplayOnly;
        FieldGroup = "Table13";
        Index = "1";
        Label = "Number of Days of Delay Interest:";
        Length = "4";
        SType = "Date";
    }

    OUT MIR-PREM-RFND-DLAY-INT-AMT-T[30] 
    {
            DisplayOnly;
        FieldGroup = "Table13";
        Index = "1";
        Label = "Delay Interest Amount:";
        Length = "15";
        SType = "Currency";
    }
    OUT MIR-DV-PREM-RFND-REMIT-AMT-T[30] 
    {
            DisplayOnly;
        FieldGroup = "Table13";
        Index = "1";
        Label = "Remittance Amount:";
        Length = "15";
        SType = "Currency";
    }

        OUT MIR-PMT-CRCY-CD
        {
                Length = "2";           
                SType = "Hidden";
                Label = "Currency";
        }    
    
    
#M271A3 CHANGES END HERE
#Q89768 CHANGES START

        OUT MIR-SUSP-CRCY-CD
        {
                Length = "2";           
                SType = "Hidden";
                Label = "Currency";
        }

#Q89768 CHANGES END
#Q61687 CHANGES START

        OUT MIR-BNK-NM-1-T[20]
        {
            Length = "36";
            FieldGroup = "table3";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Bank Name";
            Index = "1";
        }

        OUT MIR-BNK-BR-NM-1-T[20]
        {
            Length = "36";
            FieldGroup = "table3";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Branch Name";
            Index = "1";
        }


        OUT MIR-ACCT-TYP-CD-1-T[20]
        {
             Length = "3";
             FieldGroup = "table3";
             DBTableName = "DCRL";
             CodeSource = "EDIT";
             CodeType = "FBACC";
             SType = "Text";
             Label = "Account Type";
             Index = "1";
        }
        OUT MIR-DCRL-BNK-ACCT-ID-1-T[20]
        {
             Length = "7";
             FieldGroup = "table3";
             DBTableName = "DCRL";
             SType = "Text";
             Label = "Account Number";
             Index = "1";
        }

        OUT MIR-DCRL-ACCT-HLDR-NM-1-T[20]
        {
#105503 CHANGES STARTS HERE        
#            Length = "50";
            Length = "48";            
#105503 CHANGES ENDS HERE            
            FieldGroup = "table3";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Account Holder Name";
            Index = "1";
        }  
        
#Q61687 CHANGES END  
      
#CS0008 CHANGES STARTS HERE    
    OUT MIR-TRMN-NOTI-CD
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
#M245Q2 CHANGES START HERE             
          INOUT MIR-DISB-CRCY-CD
           {
              Length = "2";           
              SType = "Hidden";
              Label = "Currency";
    }
#M245Q2 CHANGES END HERE  

#M271O1 CHANGES START HERE      
    INOUT MIR-PREM-CRCY-CD
    {
                      
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }
#M271O1 CHANGES END HERE 

#UY3054 CHANGES START HERE 
     OUT  MIR-HLTH-CONG-BNFT-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Health Congratulatory Benefit";
     }
     OUT  MIR-VEST-DEFR-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Vesting deferred amount";
     }
     OUT  MIR-ACCUM-DIV-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Accumulated Dividend";
     }
     
     OUT  MIR-PAYO-VEST-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Payout vesting amount";
     }
     
     OUT  MIR-INCR-SURV-INS-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Increased surviving insurance amount";
     }
 
     OUT  MIR-TOT-DEFR-INS-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Total deferred insurance amount";
     }
     
     OUT  MIR-NON-ACCDNT-BNFT-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "No accident benefit";
     }
     
     OUT  MIR-OTHR-RFND-AMT
     {
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Other refund amount for Stream-3";
     }
     
     OUT MIR-OTHR-PAY-TOT-AMT
     {
       Length = "15";
       SType = "Currency";
       Label = "Other payment Amount total";
     }
         
# UY3054 CHANGES ENDS

}
