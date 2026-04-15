# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#**********************************************************************************
#*  Component:   BF9A94-O.s                                                       *
#*  Description: Payee Update Screen               .                              *
#*                                                                                *
#**********************************************************************************
#*  Chg#    Release  Description                                                  *
#*                                                                                *
#*  IPCAPM  CTS      Intial Version                                               *
#*  IPCA02  CTS      CHANGE THE DISPLAY TAX INFORMATION FEILD FROM INDICATOR TO   *
#*  IPCA02           DROP DOWN                                                    *
#*  ABU209  CTS     FIX TO DISPLAY RELATION TO INSURED                            *
#*  M142S2  CTS      Change the label for MIR-PREM-ACUM-AMT from Total Premiun    * 
#*  M142S2           Collected - Accumulated to Taxable Premium Paid              *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245K3  CTS     CHANGE THE ACCOUNT NUMBER FIELD LENGTH FROM 7 TO 17           *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  Q61523  CTS      BUG FIXING FOR CURRENCY SYMBOL                               * 
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS                 **
#*  MP332B  CTS      XML Changes for Money Laundering                             *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION             *
#**********************************************************************************

S-STEP BF9A94-O

{
	ATTRIBUTES
	{
		 BusinessFunctionType = "List";
		 Type = "Input";
		 DelEmptyRows;
		 FocusField = "SELECT-T[1]";
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
	
	OUT index
	{
	        SType="Hidden";
	}        

	IN MIR-CLM-STAT-CD 
	{
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";
		DisplayOnly;
		Label = "Death Master Claim Status";
		Length = "40";
		SType = "Text";
	}

	IN MIR-POL-ID 
	{
		DisplayOnly;
		Label = "Policy ID";
		Length = "10";
		SType = "Text";
	}

	IN MIR-CLM-ID 
	{
		DisplayOnly;
		Key;
		Label = "Death Master Claim ID";
		Length = "8";
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
        

	IN MIR-BNFY-SEQ-NUM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Sequence Number";
		Length = "3";
		SType = "Text";
	}

	IN MIR-BENE-INSRD-CLI-ID-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Client Number";
		Length = "10";
		SType = "Text";
	}

	IN MIR-BENE-BNFY-NM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Beneficiary Name";
		#TLB041 CHANGES START HERE
		#Length = "54";
		Length = "100";
		#TLB041 CHANGES END HERE
		SType = "Text";
	}

        IN MIR-BNFY-TYP-CD-T[30]
        {
                Length = "1";
                FieldGroup = "Table1";
                CodeSource = "DataModel";
                CodeType   = "BNFY-TYP-CD";
                Label = "Beneficiary Type Code";
                Index = "1";
                SType = "Text";
        }

	IN MIR-BNFY-DESGNT-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "BNFY-DESGNT-CD";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Beneficiary Designation Code";
		Length = "1";
		SType = "Text";
	}

	IN MIR-BNFY-REL-INSRD-CD-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
#ABU209 CHANGES START HERE       
                CodeSource = "EDIT";
                CodeType   = "BTOI";  
#ABU209 CHANGES END HERE        		
		Label = "Relation to the Insured";
		Length = "10";
		SType = "Text";
	}

	IN MIR-BNFY-PRCDS-PCT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Percentage";
		Length = "3";
		SType = "Number";
	}

	IN MIR-BNFY-MINR-IND-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "BNFY-MINR-IND";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Beneficiary is a Minor";
		Length = "1";
		SType = "Indicator";
	}
         
	IN MIR-PAYEE-NM-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		KeyColumn;
		Label = "Payee Name(Kanji)";
		Length = "50";
		SType = "Text";
	}

	IN MIR-BNK-NM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Current Bank Name";
		Length = "36";
		SType = "Text";
	}

	IN MIR-BNK-BR-NM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Current Branch Name";
		Length = "36";
		SType = "Text";
	}

	IN MIR-ACCT-TYP-CD-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Account Type";
                CodeSource = "EDIT";
                CodeType = "FBACC";		
		Length = "3";
		SType = "Text";
	}

	IN MIR-DCRL-BNK-ACCT-ID-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Account Number";
#* M245K3 CHANGES STARTS HERE
#* 		Length = "7";
                Length = "17";
#* M245K3 CHANGES ENDS HERE                
		SType = "Text";
	}

	IN MIR-DCRL-ACCT-HLDR-NM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Account Holder Name";
		Length = "50";
		SType = "Text";
	}

	IN MIR-DCRL-KJ-ADDR-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Address";
		Length = "50";
		SType = "Text";
	}

	IN MIR-DCRL-SAMAKATA-BU-TXT-T[30] 
	{
		DisplayOnly;
		Label = "Samakata-bu";
		Length = "72";
		SType = "Text";
	}

	IN MIR-DCRL-SEND-PMT-NOTI-IND-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Send Notice";
		Length = "1";
		SType = "Indicator";
	}

	IN MIR-DCRL-INSRD-REL-CD-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Relation to Beneficiary";
		Length = "40";
		SType = "Text";
	}

	IN MIR-DCRL-PAYE-STAT-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "DCRL-PAYE-STAT-CD";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Payee Status";
		Length = "1";
		SType = "Text";
	}
#* M271C9 CHANGES STARTS HERE

	IN MIR-BNK-NM-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Second Bank Name";
		Length = "36";
		SType = "Text";
	}

	IN MIR-BNK-BR-NM-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Second Branch Name";
		Length = "36";
		SType = "Text";
	}

	IN MIR-ACCT-TYP-CD-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Second Account Type";
                CodeSource = "EDIT";
                CodeType = "FBACC";		
		Length = "3";
		SType = "Text";
	}

	IN MIR-DCRL-BNK-ACCT-ID-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Second Account Number";
                Length = "17";
		SType = "Text";
	}

	IN MIR-DCRL-ACCT-HLDR-NM-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Label = "Second Account Holder Name";
		Length = "50";
		SType = "Text";
	}
#* M271C9 CHANGES ENDS HERE

	IN MIR-KJ-PAYEE-NM-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table3";
		Index = "1";
		Label = "Payee";
		Length = "30";
		SType = "Text";
	}

#IPCA02 CHANGES START HERE
	
	IN MIR-TAX-TYP-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
		DisplayOnly;
		FieldGroup = "Table3";
		Index = "1";
		Label = "Display Tax Information";
		Length = "2";
		SType = "Text";
	}

#IPCA02 CHANGES END HERE

	IN MIR-PREM-ACUM-AMT-T[30] 
	{
#M245Q2 CHANGES START HERE 	
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
#Q61523 CHANGES START HERE 
      # CurrencyCode = "MIR-POL-CRCY-CD";
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#Q61523 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE
#M245Q2 CHANGES END HERE 
		DisplayOnly;
		FieldGroup = "Table3";
		Index = "1";
		Label = "Taxable Premium Paid";
		Length = "1";
		SType = "Currency";
	}

	IN MIR-EXPL-RMRK-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table3";
		Index = "1";
		Label = "Explanatory Remarks";
		Length = "120";
		SType = "Text";
	}
#M245B2 CHANGES START HERE 	
	IN MIR-POL-CRCY-CD
        {     
	        Length = "2";
	        SType = "Hidden";
                Label = "Currency";
         }
#M245B2 CHANGES END HERE          
#M271O1 CHANGES START HERE  
#Q61523 CHANGES START HERE          
 #   INOUT MIR-PREM-CRCY-CD
 #   {
 #       SType = "Hidden";
 #       Label = "Currency";
 #   }  
#Q61523 CHANGES END HERE    
#M271O1 CHANGES END HERE 
#* MP332B Changes Start Here

    IN MIR-BNFY-KA-NM-T[12]
    {
         DisplayOnly;
         #TLB041 CHANGES START HERE
         #Length = "50";
         Length = "100";
         #TLB041 CHANGES END HERE
         FieldGroup = "Table12";
         SType = "Text";
         Label = "Beneficiary's Kana Name";
         Index = "1";
    }
    
    IN MIR-BNFY-SEX-CD-T[12]
    {
         DisplayOnly;
         Length = "1";
         FieldGroup = "Table12";
         CodeSource = "DataModel";
         CodeType = "BNFY-SEX-CD";
         SType = "Text";
         Label = "Beneficiary's Sex Code";
         Index = "1";
    }
   
    IN MIR-BNFY-BTH-DT-T[12]
    {
           DisplayOnly;
           Length = "10";
           FieldGroup = "Table12"; 
           SType = "Date";
           Label = "Beneficiary's Date Of Birth";
           Index = "1";
    }

#* MP332B Changes End Here

}
