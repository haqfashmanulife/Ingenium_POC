# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0942-I.s                                                    *
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
#*  IPMTX1  CTS      Modified MIR-PREM-APPR-IP-AMT,MIR-POL-PAYO-TAXWH-AMT and  *
#*                   MIR-POL-XPNS-RATIO-PCT and Added new fields               *
#*                   Lumpsum Benefits MIR-LMPSM-BNFT-AMT and                   *
#*                   Amount to Determine Withholding Tax MIR-WHTAX-DTRMN-AMT   *
#*                   on Automatic Payout Update Screen                         *
#*  ABU108  CTS      Fix to display MIR-POL-PAYO-TAXWH-IND correctly           *
#*  ISLIMP  CTS      REPLACED HO CLAIM ACCEPT DATE AND DOC COMPLETION DATE WITH*
#*                   COMPANY RECEIVED DATE AND COMPANY RECEIVED DATE(FINAL).   *
#*                   ALSO ADDED 1 NEW FIELD                                    *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  Q05003  CTS      MP113A - Added Annuity Fund Amount field                  *
#*  MP202A  CTS      ADDDED NEW FIELDS ANNUITY LUMPSUM PAYOUT                  *
#*                   AMOUNT AND APRAISAL VALUE PAYO AMOUNT                     *
#*  M280Z1  CTS      ADDED RESERVE PAYO EFFECTIVE DATE(MIR-RSRV-PAYO-EFF-DT)   *
#*  UY3049  CTS      STREAM 3 ANNUITY CHANGES                                  *
#*  UY349C  CTS      CORPRATE ANNUITY                                          *
#*******************************************************************************

S-STEP BF0942-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-PAYO-END-DT";
        FocusFrame = "ContentFrame";
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
        SType = "Hidden";
    }

    INOUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-PAYO-LEAD-TIME-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Lead Time";
    }

    INOUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-POL-PAYO-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

#  IPMPPU CTS  14AUG2007 Automatic Payout Changes
    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
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
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

    INOUT MIR-TOT-PREM-PREV-POL-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Premium to Previous Policy";
    }

#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
    INOUT MIR-PREM-APPR-IP-AMT
    {
#        DisplayOnly;
        Length = "15";
        Decimals = "2";        
        SType = "Currency";
        Label = "Capital/Premium Paid to the Coverage";
#        Label = "Premium Appropriated to IP rider";
#        Label = "Premium Appropriated to IP Coverage";
    }

#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-POL-XPNS-RATIO-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Ratio of Expense";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-LMPSM-BNFT-AMT
    {
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Lumpsum Benefits";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    INOUT MIR-WHTAX-DTRMN-AMT
    {
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Amount to Determine Withholding Tax";
    }

    INOUT MIR-PMT-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PMT-REASN-CD";
        SType = "Selection";
        Label = "Payment Reason";
    }

# ISLIMP - Changes start here

#    INOUT MIR-CLM-DOC-CMPLT-DT
#    {
#        Length = "10";
#        SType = "Date";
#        Label = "Claim Document Completion Date";
#    }

    INOUT MIR-CLM-FNL-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }

#    INOUT MIR-HO-CLM-ACPT-DT
#    {
#        Length = "10";
#        SType = "Date";
#        Label = "Head Office Claim Form Acceptance Date";
#    }

    INOUT MIR-CLM-CO-RECV-DT
    {
        Length = "10";
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
        SType = "Text";
        Label = "Lead Time";
        Index = "1";
    }

    INOUT MIR-PAYO-PLAN-LEAD-MTHD-CD-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-LEAD-MTHD-CD";
        SType = "Selection";
        Label = "Lead Time Method";
        Index = "1";
    }

    IN MIR-BNK-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Branch Name";
    }

    IN MIR-CDI-ALLOC-AMT-T[139]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    IN MIR-CDI-ALLOC-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        SType = "Text";
        Label = "Allocation Basis";
        Index = "1";
    }

    INOUT MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Payout Method";
        Index = "1";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-CVG-NUM-T[139]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    IN MIR-DEST-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-BASE-T[139]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-SFX-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Suffix Receiving Money";
        Index = "1";
    }

    IN MIR-FND-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
    }

    IN MIR-POL-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    IN MIR-POL-LS-PAYO-AMT
    {
      DisplayOnly;
      Length = "15";
      SType = "Currency";
      Label = "Total Lumpsum Payouts";
    }

    IN MIR-POL-PAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Efffective Date";
    }

# MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
#    IN MIR-POL-PAYO-MODE-CD
    INOUT MIR-POL-PAYO-MODE-CD
    {
#        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
#        SType = "Text";        
        SType = "Selection";
        Label = "Payout Mode";
    }

#CHANGED FOR ABU108
#   IN MIR-POL-PAYO-TAXWH-IND
    INOUT MIR-POL-PAYO-TAXWH-IND
    {
#        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }
# ABU108 CHANGES ENDS

    IN MIR-POL-PAYO-UNIT-QTY
    {
        DisplayOnly;
        Length = "18";
        SType = "Text";
        Label = "Total Payout Units";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-PAYO-NUM
    {
        Key;
        DisplayOnly;
        Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-CDA-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    IN MIR-DV-FND-DESC-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Fund Description";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    IN MIR-POL-PAYO-NXT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payout Date";
    }

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Payout Type";
    }

    #Added for IPMPPA. Changes starts here
    INOUT MIR-TOT-MODE-PAYO-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total number of Modal Payouts";
    }

    INOUT MIR-PAYO-ACUM-AMT
    {
        DisplayOnly;
        Length = "15";
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
        SType = "Number";
        Label = "Assumed Interest Rate";
    } 

# MP113A - Q05003 Changes    
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

 # M280Z1 - CHANGES STARTS HERE 
     INOUT MIR-RSRV-PAYO-EFF-DT
     {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOLP";
        Label = "Payout Efffective Date Reserved";
    }
# M280Z1 - CHANGES ENDS HERE   
# UY3049 - ANNUITY TRANSITION

    IN MIR-GUAR-PERI
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Guarantee Period";
    } 
    IN MIR-ANUTNT-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Name of the Annuitant";
    } 
    IN MIR-INSRD-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Name of the Insured";
    }
    IN MIR-POL-ANTY-STAT-CD
    {
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";   
    }

    IN MIR-ANTY-PMT-PERI
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Annuity Payment Term";      
    }
    IN MIR-BASIC-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }
    INOUT MIR-ADDL-ANTY-AMT
    {
        Length = "15";
        Decimals = "2";		
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
    IN MIR-ADDL-CAP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Additional Capital Amount";
    }

# UY349C CHANGES STARTS

    INOUT MIR-XIST-CHK-CMPLT-IND 
    {
        Length = "1";
        SType = "Indicator";
        Label = "Existence Check Completed?";
    }

    INOUT MIR-AUTO-REMIT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Auto Remittance";
    }

    INOUT MIR-DIV-OPT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Selection";
        Label = "Dividend Code";
    }

# UY349C CHANGES ENDS	
}


