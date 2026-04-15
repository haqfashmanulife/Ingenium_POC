# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9331-O.s                                                    *
#*  Description: Claim Payment Inquiry                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*  CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                   *
#*  ISLCLM  CTS      ADDED NEW DROPDOWN FIELD FOR NUMBER OF DAYS TO CLAIM      *
#*  ISLCLM           PAYMENT DUE                                               *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-INT-STRT-DT-T,             *
#*                   MIR-CLMA-DYS-BFR-PMT-DUE-T AND MIR-DV-INT-DY-QTY-T DUE TO *
#*                   THE DUPLICATE DECLARATION                                 *
#*  MP143H  CTS      CHANGES TO ADD NEW FIELDS 'TRAD PAID TO DATE','MODAL      *
#*  MP143H           PREMIUM', 'BILLING MODE' AND 'TRAD UNPAID PREMIUM'        *
#*                                                                             *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#* UY3070   CTS      STREAM 3 CANCER LUMP SUM                                  *
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM                       	       *
#*******************************************************************************
S-STEP BF9331-O
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
	
#ISLCLM CHANGES START
    IN MIR-INT-STRT-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLBN";
        SType = "Date";
        Label = "Interest Period Start Date";
        Index = "1";
    }

    IN MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
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
    
    IN MIR-DV-INT-DY-QTY-T[50]
    {
        Length = "4";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Days for Interest";
        Index = "1";
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
#		DisplayOnly;
#		Length = "10";
#		FieldGroup = "Table2";
#		Index = "1";
#		SType = "Date";
#		Label = "Interest Period Start Date";
#	}
#	
#ISLCLM CHANGES START
#	IN MIR-CLMA-DYS-BFR-PMT-DUE-T[50]
#	{
#	        Length = "03";
#	        FieldGroup = "Table2";
#	        CodeSource = "DataModel";
#	        CodeType = "DYS-BFR-PMT-DUE";
#	        DBTableName = "TCLBN";
#	        SType = "Text";
#	        Label = "Days Before Claim Payment Due";
#	        Index = "1";
#	}    
#ISLCLM CHANGES END 	
#
#	IN MIR-DV-INT-DY-QTY-T[50] 
#	{
#		DisplayOnly;
#		Length = "4";
#		FieldGroup = "Table2";
#		Index = "1";
#		SType = "Text";
#		Label = "Number of Days for Interest";
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
#*MP143H CHANGES START

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
#*MP143H CHANGES END

#*MP300C CHANGES START
        IN MIR-POL-ID-4-T[50]       
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table8";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}
        IN MIR-PRE-LCD-CHK-IND-T[50]
        {
                Length = "01";
                FieldGroup = "Table8";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                DBTableName = "TDCBD";
                SType = "Text";
                Label = "Pre-LCD Check";
                Index = "1";
        } 
#*MP300C CHANGES END
#*UY3070 CHANGES STARTS

        IN MIR-CSH-LOAN-BAL
        {
		Length = "15";
		DBTableName = "TLHST";
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
		DBTableName = "TLHST";
		SType = "Currency";
		Label = "APL Balance";
        }   

        IN MIR-DV-APL-INT-AMT
        {
           	Length = "20";
           	DBTableName = "TLHST";
      	        SType = "Currency";
        	Label = "APL Interest";
        }
#*UY3070 CHANGES ENDS
}
