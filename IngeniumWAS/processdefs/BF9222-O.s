#*******************************************************************************
#*  Component:   BF9222-O.s                                                    *
#*  Description: UL MEDICAL CLAIM SUMMARY OUTPUT S-STEP                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388 CTS     Initial Version                                           *
#*  EN001058 CTS      INCREAED NO. OF CLAIM NOTES TO 15 OCCURANCES             *
#*  RP211d   CTS      ADDED SUBTABLE 4 CODE                                    *
#*  RP2CLA   CTS      CHANGES FOR CANCER LUMPSUM AUTOMATION                    *
#*  ISLCLM   CTS      ADDED STEP-IN RIGHT INFORMATION FIELDS                   *
#*  MP143H   CTS      ADDED NEW FIELDS 'CI Event Date', 'CI Event Type' AND    *
#*  MP143H            'ICU Date'                                               *
#*  M176J3   CTS      CHANGES DONE FOR ARM TRANSPLANT BENEFIT                  *
#*  M253O1   CTS      ADDED NEW FIELDS FOR PAYEE INFORMATION  AND CANCER       *
#*  M253O1   CTS      DIAGNOSIS SECTION                                        *
#*  M281P2   CTS      CHANGES AS PART OF RETAIL CANCER                         *
#*  M280P2   CTS      CHANGES AS PART OF ARM III                               *
#*  Q71518   CTS      CHANGES DONE TO ADD HOME TREATMENT AND ASSOCIATED        *
#*                    DISEASE                                                  *
#*  MP300C  CTS       CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC *
#*  MP302M  CTS       CHANGES TO ADD NEW FIELD FOR SURVIVAL BENEFIT CHARGEBACK *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  CXT001  CTS      ADJUCICATION MESSAGES & REQUIREMENT CHANGES               *
#*  R19749  CTS      INC06199510 - FIX                                         *
#*  UY3070  CTS      STREAM 3 CANCER LUMP PAYMENT                              *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT      		                       *
#*******************************************************************************
S-STEP BF9222-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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

  IN MIR-CLM-ID 
  {
    DefaultSession = "MIR-CLM-ID";
    DisplayOnly;
    Key;
    Label = "Master Claim ID";
    Length = "8";
    SType = "Text";
  }

  IN MIR-CLMA-ASSOC-CLM-ID 
  {
    DisplayOnly;
    Label = "Associated Master Claim ID";
    Length = "8";
    SType = "Text";
  }

  IN MIR-CLMA-INSRD-CLI-ID 
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

  IN MIR-CLI-BTH-DT 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Label = "Birth Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CLI-SEX-CD 
  {
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    DisplayOnly;
    Label = "Gender";
    Length = "1";
    SType = "Text";
  }
#*ISLCLM CHANGE START
  IN MIR-CO-RECV-DT
  {
    Length = "10";
    DBTableName = "TCLBN";
    SType = "Date";
    Label = "Company Received Date";
   }
#*ISLCLM CHANGE END


  IN MIR-CLMA-HO-ACPT-DT 
  {
    DisplayOnly;
    Label = "HO Acceptance Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-BR-ID 
  {
    CodeSource = "XTAB";
    CodeType = "BRCH";
    DisplayOnly;
    Label = "RO Code";
    Length = "5";
    SType = "Text";
  }

  IN MIR-SO-ID 
  {
    CodeSource = "XTAB";
    CodeType = "SALE";
    DisplayOnly;
    Label = "SO Code";
    Length = "5";
    SType = "Text";
  }

  IN MIR-ADJ-USER-ID 
  {
    DisplayOnly;
    Label = "Adjudicator ID";
    Length = "8";
    SType = "Text";
  }

  IN MIR-POL-ID-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Policy Id";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CVG-NUM-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Coverage Number";
    Length = "2";
    SType = "Text";
  }
#*UY3070 CHANGE START
  IN MIR-PLAN-CD-T[50] 
    {
      DisplayOnly;
      FieldGroup = "Table2";
      Label = "Plan Code";
      Length = "3";
      SType = "Text";
  }
#*UY3070 CHANGE END

  IN MIR-PLAN-ID-T[50] 
  {
    CodeSource = "EDIT";
    CodeType = "PLAN";
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Plan";
    Length = "6";
    SType = "Text";
  }

  IN MIR-CVG-FACE-AMT-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Face Amount";
    Length = "16";
    SType = "Currency";
    Signed;
  }

  IN MIR-CVG-ISS-EFF-DT-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Issue Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CVG-CSTAT-CD-T[50] 
  {
    CodeSource = "DataModel";
    CodeType = "CVG-CSTAT-CD";
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Coverage Status";
    Length = "3";
    SType = "Text";
  }

  IN MIR-CVG-STBL-2-CD-T[50] 
  {
    CodeSource = "EDIT";
    CodeType = "STB2";
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Sub-table 2";
    Length = "3";
    SType = "Text";
  }

  IN MIR-CVG-STBL-4-CD-T[50] 
  {
    CodeSource = "EDIT";
    CodeType = "STB4";
    DisplayOnly;
    FieldGroup = "Table2";
    Label = "Sub-table 4";
    Length = "2";
    SType = "Text";
  }
  
#ISLCLM - Changes start here     
  IN MIR-SURR-FORM-ACPT-DT
  { 
    DisplayOnly;
    Length = "10";
    DBTableName = "TPOL";        
    SType = "Date";
    Label = "Surrender Request Form Acceptance Date";
  }
            
  IN MIR-ASIGN-SURR-EFF-DT
  { 
    DisplayOnly;
    Length = "10";
    DBTableName = "TPOL";                
    SType = "Date";
    Label = "Assigned Surrender Effective Date for Policy with Assignee";
  }
            
  IN MIR-POL-STEP-IN-RIGHT-IND
  { 
    DisplayOnly;
    Length = "1";
    DBTableName = "TPOL";                
    SType = "Text";
    Label = "Policy with Step-In Right";
  }    
#ISLCLM - Changes end here

  IN MIR-CLMA-INCID-TYP 
  {
    DisplayOnly;
    Label = "Incident Type";
    CodeSource = "DataModel";
    CodeType = "INCID-TYP-CD";
    Length = "1";
    SType = "Text";
  }

  IN MIR-CLMA-INCID-DT 
  {
    DisplayOnly;
    Label = "Incident Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-DIS-MAJ-CD-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table4";
    Label = "Major Disease Code";
    Length = "10";
    SType = "Text";
  }

  IN MIR-DV-CLMA-DIS-CAUS-DESC-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table4";
    Label = "Kanji Description";
    Length = "60";
    SType = "Text";
  }

  IN MIR-HOSP-STRT-DT-T[10] 
  {
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Hosp. Start Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-HOSP-END-DT-T[10] 
  {
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Hosp. End Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-DV-TOT-BEFORE-AGGR-QTY-T[10] 
  {
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Total Before Aggregation";
    Length = "10";
    SType = "Text";
    Signed;
  }

  IN MIR-HOSP-STAT-CD-T[10] 
  {
    CodeSource = "DataModel";
    CodeType = "CLEV-HOSP-STAT-CD";
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Discharge Status";
    Length = "01";
    SType = "Text";
  }
#M280P2 CHANGES STARTS HERE   
#   IN MIR-SURGY-STRT-DT-T[10]
  IN MIR-SURGY-STRT-DT-T[30]
#M280P2 CHANGES ENDS HERE   
  {
    DisplayOnly;
    FieldGroup = "Table6";
    Label = "Surgeries Start Date";
    Length = "10";
    SType = "Date";
  } 
#M280P2 CHANGES STARTS HERE  
#   IN MIR-DV-SURGY-MINR-DESC-T[10] 
  IN MIR-DV-SURGY-MINR-DESC-T[30]
#M280P2 CHANGES ENDS HERE   
  {
    DisplayOnly;
    FieldGroup = "Table6";
    Label = "Kanji Description";
    Length = "60";
    SType = "Text";
  }

  IN MIR-OUTP-STRT-DT 
  {
    DisplayOnly;
    Label = "Outpatient Start Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-OUTP-END-DT 
  {
    DisplayOnly;
    Label = "Outpatient End Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-DV-TOT-OUTP-DYS 
  {
    DisplayOnly;
    Label = "Total";
    Length = "3";
    SType = "Text";
  }
#*M253O1 CHANGES START
  IN MIR-CANCER-DIAGNS-DT
  {
    Length = "10";
    DBTableName = "TCLMA";
    SType = "Date";
    Label = "Diagnosed Date";
    FieldGroup = "Table14";             
  }
  
  IN MIR-CANCER-TYP-CD
  {
    DisplayOnly;  
    Length = "1";
    CodeSource = "EDIT"; 
    CodeType = "CATYP";
    Label = "Cancer Type";
    FieldGroup = "Table14";  
    SType = "Text";    
  }
  
#*M281P2 CHANGES START
  IN MIR-CANCER-STAGE-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT"; 
    CodeType = "CASTG";    
    Label = "Cancer Stage";
    FieldGroup = "Table14";     
    SType = "Text";    
  }
#*M281P2 CHANGES END  
#*M280P2 CHANGES START
       IN MIR-3DD-WP-IND-T[50]
      {
             Length = "40";
             CodeSource = "EDIT";
             CodeType = "3DDW";  
             DBTableName = "TCVG";
             SType = "Text";
             Label = "3DD Waiver of Premium";
             Index = "1";
             FieldGroup = "Table8";             
       }
#*M280P2 CHANGES END         
  IN MIR-CANCER-OUTCM-CD
  {
    DisplayOnly;
    Length = "5";
    CodeSource = "EDIT"; 
    CodeType = "CAOCM";    
    Label = "Outcome of Cancer";
    FieldGroup = "Table14";     
    SType = "Text";    
  }
#*M253O1 CHANGES END  

#*M281P2 CHANGES START	

  IN MIR-PALLIATIVE-STRT-DT-T[20] 
  {
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Palliative Start Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-PALLIATIVE-END-DT-T[20] 
  {
    DisplayOnly;
    FieldGroup = "Table5";
    Label = "Palliative End Date";
    Length = "10";
    SType = "Date";
  }

#*M281P2 CHANGES END

#*MP143H CHANGES START
#*M176J3 CHANGES START 
#*Label name "CI Event Date" is changed as "CI/Transplant Benefit Event Date"
#*Label name "CI Event Type" is changed as "CI/Transplant Benefit Event Type"
  IN MIR-CI-DIAGNS-DT
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TCLMA";
    SType = "Date";
    Label = "CI/Transplant Benefit Event Date";
  }
  IN MIR-CI-EVNT-TYP-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "CITYP";
    DBTableName = "TCLMA";
    SType = "Text";
    Label = "CI/Transplant Benefit Event Type";
  }  
#*M176J3 CHANGES END 
  IN MIR-ICU-DT
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TCLMA";
    SType = "Date";
    Label = "ICU Date";
  }      
#*MP143H CHANGES END   

  IN MIR-POL-ID1-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Policy Id";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CVG-NUM1-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Coverage Number";
    Length = "2";
    SType = "Text";
  }
#*UY3070 CHANGES START
  IN MIR-PLAN-CD1-T[50] 
   {
     DisplayOnly;
     FieldGroup = "Table8";
     Label = "Plan Code";
     Length = "3";
     SType = "Text";
  }
#*UY3070 CHANGES END
  IN MIR-PLAN-ID1-T[50]
  {
    CodeSource = "EDIT";
    CodeType = "PLAN";
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Plan";
    Length = "6";
    SType = "Text";
  }

  IN MIR-CVG-FACE-AMT1-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Face Amount";
    Length = "16";
    SType = "Currency";
    Signed;
  }

  IN MIR-BNFT-NM-ID-T[50] 
  {
    CodeSource = "EDIT";
    CodeType = "BENNM";
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Benefit Name";
    Length = "05";
    SType = "Text";
  }

  IN MIR-DV-BNFT-MULTR-FCT-T[50] 
  {
#*RP2CLA-Changed Decimals ="1"  
    Decimals = "1";
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Multiplier";
    Length = "6";
    SType = "Number";
  }

  IN MIR-DV-BNFT-PAYBL-AMT-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Payment Amount";
    Length = "16";
    SType = "Currency";
    Signed;
  }

  IN MIR-BNFT-DECSN-CD-T[50] 
  {
    CodeSource = "DataModel";
    CodeType = "CLBN-BNFT-DECSN-CD";
    DisplayOnly;
    FieldGroup = "Table8";
    Label = "Decision";
    Length = "2";
    SType = "Text";
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
  IN MIR-DV-FACE-AMT-TOT 
  {
    DisplayOnly;
    Label = "Face Amount Total";
    Length = "16";
    SType = "Currency";
    Signed;
  }
#* MP302M CHANGES STARTS HERE
  IN MIR-SRVBEN-CHRGBCK-AMT
  {
    DisplayOnly;
#*UY323A CHANGES STARTS
#    Label = "Survival Benefit Chargeback Amount";
    Label = "Benefit Chargeback Amount";
#*UY323A CHANGES ENDS
    Length = "15";
    SType = "Currency";
    Signed;
  }
#* MP302M CHANGES ENDS HERE
#* M253O1 STARTS HERE

  IN MIR-SEND-PMT-NOTI-IND-T[10] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Indicator";
    Label = "Send Notice";
  }

  IN MIR-KJ-PREFCT-TXT-T[10] 
  {
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "Prefecture";
  }

  IN MIR-KJ-CITY-TXT-T[10] 
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "City";
  }

  IN MIR-KJ-NGHBRHD-TXT-T[10] 
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "Neighbourhood";
  }

  IN MIR-CLRL-SAMAKATA-BU-TXT-T[10] 
  {
    DisplayOnly;
    Length = "72";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "Samakata-bu";
  }
  
  IN MIR-PAYEE-NM-TXT-6-T[10] 
  {
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "Payee Name";
  }
  
  IN MIR-PAYEE-PREV-UPDT-DT-T[10] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Date";
    Label = "Previous Update Date";
  }
  
  IN MIR-PAYEE-PREV-UPDT-USER-ID-T[10] 
  {
    DisplayOnly;
    Length = "8";
    FieldGroup = "Table13";
    Index = "1";
    SType = "Text";
    Label = "Previous Update User ID";
  }

#* M253O1 CHANGES ENDS HERE
  IN MIR-BNK-ID-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Bank Code";
    Length = "4";
    SType = "Text";
  }

  IN MIR-BNK-NM-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Bank Name";
    Length = "36";
    SType = "Text";
  }

  IN MIR-BNK-BR-ID-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Branch Code";
    Length = "5";
    SType = "Text";
  }

  IN MIR-BNK-BR-NM-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Branch Name";
    Length = "36";
    SType = "Text";
  }

  IN MIR-PAYEE-ACCT-TYP-CD-T[5] 
  {
    CodeSource = "EDIT";
    CodeType = "FBACC";
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Account Type";
    Length = "3";
    SType = "Text";
  }

  IN MIR-PAYEE-BNK-ACCT-ID-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Account Number";
    Length = "17";
    SType = "Text";
  }

  IN MIR-PAYEE-ACCT-HLDR-NM-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Account Nominee Name";
    Length = "50";
    SType = "Text";
  }

  IN MIR-POL-BILL-TYP-CD-IND-T[5] 
  {
    CodeSource = "DataModel";
    CodeType = "POL-BILL-TYP-CD";
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Bank Transfer";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-DV-ACCT-CHK-IND-T[5] 
  {
    DisplayOnly;
    FieldGroup = "Table9";
    Label = "Transfer account";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-MSG-TXT-T[30] 
  {
    DisplayOnly;
    FieldGroup = "Table10";
    Label = "Message";
    Length = "120";
    SType = "Text";
  }

  IN MIR-AMEX-POL-ID-T[10] 
  {
    DisplayOnly;
    FieldGroup = "Table11";
    Label;
    Length = "9";
    SType = "Text";
  }

  IN MIR-AMEX-COMNT-INFO-T[10] 
  {
    DisplayOnly;
    FieldGroup = "Table11";
    Label;
    Length = "79";
    SType = "Text";
  }

#EN1058  IN MIR-PREV-UPDT-USER-ID-T[5] 
  IN MIR-PREV-UPDT-USER-ID-T[15] 
  {
    DisplayOnly;
    FieldGroup = "Table12";
    Label = "User";
    Length = "8";
    SType = "Text";
  }

#EN1058  IN MIR-PREV-UPDT-DT-T[5] 
  IN MIR-PREV-UPDT-DT-T[15] 
  {
    DisplayOnly;
    FieldGroup = "Table12";
    Label = "Creation Day";
    Length = "10";
    SType = "Date";
  }

#EN1058  IN MIR-FTXT-CMNT-INFO-T[5] 
  IN MIR-FTXT-CMNT-INFO-T[15] 
  {
    DisplayOnly;
    FieldGroup = "Table12";
    Label = "Claim Note";
    Length = "500";
    SType = "Text";
  }
  IN MIR-INFO
  {
    Length = "90";
    SType = "Text";

  }

#Q71518 CHANGES STARTS HERE
        IN MIR-HOME-TRTMNT-STRT-DT-T[20]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table7";
		SType = "Date";
		Label = "Home Treatment Start Date";
	}   
	
        IN MIR-HOME-TRTMNT-END-DT-T[20]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table7";
		SType = "Date";
		Label = "Home Treatment End Date";
	} 
	
	IN MIR-ASSOC-DIS-MAJ-CD-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table15";
		SType = "Text";
		Label = "Major Associated Disease Code";
	}

	IN MIR-ASSOC-DIS-MINR-CD-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table15";
		SType = "Text";
		Label = "Minor Associated Disease Code";
        }
        
	IN MIR-ASSOC-DIS-MINR-DESC-TXT-T[10] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table4";
		SType = "Text";
		Label = "Minor Associated Disease Code Description";
	}
	
	IN MIR-ASSOC-DIS-STRT-DT-T[10]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table15";
		SType = "Date";
		Label = "Associated Disease Start Date";
	}
	
	IN MIR-ASSOC-DIS-END-DT-T[10]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table15";
		SType = "Date";
		Label = "Associated Disease End Date";
	}
#Q71518 CHANGES ENDS HERE	
#*MP300C CHANGES START
       IN MIR-SCRN-POL-ID-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table3";
                Label = "Policy Id";
                Length = "10";
                SType = "Text";
        }
        IN MIR-PRE-LCD-CHK-IND-T[50]
        {
                Length = "01";
                FieldGroup = "Table3";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                SType = "Text";
                Label = "Pre-LCD Check";
        }
        IN MIR-SCRN-PRE-LCD-CHK-IND-T[50]
        {
                Length = "01";
                FieldGroup = "Table3";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                SType = "Text";
                Label = "Pre-LCD Check";
        } 
#*CXT001 CHANGES START        
	IN MIR-CLIM-MORAL-RISK-CD 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "MORAL";
		SType = "Text";
		Label = "Moral Risk Category";
	}	
	
	IN MIR-FTXT-MORAL-CMNT-INFO
	{
		DisplayOnly;
		Length = "500";
		SType = "Text";
		Label = "Moral Risk Note";
	}
#*CXT001 CHANGES END        
#*MP300C CHANGES END
#R19749 CHANGES START HERE 
   INOUT MIR-POL-CRCY-CD-T[50]
        {
                Length = "2";
                SType = "Hidden";
                Label = "Currency";
        }   
#R19749 CHANGES END HERE 
}	
