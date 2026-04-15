# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0942-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPFA  CTS      Added new field LumpSump amount MIR-POL-LS-PAYO-AMT       *
#*                   on Automatic Payout screen                                *
#*  IPMPPU  CTS      Automatic Payout Changes                                  *
#*  IPMPPA  CTS      Added MIR-TOT-MODE-PAYO-QTY and MIR-PAYO-ACUM-AMT         *
#*  MPCR01  CTS      Added 'One-Time Deduction' amount                         *
#*  IPMTX1  CTS      Added new fields Lumpsum Benefits MIR-LMPSM-BNFT-AMT      *
#*                   and Amount to Determine Withholding Tax                   *
#*                   MIR-WHTAX-DTRMN-AMT and  Modified                         *
#*                   MIR-PREM-APPR-IP-AMT,MIR-POL-XPNS-RATIO-PCT and           *
#*                   MIR-POL-PAYO-TAXWH-AMT  in                                *
#*                   Automatic Payout Update Screen                            *
#*  ISLIMP  CTS      REPLACED HO CLAIM ACCEPT DATE AND DOC COMPLETION DATE WITH*
#*                   COMPANY RECEIVED DATE AND COMPANY RECEIVED DATE(FINAL).   *
#*                   ALSO ADDED 1 NEW FIELD                                    *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  Q05003  CTS      MP113A - Added Annuity Fund Amount field                  *
#*  MP202A  CTS      ADDDED NEW FIELDS ANNUITY LUMPSUM PAYOUT                  *
#*                   AMOUNT AND APRAISAL VALUE PAYO AMOUNT                     *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M280Z1  CTS      ADDED RESERVE PAYO EFFECTIVE DATE(MIR-RSRV-PAYO-EFF-DT)   *
#*  MP280Y  CTS      CHANGES FOR WSAutoPayoUpdt.f webservice                   * 
#*  UY349C  CTS      CORPORATE ANNUITY                                         *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF0942-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0942";
        BusinessFunctionName = "Automatic Payout Processing Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM4300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDI-ALLOC-AMT-T[139]
    {
        Length = "17";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        DBTableName = "TCDSI";
        SType = "Selection";
        Label = "Allocation Basis";
        Index = "1";
    }

    INOUT MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        DBTableName = "TCDSI";
        SType = "Selection";
        Label = "Payout Method";
        Index = "1";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DEST-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    INOUT MIR-DEST-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TCDSI";
        SType = "Selection";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    INOUT MIR-DEST-POL-ID-BASE-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    INOUT MIR-DEST-POL-ID-SFX-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Suffix Receiving Money";
        Index = "1";
    }

    INOUT MIR-FND-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Fund";
    }

    INOUT MIR-PAYO-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Lead Time";
    }

    INOUT MIR-POL-PAYO-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    INOUT MIR-POL-LS-PAYO-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Lumpsum Payouts";
    }

    INOUT MIR-POL-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Efffective Date";
    }

    INOUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-POL-PAYO-MODE-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Payout Mode";
    }

    INOUT MIR-POL-PAYO-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }

    INOUT MIR-POL-PAYO-UNIT-QTY
    {
        Length = "18";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Payout Units";
    }

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

    IN MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TPOLP";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    OUT MIR-CDA-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Last Payment Date";
    }

    OUT MIR-DV-FND-DESC-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Description";
    }

    OUT MIR-DV-FND-DESC-TXT-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NXT-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Next Payout Date";
    }

    OUT MIR-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Payout Type";
    }

#  IPMPPU CTS  14AUG2007 Automatic Payout Changes
    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        DBTableName = "TCDSI";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }

#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-POL-PAYO-TAXWH-AMT
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

    INOUT MIR-TOT-PREM-PREV-POL-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Premium to Previous Policy";
    }

#  IPMTX1 CTS  12OCT2007 Automatic Payout Update Changes
#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
    INOUT MIR-PREM-APPR-IP-AMT
    {
        Length = "15";
        Decimals = "2";        
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Capital/Premium Paid to the Coverage";         
#        Label = "Premium Appropriated to IP Coverage";
    }

#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-POL-XPNS-RATIO-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Percent";
        Label = "Ratio of Expense";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-LMPSM-BNFT-AMT
    {
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Lumpsum Benefits";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-WHTAX-DTRMN-AMT
    {
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Amount to Determine Withholding Tax";
    }
        

    INOUT MIR-PMT-REASN-CD
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPOLP";
        CodeSource = "DataModel";
        CodeType = "PMT-REASN-CD";
        SType = "Selection";
        Label = "Payment Reason";
    }

# ISLIMP - Changes start here

#    INOUT MIR-CLM-DOC-CMPLT-DT
#    {
#        Length = "10";
#        DBTableName = "TPOLP";
#        SType = "Date";
#        Label = "Claim Document Completion Date";
#    }

    INOUT MIR-CLM-FNL-CO-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }

#    INOUT MIR-HO-CLM-ACPT-DT
#    {
#        Length = "10";
#        DBTableName = "TPOLP";
#        SType = "Date";
#        Label = "Head Office Claim Form Acceptance Date";
#    }

    INOUT MIR-CLM-CO-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-CLM-DYS-BFR-PMT-DUE
    {
        Length = "03";
        DefaultConstant = "005";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Days before Claim Payment Due";
    }

# ISLIMP - Changes end here

    INOUT MIR-PAYO-PLAN-LEAD-DUR-T[139]
    {
        Length = "3";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Lead Time";
        Index = "1";
    }

    INOUT MIR-PAYO-PLAN-LEAD-MTHD-CD-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-LEAD-MTHD-CD";
        SType = "Selection";
        Label = "Lead Time Method";
        Index = "1";
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
      Label = "Bank Branch Name";
    }

    # Added for IPMPPA. Changes begins here
    INOUT MIR-TOT-MODE-PAYO-QTY
    {
        Length = "4";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total number of Modal Payouts";
    }

    INOUT MIR-PAYO-ACUM-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Accumulated Amount of payouts";
    }
    # IPMPPA changes ends here

    # MPCR01 changes start here
    INOUT MIR-ONE-TIME-DED-AMT
    {
        Length = "15";
      	SType = "Currency";
       	Label = "One-Time Deduction";
    }
    # MPCR01 changes end here

# MP113A CTS  10NOV2010 New Payout Plan Setup Changes      
    INOUT MIR-ASSUM-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "3";
        DBTableName = "TPOLP";
        SType = "Number";
        Label = "Assumed Interest Rate";
    } 
# MP113A - Q05003 
    INOUT MIR-ANTY-FND-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Number";
        Label = "Annuity Fund Amount";
    }        
# MP202A - CHANGES STARTS HERE 
    INOUT MIR-ANTY-LMPSM-PAYO-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Lump-sum payout amount on the annuitization date";
    }        

    INOUT MIR-APRS-VALU-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Appraisal value prescribed in Article 24";
    }        
 # MP202A - CHANGES END HERE    
 #M245B2 CHANGES START HERE 
    INOUT MIR-POL-CRCY-CD
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   }
#M245B2 CHANGES END HERE    
#M271O1 CHANGES START HERE    
    INOUT MIR-PREM-CRCY-CD
    {
                   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
#M280Z1 CHANGES STARTS HERE

    INOUT MIR-RSRV-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Payout Efffective Date Reserved";
    }
    
#M280Z1 CHANGES ENDS HERE    
#MP280Y CHANGES START HERE
    OUT MIR-DV-REMIT-DT
    {
                   
        Length = "10";
        SType = "Hidden";
        Label = "Remmittance Date";
    }
    OUT MIR-DV-NET-PAYO-AMT
    {
                   
        Length = "15";
        SType = "Hidden";
        Label = "Net Payment Amount";
    }
#MP280Y CHANGES ENDS HERE  
#UY3049 CHANGES START HERE
    INOUT MIR-WEB-SERV-CALL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Web Service Indicator";
    }
    INOUT MIR-WEB-POST-ACD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Post ACD Indicator";
    }
    OUT MIR-WEB-NET-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Net Payment Amount";
    } 
    OUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
     }
#UY3049 CHANGES ENDS HERE

# UY349C CHANGES STARTS 

    INOUT MIR-XIST-CHK-CMPLT-IND 
    {
        Length = "1";
        DBTableName = "TPOLP";        
        SType = "Indicator";
        Label = "Existence Check Completed?";
    }

    INOUT MIR-AUTO-REMIT-IND
    {
        Length = "1";
        DBTableName = "TPOLP";        
        SType = "Indicator";
        Label = "Auto Remittance";
    }

    INOUT MIR-DIV-OPT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Dividend Code";
    }

    INOUT MIR-BASIC-ANTY-AMT
    {
        DBTableName = "TPOLP";		
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }
     
    INOUT MIR-ADDL-ANTY-AMT
    {
        DBTableName = "TPOLP";		
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
# UY349C CHANGES ENDS 
#UY3049 CHANGES STARTS
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
 }
