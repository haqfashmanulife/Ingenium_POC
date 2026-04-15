# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9250-O.s                                                    *
#*  Description: Master Claim Inquiry                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   Initial version.                                          *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                  *
#*  EN0195  CTS      DOCTORS CERTIFIED DATE FIELD ADDITION                     *
#*  EN0388  CTS      ADDED RO AND SO CODE, ADJ ID                              *
#*  RP2CLA  CTS      ADDED CANCER DIAGNOSIS DATE AND CANCER TYPE CODE          *
#*  MP143G  CTS      ADDED CRITICAL ILLNESS DIAGNOSIS DATE AND EVENT TYPE CODE *
#*  M253O1  CTS      ADDED OUTCOME OF CANCER AND CHEMOTHERAPY DATE             *
#*  M281P2  CTS      CHANGES AS PART OF RETAIL CANCER                          *
#*                                                                             *
#*  M280P2  CTS      CHANGES DONE FOR ARM III                                  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM                                    *
#*******************************************************************************
S-STEP BF9250-O
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

	IN LSIR-PRCES-DT
	{
		SType="Hidden";
		DefaultSession = "LSIR-PRCES-DT";
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

	IN MIR-CLI-DTH-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Date of Death";
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

	IN MIR-INS-MORAL-RISK-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Insured Moral Risk";
	}

	IN MIR-CLAIM-NOTE-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Claim Note";
	}

	IN MIR-PREV-AUTO-ADJC-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Last Auto Adjudication Date";
	}

	IN MIR-PREV-UPDT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Previous Update Date";
	}

	IN MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "12";
		SType = "Text";
		Label = "Previous Update User ID";
	}

        IN MIR-CLMA-HIST-CLM-IND
        {
                Length = "1";
                DBTableName = "TCLMA";
                SType = "Indicator";
                Label = "Historical Claim";
        }

#UYSDMC CHANGES STARTS HERE
        IN MIR-CLMA-USYS-CLM-IND
        {
                Length = "1";
                DBTableName = "TCLMA";
                SType = "Indicator";
                Label = "Unisys Claim";
        }
#UYSDMC CHANGES ENDS HERE

        IN MIR-ADJ-USER-ID
        {
		DisplayOnly;
                Length = "8";
                SType = "Text";
                Label = "Adjudicator User ID";
        }

        IN MIR-BR-ID
        {
		DisplayOnly;
                Length = "5";
                SType = "Text";
                Label = "RO Code";
        }

        IN MIR-SO-ID
        {
		DisplayOnly;
                Length = "5";
                SType = "Text";
                Label = "SO Code";
        }
	IN MIR-CNTCT-INDV-SUR-NM 
	{
		DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	IN MIR-CNTCT-INDV-GIV-NM 
	{
		DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	IN MIR-CNTCT-CO-NM 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	IN MIR-CNTCT-INSRD-REL-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relationship to Insured";
	}

	IN MIR-CNTCT-PHON-1-TXT 
	{
		DisplayOnly;
		Length = "20";
		SType = "Text";
		Label = "Contact Phone Number";
	}

	IN MIR-CNTCT-PHON-2-TXT 
	{
		DisplayOnly;
		Length = "20";
		SType = "Text";
		Label = "Contact Mobile Number";
	}

	IN MIR-CNTCT-ADDR-LOC-CD 
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Contact Address Code";
	}

	IN MIR-CNTCT-PSTL-CD 
	{
		DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}

	IN MIR-CNTCT-ADDL-TXT 
	{
		DisplayOnly;
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}

	IN MIR-CNTCT-KJ-PREFCT-TXT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Text";
		Label = "Prefecture";
	}

	IN MIR-CNTCT-KJ-CITY-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "City";
	}

	IN MIR-CNTCT-KJ-NGHBRHD-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Neighbourhood";
	}

	IN MIR-PAYEE-NM-TXT-T[10] 
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Kanji Payee Name";
	}

	IN MIR-PAYEE-BNK-ID-T[10] 
	{
		DisplayOnly;
		Length = "4";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Bank Code";
	}

	IN MIR-PAYEE-BNK-BR-ID-T[10] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Branch Number";
	}

	IN MIR-PAYEE-BNK-ACCT-ID-T[10] 
	{
		DisplayOnly;
		Length = "17";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Account Number";
	}

	IN MIR-PAYEE-ACCT-TYP-CD-T[10] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table1";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}

	IN MIR-PAYEE-ACCT-HLDR-NM-T[10] 
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Account Holder Name";
	}

	IN MIR-PAYEE-ADDR-LOC-CD-T[10] 
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table1";
		SType = "Text";
		Label = "Address Code";
	}

	IN MIR-SEND-PMT-NOTI-IND-T[10] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		SType = "Indicator";
		Label = "Send Notice";
	}

	IN MIR-PAYEE-INSRD-REL-CD-T[10] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relationship to Insured";
	}

	IN MIR-PAYEE-STAT-CD-T[10] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		CodeSource = "DataModel";
		CodeType = "CLRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}

	IN MIR-CLMA-HO-NOTI-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Head Office Notification Date";
	}

	IN MIR-CLMA-HO-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Head Office Claim Form Acceptance Date";
	}

	IN MIR-CLMA-AGT-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Agent Claim Form Acceptance Date";
	}

	IN MIR-CLMA-SO-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Sales Office Claim Form Acceptance Date";
	}

	IN MIR-CLCC-CO-CD-T[5] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table2";
		CodeSource = "EDIT";
		CodeType = "CONFC";
		SType = "Text";
		Label = "Confirmation Company";
	}

	IN MIR-CLCC-STRT-DT-T[5] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		SType = "Date";
		Label = "Start Date";
	}

	IN MIR-CLCC-END-DT-T[5] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		SType = "Date";
		Label = "Completion Date";
	}

	IN MIR-CLCC-AMT-T[5] 
	{
		DisplayOnly;
		Signed;
		Length = "15";
		FieldGroup = "Table2";
		SType = "Currency";
		Label = "Amount Paid";
	}

	IN MIR-INCID-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "INCID-TYP-CD";
		SType = "Text";
		Label = "Claim Incident Type";
	}

	IN MIR-CLMA-INCID-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Incident Date";
	}

  	IN MIR-CLMA-DOCTOR-CERT-DT
  	{
  		DisplayOnly;
  		Length = "10";
  		SType = "Date";
  		Label = "Dr's Certified Date";
  	}

	IN MIR-LIFE-INS-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim Involved";
	}

	IN MIR-ACCDNT-DSCLSRE-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Accident Disclosure Submit";
	}

	IN MIR-CLMA-ALCHL-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Alcohol Indicator";
	}

	IN MIR-ACCDNT-TYP-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "ACCDNT-TYP-CD";
		SType = "Text";
		Label = "Accident Type";
	}

	IN MIR-ACCDNT-CERT-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Accident Certificate Submit";
	}

	IN MIR-TRF-ACCDNT-TYP-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "TACON";
		SType = "Text";
		Label = "Traffic Accident Condition";
	}

	IN MIR-DRV-VEH-TYP-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "VHTYP";
		SType = "Text";
		Label = "Driving Vehicle Type";
	}

	IN MIR-DRV-LIC-SUBMIT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "LICID";
		SType = "Text";
		Label = "Licence Indicator";
	}

	IN MIR-DRV-LIC-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Licence Date";
	}

	IN MIR-DRV-LIC-LRG-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Large Vehicle";
	}

	IN MIR-DRV-LIC-ORD-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Ordinary Vehicle";
	}

	IN MIR-DRV-LIC-LS-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Large Special";
	}

	IN MIR-DRV-LIC-MB-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Motor Bike";
	}

	IN MIR-DRV-LIC-SS-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Small Special";
	}

	IN MIR-DRV-LIC-MS-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Motor Scooter";
	}

	IN MIR-DRV-LIC-TOW-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Tow Truck";
	}

	IN MIR-DRV-LIC-LCOMM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Large Commercial";
	}

	IN MIR-DRV-LIC-OCOMM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Ordinary Commercial";
	}

	IN MIR-DRV-LIC-SCOMM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Special Commercial";
	}

	IN MIR-DRV-LIC-TCOMM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Tow Commercial";
	}

	IN MIR-CLMA-HD-INJ-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Head Injury";
	}

	IN MIR-ACCDNT-WHIP-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Reported Whiplash / Back Pain";
	}

	IN MIR-CLMA-OBJ-SYMP-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Objective Symptom";
	}

	IN MIR-ACCDNT-RECOV-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Recovered";
	}

	IN MIR-ACCDNT-RECOV-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Recovered Date";
	}

	IN MIR-CLMA-HOSP-CAT-CD
	{
		DisplayOnly;
		Length = "40";
                CodeSource = "DataModel";
                CodeType = "CLMA-HOSP-CAT-CD";
		SType = "Text";
		Label = "Hospital Category";
	}

	IN MIR-CLMA-BODY-PART-CD
	{
		DisplayOnly;
		Length = "40";
                CodeSource = "DataModel";
                CodeType = "CLMA-BODY-PART-CD";
		SType = "Text";
		Label = "Body Parts";
	}

	IN MIR-DIS-MAJ-CD-T[5] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Major Disease Code";
	}

	IN MIR-DIS-MINR-CD-T[5] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Minor Disease Code";
        }
        
	IN MIR-DIS-MINR-DESC-T[5] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Minor Disease Code Description";
	}

	IN MIR-CLMA-INCID-CAUS-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "ICAUS";
		SType = "Text";
		Label = "Incident Cause Code";
	}

	IN MIR-CLMA-CAUS-MAJ-CD 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Disease Cause Major Code";
	}


	IN MIR-CLMA-CAUS-MINR-CD 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Disease Cause Minor Code";
	}
	IN MIR-CLMA-DIS-CAUS-DESC 
	{
		DisplayOnly;
		Length = "60";
		SType = "Text";
		Label = "Disease Cause Description";
	}

	IN MIR-CLMA-CMPLC-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Complications";
	}

	IN MIR-CLMA-FIRST-EXAM-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "First Examination Date";
	}

	IN MIR-PREV-DOCTOR-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Previous Doctor";
	}

	IN MIR-EXIST-CHRONIC-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Existing Symptom / Chronic Illness";
	}

	IN MIR-CANCER-AWARE-CD 
	{
		DisplayOnly;
		Length = "40";
                CodeSource = "EDIT";
                CodeType = "CAIND";
		SType = "Text";
		Label = "Cancer Awareness";
	}

	IN MIR-HOSP-STRT-DT-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Hospitalisation Start Date";
	}

	IN MIR-HOSP-END-DT-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Hospitalisation End Date";
	}

	IN MIR-HOSP-STAT-CD-T[10] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table4";
		CodeSource = "DataModel";
		CodeType = "CLEV-HOSP-STAT-CD";
		SType = "Text";
		Label = "Hospitalisation Status";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-STRT-DT-T[10] 
        IN MIR-SURGY-STRT-DT-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table5";
		SType = "Date";
		Label = "Surgery Start Date";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-END-DT-T[10] 
        IN MIR-SURGY-END-DT-T[30]
# M280P2 CHANGES ENDS HERE         
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table5";
		SType = "Date";
		Label = "Surgery End Date";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-MINR-DESC-T[10] 
        IN MIR-SURGY-MINR-DESC-T[30]
# M280P2 CHANGES ENDS HERE         
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table5";
		SType = "Text";
		Label = "Minor Disease Code Description";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-MEDC-SUBTYP-CD-T[10] 
        IN MIR-SURGY-MEDC-SUBTYP-CD-T[30]
# M280P2 CHANGES ENDS HERE
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table5";
		CodeSource = "EDIT";
		CodeType = "SUBTY";
		SType = "Text";
		Label = "Surgery Type";
	}

# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-MINR-CD-T[10] 
        IN MIR-SURGY-MINR-CD-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table5";
		SType = "Text";
		Label = "Surgery Minor Code";
	}

	IN MIR-OUTP-STRT-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table6";
		SType = "Date";
		Label = "Outpatient Start Date";
	}

	IN MIR-CLMA-HOSP-DT
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Hospitalisation Date";
	}

	IN MIR-CLMA-DSCHRG-DT
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Discharge Date";
	}
#*RP2CLA CHANGES START	
	IN MIR-CANCER-DIAGNS-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Diagnosed Date";
	}
	
	IN MIR-CANCER-TYP-CD
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CATYP";
		SType = "Text";
		Label = "Cancer Type";
	}
#*RP2CLA CHANGES END

#*M281P2 CHANGES START
	IN MIR-CANCER-STAGE-CD
	{
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "CASTG";
		SType = "Text";
		Label = "Cancer Stage";
	}
#*M281P2 CHANGES END	
#*M253O1 CHANGES START
	IN MIR-CANCER-OUTCM-CD
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CAOCM";
		SType = "Text";
		Label = "Outcome of Cancer";
	}
#*M253O1 CHANGES END	
#*M281P2 CHANGES START	

	IN MIR-PALLIATIVE-STRT-DT-T[20] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Palliative Care Start Date";
	}

	IN MIR-PALLIATIVE-END-DT-T[20] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Palliative Care End Date";
	}

#*M281P2 CHANGES END

#*MP143G CHANGES START		
	IN MIR-CI-DIAGNS-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Diagnosed Date";
	}
	
        IN MIR-CI-EVNT-TYP-CD
	{
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "CITYP";
		SType = "Text";
		Label = "CI Event Type";
	}
	IN MIR-ICU-DT
	{
		Length = "10";
		SType = "Date";
		Label = "ICU Date";
	}
#*MP143G CHANGES END
#*M253O1 CHANGES STARTS
	IN MIR-CHEMOTHERAPY-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table7";
		SType = "Date";
		Label = "Chemotherapy Date";
	}
#*M253O1 CHANGES ENDS
#M280P2 CHANGES STARTS HERE
        IN MIR-HOME-TRTMNT-STRT-DT-T[20]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table8";
		SType = "Date";
		Label = "Home Treatment Start Date";
	}   
	
        IN MIR-HOME-TRTMNT-END-DT-T[20]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table8";
		SType = "Date";
		Label = "Home Treatment End Date";
	} 
	
	IN MIR-ASSOC-DIS-MAJ-CD-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Major Associated Disease Code";
	}

	IN MIR-ASSOC-DIS-MINR-CD-T[10] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Minor Associated Disease Code";
        }
        
	IN MIR-ASSOC-DIS-MINR-DESC-TXT-T[10] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Minor Associated Disease Code Description";
	}
	
	IN MIR-ASSOC-DIS-STRT-DT-T[10]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table9";
		SType = "Date";
		Label = "Associated Disease Start Date";
	}
	
	IN MIR-ASSOC-DIS-END-DT-T[10]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table9";
		SType = "Date";
		Label = "Associated Disease End Date";
	}		
#M280P2 CHANGES ENDS HERE

#UY3023 CHANGES STRARTS
    IN MIR-DISAB-GRADE-CD
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Grade";
    }
    
    IN MIR-DISAB-RNG-CD
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Code";
    }
    
    IN MIR-DISAB-FIXN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Fixation";
    }
#UY3023 CHANGES ENDS
}
