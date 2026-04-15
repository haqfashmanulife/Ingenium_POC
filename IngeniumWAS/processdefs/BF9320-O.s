# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9320-O.s                                                    *
#*  Description: Firm Banking Table (FBNK) Retrieve step                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                 *
#* ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                          *    
#*                                                                             *
#*  Q50690  CTS      ADDING PAYOUT TYPE METHOD FIELD                           *
#*  Q50705  CTS      BUG FIX AS PART OF M245K2                                 *
#*  MP302M  CTS      SURVIVAL BENEFIT - MEDICAL CLAIM CHANGES                  *
#*  UYS70A  CTS      CHANGES AS PART OF UNISYS FOR DISB INFO                   *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*******************************************************************************

S-STEP BF9320-O
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

	INOUT MIR-FBNK-REMIT-DT 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Remittance Date";
	}

	INOUT MIR-FBNK-CAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "DataModel";
		CodeType = "FBNK-CAT-CD";
		SType = "Text";
		Label = "Operation Category";
	}

	INOUT MIR-FBNK-REF-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Master Claim ID";
	}

	INOUT MIR-POL-ID 
	{
		Key;
		DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Policy ID";
	}

	INOUT MIR-FB-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Insured Client ID";
	}

	INOUT MIR-FBNK-SEQ-NUM 
	{
		Key;
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Reference Number";
	}

	IN MIR-DV-INS-CLI-NM 
	{
		Key;
		DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Insured Name";
	}

	IN MIR-POL-PD-TO-DT-NUM
        {
        	DisplayOnly;
        	Length = "10";
        	SType = "Text";
        	Label = "Policy Paid to Date";
        }

	IN MIR-SERV-AGT-ID
    	{
        	DisplayOnly;
        	Length = "6";
        	SType = "Text";
        	Label = "Servicing Agent ID";
    	}

	IN MIR-DV-SERV-AGT-NM
    	{
        	DisplayOnly;
        	Length = "75";
        	SType = "Text";
        	Label = "Servicing Agent Name";
    	}

	IN MIR-SERV-BR-ID
    	{
        	DisplayOnly;
        	Length = "5";
        	CodeSource = "XTAB";
        	CodeType = "BRCH";
        	SType = "Text";
        	Label = "Servicing Agent Branch";
    	}

	IN MIR-SERV-SO-ID
    	{
        	DisplayOnly;
        	Length = "5";
        	CodeSource = "XTAB";
        	CodeType = "SALE";
        	SType = "Text";
        	Label = "Servicing Agent's Sales Office";
    	}

	IN MIR-CLI-ID-T[5]
    	{
        	DisplayOnly;
        	Length = "10";
        	FieldGroup = "Table1";
        	KeyColumn;
        	SType = "Text";
        	Label = "Owner Client ID";
        	Index = "1";
    	}

	IN MIR-DV-OWN-CLI-NM-T[5]
    	{
        	DisplayOnly;
        	Length = "30";
        	FieldGroup = "Table1";
        	SType = "Text";
        	Label = "Owner Name";
        	Index = "1";
    	}

	IN MIR-KANJI-PAYE-NM 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Kanji Payee Name";
	}

	IN MIR-SEND-PMT-NOTI-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Send Payment Notice";
	}

	IN MIR-INSRD-REL-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";		
		SType = "Text";
		Label = "Relationship to Insured";
	}

	IN MIR-FBNK-KJ-PREFCT-TXT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Text";
		Label = "Kanji Address Line 1";
	}

	IN MIR-FBNK-KJ-CITY-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Kanji Address Line 2";
	}

	IN MIR-FBNK-KJ-NGHBRHD-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Kanji Address Line 3";
	}

	IN MIR-FBNK-PSTL-CD 
	{
		DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}

	IN MIR-FBNK-SAMAKATA-BU-TXT 
	{
		DisplayOnly;
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
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

	IN MIR-ACCT-TYP-CD 
	{
		DisplayOnly;
		Length = "3";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}

	IN MIR-BNK-ACCT-ID 
	{
		DisplayOnly;
		Length = "17";
		SType = "Text";
		Label = "Account Number";
	}

	IN MIR-ACCT-HLDR-NM 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Account Holder Name";
	}

	IN MIR-DV-ADJ-PMT-AMT 
	{
#Q50705 CHANGES START HERE    
        CurrencyCode = "MIR-REMIT-CRCY-CD";
#Q50705 CHANGES END HERE 	
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Adjusted Payment Amount";
	}

	IN MIR-FINAL-APROV-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Final Approval Date";
	}

#  ISLADM Changes Start here        
        IN MIR-CO-RECV-DT
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
                Label = "Company Received Date";
        }
#  ISLADM Changes End here

	IN MIR-FBNK-STAT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "FBNK-STAT-CD";
		SType = "Text";
		Label = "Firm Banking Status";
	}

	IN MIR-FBNK-FAIL-RSN-TXT 
	{
		DisplayOnly;
		Length = "40";
		SType = "Text";
		Label = "Fail Reason";
	}
	
# Q50690 CHANGES START HERE
        IN MIR-FBNK-CREAT-TYP-CD 
        {
           DisplayOnly;
           Length = "1";
           FieldGroup = "Table1";
           Index = "1";
           SType = "Text";
           CodeSource = "DataModel";
           CodeType = "FBNK-PAYO-MTHD-CD";     
           Label = "Payout Method Type";
        }
# Q50690 CHANGES END HERE        

	IN MIR-FBNK-RE-REMIT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Re-Remittance Date";
	}

	IN MIR-PREM-DED-AMT 
	{
#Q50705 CHANGES START HERE    
        CurrencyCode = "MIR-REMIT-CRCY-CD";
#Q50705 CHANGES END HERE 	
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Premium Deducted";
	}

	IN MIR-BNFT-PMT-AMT 
	{
#Q50705 CHANGES START HERE    
        CurrencyCode = "MIR-REMIT-CRCY-CD";
#Q50705 CHANGES END HERE 	
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Payment Amount";
	}

	IN MIR-DLAY-INT-AMT 
	{
#Q50705 CHANGES START HERE    
        CurrencyCode = "MIR-REMIT-CRCY-CD";
#Q50705 CHANGES END HERE 	
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Interest Paid";
	}
#MP302M CHANGES STARTS HERE
         IN MIR-SRVBEN-CHRGBCK-AMT
         {
                CurrencyCode = "MIR-REMIT-CRCY-CD";
                DisplayOnly;
                Length = "15";
                SType = "Currency";
                Label = "Survival Benefit Chargeback Deducted";
         }
#MP302M CHANGES ENDS HERE
	OUT MIR-ACTION-TO-TAKE-CD
	{
	        SType = "Hidden";
	}
	
	OUT MIR-SELECTED-FBNK-STAT-CD
	{
	        SType = "Hidden";
	}
	
#Q50705 CHANGES START HERE    
      INOUT MIR-REMIT-CRCY-CD
       {
      
              Length = "5";
              CodeSource = "EDIT";
#UYS70A CHANGES BEGINS             
             # CodeType = "CRCY";
              CodeType = "LCRCY";
#UYS70A CHANGES ENDS     
              SType = "Text";
              Label = "Currency";
       }
#Q50705 CHANGES END HERE  
#UYS70A CHANGES START HERE 
      IN MIR-POL-DED-TYP-CD-T[20]
      {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "POL-DED-TYP-CD";
        SType = "Text";
        Label = "Deduction"; 
        Index = "1";
      }      
    
      IN MIR-POL-DED-AMT-T[20]
      {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        CurrencyCode = "MIR-DV-DED-CRCY-CD-T[]";
        Label = "Deduction";
        Index = "1";        
      }
      
      IN MIR-POL-PMT-TYP-CD-T[20]
      {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "POL-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment"; 
        Index = "1";
      }
      
      IN MIR-POL-PMT-AMT-T[20]
      {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        CurrencyCode = "MIR-DV-PMT-CRCY-CD-T[]";
        Label = "Payment";
        Index = "1";        
      }
      
      IN MIR-ORIG-PMT-CRCY-CD
      {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "LCRCY";
        SType = "Text";
        Label = "Currency";
      }     
      
      IN MIR-XCHG-EFF-DT
      {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective Date";
      }      
           
      IN MIR-DV-JP-XCHNG-RT
      { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate";     
      } 
   IN MIR-ACTL-XCHG-EFF-DT
   {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Actual Exchange Effective Date";
    }
     IN MIR-DV-DED-CRCY-CD-T[20]
     {

        Length = "5";
        SType = "Hidden";
        Label = "Currency";
        Index = "1";  
     }
     IN MIR-DV-PMT-CRCY-CD-T[20]
     {

        Length = "5";
        SType = "Hidden";
        Label = "Currency";
        Index = "1";  
     }
#UY3049 changes starts
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
#UY3049 changes ends     
#UYS70A changes ends here
}

