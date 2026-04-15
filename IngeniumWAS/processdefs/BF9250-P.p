# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9250-P.p                                                    *
#*  Description: Master Claim Retrieve                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   INITIAL VERSION                                           *
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

P-STEP BF9250-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9250";
        BusinessFunctionName = "Master Claim Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9250";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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
    OUT MIR-CLI-DTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Death";
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
    OUT MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    OUT MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    OUT MIR-PREV-AUTO-ADJC-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Last Auto Adjudication Date";
    }
    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Previous Update Date";
    }
    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "12";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Previous Update User ID";
    }
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }

#UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE

    OUT MIR-ADJ-USER-ID
    {
        Length = "8";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "Adjudicator User ID";
    }
    OUT MIR-BR-ID
    {
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "RO Code";
    }
    OUT MIR-SO-ID
    {
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "SO Code";
    }
    OUT MIR-CNTCT-INDV-SUR-NM
    {
        Length = "25";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Kanji Last Name";
    }
    OUT MIR-CNTCT-INDV-GIV-NM
    {
        Length = "25";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Kanji First Name";
    }
    OUT MIR-CNTCT-CO-NM
    {
        Length = "50";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Company Kanji Name";
    }
    OUT MIR-CNTCT-INSRD-REL-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Relationship to Insured";
    }
    OUT MIR-CNTCT-PHON-1-TXT
    {
        Length = "20";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Contact Phone Number";
    }
    OUT MIR-CNTCT-PHON-2-TXT
    {
        Length = "20";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Contact Mobile Number";
    }
    OUT MIR-CNTCT-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Contact Address Code";
    }
    OUT MIR-CNTCT-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Postal Code";
    }
    OUT MIR-CNTCT-ADDL-TXT
    {
        Length = "72";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Samakata-bu";
    }
    OUT MIR-CNTCT-KJ-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Prefecture";
    }
    OUT MIR-CNTCT-KJ-CITY-TXT
    {
        Length = "30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "City";
    }
    OUT MIR-CNTCT-KJ-NGHBRHD-TXT
    {
        Length = "30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Neighbourhood";
    }
    OUT MIR-PAYEE-NM-TXT-T[10]
    {
        Length = "50";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }
    OUT MIR-PAYEE-BNK-ID-T[10]
    {
        Length = "4";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Bank Code";
        Index = "1";
    }
    OUT MIR-PAYEE-BNK-BR-ID-T[10]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }
    OUT MIR-PAYEE-BNK-ACCT-ID-T[10]
    {
        Length = "17";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }
    OUT MIR-PAYEE-ACCT-TYP-CD-T[10]
    {
        Length = "3";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }
    OUT MIR-PAYEE-ACCT-HLDR-NM-T[10]
    {
        Length = "50";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }
    OUT MIR-PAYEE-ADDR-LOC-CD-T[10]
    {
        Length = "8";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }
    OUT MIR-SEND-PMT-NOTI-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Indicator";
        Label = "Send Notice";
        Index = "1";
    }
    OUT MIR-PAYEE-INSRD-REL-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Relationship to Insured";
        Index = "1";
    }
    OUT MIR-PAYEE-STAT-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLRL-PAYE-STAT-CD";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Payee Status";
        Index = "1";
    }
    OUT MIR-CLMA-HO-NOTI-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Head Office Notification Date";
    }
    OUT MIR-CLMA-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    OUT MIR-CLMA-AGT-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Agent Claim Form Acceptance Date";
    }
    OUT MIR-CLMA-SO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Sales Office Claim Form Acceptance Date";
    }
    OUT MIR-CLCC-CO-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CONFC";
        KeyColumn;
        DBTableName = "TCLCC";
        SType = "Selection";
        Label = "Confirmation Company";
        Index = "1";
    }
    OUT MIR-CLCC-STRT-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLCC";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }
    OUT MIR-CLCC-END-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLCC";
        SType = "Date";
        Label = "Completion Date";
        Index = "1";
    }
    OUT MIR-CLCC-AMT-T[5]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TCLCC";
        SType = "Currency";
        Label = "Amount Paid";
        Index = "1";
    }
    OUT MIR-INCID-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INCID-TYP-CD";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Claim Incident Type";
    }
    OUT MIR-CLMA-INCID-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Incident Date";
    }
    OUT MIR-CLMA-DOCTOR-CERT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Dr's Certified Date";
    }
    OUT MIR-LIFE-INS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim Involved";
    }
    OUT MIR-ACCDNT-DSCLSRE-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Accident Disclosure Submit";
    }
    OUT MIR-CLMA-ALCHL-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Alcohol Indicator";
    }
    OUT MIR-ACCDNT-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ACCDNT-TYP-CD";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Accident Type";
    }
    OUT MIR-ACCDNT-CERT-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Accident Certificate Submit";
    }
    OUT MIR-TRF-ACCDNT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TACON";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Traffic Accident Condition";
    }   
    OUT MIR-DRV-VEH-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "VHTYP";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Driving Vehicle Type";
    }
    OUT MIR-DRV-LIC-SUBMIT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LICID";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Licence Indicator";
    }
    OUT MIR-DRV-LIC-DT      
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Licence Date";
    }
    OUT MIR-DRV-LIC-LRG-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Large Vehicle";
    }
    OUT MIR-DRV-LIC-ORD-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Ordinary Vehicle";
    }
    OUT MIR-DRV-LIC-LS-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Large Special";
    }
    OUT MIR-DRV-LIC-MB-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Motor Bike";
    }
    OUT MIR-DRV-LIC-SS-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Small Special";
    }
    OUT MIR-DRV-LIC-MS-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Motor Scooter";
    }
    OUT MIR-DRV-LIC-TOW-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Tow Truck";
    }
    OUT MIR-DRV-LIC-LCOMM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Large Commercial";
    }
    OUT MIR-DRV-LIC-OCOMM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Ordinary Commercial";
    }
    OUT MIR-DRV-LIC-SCOMM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Special Commercial";
    }
    OUT MIR-DRV-LIC-TCOMM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Tow Commercial";
    }
    OUT MIR-CLMA-HD-INJ-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Head Injury";
    }
    OUT MIR-ACCDNT-WHIP-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Reported Whiplash / Back Pain";
    }
    OUT MIR-ACCDNT-RECOV-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Recovered";
    }
    OUT MIR-CLMA-OBJ-SYMP-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Objective Symptom";
    }
    OUT MIR-ACCDNT-RECOV-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Recovered Date";
    }
    OUT MIR-CLMA-HOSP-CAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-HOSP-CAT-CD";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Hospital Category";
    }
    OUT MIR-CLMA-BODY-PART-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-BODY-PART-CD";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Body Parts";
    }
    OUT MIR-DIS-MAJ-CD-T[5]
    {
        Length = "10";                  
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
    }
    OUT MIR-DIS-MINR-CD-T[5]
    {
        Length = "10";                  
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Minor Disease Code";
        Index = "1";
    }
    OUT MIR-DIS-MINR-DESC-T[5]
    {
        Length = "60";                
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
    OUT MIR-CLMA-INCID-CAUS-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ICAUS";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Incident Cause Code";
    }
    OUT MIR-CLMA-CAUS-MAJ-CD
    {
        Length = "10";                    
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Disease Cause Major Code";
    }
    OUT MIR-CLMA-CAUS-MINR-CD
    {
        Length = "10";                    
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Disease Cause Minor Code";
    }
    OUT MIR-CLMA-DIS-CAUS-DESC
    {
        Length = "60";                  
        DBTableName = "Derived";
        SType = "Text";
        Label = "Disease Cause Description";
    }
    OUT MIR-CLMA-CMPLC-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Complications";
    }
    OUT MIR-CLMA-FIRST-EXAM-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "First Examination Date";
    }
    OUT MIR-PREV-DOCTOR-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Previous Doctor";
    }
    OUT MIR-EXIST-CHRONIC-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Existing Symptom / Chronic Illness";
    }
    OUT MIR-CANCER-AWARE-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CAIND";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Cancer Awareness";
    }   
    OUT MIR-HOSP-STRT-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Hospitalisation Start Date";
        Index = "1";
    }
    OUT MIR-HOSP-END-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Hospitalisation End Date";
        Index = "1";
    }
    OUT MIR-HOSP-STAT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CLEV-HOSP-STAT-CD";
        DBTableName = "TCLEV";
        SType = "Selection";
        Index = "1";
        Label = "Hospitalisation Status";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-SURGY-STRT-DT-T[10]
     OUT MIR-SURGY-STRT-DT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Surgery Start Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-SURGY-END-DT-T[10]
     OUT MIR-SURGY-END-DT-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Surgery End Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    OUT MIR-SURGY-MINR-DESC-T[10]
     OUT MIR-SURGY-MINR-DESC-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "60";                 
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Disease Code Description";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE     
#    OUT MIR-SURGY-MEDC-SUBTYP-CD-T[10]
     OUT MIR-SURGY-MEDC-SUBTYP-CD-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "02";                  
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "SUBTY";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Surgery Type";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE      
#    OUT MIR-SURGY-MINR-CD-T[10]
     OUT MIR-SURGY-MINR-CD-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";                  
        FieldGroup = "Table5";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Surgery Minor Code";
        Index = "1";
    }
    OUT MIR-OUTP-STRT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Outpatient Start Date";
        Index = "1";
    }

    OUT MIR-CLMA-HOSP-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Hospitalisation Date";
    }

    OUT MIR-CLMA-DSCHRG-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Discharge Date";
    }
#*RP2CLA CHANGES START    
    OUT MIR-CANCER-DIAGNS-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Diagnosed Date";
    }
    
    OUT MIR-CANCER-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CATYP";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Cancer Type";
    }
#*RP2CLA CHANGES END

#*M281P2 CHANGES START

    OUT MIR-CANCER-STAGE-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CASTG";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Cancer Stage";
    }
    
#*M281P2 CHANGES END	
#*M253O1 CHANGES START
    OUT MIR-CANCER-OUTCM-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CAOCM";
        DBTableName = "TCLMA";
        SType = "Selection";
        Label = "Outcome of Cancer";
    }
#*M253O1 CHANGES END    
#*M281P2 CHANGES START
    OUT MIR-PALLIATIVE-STRT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Palliative Care Start Date";
        Index = "1";
    }
    OUT MIR-PALLIATIVE-END-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Palliative Care End Date";
        Index = "1";
    }
#*M281P2 CHANGES END 

#*MP143G CHANGES START		
    OUT MIR-CI-DIAGNS-DT
    {
	Length = "10";
	DBTableName = "TCLMA";
	SType = "Date";
	Label = "Diagnosed Date";
    }
	
    OUT MIR-CI-EVNT-TYP-CD
    {
	Length = "2";
	CodeSource = "EDIT";
	CodeType = "CITYP";
	DBTableName = "TCLMA";
	SType = "Selection";
	Label = "CI Event Type";
    }
    OUT MIR-ICU-DT
    {
	Length = "10";
	DBTableName = "TCLMA";
	SType = "Date";
	Label = "ICU Date";
    }
#*MP143G CHANGES END
#*M253O1 CHANGES STARTS
    OUT MIR-CHEMOTHERAPY-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table7";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Chemotherapy Date";
        Index = "1";
    }
#*M253O1 CHANGES ENDS 
#M280P2 CHANGES STARTS HERE
        OUT MIR-HOME-TRTMNT-STRT-DT-T[20]
	{
	Length = "10";
	FieldGroup = "Table8";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Home Treatment Start Date";
        Index = "1";
	}   
	
        OUT MIR-HOME-TRTMNT-END-DT-T[20]
	{
	Length = "10";
	FieldGroup = "Table8";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Home Treatment End Date";
        Index = "1";
	} 
	
        OUT MIR-ASSOC-DIS-MAJ-CD-T[10]
        {
        Length = "10";                  
        FieldGroup = "Table9";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        Index = "1";
        }
        OUT MIR-ASSOC-DIS-MINR-CD-T[10]
        {
        Length = "10";                  
        FieldGroup = "Table9";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Minor Disease Code";
        Index = "1";
        }
        OUT MIR-ASSOC-DIS-MINR-DESC-TXT-T[10]
        {
        Length = "60";                
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Associated Disease Code Description";
        Index = "1";
        }
        
        OUT MIR-ASSOC-DIS-STRT-DT-T[10]     
        {
        Length = "10";
        FieldGroup = "Table9";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Associated Disease Start Date";
        Index = "1";
        }
  
        OUT MIR-ASSOC-DIS-END-DT-T[10]     
        {
        Length = "10";
        FieldGroup = "Table9";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Associated Disease End Date";
        Index = "1";
        }               
#M280P2 CHANGES ENDS HERE

#UY3023 CHANGES STARTS
        OUT MIR-DISAB-GRADE-CD
        {
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Grade";
        Index = "1";
        }
        
        OUT MIR-DISAB-RNG-CD
        {
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Code";
        Index = "1";
        }  
        
        OUT MIR-DISAB-FIXN-DT
        {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Date of Fixation";
        Index = "1";
        }
#UY3023 CHANGES ENDS
}
