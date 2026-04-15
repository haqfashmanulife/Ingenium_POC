# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A30-O.s                                                    *
#*  Description: Death Claim Final Approval                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAFA  CTS      Intial Version                                            *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  ISLCLM  CTS      Added definition for new fields on final approval inquiry *
#*                   output screen                                             *
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      Foreign Currency Formatting                    *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS              **
#*  M287C9  CTS      CHANGES AS PART OF CR9 PAYEE DETAILS                      *
#*  M319A7  CTS      CHANGES FOR FXWL DEATH CLAIM PROCESSING                   *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  Q90721  CTS      M319A7 - FIX FOR SUM OF SUSPENSE DISPLAY                  *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  105503  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  UY3054  CTS      DEATH CLAIM SETTLEMENT                                   **
#*  30711D  CTS      CHANGES DONE AS THE PART OF REFUND OF                    **
#*  30711D           UNEARNED PREMIUM PROJ-2025                               **
#*  RUP042  CTS      REFUND PROJ JIRA FIX                                     **
#*******************************************************************************

S-STEP BF9A30-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
        Type = "Output";
    }

    IN Title;

    IN TitleBar;
    IN TitleBarSize;

    IN ButtonBar;
    IN ButtonBarSize;

    IN MessageFrame;
    IN MessageFrameSize;

    OUT action
    {
        SType="Hidden";
    }

    IN MIR-CLM-ID
    {
        DisplayOnly;
        Key;
        Label = "Death Master Claim ID";
        Length = "8";
        SType = "Text";
    }

    IN MIR-POL-ID
    {
        DisplayOnly;
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }

    IN MIR-INSRD-CLI-ID
    {
        DisplayOnly;
        Label = "Insured Client ID";
        Length = "10";
        SType = "Text";
    }

    IN MIR-DV-INS-CLI-NM
    {
        DisplayOnly;
        Label = "Insured Name";
        Length = "75";
        SType = "Text";
    }

    IN MIR-DV-INS-CLI-NM-1
    {
        DisplayOnly;
        Label = "Insured Kanji Name";
        Length = "75";
        SType = "Text";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Label = "Insured Date Of Birth";
        Length = "10";
        SType = "Date";
    }

    IN MIR-CLI-SEX-CD
    {
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DisplayOnly;
        Label = "Sex";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CLM-HO-ACPT-DT
    {
        DisplayOnly;
        Label = "Head Office Acceptance Date";
        Length = "10";
        SType = "Date";
    }
        IN MIR-RO-ID
    {
            Label = "RO:";
        Length = "5";
        SType = "Text";
    }

        IN MIR-DCLM-CLM-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
    }

    IN MIR-SO-ID
    {
            Label = "SO:";
        Length = "5";
        SType = "Text";
    }
#M245Q2 CHANGES START HERE
      IN MIR-PAYO-MTHD-CD
      {
            Length = "18";
            CodeSource = "DataModel";
            CodeType = "PAYO-MTHD-CD";
            DisplayOnly;
            SType = "Text";
            Label = "Payout Method";
      }

      IN MIR-PAYO-JPY-BNFT-CD
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

        IN MIR-XCHNG-BASE-DT
    {
         Length = "10";
         DisplayOnly;
         SType = "Date";
         Label = "Exchange Base Date";
        }

#M319A7 CHANGES END HERE
    IN MIR-PAYEE-NM-TXT-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        KeyColumn;
        Label = "Kanji Payee Name";
        Length = "50";
        SType = "Text";
    }

# M287C9 CHANGES STARTS HERE

    IN MIR-INDV-KA-SUR-NM-T[20]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-INDV-KA-GIV-NM-T[20]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-CO-KA-NM-T[20]

    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }
    IN MIR-PAYEE-CLI-SEX-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "table3";
        Index = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
    IN MIR-PAYEE-CLI-BTH-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "table3";
        Index = "1";
        SType = "Date";
        Label = "Birth Date";
    }
# M287C9 CHANGES ENDS HERE

    IN MIR-BNK-NM-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Bank Name";
        Length = "36";
        SType = "Text";
    }

    IN MIR-BNK-BR-NM-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Branch Name";
        Length = "36";
        SType = "Text";
    }

    IN MIR-ACCT-TYP-CD-T[30]
    {
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Type";
        Length = "3";
        SType = "Text";
    }

    IN MIR-DCRL-BNK-ACCT-ID-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Number";
        Length = "7";
        SType = "Text";
    }

    IN MIR-DCRL-ACCT-HLDR-NM-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Holder Name";
        Length = "50";
        SType = "Text";
    }

    IN MIR-DCRL-INSRD-REL-CD-T[30]
    {
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Relation to Beneficiary";
        Length = "40";
        SType = "Text";
    }
#M271C9 CHANGES STARTS HERE
    IN MIR-BNK-NM-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Bank Name";
        Length = "36";
        SType = "Text";
    }

    IN MIR-BNK-BR-NM-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Branch Name";
        Length = "36";
        SType = "Text";
    }

    IN MIR-ACCT-TYP-CD-1-T[30]
    {
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Type";
        Length = "3";
        SType = "Text";
    }

    IN MIR-DCRL-BNK-ACCT-ID-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Number";
        Length = "7";
        SType = "Text";
    }

    IN MIR-DCRL-ACCT-HLDR-NM-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Label = "Account Holder Name";
#105503 CHANGES STARTS HERE
#        Length = "50";
        Length = "48";
#105503 CHANGES ENDS HERE
        SType = "Text";
    }
#M271C9 CHANGES ENDS HERE
    IN MIR-POL-ID-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }

    IN MIR-PLAN-ID-T[30]
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Rider Name:";
        Length = "6";
        SType = "Text";
    }

    IN MIR-BNFT-NM-ID-T[30]
    {
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Benefit Name";
        Length = "5";
        SType = "Text";
    }

    IN MIR-CVG-NUM-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Coverage Id:";
        Length = "2";
        SType = "Text";
    }

    IN MIR-FINAL-DECID-CD-T[30]
    {
        CodeSource = "DataModel";
        CodeType = "BNFT-DECID-CD";
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Decision";
        Length = "2";
        SType = "Text";
    }

# ABF423 The attribute Signed is added

    IN MIR-CLM-PAYBL-AMT-T[30]
    {
    #M245B2 CHANGES START HERE
            CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE
            Signed;
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Payment Amount";
        Length = "15";
        SType = "Currency";
    }
#M245Q2 CHANGES START HERE
    IN  MIR-DV-CLM-PAYBL-JPY-AMT-T[30]
    {
        Signed;
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Payable Amount(Converted to JPY)";
        Index = "1";
    }
#M245Q2 CHANGES END HERE

    IN MIR-FINAL-APP-DT-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        Label = "Final Approval Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-PAYEE-NM-TXT-1-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table2";
        Index = "1";
        KeyColumn;
        Label = "Payee";
        Length = "50";
        SType = "Text";
    }

    IN MIR-POL-ID-2-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }


    IN MIR-JOURNAL-DT-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }
# ABF423 The attribute Signed is added

    IN MIR-CLM-PAYBL-AMT-1-T[30]
    {
    #M245B2 CHANGES START HERE
            CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE
            Signed;
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Payment Amount";
        Length = "15";
        SType = "Currency";
    }

    IN MIR-PREM-DED-AMT-T[30]
    {
    #M245B2 CHANGES START HERE
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Premium Deducted";
        Length = "11";
        SType = "Currency";
    }
#M245Q2  CHANGES START HERE
        IN MIR-CLM-JPY-XCHNG-RT-T[30]
        {
            Signed;
        DisplayOnly;
            Length = "18";
            Decimals ="9";
        FieldGroup = "Table1";
            SType = "Number";
            Label = "Exchange Rate to JPY";
            Index = "1";
        }
        IN MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]
        {
#Q90721  CHANGES START HERE
         CurrencyCode = "MIR-DISB-CRCY-CD";
#Q90721  CHANGES ENDS HERE
            Signed;
        DisplayOnly;
            Length = "15";
        FieldGroup = "Table1";
               SType = "Currency";
               Label = "Net Payable Amount (In payout currency)";
               Index = "1";
        }
	
#30711D  CHANGES STARTS HERE
        IN MIR-DV-CLM-PAYMNT-JPY-AMT-T[30]
        {
         CurrencyCode = "MIR-DISB-CRCY-CD";
            Signed;
        DisplayOnly;
            Length = "15";
        FieldGroup = "Table1";
               SType = "Currency";
#RUP042 CHANGES STARTS HERE	       
               Label = "Payment Amount (In payout currency)";
#RUP042 CHANGES ENDS HERE	       	       
               Index = "1";
        }
#30711D CHANGES ENDS HERE	
#M245Q2  CHANGES END HERE
# ISLCLM CHANGES START
        IN MIR-DCLM-DYS-BFR-PMT-DUE-T[30]
        {
        Length = "03";
                CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        SType = "Text";
        FieldGroup = "Table1";
        Label = "Days Before Claim Payment Due";
        Index = "1";
    }

        IN MIR-DLAY-INT-STRT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Date";
        Label = "Delay Interest Calc. Start Date";
    }

    IN MIR-DLAY-INT-ARR-DUR-T[30]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Number of Days to Delay Interest";
    }
#ISLCLM CHANGES END

    IN MIR-DLAY-INT-AMT-T[30]
    {
#M245Q2  CHANGES START HERE
    #M245B2 CHANGES START HERE
#            CurrencyCode = "MIR-POL-CRCY-CD";
             CurrencyCode = "MIR-DISB-CRCY-CD";
#M245B2 CHANGES END HERE
#M245Q2 CHANGES END HERE
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Interest Paid";
        Length = "15";
        SType = "Currency";
    }

# ABF419 CHANGES START HERE
    IN MIR-PREM-SUSP-AMT-T[30]
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE
     #CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
     #CurrencyCode = "MIR-PREM-CRCY-CD";
#Q90721 CHANGES START HERE
         #CurrencyCode = "MIR-PMT-CRCY-CD";
         CurrencyCode = "MIR-SUSP-CRCY-CD";
#Q90721 CHANGES END HERE
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE
#M245B2 CHANGES END HERE
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Sum of Suspense";
        Length = "15";
        SType = "Currency";
    }
# ABF419 CHANGES ENDS HERE
# ABF423 The attribute Signed is added

    IN MIR-REMIT-AMT-T[30]
    {
#M245Q2  CHANGES START HERE
    #M245B2 CHANGES START HERE
#            CurrencyCode = "MIR-POL-CRCY-CD"
            CurrencyCode = "MIR-DISB-CRCY-CD";
#M245B2 CHANGES END HERE
#M245Q2 CHANGES END HERE
            Signed;
        DisplayOnly;
        FieldGroup = "Table1";
        Index = "1";
        Label = "Adjusted Payment Amount";
        Length = "15";
        SType = "Currency";
    }



    IN MIR-DCRL-SEND-PMT-NOTI-IND-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table4";
        Index = "1";
        Label = "Send Payment Notice";
        Length = "1";
        SType = "Indicator";
    }

    IN MIR-DCRL-KJ-ADDR-TXT-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table4";
        Index = "1";
        Label = "Address Line 1";
        Length = "50";
        SType = "Text";
    }


    IN MIR-PREV-UPDT-USER-ID-T[30]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table4";
        Index = "1";
        Label = "Payee Previous Update User ID";
        Length = "8";
        SType = "Text";
    }

    IN MIR-PREV-UPDT-DT-T[30]
    {
        DisplayOnly;
        FieldGroup = "Table4";
        Index = "1";
        Label = "Payee Previous Update Date";
        Length = "10";
        SType = "Date";
    }

#M166P3 CHANGES STARTS HERE

        IN MIR-DV-CSH-LOAN-BAL-T[30]
         {
   #M245B2 CHANGES START HERE
           CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE
           Signed;
           Length = "15";
           FieldGroup = "Table10";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Cash Loan Balance";
         }


         IN MIR-DV-APL-BAL-AMT-T[30]
          {
   #M245B2 CHANGES START HERE
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE
           Signed;
           Length = "15";
           FieldGroup = "Table11";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "APL  Balance";
         }
#M166P3 CHANGES ENDS  HERE

#CS0008 CHANGES STARTS HERE
    IN MIR-TRMN-NOTI-CD
          {
           DisplayOnly;
           Length = "01";
           CodeType = "TRMN-NOTI-CD";
           CodeSource = "DataModel";
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
#M319O1 CHANGES START HERE
     INOUT MIR-PMT-CRCY-CD
      {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
      }
#M319O1 CHANGES END HERE
#Q90721 CHANGES START HERE
     INOUT MIR-SUSP-CRCY-CD
      {
          Length = "2";
      SType = "Hidden";
      Label = "Currency";
      }
#Q90721 CHANGES END HERE

#UY3054 CHANGES START HERE

     IN MIR-HLTH-CONG-BNFT-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Health Congratulatory Benefit";
     }

     IN MIR-NON-ACCDNT-BNFT-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "No accident benefit";
     }

     IN MIR-OTHR-RFND-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Other refund amount for Stream-3t";

     }

     IN MIR-OTHR-PAY-TOT-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Other payment Amount total";
     }

     IN MIR-PAYO-VEST-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Payout vesting amount";
     }
     IN MIR-INCR-SURV-INS-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Increased surviving insurance amount";
     }
     IN MIR-TOT-DEFR-INS-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Total deferred insurance amount";
     }
     IN MIR-ACCUM-DIV-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Accumulated Dividend";
     }
     IN MIR-VEST-DEFR-AMT
     {
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Length = "15";
       SType = "Currency";
       Label = "Vesting deferred amount";
     }

# UY3054 CHANGES ENDS
}
