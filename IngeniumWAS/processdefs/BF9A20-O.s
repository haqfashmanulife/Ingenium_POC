# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A20-O.s                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004          Initial Revision                                           *
#*  AHS048   CTS    ADDED DOCTOR RANK FIELD                                    *
#*  AHS150  CTS      CHANGED DOCTOR RANK FIELD                                 *
#*  AHS150  CTS      CHANGED FOR CHANGE INDICATOR                              *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*  AHU068  CTS      CHANGES FOR COVERAGE UW-NOTE                              *
#*  M16138  CTS      CHANGES TO DISPLAY STATE OF ADDITION OF 3DD WOP RIDER     *
#*  M213F1  CTS      CHANGES TO ADD NEW SIX  INDICATOR FIELDS  FOR RUM         *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP253E  CTS      ADD NEW FIELDS FOR INELIGIBLE FOR LTC RIDER               *
#*  MP265G CTS      ADDED NEW FIELD AGENT NAME AS PART OF NOMURA*
#*******************************************************************************

S-STEP BF9A20-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
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
     Length = "10";
     SType = "Text";
  }

  IN MIR-POL-CSTAT-CD
  {
     DisplayOnly;
     Label = "Policy Status";
     Length = "10";
     CodeSource = "DataModel";
     CodeType = "POL-CSTAT-CD";
     SType = "Text";
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
#    Length = "02";
#    SType = "Text";
     Index = "1";
  }

  IN MIR-CVG-STBL-1-CD-T[20]
  {
     DisplayOnly;
     Length = "40";
     FieldGroup = "Table20";
#* M241A3 changes START here*
#     CodeSource = "EDIT";
#     CodeType = "STB1";
      CodeSource = "CSOM9D29";
      FilterFields = "2";
      FilterField1 = "MIR-PLAN-ID-T"; 
      FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
     SType = "Text";
     Label = "Duration";
     Index = "1";
#    CodeSource = "EDIT";
#    CodeType = "STB1";
#    DisplayOnly;
#    Label = "Duration";
#    Length = "02";
#    SType = "Text";
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
#    DBTableName = "TCVG";
#    CodeSource = "EDIT";
#    CodeType = "STB2";
#    DisplayOnly;
#    Label = "Type";
#    Length = "02";
#    SType = "Text";
  }

# Changes for AHU068 start

  IN MIR-UW-NOTE-T[20]
  {
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
     CodeSource = "DataModel";
     CodeType = "CNVR-TYP-CD";
     DBTableName = "TPOL";
     DisplayOnly;
     Label = "Application Type";
     Length = "10";
     SType = "Text";
  }

  IN MIR-UW-TYP-CD
  {
     DBTableName = "TPOL";
     CodeSource = "DataModel";
     CodeType = "UW-TYP-CD";
     DisplayOnly;
     Label = "Selection Method";
     Length = "01";
     SType = "Text";
  }

  IN MIR-NON-CNTRCT-DOCTOR-IND
  {
#    Fix for BU3679 start
#    CodeSource = "EDIT";
#    Fix for BU3679 end
     DisplayOnly;
     Label = "Non Contract Doctor";
     Length = "01";
     SType = "Text";
  }

  IN MIR-CNTRCT-DOCTOR-ID
  {
#    Fix for BU3679 start
#    CodeSource = "EDIT";
#    Fix for BU3679 end
     DisplayOnly;
     Label = "Contracr Doctor Id";
     Length = "06";
     SType = "Text";
  }


  IN MIR-DOCTOR-RANK-CD
  {
#   Fix for BU3679 start
#   CodeSource = "EDIT";
#   Fix for BU3679 start
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
     SType = "Text";
  }

  IN MIR-MOBIL-INTRVW-IND
  {
     DisplayOnly;
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
    IN MIR-BLOOD-TXT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Blood";
    }

  IN MIR-BLOOD-TXT
  {
     DisplayOnly;
     Label = "Blood";
     Length = "100";
     SType = "Text";
  }

  IN MIR-MED-MIN-BLOOD-RT
  {
     DisplayOnly;
     Label = "Blood";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MED-MAX-BLOOD-RT
  {
     DisplayOnly;
     Label = "Blood";
     Length = "03";
     SType = "Text";
  }

    INOUT MIR-ECG-TXT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "ECG";
    }
  IN MIR-ECG-TXT
  {
     DisplayOnly;
     Label = "ECG";
     Length = "100";
     SType = "Text";
  }

  IN MIR-BLOOD-TEST-IND
  {
     DisplayOnly;
     Label = "Blood test";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-ECG-IND
  {
     DisplayOnly;
     Label = "ECG";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-HLTH-CHK-RSLT-IND
  {
     DisplayOnly;
     Label = "Results of Health check up";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-MEDIC-RPT-IND
  {
     DisplayOnly;
     Label = "Medical report";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-ADDL-SELF-DSCLSRE-IND
  {
     DisplayOnly;
     Label = "Additional Self Disclosure";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-DEDCT-SELF-DSCLSRE-IND
  {
     DisplayOnly;
     Label = "Dedicated Additional Self Disclosure";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-EXIST-SELF-DSCLSRE-IND
  {
     DisplayOnly;
     Label = "Existing Policy Self Disclosure";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-PRE-ISS-RPT-IND
  {
     DisplayOnly;
     Label = "Pre-issue Report Indicator";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-HLTH-RPT-RESP-IND
  {
     DisplayOnly;
     Label = "Doctor/Interviewer/Corporate Health Report";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-PRLM-UW-RSLT-IND
  {
     DisplayOnly;
     Label = "Results of Preliminary Underwriting";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-MEDIC-BNFT-RPT-IND
  {
     DisplayOnly;
     Label = "Medical Report for the benefit (Claim)";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-INCMPLT-DOC-IND
  {
     DisplayOnly;
     Label = "Response to Incomplete documentation";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-SCR-WRITN-PLDG-IND
  {
     DisplayOnly;
     Label = "Scrivener's Written Pledge";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-EXIST-POL-DOC-IND
  {
     DisplayOnly;
     Label = "Documents of existing policy";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-OTHRS-IND
  {
     DisplayOnly;
     Label = "Others";
     Length = "01";
     SType = "Indicator";
  }

  IN MIR-OTHRS-DESC-TXT
  {
     DisplayOnly;
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

  IN MIR-BMI-VALU-TXT
  {
     DisplayOnly;
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


    IN MIR-DTH-TOT-AMT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - Total";
    }


  IN MIR-DTH-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Death - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Death - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BLD-CD
  {
     DisplayOnly;
     Label = "Death - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-PULSE-CD
  {
     DisplayOnly;
     Label = "Death - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BD-CD
  {
     DisplayOnly;
     Label = "Death - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-URINE-CD
  {
     DisplayOnly;
     Label = "Death - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Death - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-LIVER-CD
  {
     DisplayOnly;
     Label = "Death - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-LIPID-CD
  {
     DisplayOnly;
     Label = "Death - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-ANEM-CD
  {
     DisplayOnly;
     Label = "Death - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-ECG-CD
  {
     DisplayOnly;
     Label = "Death - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-ADJ-CD
  {
     DisplayOnly;
     Label = "Death - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-STD-CD
  {
     DisplayOnly;
     Label = "Death - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-TOT-AMT
  {
     DisplayOnly;
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

    IN MIR-CON-TOT-AMT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S - Total";
    }

  IN MIR-CON-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "S - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "S - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BLD-CD
  {
     DisplayOnly;
     Label = "S - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-PULSE-CD
  {
     DisplayOnly;
     Label = "S - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BD-CD
  {
     DisplayOnly;
     Label = "S - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-URINE-CD
  {
     DisplayOnly;
     Label = "S - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "S - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-LIVER-CD
  {
     DisplayOnly;
     Label = "S - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-LIPID-CD
  {
     DisplayOnly;
     Label = "S - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ANEM-CD
  {
     DisplayOnly;
     Label = "S - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ECG-CD
  {
     DisplayOnly;
     Label = "S - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ADJ-CD
  {
     DisplayOnly;
     Label = "S - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-STD-CD
  {
     DisplayOnly;
     Label = "S - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-TOT-AMT
  {
     DisplayOnly;
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

    IN MIR-MEDIC-TOT-AMT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - Total";
    }


  IN MIR-MEDIC-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Hospital - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Hospital - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BLD-CD
  {
     DisplayOnly;
     Label = "Hospital - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-PULSE-CD
  {
     DisplayOnly;
     Label = "Hospital - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BD-CD
  {
     DisplayOnly;
     Label = "Hospital - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-URINE-CD
  {
     DisplayOnly;
     Label = "Hospital - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Hospital - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-LIVER-CD
  {
     DisplayOnly;
     Label = "Hospital - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-LIPID-CD
  {
     DisplayOnly;
     Label = "Hospital - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ANEM-CD
  {
     DisplayOnly;
     Label = "Hospital - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ECG-CD
  {
     DisplayOnly;
     Label = "Hospital - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ADJ-CD
  {
     DisplayOnly;
     Label = "Hospital - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-STD-CD
  {
     DisplayOnly;
     Label = "Hospital - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-TOT-AMT
  {
     DisplayOnly;
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

    IN MIR-EXCL-TOT-AMT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL - Total";
    }


  IN MIR-EXCL-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Exclusion - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Exclusion - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BLD-CD
  {
     DisplayOnly;
     Label = "Exclusion - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-PULSE-CD
  {
     DisplayOnly;
     Label = "Exclusion - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BD-CD
  {
     DisplayOnly;
     Label = "Exclusion - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-URINE-CD
  {
     DisplayOnly;
     Label = "Exclusion - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Exclusion - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-LIVER-CD
  {
     DisplayOnly;
     Label = "Exclusion - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-LIPID-CD
  {
     DisplayOnly;
     Label = "Exclusion - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ANEM-CD
  {
     DisplayOnly;
     Label = "Exclusion - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ECG-CD
  {
     DisplayOnly;
     Label = "Exclusion - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ADJ-CD
  {
     DisplayOnly;
     Label = "Exclusion - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-STD-CD
  {
     DisplayOnly;
     Label = "Exclusion - Standard";
     Length = "03";
      SType = "Text";
  }

  IN MIR-EXCL-TOT-AMT
  {
     DisplayOnly;
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

  IN MIR-MLJ-HLTH-ASSESS-CD
  {
     DisplayOnly;
     Label = "MLJ Decision";
     CodeSource = "EDIT";
     CodeType = "CLDEC";
     Length = "02";
     SType = "Text";
  }
  IN MIR-REINS-HLTH-ASSESS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-REINS-HLTH-ASSESS-CD
  {
     DisplayOnly;
     Label = "Re-insurer Decision";
     CodeSource = "EDIT";
     CodeType = "CLDEC";
     Length = "02";
     SType = "Text";
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

  IN MIR-EXCL-BODY-PART-1-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 1";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-2-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 2";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-3-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 3";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-4-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 4";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-5-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 5";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-6-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 6";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-7-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 7";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DISABL-NOT-COVD-IND
  {
     DisplayOnly;
     Label = "Specific disability not covered";
     Length = "01";
     SType = "Indicator";
  }
    INOUT MIR-DISABL-NOT-COVD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Specific disability not covered";
    }

    IN MIR-REASN-1-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -1";
    }
  IN MIR-REASN-1-CD
  {
     DisplayOnly;
     Label = "Reason Code -1";
     Length = "03";
     SType = "Text";
  }


    IN MIR-REASN-2-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -2";
    }

  IN MIR-REASN-2-CD
  {
     DisplayOnly;
     Label = "Reason Code -2";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-3-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -3";
    }

  IN MIR-REASN-3-CD
  {
     DisplayOnly;
     Label = "Reason Code -3";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-4-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -4";
    }

  IN MIR-REASN-4-CD
  {
     DisplayOnly;
     Label = "Reason Code -4";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-5-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }


  IN MIR-REASN-5-CD
  {
     DisplayOnly;
     Label = "Reason Code -5";
     Length = "03";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-FRST-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-FRST-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-FRST-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-FRST-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-FRST-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-FRST-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-FRST-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }

  IN MIR-SEC-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-SEC-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-SEC-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-SEC-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-SEC-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-SEC-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }

  IN MIR-SEC-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }

  IN MIR-THRD-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-THRD-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-THRD-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-THRD-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-THRD-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-THRD-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-THRD-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }

  IN MIR-FRTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-FRTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-FRTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-FRTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-FRTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-FRTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-FRTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-FIFTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-FIFTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-FIFTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FIFTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-FIFTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FIFTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-FIFTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-FIFTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-FIFTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-SIXTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-SIXTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-SIXTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-SIXTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-SIXTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-SIXTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-SIXTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SVNTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-SVNTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-SVNTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-SVNTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-SVNTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-SVNTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-SVNTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-SVNTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-SVNTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-EIGTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-EIGTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-EIGTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-EIGTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-EIGTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-EIGTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-EIGTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-NINTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-NINTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-NINTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-NINTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-NINTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-NINTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-NINTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-NINTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-NINTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "20";
     SType = "Text";
  }


    INOUT MIR-CI-TENTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-TENTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-TENTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-TENTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-TENTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-TENTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-TENTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-TENTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-TENTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-TENTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-TENTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-TENTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-TENTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-TENTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "20";
     SType = "Text";
  }

  IN MIR-DV-UW-NM-T[20]
  {
     DisplayOnly;
     Label = "User";
     Length = "75";
     SType = "Text";
  }

  IN MIR-CREAT-DT-T[20]
  {
     DisplayOnly;
     Label = "Creation Day";
     Length = "75";
     SType = "Text";
  }

  IN MIR-UW-COMNT-TXT-T[20]
  {
     DisplayOnly;
     Label = "UW Note";
     Length = "200";
     SType = "Text";
  }

  IN MIR-DOCTOR-CMNT-TXT-T[20]
  {
     DisplayOnly;
     Label = "DR Commment";
     Length = "200";
     SType = "Text";
  }


    INOUT MIR-PHYS-COND-TXT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Physical Conditions";
    }

  IN MIR-PHYS-COND-TXT
  {
     DisplayOnly;
     Label = "Physical Conditions";
     Length = "400";
     SType = "TextArea";
  }


    INOUT MIR-ADULT-DIS-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Adult Disease Rider";
    }

  IN MIR-ADULT-DIS-CVG-IND
  {
     DisplayOnly;
     Label = "Adult Disease Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-FEM-DIS-HOSP-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Female Disease Hospitalization Rider";
    }

  IN MIR-FEM-DIS-HOSP-CVG-IND
  {
     DisplayOnly;
     Label = "Female Disease Hospitalization Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-INJURY-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Injury Rider";
    }

  IN MIR-INJURY-CVG-IND
  {
     DisplayOnly;
     Label = "Injury Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-ACCDNT-DTH-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Accidental Death Rider";
    }

  IN MIR-ACCDNT-DTH-CVG-IND
  {
     DisplayOnly;
     Label = "Accidental Death Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-ACCDNT-HOSP-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Accidental Hospitaliztion Rider";
    }

  IN MIR-ACCDNT-HOSP-CVG-IND
  {
     DisplayOnly;
     Label = "Accidental Hospitaliztion Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-DIS-HOSP-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Disease Hospitalization Rider";
    }

  IN MIR-DIS-HOSP-CVG-IND
  {
     DisplayOnly;
     Label = "Disease Hospitalization Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-CTYP-HOSP-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "C Type Hospitalization Rider";
    }

  IN MIR-CTYP-HOSP-CVG-IND
  {
     DisplayOnly;
     Label = "C Type Hospitalization Rider";
     Length = "01";
     SType = "Indicator";
  }


    INOUT MIR-DSCHRG-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Discharge Disease Rider";
    }

  IN MIR-DSCHRG-CVG-IND
  {
     DisplayOnly;
     Label = "Discharge Disease Rider";
     Length = "01";
     SType = "Indicator";
  }

    INOUT MIR-CANCER-REL-CVG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Cancer Related Rider";
    }

  IN MIR-CANCER-REL-CVG-IND
  {
     DisplayOnly;
     Label = "Cancer Related Rider";
     Length = "01";
     SType = "Indicator";
  }
#M213F1 CHANGES STARTS HERE   
   INOUT MIR-DD-WP-CVG-CHNG-IND
   {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "3DD WoP Rider";
   }
      
   IN MIR-DD-WP-CVG-IND
   {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";
        Label = "3DD WoP Rider";
   }
      
   INOUT MIR-PREF-RT-CVG-CHNG-IND
   {
     
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Preferred Rate";
   }
      
   IN MIR-PREF-RT-CVG-IND
   {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";
        Label = "Preferred Rate";
   }
      
   INOUT MIR-LD-EXT-CVG-CHNG-IND
   {
        
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "7LD Extension Rider";
   }
      
   IN MIR-LD-EXT-CVG-IND
   {
          
          DisplayOnly;
          Length = "01";
          SType = "Indicator";
          Label = "7LD Extension Rider";
   }
      
   INOUT MIR-CRIT-ILL-CVG-CHNG-IND
   {
        
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Critical Illness Rider";
   }
      
   IN MIR-CRIT-ILL-CVG-IND
   {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";
        Label = "Critical Illness Rider";
   }
     
   INOUT MIR-PRIM-MEDIC-CVG-CHNG-IND
   {
         Length = "01";
         DBTableName = "Derived";
         SType = "Indicator";
         Label = "Primary Medical Rider";
   }
       
   IN MIR-PRIM-MEDIC-CVG-IND
   {
         DisplayOnly;
         Length = "01";
         SType = "Indicator";
         Label = "Primary Medical Rider";
   }
      
   INOUT MIR-ADV-MEDIC-TRTMNT-CHNG-IND
   {
         Length = "01";
         DBTableName = "Derived";
         SType = "Indicator";
         Label = "Advanced Medical Treatment Rider";
   }
       
   IN MIR-ADV-MEDIC-TRTMNT-IND
   {
         DisplayOnly;
         Length = "01";
         SType = "Indicator";
         Label = "Advanced Medical Treatment Rider";
   }
#MP253E CHANGES STARTS HERE

   INOUT MIR-LNG-TRM-CARE-CHNG-IND
   {
         Length = "01";
         DBTableName = "Derived";
         SType = "Indicator";
         Label = "LTC Rider";
   }

   IN MIR-LNG-TRM-CARE-IND
   {
         DisplayOnly;
         Length = "01";
         SType = "Indicator";
         Label = "LTC Rider";
   }
#MP253E CHANGES ENDS HERE

#M213F1 CHANGES END HERE
  IN MIR-UW-COMNT-TXT
  {
     DisplayOnly;
     Label = "UW Note";
     Length = "200";
     SType = "TextArea";
  }

  IN MIR-DOCTOR-CMNT-TXT
  {
     DisplayOnly;
     Label  = "DR Commment";
     Length = "200";
     SType  = "TextArea";
  }

  IN MIR-MNGR-DECID-INFO-CD
  {
     DisplayOnly;
     Label = "Manager's decision";
     CodeSource = "EDIT";
     CodeType = "MNDEC";
     Length = "01";
     SType = "Text";
  }

  IN MIR-CASE-TYP-INFO-CD
  {
     DisplayOnly;
     Label = "Case Type ";
     CodeSource = "EDIT";
     CodeType = "CASE";
     Length = "01";
     SType = "Text";
  }

  IN MIR-MNGR-COMNT-TXT
  {
     DisplayOnly;
     Label = "Manger's Comments";
     Length = "200";
     SType = "TextArea";
  }

  IN MIR-MNGR-OTHR-INFO-TXT
  {
    DisplayOnly;
    Label = "Manger's Comments";
    Length = "60";
    SType = "TextArea";
  }

#M245B2 CHANGES START HERE    
  INOUT MIR-POL-CRCY-CD
      {   
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
            
    }  
#M245B2 CHANGES END HERE      
}
