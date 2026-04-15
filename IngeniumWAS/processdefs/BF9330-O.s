# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9330-O.s                                                    *
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
#*  M280P2  CTS      ARM III MEDICAL CLAIM CHANGES                             *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      CANCER LUMP SUM STREAM 3                                  *
#*  UY3023  CTS      STREAM3 MEDICAL CLAIM
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************
S-STEP BF9330-O
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
    SType="Hidden";
	}

        INOUT MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            SType = "Hidden";
            Label = "process code";
        }

	IN MIR-CLM-ID 
	{
    Key;
    DisplayOnly;
    Length = "8";
    DefaultSession = "MIR-CLM-ID";
    SType = "Text";
    Label = "Master Claim ID";
	}

	IN MIR-DV-INS-CLI-NM 
	{
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Insured Name";
	}

	IN MIR-CLMA-CLM-STAT-CD 
	{
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "CLMA-CLM-STAT-CD";
    SType = "Text";
    Label = "Master Claim Status";
	}

	IN MIR-CLMA-INSRD-CLI-ID 
	{
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Insured Client ID";
	}

	IN MIR-CLI-BTH-DT 
	{
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Date of Birth";
	}

	IN MIR-CLI-SEX-CD 
	{
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    SType = "Text";
    Label = "Sex";
	}

	IN MIR-CLMA-HO-ACPT-DT 
	{
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Head Office Claim Form Acceptance Date";
	}

	IN MIR-LIFE-INS-CLM-IND 
	{
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Life Insurance Claim Involved";
	}

	IN MIR-CLMA-HIST-CLM-IND 
	{
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Historical Claim:";
	}
#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND 
	{
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Unisys Claim:";
	}
#UYSDMC CHANGES ENDS HERE
	IN MIR-POL-ID-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
	}

	IN MIR-PAYEE-NM-TXT-T[50] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

	IN MIR-FINAL-APROV-DT-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Journal Date";
	}

	IN MIR-BNFT-PMT-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Payment Amount";
	}

	IN MIR-PREM-DED-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "11";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Premium Deducted";
	}

	IN MIR-DLAY-INT-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "11";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Interest Paid";
	}

	IN MIR-REMIT-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Adjusted Payment Amount";
	}

# ISLCLM CHANGES START         
        IN MIR-INT-STRT-DT-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Interest Period Start Date";
	}
	
        IN MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
        {
    Length = "03";
                CodeSource = "DataModel";
    CodeType = "DYS-BFR-PMT-DUE";
    SType = "Text";
    FieldGroup = "Table1";
    Label = "Days Before Claim Payment Due";
    Index = "1";               
	}

	IN MIR-DV-INT-DY-QTY-T[50] 
	{
    DisplayOnly;
    Length = "4";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Number of Days for Interest";
	}
#ISLCLM CHANGES END	

	IN MIR-POL-ID-2-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table2";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
	}

	IN MIR-CLRL-SEQ-NUM-T[50] 
	{
    DisplayOnly;
    Length = "50";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

	IN MIR-PAYEE-NM-TXT-2-T[50] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

	IN MIR-CLBN-ACRU-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Payment Amount";
	}

	IN MIR-PREM-DED-AMT-2-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "11";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Premium Amount to Deduct";
	}

	IN MIR-NET-PMT-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Payment Less Premium";
	}
	
#EN9547 CHANGES START HERE
#	IN MIR-INT-STRT-DT-T[50] 
#	{
#    DisplayOnly;
#    Length = "10";
#    FieldGroup = "Table2";
#    Index = "1";
#    SType = "Date";
#    Label = "Interest Period Start Date";
#	}
#	
#	#ISLCLM CHANGES START
#        IN MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
#        {
#    Length = "03";
#                CodeSource = "DataModel";
#    CodeType = "DYS-BFR-PMT-DUE";
#    SType = "Text";
#    Label = "Days Before Claim Payment Due";
#    Index = "1";               
#	}
#        #ISLCLM CHANGES END
#
#	IN MIR-DV-INT-DY-QTY-T[50] 
#	{
#    DisplayOnly;
#    Length = "4";
#    FieldGroup = "Table2";
#    Index = "1";
#    SType = "Text";
#    Label = "Number of Days for Interest";
#	}
#EN9547 CHANGES END HERE

	IN MIR-DLAY-INT-AMT-2-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "11";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Interest Paid";
	}

	IN MIR-ADJ-PMT-AMT-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Adjusted Payment Amount";
	}
	
#MP143H CHANGES START

#	IN MIR-POL-ID-3-T[100] 
 	IN MIR-POL-ID-3-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table3";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
	}
#UY3023 CHANGES STARTS HERE	
        IN MIR-RIDER-CD-T[50] 
	{
    DisplayOnly;
    Length = "3";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Rider Code";
	}
#UY3023 CHANGES ENDS HERE
#	IN MIR-PLAN-ID-T[100] 
	IN MIR-PLAN-ID-T[50] 
	{
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table3";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider Name";
	}

#	IN MIR-BNFT-NM-ID-T[100] 
	IN MIR-BNFT-NM-ID-T[50] 
	{
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table3";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "BENNM";
    SType = "Text";
    Label = "Benefit Name";
	}

#	IN MIR-BNFT-DECSN-CD-T[100] 
	IN MIR-BNFT-DECSN-CD-T[50] 
	{
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table3";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "CLBN-BNFT-DECSN-CD";
    SType = "Text";
    Label = "Decision";
	}
	
#* CS0008 CHANGES STARTS HERE
        IN MIR-NON-PMT-REASN-TXT-T[50] 
        {
                CodeSource = "DataModel";
                CodeType = "NON-PMT-REASN-TXT";
                DisplayOnly;
                FieldGroup = "Table8";
                Label = "Non-payment reason code";
                Length = "08";
                SType = "Text";
        }
#* CS0008 CHANGES END HERE
#	IN MIR-BNFT-DECSN-CD-2-T[100]
	IN MIR-BNFT-DECSN-CD-2-T[50]
	{
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Decision Code Itself";
	}

#	IN MIR-CLBN-ACRU-AMT-2-T[100] 
	IN MIR-CLBN-ACRU-AMT-2-T[50] 
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Currency";
    Label = "Payment Amount";
	}

#	IN MIR-FINAL-APROV-DT-2-T[100] 
	IN MIR-FINAL-APROV-DT-2-T[50] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Date";
    Label = "Final Approval Date";
	}

#	IN MIR-CLRL-SEQ-NUM-2-T[100] 
	IN MIR-CLRL-SEQ-NUM-2-T[50] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table3";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

#	IN MIR-PAYEE-NM-TXT-3-T[100] 
	IN MIR-PAYEE-NM-TXT-3-T[50] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}
	
#MP143H CHANGES END
# M280P2 CHANGES STARTS HERE
#	IN MIR-POL-ID-4-T[10] 
        IN MIR-POL-ID-4-T[30]
# M280P2 CHANGES ENDS HERE        
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table4";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
	}
# M280P2 CHANGES STARTS HERE
#	IN MIR-INT-STRT-DT-2-T[10] 
        IN MIR-INT-STRT-DT-2-T[30]
# M280P2 CHANGES ENDS HERE         
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table4";
    Index = "1";
    SType = "Date";
    Label = "Interest Period Start Date";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-POL-ID-5-T[10] 
        IN MIR-POL-ID-5-T[30]
# M280P2 CHANGES STARTS HERE        
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table5";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-POL-UL-SHRT-AMT-T[10] 
        IN MIR-POL-UL-SHRT-AMT-T[30]
# M280P2 CHANGES STARTS HERE        
	{
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table5";
    Index = "1";
    SType = "Currency";
    Label = "Shortage Amount";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-UL-LAPS-STRT-DT-T[10] 
        IN MIR-UL-LAPS-STRT-DT-T[30]
# M280P2 CHANGES STARTS HERE        
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table5";
    Index = "1";
    SType = "Date";
    Label = "Lapse Start Date";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-LTST-PD-END-DT-T[10] 
        IN MIR-LTST-PD-END-DT-T[30] 
# M280P2 CHANGES STARTS HERE         
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table5";
    Index = "1";
    SType = "Date";
    Label = "Latest Paid Claim End Date";
	}

#MP143H CHANGES START
# M280P2 CHANGES STARTS HERE
#        IN MIR-TRAD-PD-TO-DT-NUM-T[10]
         IN MIR-TRAD-PD-TO-DT-NUM-T[30]
# M280P2 CHANGES STARTS HERE          
        {
                DisplayOnly;
                Length = "10";
                FieldGroup = "Table5";
                Index = "1";
                SType = "Date";
        	Label = "Trad Paid to Date";
	}
	
# M280P2 CHANGES STARTS HERE	
#    	IN MIR-POL-MPREM-AMT-T[10]
        IN MIR-POL-MPREM-AMT-T[30]
# M280P2 CHANGES STARTS HERE        
    	{
    	        DisplayOnly;
        Signed;
        Length = "15";
        	FieldGroup = "Table5";
        	Index = "1";
        	SType = "Currency";
        	Label = "Modal Premium";
    	}
# M280P2 CHANGES STARTS HERE    	
#    	IN MIR-POL-BILL-MODE-CD-T[10]
        IN MIR-POL-BILL-MODE-CD-T[30]
# M280P2 CHANGES STARTS HERE         
    	{
    	        DisplayOnly;
        Length = "40";
        FieldGroup = "Table5";
        	CodeSource = "DataModel";
        	CodeType = "POL-BILL-MODE-CD";
        	Index = "1";
               	SType = "Text";
        	Label = "Billing Mode";
    	}  
# M280P2 CHANGES STARTS HERE     	
#    	IN MIR-TRAD-UNPD-PREM-AMT-T[10]
        IN MIR-TRAD-UNPD-PREM-AMT-T[30]
# M280P2 CHANGES STARTS HERE        
    	{
    	        DisplayOnly;
        Signed;
    	    	Length = "15";
    	    	FieldGroup = "Table5";
    	    	Index = "1";
    	    	SType = "Currency";
    	    	Label = "Trad Unpaid Premium";
    	}       
#MP143H CHANGES END
# M280P2 CHANGES STARTS HERE 
#	IN MIR-CLRL-SEQ-NUM-3-T[10] 
        IN MIR-CLRL-SEQ-NUM-3-T[30]
# M280P2 CHANGES STARTS HERE                 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table5";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
    FieldGroup = "Table5";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

	IN MIR-PAYEE-NM-TXT-4-T[10] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table5";
    Index = "1";
    SType = "Text";
    Label = "Payee";
	}

	IN MIR-PAYEE-NM-TXT-5-T[10] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table6";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Kanji Payee Name";
	}

	IN MIR-BNK-NM-T[10] 
	{
    DisplayOnly;
    Length = "36";
    FieldGroup = "Table6";
    Index = "1";
    SType = "Text";
    Label = "Bank Name";
	}

	IN MIR-BNK-BR-NM-T[10] 
	{
    DisplayOnly;
    Length = "36";
    FieldGroup = "Table6";
    Index = "1";
    SType = "Text";
    Label = "Branch Name";
	}

	IN MIR-PAYEE-ACCT-TYP-CD-T[10] 
	{
    DisplayOnly;
    Length = "3";
    FieldGroup = "Table6";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "FBACC";
    SType = "Text";
    Label = "Account Type";
	}

	IN MIR-PAYEE-BNK-ACCT-ID-T[10] 
	{
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table6";
    Index = "1";
    SType = "Text";
    Label = "Bank Account Number";
	}

	IN MIR-PAYEE-ACCT-HLDR-NM-T[10] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table6";
    Index = "1";
    SType = "Text";
    Label = "Account Holder Name";
	}

	IN MIR-PAYEE-INSRD-REL-CD-T[10] 
	{
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table6";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "CLMRL";
    SType = "Text";
    Label = "Relationship to Insured";
	}

	IN MIR-PAYEE-NM-TXT-6-T[10] 
	{
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table7";
    KeyColumn;
    Index = "1";
    SType = "Text";
    Label = "Kanji Payee Name";
	}

	IN MIR-SEND-PMT-NOTI-IND-T[10] 
	{
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Indicator";
    Label = "Send Notice";
	}

	IN MIR-KJ-PREFCT-TXT-T[10] 
	{
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Text";
    Label = "Prefecture";
	}

	IN MIR-KJ-CITY-TXT-T[10] 
	{
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Text";
    Label = "City";
	}

	IN MIR-KJ-NGHBRHD-TXT-T[10] 
	{
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Text";
    Label = "Neighbourhood";
	}
	
	IN MIR-CLRL-SAMAKATA-BU-TXT-T[10] 
	{
    DisplayOnly;
    Length = "72";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Text";
    Label = "Samakata-bu";
	}
	
	IN MIR-PREV-UPDT-USER-ID-T[10] 
	{
    DisplayOnly;
    Length = "8";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Text";
    Label = "Previous Update User ID";
	}

	IN MIR-PREV-UPDT-DT-T[10] 
	{
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table7";
    Index = "1";
    SType = "Date";
    Label = "Previous Update Date";
	}
#*MP300C CHANGES START
        IN MIR-PRE-LCD-CHK-IND-T[50]
        {
                Length = "01";
                FieldGroup = "Table8";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                SType = "Text";
                Label = "Pre-LCD Check";
                Index = "1";
        }
#*MP300C CHANGES END	
#*UY3070 CHANGES STARTS
        IN MIR-CSH-LOAN-BAL
	{
    Length = "15";
    SType = "Currency";
    Label = "Policy loan Balance";
        }
        
        IN MIR-OVR-SHRT-PREM-AMT
	{
    Length = "15";
    SType = "Currency";
    Label = "excess or shortage of interest";
        }
        
        IN MIR-UNEARN-LOAN-INT-AMT	
        {
	         Signed;
	         Length = "15";
	         SType = "Currency";
	         Label = "Unearned Interest";
        }
        
        IN MIR-OUT-INT-AMT	
        {
	         Signed;
	         Length = "15";
	         SType = "Currency";
	         Label = "Outstanding Interest";        
        } 
        
        IN MIR-APL-BAL-AMT
        { 
         Length = "20";
         SType = "Currency";
         Label = "APL Balance";
        }   

        IN MIR-DV-APL-INT-AMT-T
        { 
         Length = "20";
         SType = "Currency";
         Label = "APL Interest";
        }
#*UY3070 CHANGES ENDS	


#*UY323A CHANGES STARTS

    IN MIR-SRVBEN-CHRGBCK-AMT-2-T[30] 
    {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Currency";
    Label = "Benefit Chargeback Amount";
    }

    IN MIR-SRVBEN-CHRGBCK-AMT-T[50]
    {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Benefit Chargeback Amount";
    }

#*UY323A CHANGES ENDS
}