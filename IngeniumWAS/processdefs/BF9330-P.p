# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9330-P.p                                                    *
#*  Description: Claim Payment Inquiry                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*  CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                   *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                  *
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *
#*                   CLAIM PAYMENT DUE'                                        *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLES  MIR-INT-STRT-DT-T            *
#*                   MIR-DV-INT-DY-QTY-T  AND MIR-CLMA-DYS-BFR-PMT-DUE-T       *
#*                   IN ONE PLACE DUE TO DUPLICATE DECLARATION                 *
#*  MP143H  CTS      ADDED NEW FIELDS 'TRAD PAID TO DATE','MODAL PREMIUM',     *
#*  MP143H           'BILLING MODE' AND 'TRAD UNPAID PREMIUM'                  *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M280P2  CTS      ARM III MEDICAL CLAIM CHANGES                             *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  MP302M  CTS      CHANGES TO ADD NEW FIELD FOR SURVIVAL BENEFIT CHARGEBACK  *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      STREAM 3 CANCER LUMP SUM                                  *
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM                                    *
#*******************************************************************************

P-STEP BF9330-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9330";
        BusinessFunctionName = "Claim Payment Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9330";
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

    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    OUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
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
    OUT MIR-CLMA-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    OUT MIR-LIFE-INS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim Involved";
    }
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim:";
    }
#UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim:";
    }
#UYSDMC CHANGES ENDS HERE
    OUT MIR-POL-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-T[50]
    {
        Length = "03";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
    OUT MIR-CLAP-KEY-T[50]
    {
        Length = "14";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "CLAP Record Key";
        Index = "1";
    }
    OUT MIR-PAYEE-NM-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    OUT MIR-FINAL-APROV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    OUT MIR-BNFT-PMT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
    OUT MIR-PREM-DED-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Deducted";
        Index = "1";
    }
    OUT MIR-DLAY-INT-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Interest Paid";
        Index = "1";
    }
    OUT MIR-REMIT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
    }
#ISLCLM CHANGES START
    OUT MIR-INT-STRT-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLBN";
        SType = "Date";
        Label = "Interest Period Start Date";
        Index = "1";
    }

    OUT MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
    {
        Length = "03";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Days Before Claim Payment Due";
        Index = "1";
    }    
    
    OUT MIR-DV-INT-DY-QTY-T[50]
    {
        Length = "4";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Days for Interest";
        Index = "1";
    }    
#ISLCLM CHANGES END     
   
    OUT MIR-POL-ID-2-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-2-T[50]
    {
        Length = "03";
        FieldGroup = "Table2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
    OUT MIR-CLRL-SEQ-NUM-T[50]
    {
        Length = "50";
        FieldGroup = "Table2";
        CodeSource = "CSOM9335";
        SType = "Selection";
        Label = "Payee";
        Index = "1";
    }
    OUT MIR-PAYEE-NM-TXT-2-T[50]
    {
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    OUT MIR-CLBN-ACRU-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
    OUT MIR-PREM-DED-AMT-2-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLPS";
        SType = "Currency";
        Label = "Premium Amount to Deduct";
        Index = "1";
    }
    OUT MIR-NET-PMT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payment Less Premium";
        Index = "1";
    }
#EN9547 CHANGES START HERE    
#    OUT MIR-INT-STRT-DT-T[50]
#    {
#        Length = "10";
#        FieldGroup = "Table2";
#        DBTableName = "TCLBN";
#        SType = "Date";
#        Label = "Interest Period Start Date";
#        Index = "1";
#    }
#ISLCLM CHANGES START
#    OUT MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
#    {
#        Length = "03";
#        FieldGroup = "Table2";
#        CodeSource = "DataModel";
#        CodeType = "DYS-BFR-PMT-DUE";
#        SType = "Text";
#        Label = "Days Before Claim Payment Due";
#        Index = "1";
#    }    
#ISLCLM CHANGES END    
#    OUT MIR-DV-INT-DY-QTY-T[50]
#    {
#        Length = "4";
#        FieldGroup = "Table2";
#        DBTableName = "Derived";
#        SType = "Text";
#        Label = "Number of Days for Interest";
#        Index = "1";
#    }
#EN9547 CHANGES END HERE
    OUT MIR-DLAY-INT-AMT-2-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interest Paid";
        Index = "1";
    }
    OUT MIR-ADJ-PMT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
    }
#MP143H CHANGES START
#   OUT MIR-POL-ID-3-T[100]
    OUT MIR-POL-ID-3-T[50]
    {
        Length = "10";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-3-T[50]
    {
        Length = "03";
        FieldGroup = "Table3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
#UY3023 CHANGES STARTS HERE
    OUT MIR-RIDER-CD-T[50]
    {
        FieldGroup = "Table3";
        Length = "3";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Rider Code";
        Index = "1";
    }  
#UY3023 CHANGES ENDS HERE

#   OUT MIR-PLAN-ID-T[100]
    OUT MIR-PLAN-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
#    OUT MIR-BNFT-NM-ID-T[100]
     OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
#   OUT MIR-BNFT-DECSN-CD-T[100]
    OUT MIR-BNFT-DECSN-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }
#* CS0008 CHANGES STARTS HERE
      OUT MIR-NON-PMT-REASN-TXT-T[50] 
      {
             Length = "08";  
             CodeSource = "DataModel";
             CodeType = "NON-PMT-REASN-TXT";
             DBTableName = "TCLBD";
             SType = "Text";
             Label = "Non-payment reason code";
             FieldGroup = "Table3";      
      }
#* CS0008 CHANGES END HERE    
#   OUT MIR-BNFT-DECSN-CD-2-T[100]
    OUT MIR-BNFT-DECSN-CD-2-T[50]
    {
        Length = "2";
        FieldGroup = "Table3";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision Code Itself";
        Index = "1";
    }
#   OUT MIR-CLBN-ACRU-AMT-2-T[100]
    OUT MIR-CLBN-ACRU-AMT-2-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TCLBN";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
#   OUT MIR-FINAL-APROV-DT-2-T[100]
    OUT MIR-FINAL-APROV-DT-2-T[50]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Final Approval Date";
        Index = "1";
    }
#   OUT MIR-CLRL-SEQ-NUM-2-T[100]
    OUT MIR-CLRL-SEQ-NUM-2-T[50]
    {
        Length = "50";
        FieldGroup = "Table3";
        CodeSource = "CSOM9335";
        SType = "Selection";
        Label = "Payee";
        Index = "1";
    }
#   OUT MIR-PAYEE-NM-TXT-3-T[100]
    OUT MIR-PAYEE-NM-TXT-3-T[50]
    {
        Length = "50";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
#MP143H CHANGES END
# M280P2 CHANGES STARTS HERE
#    OUT MIR-POL-ID-4-T[10]
     OUT MIR-POL-ID-4-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-4-T[30]
    {
        Length = "03";
        FieldGroup = "Table4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-INT-STRT-DT-2-T[10]
     OUT MIR-INT-STRT-DT-2-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCLBN";
        SType = "Date";
        Label = "Interest Period Start Date";
        Index = "1";
    }
#* ISLCLM CHANGE START
# M280P2 CHANGES STARTS HERE 
#    OUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[10]
     OUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "03";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Days Before Claim Payment Due";
        Index = "1";
#* ISLCLM CHANGE END        
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-POL-ID-5-T[10]
     OUT MIR-POL-ID-5-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-5-T[30]
    {
        Length = "03";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
# M280P2 CHANGES STARTS HERE     
#    OUT MIR-POL-UL-SHRT-AMT-T[10]
     OUT MIR-POL-UL-SHRT-AMT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-UL-LAPS-STRT-DT-T[10]
     OUT MIR-UL-LAPS-STRT-DT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE     
#    OUT MIR-LTST-PD-END-DT-T[10]
     OUT MIR-LTST-PD-END-DT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Latest Paid Claim End Date";
        Index = "1";
    }
#MP143H CHANGES START
# M280P2 CHANGES STARTS HERE 
#    OUT MIR-TRAD-PD-TO-DT-NUM-T[10]
     OUT MIR-TRAD-PD-TO-DT-NUM-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Trad Paid to Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-POL-MPREM-AMT-T[10]
     OUT MIR-POL-MPREM-AMT-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE      
#    OUT MIR-POL-BILL-MODE-CD-T[10]
     OUT MIR-POL-BILL-MODE-CD-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Mode";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-TRAD-UNPD-PREM-AMT-T[10]
     OUT MIR-TRAD-UNPD-PREM-AMT-T[30]
# M280P2 CHANGES ENDS HERE 
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Unpaid Premium";
        Index = "1";
    }   
    
#*MP143H CHANGES END
#*MP302M CHANGES STARTS HERE
    OUT MIR-SRVBEN-CHRGBCK-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
# UY323A CHANGES STARTS 
#         Label = "Survival Benefit Chargeback Amount";
		 Label = "Benefit Chargeback Amount";
# UY323A CHANGES ENDS	
        Index = "1";
    }
#*MP302M CHANGES ENDS HERE
    OUT MIR-PREM-DED-AMT-3-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table5";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Amount to Deduct";
        Index = "1";
    }
    OUT MIR-CLRL-SEQ-NUM-3-T[10]
    {
        Length = "50";
        FieldGroup = "Table5";
        CodeSource = "CSOM9335";
        SType = "Selection";
        Label = "Payee";
        Index = "1";
    }
    OUT MIR-PAYEE-NM-TXT-4-T[10]
    {
        Length = "50";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    OUT MIR-PAYEE-NM-TXT-5-T[10]
    {
        Length = "50";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }
    OUT MIR-BNK-NM-T[10]
    {
        Length = "36";
        FieldGroup = "Table6";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }
    OUT MIR-BNK-BR-NM-T[10]
    {
        Length = "36";
        FieldGroup = "Table6";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
        Index = "1";
    }
    OUT MIR-PAYEE-ACCT-TYP-CD-T[10]
    {
        Length = "3";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }
    OUT MIR-PAYEE-BNK-ACCT-ID-T[10]
    {
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }
    OUT MIR-PAYEE-ACCT-HLDR-NM-T[10]
    {
        Length = "50";
        FieldGroup = "Table6";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }
    OUT MIR-PAYEE-INSRD-REL-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Relationship to Insured";
        Index = "1";
    }
    OUT MIR-PAYEE-NM-TXT-6-T[10]
    {
        Length = "50";
        FieldGroup = "Table7";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }
    OUT MIR-SEND-PMT-NOTI-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table7";
        DBTableName = "TCLRL";
        SType = "Indicator";
        Label = "Send Notice";
        Index = "1";
    }
    OUT MIR-KJ-PREFCT-TXT-T[10] 
    {
        FieldGroup = "Table7";
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }
    OUT MIR-KJ-CITY-TXT-T[10] 
    {
        FieldGroup = "Table7";
        Length = "30";
        SType = "Text";
        Label = "City";
        Index = "1";
    }
    OUT MIR-KJ-NGHBRHD-TXT-T[10] 
    {
        FieldGroup = "Table7";
        Length = "30";
        SType = "Text";
        Label = "Neighbourhood";
        Index = "1";
    }
    OUT MIR-CLRL-SAMAKATA-BU-TXT-T[10] 
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table7";
        Index = "1";
        SType = "Text";
        Label = "Samakata-bu";
    }
    OUT MIR-PREV-UPDT-USER-ID-T[10] 
    {
        Length = "8";
        FieldGroup = "Table7";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
    }
    OUT MIR-PREV-UPDT-DT-T[10] 
    {
        Length = "10";
        FieldGroup = "Table7";
        DBTableName = "TCLRL";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
     }  
#M271O1 CHANGES END HERE 
#MP300C CHANGES START HERE 
    OUT MIR-PRE-LCD-CHK-IND-T[50]
    {
        Length = "01";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Pre-LCD Check";
        Index = "1";
    } 
#MP300C CHANGES END HERE 
#*UY3070 CHANGES STARTS

        OUT MIR-CSH-LOAN-BAL
	{
	        Signed;
		Length = "15";
		DBTableName = "TLHST";
		SType = "Currency";
		Label = "Policy loan Balance";
        }
        
        OUT MIR-OVR-SHRT-PREM-AMT
	{  
	        Signed;
		Length = "15";
		SType = "Currency";
		Label = "Excess or Shortage of interest";
        }
        
        OUT MIR-UNEARN-LOAN-INT-AMT
        {
	         Signed;
	         Length = "15";
	         SType = "Currency";
	         Label = "Unearned Interest";
        }
        
       OUT MIR-OUT-INT-AMT
        {
	         Signed;
	         Length = "15";
	         SType = "Currency";
	         Label = "Outstanding Interest";
        }        
        OUT MIR-APL-BAL-AMT
        { 
                Signed;
		Length = "20";
		DBTableName = "TLHST";
		SType = "Currency";
		Label = "APL Balance";
        }   

        OUT MIR-DV-APL-INT-AMT
        { 
                Signed;
           	Length = "20";
           	DBTableName = "TLHST";
      	        SType = "Currency";
        	Label = "APL Interest";
        }
#*UY3070 CHANGES ENDS

#*UY323A CHANGES STARTS HERE

    OUT MIR-SRVBEN-CHRGBCK-AMT-2-T[30]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        Index = "1";
        DBTableName = "TCLPS";
        SType = "Currency";
        Label = "Benefit Chargeback Amount";
    }
	
#*UY323A CHANGES ENDS HERE
}
