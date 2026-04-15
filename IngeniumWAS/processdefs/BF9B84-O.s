#*******************************************************************************
#*  Component:   BF9B84-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#* NWLCAR   29OCT09  NEW DEPOSIT HISTORY SCREEN FOR NWL POLICIES               *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  R10762  CTS     ADDITION OF EXPECTED LAPSE DATE FIELD                      *
#*  M319B1  CTS      CHANGES FOR FXWL PROJECT                                  *
#*  FFF002  CTS      CHANGES FOR SHOWING JPY AMOUNT FOR JPY TRANSACTION AMT    *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  FFF10Q  CTS      CHANGES FOR FFF PRODUCT                                   *
#*  TL0763  CTS     ADDITION OF Elapsed Duration of CSV FILED                  *
#*******************************************************************************

S-STEP BF9B84-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
		Type = "Output";
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

	IN MIR-POL-ID-BASE 
	{
		DefaultSession = "MIR-POL-ID-BASE";
		DisplayOnly;
		Key;
		Label = "Policy Id";
		Length = "9";
		SType = "Text";
	}
    #TDMG24 CHANGES START HERE    
        IN MIR-POL-CSTAT-CD
    {
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        Label = "Current Policy Status";
        Length = "40";
        SType = "Text";
     }
     
   #TDMG24 CHANGES END HERE 

   #TDMG24 CHANGES START HERE
    IN MIR-PREM-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";

    }    
   #TDMG24 CHANGES END HERE    	

	IN MIR-POL-ID-SFX 
	{
		DefaultSession = "MIR-POL-ID-SFX";
		DisplayOnly;
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

	IN MIR-APPL-CTL-PRCES-DT 
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Key;
		Label = "Process Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-DV-OWN-CLI-NM 
	{
		DisplayOnly;
		Label = "Owner Name";
		Length = "75";
		SType = "Text";
	}

	IN MIR-PLAN-ID 
	{
		CodeSource = "EDIT";
		CodeType = "PLAN";
		DisplayOnly;
		Label = "Plan ID";
		Length = "40";
		SType = "Text";
	}

	IN MIR-POL-ISS-EFF-DT 
	{
		DisplayOnly;
		Label = "Issue Date of the Policy";
		Length = "10";
		SType = "Date";
	}

	IN MIR-POL-PD-TO-MO-NUM 
	{
		DisplayOnly;
		Label = "Policy Paid to Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-POL-PD-TO-DT-NUM 
	{
		DisplayOnly;
		Label = "Policy Paid to Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-POL-PD-DURATION-NUM 
	{
		DisplayOnly;
		Label = "Policy Paid Duration";
		Length = "7";
		SType = "Text";
	}

	IN MIR-TRAD-PD-TO-MO-NUM 
	{
		DisplayOnly;
		Label = "Trad Paid to Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-TRAD-PD-TO-DT-NUM 
	{
		DisplayOnly;
		Label = "Trad Paid to Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-TRAD-PD-DURATION-NUM 
	{
		DisplayOnly;
		Label = "Trad Paid Duration";
		Length = "6";
		SType = "Text";
	}
	
#R10762 CHANGES START HERE
	IN MIR-EXPCT-LAPS-DT 
	{
            DisplayOnly;
            Length = "10";
            DBTableName = "Derived";
            SType = "Date";
            Label = "Expected Lapse Date";
	}
#R10762 CHANGES END HERE    

	IN MIR-COLCT-MTHD-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "COLCT-MTHD-CD";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Collection Method";
		Length = "3";
		SType = "Text";
	}

	IN MIR-COLCT-CATG-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "COLCT-CATG-CD";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Collection Category";
		Length = "3";
		SType = "Text";
	}

	IN MIR-TRAD-JRNL-DT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Trad Journal Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-TRAD-SO-JRNL-DT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Trad SO Journal Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-TRAD-RECV-DT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Trad Received Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-PREM-DUE-MO-NUM-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Premium Due Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-DPOS-RFND-QTY-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Number of Deposits/ Refunds";
		Length = "3";
		SType = "Text";
	}

	IN MIR-TRXN-AMT-T[50] 
	{
	 #M245B2 CHANGES START HERE    
	 #FFF10Q CHANGES START HERE
	 #       CurrencyCode="MIR-PMT-CRCY-CD";
	        CurrencyCode="MIR-TRXN-CRCY-CD-T[]";
	 #FFF10Q CHANGES END HERE       
         #M245B2 CHANGES END HERE 
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Transaction Amount";
		Length = "15";
		SType = "Currency";
		Signed;
	}
	
#M319B1 CHANGES START HERE
        IN MIR-CRCY-XCHNG-RT-T[50]
	{
                DisplayOnly;
                FieldGroup = "Table50";
		Index = "1";
                Length = "18";
                SType = "Number";
                Label = "JPY Conversion Rate";
	}
	
        IN MIR-JPY-TRXN-AMT-T[50] 
	{

#FFF002 Changes Starts here
#               CurrencyCode="MIR-PMT-CRCY-CD";
#FFF002 Changes Ends here

	        DisplayOnly;
	        FieldGroup = "Table50";
		Index = "1";
	        Length = "16";
	        SType = "Currency";
	        Label = "Payment Amount (Yen Equivalent amount)";
	        Signed;
	}
	
        IN MIR-PREM-CRCY-TRXN-AMT-T[50] 
        {
	        CurrencyCode="MIR-PREM-CRCY-CD";
	        DisplayOnly;
	        FieldGroup = "Table50";
		Index = "1";
	        Length = "16";
	        SType = "Currency";
	        Label = "Premium (Policy Currency)";
	        Signed;
        }
	
        IN MIR-CRCY-XCHNG-EFF-DT-T[50] 
	{
	        DisplayOnly;
	        FieldGroup = "Table50";
		Index = "1";
	        Length = "10";
	        SType = "Date";
	        Label = "Conversion Rate Effective Date";
	}
#M319B1 CHANGES END HERE  

	IN MIR-TRXN-PRCES-DT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Transaction Process Date";
		Length = "10";
		SType = "Text";
	}

	IN MIR-SEQ-NUM-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Sequence Number";
		Length = "3";
		SType = "Text";
	}

	IN MIR-HID-TRAD-SO-JRNL-DT 
	{
		DisplayOnly;
		Label = "Trad SO Journal Date";
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-SEQ-NUM 
	{
		DisplayOnly;
		Label = "Sequence Number";
		Length = "3";
		SType = "Hidden";
	}
	
#M245B2 CHANGES START HERE	
#FFF10Q CHANGES START HERE
#	 INOUT MIR-PMT-CRCY-CD
#	    {
#	        Length = "2"; 
#	        SType = "Hidden";
#	        Label = "Currency";
#   }
   INOUT MIR-TRXN-CRCY-CD-T[50]
  
       {
         Length = "2";
         FieldGroup = "Table1";         
         SType = "Hidden";
         Label = "Transaction currency code";
         Index = "1";
     }
#FFF10Q CHANGES END HERE 
#M245B2 CHANGES END HERE    

#M319B1 CHANGES START HERE
         INOUT MIR-PREM-CRCY-CD
	    {
	        Length = "2"; 
	        SType = "Hidden";
	        Label = "Currency";
   }
#M319B1 CHANGES END HERE
#TL0763 CHANGES START HERE
	IN MIR-CSV-ELPSD-DUR
	{
		DisplayOnly;
		Label = "Elapsed Duration of CSV";
		Length = "7";
		SType = "Text";
	}
#TL0763 CHANGES END HERE
}
