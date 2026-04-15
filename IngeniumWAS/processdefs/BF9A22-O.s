# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A22-O.s                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004  CTS      INITIAL VERSION                                           *
#*  AHS048  CTS      ADDED DOCTOR RANK FIELD                                   *
#*  AHS150  CTS      CHANGED DOCTOR RANK FIELD                                 *
#*  AHS152  CTS      CHANGED FOR NON-CONTRACTOR DOCTOR INDICATOR               *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*  AHU068  CTS      CHANGES FOR COVERAGE UW-NOTE                              *
#*  M16138  CTS      CHANGES TO DISPLAY STATE OF ADDITION OF 3DD WOP RIDER     *
#*  M213F1  CTS      CHANGES TO ADD NEW SIX  INDICATOR FIELDS FOR RUM          *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP253E  CTS      ADD NEW INDICATOR FOR ULE2                                *
#*  MP265G CTS      ADDED NEW FIELD AGENT NAME AS PART OF NOMURA*
#*******************************************************************************


S-STEP BF9A22-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    FocusField = "MIR-POL-ID";
    FocusFrame = "ContentFrame";
    Type = "Input";
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

  IN MIR-POL-ID
  {
    DefaultSession = "MIR-POL-ID-BASE";
    DisplayOnly;
    Key;
    Label = "Policy ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CLI-ID
  {
    DefaultSession = "MIR-CLI-ID";
    DisplayOnly;
    Key;
    Label = "Client Id";
    Length = "10";
    SType = "Text";
  }

  IN MIR-POL-APP-UPLD-DT
  {
    DisplayOnly;
    Label = "Upload Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-DV-UW-NM
  {
    DisplayOnly;
    Label = "UW Name";
    Length = "75";
    SType = "Text";
  }

  IN MIR-CLI-KANA-FULL-NM
  {
    DisplayOnly;
    Label = "Insured Name(Kana)";
    Length = "75";
    SType = "Text";
  }

  IN MIR-CLI-KJ-FULL-NM
  {
    DisplayOnly;
    Label = "Insured Name(kanji)";
    Length = "75";
    SType = "Text";
  }

  IN MIR-APPL-CTL-PRCES-DT
  {
    DisplayOnly;
    Label = "Process Date";
    Length = "10";
    SType = "Date";
  }

#MP245J CHANGES STARTS HERE

  IN MIR-SSTD-AGE-ADD-DUR
  {
      DisplayOnly;
      Length = "2";
      Decimals = "0";
      DBTableName = "TCVG";
      SType = "Number";
      Label = "Substandard Age Duration";
  }

#MP245J CHANGES ENDS HERE

  IN MIR-CLI-AGE
  {
    DisplayOnly;
    Label = "Age";
    Length = "03";
    SType = "Text";
  }

  IN MIR-CLI-BTH-DT
  {
    DisplayOnly;
    Label = "Birth Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CLI-SEX-CD
  {
    DisplayOnly;
    Label = "Sex";
    Length = "10";
    SType = "Text";
  }

  IN MIR-STCKR-ID
  {
    DisplayOnly;
    Label = "Sticker Id";
    Length = "11";
    SType = "Text";
  }

  IN MIR-POL-CSTAT-CD
  {
     DisplayOnly;
     Length = "40";
     CodeSource = "DataModel";
     CodeType = "POL-CSTAT-CD";
     SType = "Text";
     Label = "Policy Status";
  }

  IN MIR-CVG-NUM-T[20]
  {
    DisplayOnly;
    Label = "Coverage Number";
    Length = "02";
    SType = "Text";
  }

  IN MIR-PLAN-ID-T[20]
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider Name";
  }

  IN MIR-CVG-FACE-AMT-T[20]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "16";
    FieldGroup = "Table20";
    SType = "Currency";
    Label = "Face Amount";
    Index = "1";
  }

  IN MIR-CVG-STBL-1-CD-T[20]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table20";
#* M241A3 changes START here* 
    CodeSource = "CSOM9D29";        
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T"; 
    FilterField2 = "MIR-CVG-STBL-1-CD-T";
#   CodeSource = "EDIT";
#   CodeType = "STB1";
#* M241A3 changes END here* 
    SType = "Text";
    Label = "Duration";
    Index = "1";
  }

  IN MIR-CVG-STBL-2-CD-T[20]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table20";
    CodeSource = "EDIT";
    CodeType = "STB2";
    SType = "Text";
    Label = "Type";
    Index = "1";
  }

# Changes for AHU068 start

  INOUT MIR-UW-NOTE-T[20]
  {
    MixedCase;
    Label = "Underwriter Note";
    Length = "10";
    SType = "Text";
  }

# Changes for AHU068 end

# Changes for M16138 start

  INOUT MIR-CVG-WP-IND-T[20]
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "STATE OF ADDITION OF 3DD WOP RIDER";

  }

# Changes for M16138 end

  IN MIR-BR-ID
  {
    DisplayOnly;
    Label = "Branch Id";
    Length = "05";
    SType = "Text";
  }

  IN MIR-POL-CNVR-TYP-CD
  {
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "CNVR-TYP-CD";
    SType = "Text";
    Label = "Application Type";
  }

  IN MIR-UW-TYP-CD
  {

    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DisplayOnly;
    Label = "Selection Method";
    Length = "01";
    SType = "Text";
  }

  IN MIR-NON-CNTRCT-DOCTOR-IND
  {
#   Fix for BU3679 start
#   CodeSource = "EDIT";
#   Fix for BU3679 end
    DisplayOnly;
    Label = "Non Contract Doctor";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-CNTRCT-DOCTOR-ID
  {
#   Fix for BU3679 start
#   CodeSource = "EDIT";
#   Fix for BU3679 end
    DisplayOnly;
    Label = "Contracr Doctor Id";
    Length = "06";
    SType = "Text";
  }
  IN MIR-DOCTOR-RANK-CD
  {
#   Fix for BU3679 start
#   CodeSource = "EDIT";
#   Fix for BU3679 end
    DisplayOnly;
    Label = "Rank";
    Length = "03";
    SType = "Text";
  }

  IN MIR-MEDIC-RPT-NUM
  {
    DisplayOnly;
    Label = "Medical report number";
    Length = "06";
    SType = "Text";
  }

  IN MIR-MEDIC-RPT-DT
  {
    DisplayOnly;
    Label = "Medical report Date";
    Length = "10";
    SType = "Date";
  }
  INOUT MIR-MOBIL-INTRVW-IND
  {
    Label = "Mobie Interview";
    Length = "01";
    SType = "Indicator";
  }
# Changes for MP265G Start  
  IN MIR-DV-AGT-NM
  {
       DisplayOnly;
       Label = "Agent Name";
       Length = "51";
       SType = "Text";
  }
# Changes for MP265G End  

  INOUT MIR-BLOOD-TXT
  {
    MixedCase;
    Label = "Blood";
    Length = "100";
    SType = "Text";
  }

  IN MIR-MED-MIN-BLOOD-RT
  {
    DisplayOnly;
    Label = "Blood";
    Length = "OO3";
    SType = "Text";
  }

  IN MIR-MED-MAX-BLOOD-RT
  {
    DisplayOnly;
    Label = "Blood";
    Length = "03";
    SType = "Text";
  }
  INOUT MIR-ECG-TXT
  {
    MixedCase;
    Label = "ECG";
    Length = "100";
    SType = "Text";
  }

  INOUT MIR-BLOOD-TEST-IND
  {
    Label = "Blood test";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-ECG-IND
  {
    Label = "ECG";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-HLTH-CHK-RSLT-IND
  {
    Label = "Results of Health check up";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-MEDIC-RPT-IND
  {
    Label = "Medical report";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-ADDL-SELF-DSCLSRE-IND
  {
    Label = "Additional Self Disclosure";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-DEDCT-SELF-DSCLSRE-IND
  {
    Label = "Dedicated Additional Self Disclosure";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-EXIST-SELF-DSCLSRE-IND
  {
    Label = "Existing Policy Self Disclosure";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-PRE-ISS-RPT-IND
  {
    Label = "Pre-issue Report Indicator";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-HLTH-RPT-RESP-IND
  {
    Label = "Doctor/Interviewer/Corporate Health Report";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-PRLM-UW-RSLT-IND
  {
    Label = "Results of Preliminary Underwriting";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-MEDIC-BNFT-RPT-IND
  {
    Label = "Medical Report for the benefit (Claim)";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-INCMPLT-DOC-IND
  {
    Label = "Response to Incomplete documentation";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-SCR-WRITN-PLDG-IND
  {
    Label = "Scrivener's Written Pledge";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-EXIST-POL-DOC-IND
  {
    Label = "Documents of existing policy";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-OTHRS-IND
  {
    Label = "Others";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-OTHRS-DESC-TXT
  {
    MixedCase;
    Label = "Comments";
    Length = "50";
    SType = "TextArea";
  }

  IN MIR-SELF-DSCLSRE-IND
  {
    DisplayOnly;
    Label = "With Self-disclosure";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-MED-URINE-IND
  {
    DisplayOnly;
    Label = "Urine";
    Length = "01";
    SType = "Indicator";
  }
  INOUT MIR-BMI-VALU-TXT
  {
    MixedCase;
    Label = "BMI value";
    Length = "06";
    SType = "Indicator";
  }

  IN MIR-MED-BLOOD-RT-IND
  {
    DisplayOnly;
    Label = "BP";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-MED-PULSE-RT-IND
  {
    DisplayOnly;
    Label = "Pulse";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-MED-BLOOD-TST-IND
  {
    DisplayOnly;
    Label = "Blood Test Available";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-MED-ECG-IND
  {
    DisplayOnly;
    Label = "ECG Available";
    Length = "01";
    SType = "Indicator";
  }

  IN MIR-DTH-PREV-DIS-CHNG-IND
  {
      Length = "01";
      DisplayOnly;
      SType = "Indicator";
      Label = "Death - Previous";
  }

  IN MIR-DTH-BLD-CHNG-IND
  {
      Length = "01";
      DisplayOnly;
      SType = "Indicator";
      Label = "Death - Build";
  }

  IN MIR-DTH-CRNT-DIS-CHNG-IND
  {
      Length = "01";
      DisplayOnly;
      SType = "Indicator";
      Label = "Death - Current";
  }

  IN MIR-DTH-PULSE-CHNG-IND
  {
      Length = "01";
      DisplayOnly;
      SType = "Indicator";
      Label = "Death - PULSE";
  }

  IN MIR-DTH-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - BD";
  }

  IN MIR-DTH-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - URINE";
  }

  IN MIR-DTH-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - BLOOD SUGAR";
  }

  IN MIR-DTH-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - LIVER";
  }

  IN MIR-DTH-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - LIPID";
  }

  IN MIR-DTH-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ANEM";
  }

  IN MIR-DTH-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ECG";
  }

  IN MIR-DTH-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ADJUST";
  }

  INOUT MIR-DTH-PREV-DIS-CD
  {
    MixedCase;
    Label = "Death - Previous";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-CRNT-DIS-CD
  {
    MixedCase;
    Label = "Death - Current";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-BLD-CD
  {
    MixedCase;
    Label = "Death - Build";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-PULSE-CD
  {
    MixedCase;
    Label = "Death - Pulse";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-BD-CD
  {
    MixedCase;
    Label = "Death - BD";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-URINE-CD
  {
    MixedCase;
    Label = "Death - Urine";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-BLOOD-SUGAR-CD
  {
    MixedCase;
    Label = "Death - Sugar";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-LIVER-CD
  {
    MixedCase;
    Label = "Death - Liver";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-LIPID-CD
  {
    MixedCase;
    Label = "Death - Lipid";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-ANEM-CD
  {
    MixedCase;
    Label = "Death - Anemia";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-ECG-CD
  {
    MixedCase;
    Label = "Death - ECG";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-ADJ-CD
  {
    MixedCase;
    Label = "Death - Adjust";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-STD-CD
  {
    MixedCase;
    Label = "Death - Standard";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-DTH-TOT-AMT
  {
    MixedCase;
    Label = "Death - Total";
    Length = "05";
    SType = "Text";
  }

  IN MIR-CON-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Previous";
  }

  IN MIR-CON-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Build";
  }

  IN MIR-CON-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Current";
  }

  IN MIR-CON-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - PULSE";
  }

  IN MIR-CON-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - BD";
  }

 IN MIR-CON-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - URINE";
  }

  IN MIR-CON-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - BLOOD SUGAR";
  }

  IN MIR-CON-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - LIVER";
  }

  IN MIR-CON-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - LIPID";
  }

  IN MIR-CON-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ANEM";
  }

  IN MIR-CON-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ECG";
  }

  IN MIR-CON-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ADJUST";
  }
  INOUT MIR-CON-PREV-DIS-CD
  {
    MixedCase;
    Label = "S - Previous";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-CRNT-DIS-CD
  {
    MixedCase;
    Label = "S - Current";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-BLD-CD
  {
    MixedCase;
    Label = "S - Build";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-PULSE-CD
  {
    MixedCase;
    Label = "S - Pulse";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-BD-CD
  {
    MixedCase;
    Label = "S - BD";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-URINE-CD
  {
    MixedCase;
    Label = "S - Urine";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-BLOOD-SUGAR-CD
  {
    MixedCase;
    Label = "S - Sugar";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-LIVER-CD
  {
    MixedCase;
    Label = "S - Liver";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-LIPID-CD
  {
    MixedCase;
    Label = "S - Lipid";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-ANEM-CD
  {
    MixedCase;
    Label = "S - Anemia";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-ECG-CD
  {
    MixedCase;
    Label = "S - ECG";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-ADJ-CD
  {
    MixedCase;
    Label = "S - Adjust";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-STD-CD
  {
    MixedCase;
    Label = "S - Standard";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-CON-TOT-AMT
  {
    MixedCase;
    Label = "S - Total";
    Length = "05";
    SType = "Text";
   }

  IN MIR-MEDIC-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Previous";
  }

  IN MIR-MEDIC-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Build";
  }

  IN MIR-MEDIC-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Current";
  }

  IN MIR-MEDIC-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - PULSE";
  }

  IN MIR-MEDIC-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - BD";
  }

  IN MIR-MEDIC-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - URINE";
  }

  IN MIR-MEDIC-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - BLOOD SUGAR";
  }

  IN MIR-MEDIC-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - LIVER";
  }

  IN MIR-MEDIC-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - LIPID";
  }

  IN MIR-MEDIC-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ANEM";
  }

  IN MIR-MEDIC-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ECG";
  }

  IN MIR-MEDIC-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ADJUST";
  }

  INOUT MIR-MEDIC-PREV-DIS-CD
  {
    MixedCase;
    Label = "Hospital - Previous";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-CRNT-DIS-CD
  {
    MixedCase;
    Label = "Hospital - Current";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-BLD-CD
  {
    MixedCase;
    Label = "Hospital - Build";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-PULSE-CD
  {
    MixedCase;
    Label = "Hospital - Pulse";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-BD-CD
  {
    MixedCase;
    Label = "Hospital - BD";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-URINE-CD
  {
    MixedCase;
    Label = "Hospital - Urine";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-BLOOD-SUGAR-CD
  {
    MixedCase;
    Label = "Hospital - Sugar";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-LIVER-CD
  {
    MixedCase;
    Label = "Hospital - Liver";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-LIPID-CD
  {
    MixedCase;
    Label = "Hospital - Lipid";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-ANEM-CD
  {
    MixedCase;
    Label = "Hospital - Anemia";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-ECG-CD
  {
    MixedCase;
    Label = "Hospital - ECG";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-ADJ-CD
  {
    MixedCase;
    Label = "Hospital - Adjust";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-STD-CD
  {
    MixedCase;
    Label = "Hospital - Standard";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-MEDIC-TOT-AMT
  {
    MixedCase;
    Label = "Hospital - Total";
    Length = "05";
    SType = "Text";
  }

  IN MIR-EXCL-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Previous";
  }

  IN MIR-EXCL-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Build";
  }

  IN MIR-EXCL-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Current";
  }

  IN MIR-EXCL-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- PULSE";
  }

  IN MIR-EXCL-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- BD";
  }

  IN MIR-EXCL-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- URINE";
  }

  IN MIR-EXCL-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- BLOOD SUGAR";
  }

  IN MIR-EXCL-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- LIVER";
  }

  IN MIR-EXCL-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- LIPID";
  }

  IN MIR-EXCL-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ANEM";
  }

  IN MIR-EXCL-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ECG";
  }

  IN MIR-EXCL-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ADJUST";
  }

  INOUT MIR-EXCL-PREV-DIS-CD
  {
    MixedCase;
    Label = "Exclusion - Previous";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-CRNT-DIS-CD
  {
    MixedCase;
    Label = "Exclusion - Current";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-BLD-CD
  {
    MixedCase;
    Label = "Exclusion - Build";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-PULSE-CD
  {
    MixedCase;
    Label = "Exclusion - Pulse";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-BD-CD
  {
    MixedCase;
    Label = "Exclusion - BD";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-URINE-CD
  {
    MixedCase;
    Label = "Exclusion - Urine";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-BLOOD-SUGAR-CD
  {
    MixedCase;
    Label = "Exclusion - Sugar";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-LIVER-CD
  {
    MixedCase;
    Label = "Exclusion - Liver";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-LIPID-CD
  {
    MixedCase;
    Label = "Exclusion - Lipid";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-ANEM-CD
  {
    MixedCase;
    Label = "Exclusion - Anemia";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-ECG-CD
  {
    MixedCase;
    Label = "Exclusion - ECG";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-ADJ-CD
  {
    MixedCase;
    Label = "Exclusion - Adjust";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-STD-CD
  {
    MixedCase;
    Label = "Exclusion - Standard";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-EXCL-TOT-AMT
  {
    MixedCase;
    Label = "Exclusion - Total";
    Length = "05";
    SType = "Text";
  }

  IN MIR-MLJ-HLTH-ASSESS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MLJ DECISION";
  }

  INOUT MIR-MLJ-HLTH-ASSESS-CD
  {
    Label = "MLJ DECISION";
    CodeSource = "EDIT";
    CodeType = "CLDEC";
    Length = "02";
    SType = "Selection";
  }
  IN MIR-REINS-HLTH-ASSESS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  INOUT MIR-REINS-HLTH-ASSESS-CD
  {
    Label = "Re-Insurer  DECISION";
    CodeSource = "EDIT";
    CodeType = "CLDEC";
    Length = "02";
    SType = "Selection";
  }

  IN MIR-EXCL-BODY-PART-1-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-2-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-3-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-4-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-5-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-6-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-7-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  INOUT MIR-EXCL-BODY-PART-1-CD
  {
    Label = "Parts of Body - 1";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-2-CD
  {
    Label = "Parts of Body - 2";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-3-CD
  {
    Label = "Parts of Body - 3";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-4-CD
  {
    Label = "Parts of Body - 4";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-5-CD
  {
    Label = "Parts of Body - 5";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-6-CD
  {
    Label = "Parts of Body - 6";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-EXCL-BODY-PART-7-CD
  {
    Label = "Parts of Body - 7";
    CodeSource = "EDIT";
    CodeType = "XCLUD";
    Length = "03";
    SType = "Selection";
  }

  INOUT MIR-DISABL-NOT-COVD-IND
  {
    Label = "Specific disability not covered";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-REASN-1-CD
  {
    MixedCase;
    Label = "Reason Code -1";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-REASN-2-CD
  {
    MixedCase;
    Label = "Reason Code -2";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-REASN-3-CD
  {
    MixedCase;
    Label = "Reason Code -3";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-REASN-4-CD
  {
    MixedCase;
    Label = "Reason Code -4";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-REASN-5-CD
  {
    MixedCase;
    Label = "Reason Code -5";
    Length = "03";
    SType = "Text";
  }

  INOUT MIR-FRST-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-FRST-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-FRST-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRST-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRST-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRST-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRST-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SEC-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-SEC-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-SEC-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SEC-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SEC-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SEC-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SEC-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-THRD-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-THRD-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-THRD-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-THRD-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-THRD-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-THRD-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-THRD-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-FRTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-FRTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FRTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FIFTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-FIFTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-FIFTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FIFTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FIFTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FIFTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-FIFTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SIXTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-SIXTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-SIXTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SIXTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SIXTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SIXTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SIXTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SVNTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-SVNTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-SVNTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SVNTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SVNTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SVNTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-SVNTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-EIGTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-EIGTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-EIGTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-EIGTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-EIGTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-EIGTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-EIGTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-NINTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-NINTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-NINTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-NINTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-NINTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-NINTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-NINTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "20";
    SType = "Text";
  }

  INOUT MIR-TENTH-DFCT-1-CD
  {
    MixedCase;
    Label = "Defect Code -1";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-TENTH-DFCT-2-CD
  {
    MixedCase;
    Label = "Defect Code -2";
    Length = "06";
    SType = "Text";
  }

  INOUT MIR-TENTH-ELAPS-YRS-DUR
  {
    MixedCase;
    Label = "Elapsed Years";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-TENTH-SURGY-1-CD
  {
    MixedCase;
    Label = "Surgery Code - 1";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-TENTH-SURGY-2-CD
  {
    MixedCase;
    Label = "Surgery Code - 2";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-TENTH-SURGY-3-CD
  {
    MixedCase;
    Label = "Surgery Code - 3";
    Length = "02";
    SType = "Text";
  }

  INOUT MIR-TENTH-ADDL-INFO-TXT
  {
    MixedCase;
    Label = "Additional Info";
    Length = "20";
    SType = "Text";
  }

  INOUT MIR-DV-UW-NM-T[20]
  {
    Label = "User";
    Length = "75";
    SType = "Text";
  }

  INOUT MIR-CREAT-DT-T[20]
  {
    Label = "Creation Day";
    Length = "75";
    SType = "Text";
  }

  INOUT MIR-UW-COMNT-TXT-T[20]
  {
    MixedCase;
    Label = "UW Note";
    Length = "200";
    SType = "Text";
  }

  INOUT MIR-DOCTOR-CMNT-TXT-T[20]
  {
    MixedCase;
    Label = "DR Commment";
    Length = "200";
    SType = "Text";
  }

  INOUT MIR-PHYS-COND-TXT
  {
    MixedCase;
    Label = "Physical Conditions";
    Length = "400";
    SType = "TextArea";
  }

  INOUT MIR-ADULT-DIS-CVG-IND
  {
    Label = "Adult Disease Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-FEM-DIS-HOSP-CVG-IND
  {
    Label = "Female Disease Hospitalization Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-INJURY-CVG-IND
  {
    Label = "Injury Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-ACCDNT-DTH-CVG-IND
  {
    Label = "Accidental Death Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-ACCDNT-HOSP-CVG-IND
  {
    Label = "Accidental Hospitaliztion Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-DIS-HOSP-CVG-IND
  {
    Label = "Disease Hospitalization Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-CTYP-HOSP-CVG-IND
  {
    Label = "C Type Hospitalization Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-DSCHRG-CVG-IND
  {
    Label = "Discharge Disease Rider";
    Length = "01";
    SType = "Indicator";
  }

  INOUT MIR-CANCER-REL-CVG-IND
  {
    Label = "Cancer Related Rider";
    Length = "01";
    SType = "Indicator";
  }
  
 #M213F1 CHANGES STARTS HERE   
     
   INOUT MIR-DD-WP-CVG-IND
   {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "3DD WoP Rider";
   }
      
   INOUT MIR-PREF-RT-CVG-IND
   {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Preferred Rate";
   }
      
   INOUT MIR-LD-EXT-CVG-IND
   {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "7LD Extension Rider";
   }
      
   INOUT MIR-CRIT-ILL-CVG-IND
   {
          
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Critical Illness Rider";
   }
     
   INOUT MIR-PRIM-MEDIC-CVG-IND
   {
         Length = "01";
         DBTableName = "TUWFD";
         SType = "Indicator";
         Label = "Primary Medical Rider";
   }
     
   INOUT MIR-ADV-MEDIC-TRTMNT-IND
   {
         Length = "01";
         DBTableName = "TUWFD";
         SType = "Indicator";
         Label = "Advanced Medical Treatment Rider";
   }

#MP253E CHANGES STARTS HERE
   INOUT MIR-LNG-TRM-CARE-IND
   {
         Length = "01";
         DBTableName = "TUWFD";
         SType = "Indicator";
         Label = "LTC Rider";
   }

#MP253E CHANGES ENDS HERE
#M213F1 CHANGES END HERE
  INOUT MIR-UW-COMNT-TXT
  {
    MixedCase;
    Label = "UW Note";
    Length = "200";
    SType = "TextArea";
  }

  INOUT MIR-DOCTOR-CMNT-TXT
  {
    MixedCase;
    Label = "DR Commment";
    Length = "200";
    SType = "TextArea";
  }

  INOUT MIR-MNGR-DECID-INFO-CD
  {
    Label = "Manager's decision";
    Length = "01";
    CodeSource = "EDIT";
    CodeType = "MNDEC";
    SType = "Selection";
  }

  INOUT MIR-CASE-TYP-INFO-CD
  {
    Label = "Case Type ";
    Length = "01";
    CodeSource = "EDIT";
    CodeType = "CASE";
    SType = "Selection";
  }

  INOUT MIR-MNGR-COMNT-TXT
  {
    MixedCase;
    Label = "Manger's Comments";
    Length = "200";
    SType = "TextArea";
  }

  INOUT MIR-MNGR-OTHR-INFO-TXT
  {
    MixedCase;
    Label = "Manger's Comments";
    Length = "60";
    SType = "TextArea";
  }

#M245B2 CHANGES START HERE    
  IN MIR-POL-CRCY-CD
      {   
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
            
    } 
#M245B2 CHANGES END HERE      
}
