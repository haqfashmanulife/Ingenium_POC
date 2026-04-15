# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0940-P.p                                                    *
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
#*  IPMPPA  CTS      Added two fields for IPMPPA                               *
#*  MPCR01  CTS      Added 'One-Time Deduction' amount                         *
#*  IPMTX1  CTS      Added new fields Lumpsum Benefits MIR-LMPSM-BNFT-AMT      *
#*                   and Amount to Determine Withholding Tax                   *
#*                   MIR-WHTAX-DTRMN-AMT and Modified MIR-POL-PAYO-TAXWH-AMT,  *
#*                   MIR-POL-XPNS-RATIO-PCT and MIR-PREM-APPR-IP-AMT           *
#*                   in Automatic Payout Update Screen                         *
#*  ISLIMP  CTS      REPLACED HO CLAIM ACCEPT DATE AND DOC COMPLETION DATE WITH*
#*                   COMPANY RECEIVED DATE AND COMPANY RECEIVED DATE(FINAL).   *
#*                   ALSO ADDED 1 NEW FIELD                                    *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  Q05003  CTS      MP113A - Added Annuity Fund Amount field                  *
#*  MP202A  CTS      ADDDED NEW FIELDS ANNUITY LUMPSUM PAYOUT                  *
#*                   AMOUNT AND APRAISAL VALUE PAYO AMOUNT                     *
#*  C19481  CTS      PATHFINDER LOG FIX                                        *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M280Z1  CTS      ADDED RESERVE PAYO EFFECTIVE DATE(MIR-RSRV-PAYO-EFF-DT)   *
#*  UY3049  CTS      ANNUITY PAYOUT                                            *
#*  UCR244  CTS    CHANGES AS PART OF STREAM3                                  *
#*******************************************************************************

P-STEP BF0940-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0940";
        BusinessFunctionName = "Automatic Payout Processing Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-CDI-ALLOC-AMT-T[139]
    {
        Length = "17";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Allocation Basis";
        Index = "1";
    }

    OUT MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Payout Method";
        Index = "1";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DEST-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    OUT MIR-DEST-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-BASE-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-SFX-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
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

# IPMPPU
    OUT MIR-PAYO-PLAN-LEAD-DUR-T[139]
    {
        Length = "3";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Lead Time";
        Index = "1";
    }

    OUT MIR-PAYO-PLAN-LEAD-MTHD-CD-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-LEAD-MTHD-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Lead Time Method";
        Index = "1";
    }

    OUT MIR-FND-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Fund";
    }

    OUT MIR-PAYO-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Lead Time";
    }

    OUT MIR-POL-PAYO-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    OUT MIR-POL-LS-PAYO-AMT
        {
            Length = "15";
            DBTableName = "TPOLP";
            SType = "Currency";
            Label = "Total Lumpsum Payouts";
      }

    OUT MIR-POL-REQD-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Requested Amount";
    }

    # Added for IPMPPA
    OUT MIR-TOT-MODE-PAYO-QTY
    {
        Length = "4";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Number of Modal Payouts";
    }

    OUT MIR-PAYO-ACUM-AMT
    {
        Length = "15";
        DBTableName = "POLP";
        SType = "Currency";
        Label = "Accumulated Amount of Payouts";
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

    OUT MIR-POL-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Efffective Date";
    }

    OUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "End Date";
    }

    OUT MIR-POL-PAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Mode";
    }

    OUT MIR-POL-PAYO-NXT-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Next Payout Date";
    }

    OUT MIR-POL-PAYO-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }

    OUT MIR-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Type";
    }

    OUT MIR-POL-PAYO-UNIT-QTY
    {
        Length = "18";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Payout Units";
    }

# IPMPPU
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    OUT MIR-POL-PAYO-TAXWH-AMT
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

# ISLIMP - Changes start here

#    OUT MIR-CLM-DOC-CMPLT-DT
#    {
#        Length = "10";
#        DBTableName = "TPOLP";
#        SType = "Date";
#        Label = "Claim Document Completion Date";
#    }

    OUT MIR-CLM-FNL-CO-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }
# ISLIMP - Changes end here

    OUT MIR-PMT-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PMT-REASN-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payment Reason";
    }

# ISLIMP - Changes start here

#    OUT MIR-HO-CLM-ACPT-DT
#    {
#        Length = "10";
#        DBTableName = "TPOLP";
#        SType = "Date";
#        Label = "Head Office Claim Form Acceptance Date";
#    }

    OUT MIR-CLM-CO-RECV-DT
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
# C19481 - Changes starts here
#        SType = "Selection";
        SType = "Text";        
# C19481 - Changes ends here
        Label = "Days before Claim Payment Due";
    }

# ISLIMP - Changes end here

    OUT MIR-TOT-PREM-PREV-POL-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Premium to Previous Policy";
    }

#  IPMTX1 CTS  12OCT2007 Automatic Payout Update Changes
#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes  
    OUT MIR-PREM-APPR-IP-AMT
    {
        DisplayOnly;    
        Length = "15";    
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Capital/Premium Paid to the Coverage";         
#        Label = "Premium Appropriated to IP Coverage";
    }

#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    OUT MIR-POL-XPNS-RATIO-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Percent";
        Label = "Ratio of Expense";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    OUT MIR-LMPSM-BNFT-AMT
    {
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Lumpsum Benefits";
    }
    
#  IPMTX1 CTS  10OCT2007 Automatic Payout Update Changes
    OUT MIR-WHTAX-DTRMN-AMT
    {
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Amount to Determine Withholding Tax";
    }
        
    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Holder Name";
    }
    
    INOUT MIR-DV-PAYO-UPDT-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Payout Process Indicator";
    }
    
#  MP113A CTS  10NOV2010 New Payout Plan Setup Changes      
    OUT MIR-ASSUM-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "3";
        DBTableName = "TPOLP";
        SType = "Number";
        Label = "Assumed Interest Rate";
    }
#  MP113A - Q05003
    OUT MIR-ANTY-FND-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Number";
        Label = "Annuity Fund Amount";
    }    
# MP202A - CHANGES STARTS HERE 
    OUT MIR-ANTY-LMPSM-PAYO-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Lump-sum payout amount on the annuitization date";
    }        

    OUT MIR-APRS-VALU-PAYO-AMT
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

    OUT MIR-RSRV-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Payout Efffective Date Reserved";
    }
    
#M280Z1 CHANGES ENDS HERE 
 
#UY3049 CHANGES STARTS HERE 
    OUT MIR-XIST-CHK-CMPLT-IND 
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Existence Check Completed?";
    }
	
    OUT MIR-AUTO-REMIT-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Auto Remittance";
    }

    OUT MIR-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Dividend Code";
    }
    
#UY3049 CHANGES ENDS HERE    
  # UY3049 - ANNUITY TRANSITION

    OUT MIR-GUAR-PERI
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Guarantee Period";
    } 
    OUT MIR-ANUTNT-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Name of the Annuitant";
    } 
    OUT MIR-INSRD-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Name of the Insured";
    }
    OUT MIR-POL-ANTY-STAT-CD
    {
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";   
    }

    OUT MIR-ANTY-PMT-PERI
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Annuity Payment Term";      
    }
    OUT MIR-BASIC-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }
    OUT MIR-ADDL-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "2";		
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
    OUT MIR-ADDL-CAP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Additional Capital Amount";
    }  
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

    OUT MIR-BASIC-ANTY-AMT-T[15]
    {
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Basic Annuity Amount";
        Index = "1";
    }
    OUT MIR-ADDL-ANTY-AMT-T[15]
    {
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Additional Annuity Amount";
        Index = "1";
    }
#UCR244 CHANGES STARTS
	OUT MIR-TOT-INCR-ANTY-AMT-T[15]
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
    OUT MIR-TOT-ANTY-AMT-T[15]
    {
        Length = "15";
        FieldGroup = "Table15";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Annuity Amount";
        Index = "1";
    }
    OUT MIR-ANNV-DT-T[15]
    {
        Length = "10";
        SType = "Date";
        Label = "Anniversary Date";
    }
    OUT MIR-PAYO-YEAR-T[15]
    {
        Length = "20";
        SType = "Date";
        Label = "Year";
    }
    OUT MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    } 
    OUT MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";
    }
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
}
