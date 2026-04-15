# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9252AD-I.s                                                  *
#*  Description: Master Claim Update                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  EN0195  CTS      DOCTORS CERTIFIED DATE FIELD ADDITION                     *
#*  EN0388  CTS      ADDED RO AND SO CODE, ADJ ID                              *
#*  EN0386  CTS      REMOVING HOSP & DSCHRG DT FROM OUTPATIENT SECTION         *
#*  RP2CLA  CTS      ADDED CANCER DIAGNOSIS DATE AND CANCER TYPE CODE          *
#*  MP143G  CTS      ADDED CRITICAL ILLNESS DIAGNOSIS DATE AND EVENT TYPE CODE *
#*  M253O1  CTS      ADDED OUTCOME OF CANCER AND CHEMOTHERAPY DATE             *
#*  M281P2  CTS      CHANGES AS PART OF RETAIL CANCER                          *
#*                                                                             *
#*  M280P2  CTS      CHANGES DONE FOR ARM III                                  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION    
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM                                    *                               *
#*******************************************************************************

S-STEP BF9252AD-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-ADJ-USER-ID";
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

	IN LSIR-PRCES-DT
	{
		SType="Hidden";
		DefaultSession = "LSIR-PRCES-DT";
	}

        INOUT MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            SType = "Hidden";
            Label = "process code";
        }

	IN MIR-CLM-ID
	{
		Length = "8";
		SType = "Text";
		Label = "Claim ID";
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
		Label = "Date of Birth";
	}

	IN MIR-CLI-DTH-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Date of Death";
	}

	IN MIR-CLI-SEX-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLI-SEX-CD";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-INS-MORAL-RISK-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Insured Moral Risk";
	}

	IN MIR-CLAIM-NOTE-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Claim Note";
	}

	IN MIR-PREV-AUTO-ADJC-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Last Auto Adjudication Date";
	}

	IN MIR-PREV-UPDT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Previous Update Date";
	}

	IN MIR-PREV-UPDT-USER-ID
	{
		Length = "12";
		SType = "Text";
		Label = "Previous Update User ID";
	}

	IN MIR-CLMA-HIST-CLM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Historical Claim";
	}

#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Unisys Claim";
	}
#UYSDMC CHANGES ENDS HERE

        INOUT MIR-ADJ-USER-ID
        {
                Length = "8";
                SType = "Text";
                Label = "Adjudicator User ID";
        }

        INOUT MIR-BR-ID
        {
                Length = "5";
                SType = "Text";
                Label = "RO Code";
        }

        INOUT MIR-SO-ID
        {
                Length = "5";
                SType = "Text";
                Label = "SO Code";
        }

	INOUT MIR-CNTCT-INDV-SUR-NM
	{
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	INOUT MIR-CNTCT-INDV-GIV-NM
	{
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	INOUT MIR-CNTCT-CO-NM
	{
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	INOUT MIR-CNTCT-INSRD-REL-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Selection";
		Label = "Relationship to Insured";
	}

	INOUT MIR-CNTCT-PHON-1-TXT
	{
		Length = "20";
		SType = "Text";
		Label = "Contact Phone Number";
	}

	INOUT MIR-CNTCT-PHON-2-TXT
	{
		Length = "20";
		SType = "Text";
		Label = "Contact Mobile Number";
	}

	INOUT MIR-CNTCT-ADDR-LOC-CD
	{
		Length = "8";
		SType = "Text";
		Label = "Contact Address Code";
	}

	INOUT MIR-CNTCT-PSTL-CD
	{
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}

	INOUT MIR-CNTCT-ADDL-TXT
	{
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}

	IN MIR-CNTCT-KJ-PREFCT-TXT
	{
		Length = "11";
		SType = "Text";
		Label = "Prefecture";
	}

	IN MIR-CNTCT-KJ-CITY-TXT
	{
		Length = "30";
		SType = "Text";
		Label = "City";
	}

	IN MIR-CNTCT-KJ-NGHBRHD-TXT
	{
		Length = "30";
		SType = "Text";
		Label = "Neighbourhood";
	}

	INOUT MIR-CLMA-HO-NOTI-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Head Office Notification Date";
	}

	INOUT MIR-CLMA-HO-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Head Office Claim Form Acceptance Date";
	}

	INOUT MIR-CLMA-AGT-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Agent Claim Form Acceptance Date";
	}

	INOUT MIR-CLMA-SO-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Sales Office Claim Form Acceptance Date";
	}

	INOUT MIR-CLCC-CO-CD-T[5]
	{
		Length = "40";
		FieldGroup = "Table2";
		CodeSource = "EDIT";
		CodeType = "CONFC";
		SType = "Selection";
		Label = "Confirmation Company";
	}

	INOUT MIR-CLCC-STRT-DT-T[5]
	{
		Length = "10";
		FieldGroup = "Table2";
		SType = "Date";
		Label = "Start Date";
	}

	INOUT MIR-CLCC-END-DT-T[5]
	{
		Length = "10";
		FieldGroup = "Table2";
		SType = "Date";
		Label = "Completion Date";
	}

	INOUT MIR-CLCC-AMT-T[5]
	{
		Signed;
		Length = "15";
		FieldGroup = "Table2";
		SType = "Currency";
		Label = "Amount Paid";
	}

	INOUT MIR-INCID-TYP-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "INCID-TYP-CD";
		SType = "Selection";
		Label = "Claim Incident Type";
	}

	INOUT MIR-CLMA-INCID-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Incident Date";
	}

  	INOUT MIR-CLMA-DOCTOR-CERT-DT
  	{
  		Length = "10";
  		SType = "Date";
  		Label = "Dr's Certified Date";
  	}

	INOUT MIR-LIFE-INS-CLM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim Involved";
	}

	INOUT MIR-ACCDNT-DSCLSRE-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Accident Disclosure Submit";
	}

	INOUT MIR-CLMA-ALCHL-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Alcohol Indicator";
	}

	INOUT MIR-ACCDNT-TYP-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "ACCDNT-TYP-CD";
		SType = "Selection";
		Label = "Accident Type";
	}

	INOUT MIR-ACCDNT-CERT-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Accident Certificate Submit";
	}

	INOUT MIR-TRF-ACCDNT-TYP-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "TACON";
		SType = "Selection";
		Label = "Traffic Accident Condition";
	}

	INOUT MIR-DRV-VEH-TYP-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "VHTYP";
		SType = "Selection";
		Label = "Driving Vehicle Type";
	}

	INOUT MIR-DRV-LIC-SUBMIT-CD
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "LICID";
		SType = "Selection";
		Label = "Licence Indicator";
	}

	INOUT MIR-DRV-LIC-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Licence Date";
	}

	INOUT MIR-DRV-LIC-LRG-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Large Vehicle";
	}

	INOUT MIR-DRV-LIC-ORD-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Ordinary Vehicle";
	}

	INOUT MIR-DRV-LIC-LS-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Large Special";
	}

	INOUT MIR-DRV-LIC-MB-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Motor Bike";
	}

	INOUT MIR-DRV-LIC-SS-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Small Special";
	}

	INOUT MIR-DRV-LIC-MS-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Motor Scooter";
	}

	INOUT MIR-DRV-LIC-TOW-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Tow Truck";
	}

	INOUT MIR-DRV-LIC-LCOMM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Large Commercial";
	}

	INOUT MIR-DRV-LIC-OCOMM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Ordinary Commercial";
	}

	INOUT MIR-DRV-LIC-SCOMM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Special Commercial";
	}

	INOUT MIR-DRV-LIC-TCOMM-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Tow Commercial";
	}

	INOUT MIR-CLMA-HD-INJ-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Head Injury";
	}

	INOUT MIR-ACCDNT-WHIP-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Reported Whiplash / Back Pain";
	}

	INOUT MIR-ACCDNT-RECOV-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Recovered";
	}

	INOUT MIR-CLMA-OBJ-SYMP-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Objective Symptom";
	}

	INOUT MIR-ACCDNT-RECOV-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Recovered Date";
	}

	INOUT MIR-CLMA-HOSP-CAT-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-HOSP-CAT-CD";
		SType = "Selection";
		Label = "Hospital Category";
	}

	INOUT MIR-CLMA-BODY-PART-CD
	{
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-BODY-PART-CD";
		SType = "Selection";
		Label = "Body Parts";
	}

	INOUT MIR-DIS-MAJ-CD-T[5]
	{
		Length = "10";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Major Disease Code";
	}

	IN MIR-DIS-MINR-CD-T[5]
	{
		Length = "10";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Minor Disease Code";
	}

	INOUT MIR-DIS-MINR-DESC-T[5]
	{
		Length = "60";
		FieldGroup = "Table3";
		SType = "Text";
		Label = "Minor Disease Code Description";
	}

	INOUT MIR-CLMA-INCID-CAUS-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "ICAUS";
		SType = "Selection";
		Label = "Incident Cause Code";
	}

	INOUT MIR-CLMA-CAUS-MAJ-CD
	{
		Length = "10";
		SType = "Text";
		Label = "Disease Cause Major Code";
	}

	IN MIR-CLMA-CAUS-MINR-CD
	{
		Length = "10";
		SType = "Text";
		Label = "Disease Cause Minor Code";
	}

	INOUT MIR-CLMA-DIS-CAUS-DESC
	{
		Length = "60";
		SType = "Text";
		Label = "Disease Cause Description";
	}

	INOUT MIR-CLMA-CMPLC-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Complications";
	}

	INOUT MIR-CLMA-FIRST-EXAM-DT
	{
		Length = "10";
		SType = "Date";
		Label = "First Examination Date";
	}

	INOUT MIR-PREV-DOCTOR-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Previous Doctor";
	}

	INOUT MIR-EXIST-CHRONIC-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Existing Symptom / Chronic Illness";
	}

	INOUT MIR-CANCER-AWARE-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "CAIND";
		DefaultConstant = "4";
		SType = "Selection";
		Label = "Cancer Awareness";
	}

	INOUT MIR-HOSP-STRT-DT-T[10]
	{
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Hospitalisation Start Date";
	}

	INOUT MIR-HOSP-END-DT-T[10]
	{
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Hospitalisation End Date";
	}

	INOUT MIR-HOSP-STAT-CD-T[10]
	{
		Length = "40";
		FieldGroup = "Table4";
		CodeSource = "DataModel";
		CodeType = "CLEV-HOSP-STAT-CD";
		SType = "Selection";
		Label = "Hospitalisation Status";
	}

# M280P2 CHANGES STARTS HERE
#	INOUT MIR-SURGY-STRT-DT-T[10]
        INOUT MIR-SURGY-STRT-DT-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		Length = "10";
		FieldGroup = "Table5";
		SType = "Date";
		Label = "Surgery Start Date";
	}

# M280P2 CHANGES STARTS HERE
#	INOUT MIR-SURGY-END-DT-T[10]
        INOUT MIR-SURGY-END-DT-T[30]
# M280P2 CHANGES ENDS HERE        
	{
		Length = "10";
		FieldGroup = "Table5";
		SType = "Date";
		Label = "Surgery End Date";
	}

# M280P2 CHANGES STARTS HERE
#	INOUT MIR-SURGY-MINR-DESC-T[10]
        INOUT MIR-SURGY-MINR-DESC-T[30]
# M280P2 CHANGES ENDS HERE        
	{
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
		Length = "02";
		FieldGroup = "Table5";
		CodeSource = "EDIT";
		CodeType = "SUBTY";
		SType = "Text";
		Label = "Surgery Type";
	}
# M280P2 CHANGES STARTS HERE
#	IN MIR-SURGY-MINR-CD-T[10]
        IN MIR-SURGY-MINR-CD-T[30]
# M280P2 CHANGES STARTS HERE        
	{
		Length = "10";
		FieldGroup = "Table5";
		SType = "Text";
		Label = "Surgery Minor Code";
	}

	INOUT MIR-OUTP-STRT-DT-T[100]
	{
		Length = "10";
		FieldGroup = "Table6";
		SType = "Date";
		Label = "Outpatient Start Date";
	}

	INOUT MIR-CLMA-HOSP-DT
	{
		Length = "10";
#*EN0386 CHANGES START
#*              SType = "Date";
		SType = "Hidden";
#*EN0386 CHANGES END
		Label = "Hospitalisation Date";
	}

	INOUT MIR-CLMA-DSCHRG-DT
	{
		Length = "10";
#*EN0386 CHANGES START
#*              SType = "Date";
		SType = "Hidden";
#*EN0386 CHANGES END		
		Label = "Discharge Date";
	}

#*RP2CLA CHANGES START		
	INOUT MIR-CANCER-DIAGNS-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Diagnosed Date";
	}
	
	INOUT MIR-CANCER-TYP-CD
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CATYP";
		SType = "Selection";
		Label = "Cancer Type";
	}
#*RP2CLA CHANGES END

#*M281P2 CHANGES START
	INOUT MIR-CANCER-STAGE-CD
	{
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "CASTG";
		SType = "Selection";
		Label = "Cancer Stage";
	}
#*M281P2 CHANGES END
#*M253O1 CHANGES START
	INOUT MIR-CANCER-OUTCM-CD
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CAOCM";
		SType = "Selection";
		Label = "Outcome of Cancer";
	}
#*M253O1 CHANGES END
#*M281P2 CHANGES START
	INOUT MIR-PALLIATIVE-STRT-DT-T[20]
	{
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Palliative Care Start Date";
	}

	INOUT MIR-PALLIATIVE-END-DT-T[20]
	{
		Length = "10";
		FieldGroup = "Table4";
		SType = "Date";
		Label = "Palliative Care End Date";
	}
#*M281P2 CHANGES START

#*MP143G CHANGES START		
	INOUT MIR-CI-DIAGNS-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Diagnosed Date";
	}
	
        INOUT MIR-CI-EVNT-TYP-CD
	{
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "CITYP";
		SType = "Selection";
		Label = "CI Event Type";
	}
	INOUT MIR-ICU-DT
	{
		Length = "10";
		SType = "Date";
		Label = "ICU Date";
	}
#*MP143G CHANGES END
#*M253O1 CHANGES STARTS
	INOUT MIR-CHEMOTHERAPY-DT-T[100]
	{
		Length = "10";
		FieldGroup = "Table7";
		SType = "Date";
		Label = "Chemotherapy Date";
	}
#*M253O1 CHANGES ENDS	
#M280P2 CHANGES STARTS HERE
        INOUT MIR-HOME-TRTMNT-STRT-DT-T[20]
	{
		Length = "10";
		FieldGroup = "Table8";
		SType = "Date";
		Label = "Home Treatment Start Date";
	}   
	
        INOUT MIR-HOME-TRTMNT-END-DT-T[20]
	{
		Length = "10";
		FieldGroup = "Table8";
		SType = "Date";
		Label = "Home Treatment End Date";
	} 
	
	INOUT MIR-ASSOC-DIS-MAJ-CD-T[10] 
	{
		Length = "10";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Major Associated Disease Code";
	}

	IN MIR-ASSOC-DIS-MINR-CD-T[10] 
	{
		Length = "10";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Minor Associated Disease Code";
        }
        
	INOUT MIR-ASSOC-DIS-MINR-DESC-TXT-T[10] 
	{
		Length = "60";
		FieldGroup = "Table9";
		SType = "Text";
		Label = "Minor Associated Disease Code Description";
	}
	
	INOUT MIR-ASSOC-DIS-STRT-DT-T[10]
	{
		Length = "10";
		FieldGroup = "Table9";
		SType = "Date";
		Label = "Associated Disease Start Date";
	}
	
	INOUT MIR-ASSOC-DIS-END-DT-T[10]
	{
		Length = "10";
		FieldGroup = "Table9";
		SType = "Date";
		Label = "Associated Disease End Date";
	}				
#M280P2 CHANGES ENDS HERE
#UY3023 CHANGES STARTS

    INOUT MIR-DISAB-GRADE-CD
    {
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Grade";
        Index = "1";
    }

    INOUT MIR-DISAB-RNG-CD
    {
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Code";
        Index = "1";
    }    
   
    INOUT MIR-DISAB-FIXN-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Date of Fixation";
        Index = "1";
    }
#UY3023 CHANGES ENDS 
}