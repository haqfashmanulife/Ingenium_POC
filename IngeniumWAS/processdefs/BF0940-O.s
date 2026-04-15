# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0940-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  5-0035  AC       Added MIR-POL-REQD-AMT                                    *
#*  IPMPFA  CTS      Added new field LumpSump amount MIR-POL-LS-PAYO-AMT       *
#*                   on Automatic Payout screen                                *
#*  IPMPPU  CTS      Added new fields for IPMP                                 *
#*  IPMPPA  CTS      Added MIR-PAYO-ACUM-AMT and MIR-TOT-MODE-PAYO-QTY         *
#*  MPCR01  CTS      Added 'One-Time Deduction' amount                         *
#*  IPMTX1  CTS      Added new fields Lumpsum Benefits MIR-LMPSM-BNFT-AMT      *
#*                   and Amount to Determine Withholding Tax                   *
#*                   MIR-WHTAX-DTRMN-AMT and Modified MIR-PREM-APPR-IP-AMT,    *
#*                   MIR-POL-XPNS-RATIO-PCT and MIR-POL-PAYO-TAXWH-AMT         *
#*                   in Automatic Payout Update Screen                         *
#*  ISLIMP  CTS      REPLACED HO CLAIM ACCEPT DATE AND DOC COMPLETION DATE WITH*
#*                   COMPANY RECEIVED DATE AND COMPANY RECEIVED DATE(FINAL).   *
#*                   ALSO ADDED 1 NEW FIELD                                    *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  Q05003  CTS      MP113A - Added Annuity Fund Amount field                  *
#*  MP202A  CTS      ADDDED NEW FIELDS ANNUITY LUMPSUM PAYOUT                  *
#*                   AMOUNT AND APRAISAL VALUE PAYO AMOUNT                     *
#*  C19481  CTS      PATHFINDER LOG FIX                                        *
#*  M280Z1  CTS       ADDED RESERVE PAYO EFFECTIVE DATE(MIR-RSRV-PAYO-EFF-DT)  *
#*  UY3049  CTS      ANNUITY PAYOUT                                            *   
#*  UCR244  CTS    CHANGES AS PART OF STREAM3                                  *
#*******************************************************************************

S-STEP BF0940-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    OUT index
    {
        SType = "Hidden";
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

    IN MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        SType = "Text";
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
        Label = "Suffix";
        Index = "1";
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

# IPMPPU
    IN MIR-PAYO-PLAN-LEAD-DUR-T[139]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Lead Time";
        Index = "1";
    }

    IN MIR-PAYO-PLAN-LEAD-MTHD-CD-T[139]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-LEAD-MTHD-CD";
        SType = "Text";
        Label = "Lead Time Method";
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

    IN MIR-PAYO-LEAD-TIME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Lead Time";
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

    IN MIR-POL-REQD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Requested Amount";
    }

    # Added for IPMPPA
    IN MIR-TOT-MODE-PAYO-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Number of Modal Payouts";
    }

    IN MIR-PAYO-ACUM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Amount of Payout";
    }
    # IPMPPA change ends here

    # MPCR01 changes start here
    INOUT MIR-ONE-TIME-DED-AMT
    {
        Length = "15";
      	SType = "Currency";
       	Label = "One-Time Deduction";
    }
    # MPCR01 changes end here

    IN MIR-POL-PAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Efffective Date";
    }

    IN MIR-POL-PAYO-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-POL-PAYO-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        SType = "Text";
        Label = "Payout Mode";
    }

    IN MIR-POL-PAYO-NXT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payout Date";
    }

    IN MIR-POL-PAYO-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-POL-PAYO-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
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

    IN MIR-POL-PAYO-UNIT-QTY
    {
        DisplayOnly;
        Length = "18";
        SType = "Text";
        Label = "Total Payout Units";
    }

# IPMPPU
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    IN MIR-POL-PAYO-TAXWH-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

# ISLIMP - Changes start here

#    IN MIR-CLM-DOC-CMPLT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        SType = "Date";
#        Label = "Claim Document Completion Date";
#    }

    IN MIR-CLM-FNL-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }
# ISLIMP - Changes end here

    IN MIR-PMT-REASN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PMT-REASN-CD";
        SType = "Text";
        Label = "Payment Reason";
    }

# ISLIMP - Changes start here

#    IN MIR-HO-CLM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        SType = "Date";
#        Label = "Head Office Claim Form Acceptance Date";
#    }

    IN MIR-CLM-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    IN MIR-CLM-DYS-BFR-PMT-DUE
    {
        DisplayOnly;
        Length = "03";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TPOLP";
# C19481 - Changes starts here
#        SType = "Selection";
        SType = "Text";        
# C19481 - Changes ends here
        Label = "Days before Claim Payment Due";
    }

# ISLIMP - Changes end here

    IN MIR-TOT-PREM-PREV-POL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Premium to Previous Policy";
    }

#  IPMTX1 CTS  12OCT2007 Automatic Payout Update Changes
#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
    IN MIR-PREM-APPR-IP-AMT
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
    IN MIR-POL-XPNS-RATIO-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Ratio of Expense";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    IN MIR-LMPSM-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Lumpsum Benefits";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    IN MIR-WHTAX-DTRMN-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Amount to Determine Withholding Tax";
    }
             
    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
    IN MIR-ASSUM-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Assumed Interest Rate";
    } 

#  MP113A - Q05003 Changes    
    IN MIR-ANTY-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        SType = "Number";
        Label = "Annuity Fund Amount";
    }        
  # MP202A - CHANGES STARTS HERE 
    IN MIR-ANTY-LMPSM-PAYO-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Lump-sum payout amount on the annuitization date";
    }        

    IN MIR-APRS-VALU-PAYO-AMT
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
     IN MIR-RSRV-PAYO-EFF-DT
     {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        DBTableName = "TPOLP";
        Label = "Payout Efffective Date Reserved";
    }
 # M280Z1 - CHANGES ENDS HERE    
#UY3049 CHANGES STARTS HERE 
   IN MIR-XIST-CHK-CMPLT-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Existence Check Completed";
    }
	
   IN MIR-AUTO-REMIT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Auto Remittance";
    }
    IN MIR-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Dividend Code";
    }    
#UY3049 CHANGES ENDS HERE 
# UY3049 - ANNUITY TRANSITION

    IN MIR-GUAR-PERI
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Guarantee Period";
    } 
    IN MIR-ANUTNT-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Name of the Annuitant";
    } 
    IN MIR-INSRD-NM
    {
        DisplayOnly;
        Length = "50";
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
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        DBTableName = "TCVG";
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
    IN MIR-ADDL-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        DBTableName = "TPOLP";
        Label = "Additional Annuity Amount";
    }
    IN MIR-ADDL-CAP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Additional Capital Amount";
    }

    IN MIR-BASIC-ANTY-AMT-T[15]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Basic Annuity Amount";
        Index = "1";
    }
    IN MIR-ADDL-ANTY-AMT-T[15]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Additional Annuity Amount";
        Index = "1";
    }   
#UCR244 CHANGES STARTS	
	IN MIR-TOT-INCR-ANTY-AMT-T[15]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Increased Annuity Amount";
        Index = "1";
    }
#UCR244 CHANGES ENDS
    IN MIR-TOT-ANTY-AMT-T[15]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Annuity Amount";
        Index = "1";
    }
    IN MIR-ANNV-DT-T[15]
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Anniversary Date";
    }
    IN MIR-PAYO-YEAR-T[15]
    {
        DisplayOnly;
        Length = "20";
        SType = "Date";
        Label = "Year";
    }
    IN MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    } 
    IN MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";
    }
    # UY3049 CHANGES STARTS    
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
    # UY3049 CHANGES ENDS
}

