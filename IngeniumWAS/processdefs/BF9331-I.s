# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9331-I.s                                                    *
#*  Description: Claim Payment Input                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*  CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                   *
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *
#*                   CLAIM PAYMENT DUE'                                        *
#*  MP143H  CTS      ADDED NEW FIELDS 'TRAD PAID TO DATE','MODAL PREMIUM',     *
#*  MP143H           'BILLING MODE' AND 'TRAD UNPAID PREMIUM'                  *
#*                                                                             *
#*  M280P2  CTS      ARM III MEDICAL CLAIM CHANGES                             *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  MP302M  CTS      CHANGES TO ADD NEW FIELD FOR SURVIVAL BENEFIT CHARGEBACK  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      CANCER LUMP SUM STREAM 3                                  *
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM				       *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT      		                       *
#*******************************************************************************
S-STEP BF9331-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-CLM-ID";
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
		SType="Hidden";
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
		Length = "75";
		SType = "Text";
		Label = "Insured Name";
	}

	IN MIR-CLMA-CLM-STAT-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
	}

	IN MIR-CLMA-INSRD-CLI-ID
	{
		Length = "10";
		SType = "Text";
		Label = "Insured Client ID";
	}

	IN MIR-CLI-BTH-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Birth Date";
	}

	IN MIR-CLI-SEX-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLI-SEX-CD";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-CLMA-HO-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Head Office Claim Form Acceptance Date";
	}

	IN MIR-LIFE-INS-CLM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim In Progress";
	}

	IN MIR-CLMA-HIST-CLM-IND 
	{
		Length = "1";
		SType = "Indicator";
		Label = "Historical Claim:";
	}
#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND 
	{
		Length = "1";
		SType = "Indicator";
		Label = "Unisys Claim:";
	}
#UYSDMC CHANGES ENDS HERE
	IN MIR-POL-ID-T[50]
	{
		Length = "10";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-PAYEE-NM-TXT-T[50]
	{
		Length = "50";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Payee";
	}

	IN MIR-FINAL-APROV-DT-T[50]
	{
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Journal Date";
	}

	IN MIR-BNFT-PMT-AMT-T[50]
	{
		Signed;
		Length = "15";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Payment Amount";
	}

	IN MIR-PREM-DED-AMT-T[50]
	{
		Signed;
		Length = "11";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Premium Deducted";
	}

	IN MIR-DLAY-INT-AMT-T[50]
	{
		Signed;
		Length = "11";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Interest Paid";
	}

	IN MIR-REMIT-AMT-T[50]
	{
		Signed;
		Length = "15";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Adjusted Payment Amount";
	}
#MP143H CHANGES START

#	IN MIR-POL-ID-3-T[100]
	IN MIR-POL-ID-3-T[50]
	{
		Length = "10";
		FieldGroup = "Table3";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}
#UY3023 CHANGES STARTS
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
		Length = "2";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLBN-BNFT-DECSN-CD";
		SType = "Text";
		Label = "Decision";
	}

#	IN MIR-CLBN-ACRU-AMT-2-T[100]
	IN MIR-CLBN-ACRU-AMT-2-T[50]
	{
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
		Length = "10";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Date";
		Label = "Final Approval Date";
	}

#	INOUT MIR-CLRL-SEQ-NUM-2-T[100]
	INOUT MIR-CLRL-SEQ-NUM-2-T[50]
	{
		Length = "50";
		FieldGroup = "Table3";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
		Index = "1";
		SType = "Selection";
		Label = "Payee";
	}
#MP143H CHANGES END

# M280P2 CHANGES STARTS HERE 
#	IN MIR-POL-ID-4-T[10]
        IN MIR-POL-ID-4-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		Length = "10";
		FieldGroup = "Table4";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}
# M280P2 CHANGES STARTS HERE 
#	INOUT MIR-INT-STRT-DT-2-T[10]
        INOUT MIR-INT-STRT-DT-2-T[30]
# M280P2 CHANGES ENDS HERE         
	{
		Length = "10";
		FieldGroup = "Table4";
		Index = "1";
		SType = "Date";
		Label = "Interest Period Start Date";
	}
	
#ISLCLM CHANGES START
# M280P2 CHANGES STARTS HERE 
#	INOUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[10]
        INOUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[30]
# M280P2 CHANGES ENDS HERE         
	{
	        Length = "03";
	        FieldGroup = "Table4";
	        CodeSource = "DataModel";
	        CodeType = "DYS-BFR-PMT-DUE";
	        DefaultConstant = "005";
	        DBTableName = "TCLBN";
	        SType = "Selection";
	        Label = "Days Before Claim Payment Due";
	        Index = "1";
	}    
#ISLCLM CHANGES END 
        
# M280P2 CHANGES STARTS HERE         
#	IN MIR-POL-ID-5-T[10]
        IN MIR-POL-ID-5-T[30]
# M280P2 CHANGES ENDS HERE         
	{
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
# M280P2 CHANGES ENDS HERE         
	{
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
# M280P2 CHANGES ENDS HERE         
	{
		Length = "10";
		FieldGroup = "Table5";
		Index = "1";
		SType = "Date";
		Label = "Lapse Start Date";
	}

# M280P2 CHANGES STARTS HERE
# 	IN MIR-LTST-PD-END-DT-T[10]
        IN MIR-LTST-PD-END-DT-T[30]
# M280P2 CHANGES ENDS HERE        
	{
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
# M280P2 CHANGES ENDS HERE         
        {
                Length = "10";
                FieldGroup = "Table5";
                Index = "1";
                SType = "Date";
        	Label = "Trad Paid to Date";
	}	
# M280P2 CHANGES STARTS HERE    	
#    	IN MIR-POL-MPREM-AMT-T[10]
        IN MIR-POL-MPREM-AMT-T[30]
# M280P2 CHANGES ENDS HERE        
        
    	{
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
# M280P2 CHANGES ENDS HERE        
    	{
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
# M280P2 CHANGES ENDS HERE
    	{
    		Signed;
    	    	Length = "15";
    	    	FieldGroup = "Table5";
    	    	Index = "1";
    	    	SType = "Currency";
    	    	Label = "Trad Unpaid Premium";
    	}       
#*MP143H CHANGES END
#*MP302M CHANGES STARTS
	IN MIR-SRVBEN-CHRGBCK-AMT-T[50]
	{
		Signed;
		Length = "15";
		FieldGroup = "Table5";
		Index = "1";
		SType = "Currency";
#*UY323A CHANGES STARTS
#        Label = "Survival Benefit Chargeback Amount";
        Label = "Benefit Chargeback Amount";
#*UY323A CHANGES ENDS
	}
#*MP302M CHANGES ENDS
	INOUT MIR-PREM-DED-AMT-3-T[50]
	{
		Signed;
		Length = "11";
		FieldGroup = "Table5";
		Index = "1";
		SType = "Currency";
		Label = "Premium Amount to Deduct";
	}

# M280P2 CHANGES STARTS HERE
#	INOUT MIR-CLRL-SEQ-NUM-3-T[10]
        INOUT MIR-CLRL-SEQ-NUM-3-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		Length = "50";
		FieldGroup = "Table5";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
		Index = "1";
		SType = "Selection";
		Label = "Payee";
	}

	IN MIR-BNFT-DECSN-CD-2-T[100]
	{
		Length = "2";
		FieldGroup = "Table6";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Decision Code Itself";
	}
# MP300C CHANGES STARTS HERE 
        INOUT MIR-PRE-LCD-CHK-IND-T[30]       
	{
	        Length = "01";
	        FieldGroup = "Table8";
	        CodeSource = "DataModel";
	        CodeType = "PRE-LCD-CHK-IND";
	        DefaultConstant = "005";
	        DBTableName = "TCLBN";
	        SType = "Selection";
	        Label = "Pre-LCD Check";
	        Index = "1";
	}    
#MP300C CHANGES ENDS HERE
#*UY3070 CHANGES STARTS
    
        INOUT MIR-CSH-LOAN-BAL
        { 
                Length = "15";
                DBTableName = "TLHST";
                SType = "Currency";
                Label = "Policy loan Balance";
        } 
    
        INOUT MIR-OVR-SHRT-PREM-AMT
        { 
		Length = "15";
		SType = "Currency";
		Label = "excess or shortage of interest";
        } 
    	
        INOUT MIR-UNEARN-LOAN-INT-AMT
        {
    	         Signed;
    	         Length = "15";
    	         SType = "Currency";
	         Label = "Unearned Interest";
        }
        
        INOUT MIR-OUT-INT-AMT	
        {
	         Signed;
	         Length = "15";
	         SType = "Currency";
	         Label = "Outstanding Interest";        
        }        
    
        INOUT MIR-APL-BAL-AMT
        { 
            DBTableName = "TLHST";
            Length = "20";
            SType = "Currency";
            Label = "APL Balance";
        }
    
        INOUT MIR-DV-APL-INT-AMT
        { 
            DBTableName = "TLHST";
            Length = "20";
            SType = "Currency";
            Label = "APL Interest";
        }
      
#* UY3070 CHANGES ENDS 
}
