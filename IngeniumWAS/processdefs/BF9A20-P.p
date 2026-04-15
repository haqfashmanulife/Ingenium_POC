# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A20-P.p                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2003           Initial Revision                                          *
#*  AHS150  CTS      CHANGED DOCTOR RANK FIELD                                 *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*  AHU068  CTS      CHANGES FOR COVERAGE UW-NOTE                              *
#*  M16138  CTS      CHANGES TO DISPLAY STATE OF ADDITION OF 3DD WOP RIDER     *
#*  M213F1  CTS      CHANGES TO ADD NEW SIX INDICATOR FIELDS FOR RUM           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP253E  CTS      ADD NEW INDICATOR FOR ULE2                                *
#*  MP265G  CTS      ADDED NEW FIELD AGENT NAME AS PART OF NOMURA              *
#*******************************************************************************

P-STEP BF9A20-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A20";
        BusinessFunctionName = "UW Final Decision Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USER-ID
    {
       Key;
       Length = "10";
       DBTableName = "TUWFD";
       DefaultSession = "MIR-USER-ID";
       SType = "Text";
       Label = "User ID";
    }



    INOUT MIR-POL-ID
    {
       Key;
       Length = "10";
       DBTableName = "TUWFD";
       DefaultSession = "MIR-POL-ID-BASE";
       SType = "Text";
       Label = "Policy ID";
    }

    INOUT MIR-CLI-ID
    {
       Key;
       Length = "10";
       DBTableName = "TUWFD";
       DefaultSession = "MIR-CLI-ID";
       SType = "Text";
       Label = "Client Id";
    }

    INOUT MIR-SEQ-NUM
    {
      Key;
      Length = "2";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Sequence Number";
    }

    INOUT MIR-APP-TYP-CD
    {
      Key;
      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Application Type";
    }


    INOUT MIR-POL-APP-UPLD-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload Date";
    }

#  Fix for BU3679 start
#   INOUT MIR-DV-PRCES-STATE-CD
#   {
#       Length = "1";
#       Stype = "Hidden";
#       DBTableName = "Derived";
#       Label = "Process State";
#   }
#  Fix for BU3679 end

    INOUT MIR-DV-UW-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "UW Name";
    }

   INOUT MIR-CLI-KANA-FULL-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name(Kana)";
    }
    INOUT MIR-CLI-KJ-FULL-NM
    {
         Length = "75";
         DBTableName = "Derived";
         SType = "Text";
         Label = "Insured Name(kanji)";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Process Date";
    }

#MP245J CHANGES STARTS HERE

    INOUT MIR-SSTD-AGE-ADD-DUR
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

    INOUT MIR-CLI-AGE
    {
        Length = "03";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Age";

    }

    INOUT MIR-CLI-BTH-DT
    {
         Length = "10";
         DBTableName = "TCLI";
         SType = "Date";
         Label = "Birth Date";
    }

    INOUT MIR-CLI-SEX-CD
    {
         Length = "10";
         DBTableName = "TCLI";
         SType = "Text";
         Label = "Sex";
    }

    INOUT MIR-STCKR-ID
    {
          Length = "11";
          DBTableName = "TCLI";
          SType = "Text";
          Label = "Sticker Id";
    }

    INOUT MIR-POL-CSTAT-CD
    {
          Length = "40";
          DBTableName = "TPOL";
          CodeSource = "DataModel";
          CodeType = "POL-CSTAT-CD";
          SType = "Text";
          Label = "Policy Status";
    }

    INOUT MIR-CVG-NUM-T[20]
    {
          Length = "02";
          DBTableName = "TCVG";
          SType = "Text";
          Label = "Coverage Number";
    }

    INOUT MIR-PLAN-ID-T[20]
    {
           DisplayOnly;
           Length = "40";
           CodeSource = "EDIT";
           CodeType = "PLAN";
           DBTableName = "TPOL";
           SType = "Text";
           Label = "Rider Name";
    }

#   INOUT MIR-CVG-FACE-AMT-T [20]
#   {
#         Length = "02";
#         DBTableName = "TCVG";
#         SType = "Text";
#         Label = "Face Amount";
#   }
    INOUT MIR-CVG-FACE-AMT-T[20]
    {
          Signed;
          Length = "16";
          FieldGroup = "Table20";
          DBTableName = "TCVG";
          SType = "Currency";
          Label = "Face Amount";
          Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T [20]
    {
#         Length = "02";
          Length = "40";
          FieldGroup = "Table20";
#* M241A3 changes START here*
#          CodeSource = "EDIT";
#          CodeType = "STB1";
          CodeSource = "CSOM9D29";        
	  FilterFields = "2";
     	  FilterField1 = "MIR-PLAN-ID-T"; 
     	  FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
          DBTableName = "TCVG";
          SType = "Text";
          Label = "Duration";
          Index = "1";
    }

    INOUT MIR-CVG-STBL-2-CD-T [20]
    {
#         Length = "02";
          Length = "40";
          FieldGroup = "Table20";
          CodeSource = "EDIT";
          CodeType = "STB2";
          DBTableName = "TCVG";
          SType = "Text";
          Label = "Type";
          Index = "1";
    }

#   Changes for AHU068 start

    INOUT MIR-UW-NOTE-T [20]
    {
          Length = "10";
          DBTableName = "TCVG";
          SType = "Text";
          Label = "Underwriter Note";
    }
#   Changes for AHU068 end
# Changes for M16138 start

    INOUT MIR-CVG-WP-IND-T [20]
    {
          DisplayOnly;
          Length = "1";
          DBTableName = "TCVG";    
          SType = "Indicator";
          Label = "STATE OF ADDITION OF 3DD WOP RIDER";

  }

# Changes for M16138 end

    INOUT MIR-BR-ID
    {
          Length = "05";
          DBTableName = "TPOL";
          SType = "Text";
          Label = "Branch Id";
    }

    INOUT MIR-POL-CNVR-TYP-CD
    {
          Length = "10";
          CodeSource = "DataModel";
          CodeType = "CNVR-TYP-CD";
          DBTableName = "TPOL";
          SType = "Text";
          Label = "Application Type";
    }


    INOUT MIR-UW-TYP-CD
    {
          Length = "01";
          CodeSource = "DataModel";
          DBTableName = "TPOL";
          CodeType = "UW-TYP-CD";
          SType = "Text";
          Label = "Selection Method";
    }

    INOUT MIR-NON-CNTRCT-DOCTOR-IND
    {
          Length = "01";
          CodeSource = "EDIT";
          DBTableName = "TPOL";
          SType = "Text";
          Label = "Non Contract Doctor";
    }

    INOUT MIR-CNTRCT-DOCTOR-ID
    {
          Length = "06";
          CodeSource = "EDIT";
          DBTableName = "TAPPV";
          SType = "Text";
          Label = "Contracr Doctor Id";
    }

    INOUT MIR-DOCTOR-RANK-CD
    {
          Length = "03";
          CodeSource = "EDIT";
          DBTableName = "TAPPV";
          SType = "Text";
          Label = "Rank";
    }

    INOUT MIR-MEDIC-RPT-NUM
    {
          Length = "06";
          DBTableName = "TAPPV";
          SType = "Text";
          Label = "Medical report number";
    }

    INOUT MIR-MEDIC-RPT-DT
    {
          Length = "10";
          DBTableName = "TAPPV";
#         SType = "Text";
          SType = "Date";
          Label = "Medical report Date";
    }


    INOUT MIR-MOBIL-INTRVW-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Mobie Interview";
    }

# Changes for MP265G Start     
    INOUT MIR-DV-AGT-NM
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
    }
# Changes for MP265G End
    INOUT MIR-BLOOD-TXT
    {
          Length = "100";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Blood";
    }

    INOUT MIR-MED-MIN-BLOOD-RT
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Blood";
    }

    INOUT MIR-MED-MAX-BLOOD-RT
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Blood";
    }

    INOUT MIR-ECG-TXT
    {
          Length = "100";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "ECG";
    }


    INOUT MIR-BLOOD-TEST-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Blood test";
    }


    INOUT MIR-ECG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "ECG";
    }

    INOUT MIR-HLTH-CHK-RSLT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Results of Health check up";
    }

    INOUT MIR-MEDIC-RPT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Medical report";
    }

    INOUT MIR-ADDL-SELF-DSCLSRE-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Additional Self Disclosure";
    }

    INOUT MIR-DEDCT-SELF-DSCLSRE-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Dedicated Additional Self Disclosure";
    }

    INOUT MIR-EXIST-SELF-DSCLSRE-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Existing Policy Self Disclosure";
    }

    INOUT MIR-PRE-ISS-RPT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Pre-issue Report Indicator";
    }

    INOUT MIR-HLTH-RPT-RESP-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Doctor/Interviewer/Corporate Health Report";
    }

    INOUT MIR-PRLM-UW-RSLT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Results of Preliminary Underwriting";
    }


    INOUT MIR-MEDIC-BNFT-RPT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Medical Report for the benefit (Claim)";
    }

    INOUT MIR-INCMPLT-DOC-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Response to Incomplete documentation";
    }


    INOUT MIR-SCR-WRITN-PLDG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Scrivener's Written Pledge";
    }


    INOUT MIR-EXIST-POL-DOC-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Documents of existing policy";
    }



    INOUT MIR-OTHRS-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Others";
    }


    INOUT MIR-OTHRS-DESC-TXT
    {
          Length = "50";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "Comments";
    }

    OUT MIR-SELF-DSCLSRE-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "With Self-disclosure";
    }


    INOUT MIR-MED-URINE-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Urine";
    }

    INOUT MIR-BMI-VALU-TXT
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "BMI value";
    }


   INOUT MIR-MED-BLOOD-RT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "BP";
    }


    INOUT MIR-MED-PULSE-RT-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Pulse";
    }


    INOUT MIR-MED-BLOOD-TST-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Blood Test Available";
    }


    INOUT MIR-MED-ECG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "ECG Available";
    }

    INOUT MIR-DTH-PREV-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - Previous";
    }

    INOUT MIR-DTH-BLD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - Build";
    }

    INOUT MIR-DTH-CRNT-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - Current";
    }

    INOUT MIR-DTH-PULSE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - PULSE";
    }

    INOUT MIR-DTH-BD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - BD";
    }

    INOUT MIR-DTH-URINE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - URINE";
    }

    INOUT MIR-DTH-BLOOD-SUGAR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - BLOOD SUGAR";
    }

    INOUT MIR-DTH-LIVER-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - LIVER";
    }

    INOUT MIR-DTH-LIPID-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - LIPID";
    }

    INOUT MIR-DTH-ANEM-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - ANEM";
    }

    INOUT MIR-DTH-ECG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - ECG";
    }

    INOUT MIR-DTH-ADJ-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Death - ADJUST";
    }

    INOUT MIR-DTH-PREV-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Previous";
    }


    INOUT MIR-DTH-CRNT-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Current";
    }


    INOUT MIR-DTH-BLD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Build";
    }


    INOUT MIR-DTH-PULSE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Pulse";
    }


    INOUT MIR-DTH-BD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - BD";
    }


    INOUT MIR-DTH-URINE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Urine";
    }


    INOUT MIR-DTH-BLOOD-SUGAR-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Sugar";
    }


    INOUT MIR-DTH-LIVER-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Liver";
    }


    INOUT MIR-DTH-LIPID-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Lipid";
    }


    INOUT MIR-DTH-ANEM-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Anemia";
    }


    INOUT MIR-DTH-ECG-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - ECG";
    }

    INOUT MIR-DTH-ADJ-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Adjust";
    }

    INOUT MIR-DTH-STD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Standard";
    }

    INOUT MIR-DTH-TOT-AMT
    {
          Length = "05";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Death - Total";
    }

    INOUT MIR-CON-PREV-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- Previous";
    }

    INOUT MIR-CON-BLD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- Build";
    }

    INOUT MIR-CON-CRNT-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- Current";
    }

    INOUT MIR-CON-PULSE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- PULSE";
    }

    INOUT MIR-CON-BD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- BD";
    }

    INOUT MIR-CON-URINE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- URINE";
    }

    INOUT MIR-CON-BLOOD-SUGAR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- BLOOD SUGAR";
    }

    INOUT MIR-CON-LIVER-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- LIVER";
    }

    INOUT MIR-CON-LIPID-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- LIPID";
    }

    INOUT MIR-CON-ANEM-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- ANEM";
    }

    INOUT MIR-CON-ECG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- ECG";
    }

    INOUT MIR-CON-ADJ-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "S- ADJUST";
    }

    INOUT MIR-CON-PREV-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Previous";
    }


    INOUT MIR-CON-CRNT-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Current";
    }


    INOUT MIR-CON-BLD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Build";
    }


    INOUT MIR-CON-PULSE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Pulse";
    }


    INOUT MIR-CON-BD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - BD";
    }


    INOUT MIR-CON-URINE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Urine";
    }


    INOUT MIR-CON-BLOOD-SUGAR-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Sugar";
    }


    INOUT MIR-CON-LIVER-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Liver";
    }


    INOUT MIR-CON-LIPID-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Lipid";
    }


    INOUT MIR-CON-ANEM-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Anemia";
    }


    INOUT MIR-CON-ECG-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - ECG";
    }

    INOUT MIR-CON-ADJ-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Adjust";
    }

    INOUT MIR-CON-STD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Standard";
    }

    INOUT MIR-CON-TOT-AMT
    {
          Length = "05";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "S - Total";
    }

    INOUT MIR-MEDIC-PREV-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - Previous";
    }

    INOUT MIR-MEDIC-BLD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - Build";
    }

    INOUT MIR-MEDIC-CRNT-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - Current";
    }

    INOUT MIR-MEDIC-PULSE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - PULSE";
    }

    INOUT MIR-MEDIC-BD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - BD";
    }

    INOUT MIR-MEDIC-URINE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - URINE";
    }

    INOUT MIR-MEDIC-BLOOD-SUGAR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - BLOOD SUGAR";
    }

    INOUT MIR-MEDIC-LIVER-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - LIVER";
    }

    INOUT MIR-MEDIC-LIPID-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - LIPID";
    }

    INOUT MIR-MEDIC-ANEM-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - ANEM";
    }

    INOUT MIR-MEDIC-ECG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - ECG";
    }

    INOUT MIR-MEDIC-ADJ-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC - ADJUST";
    }

    INOUT MIR-MEDIC-PREV-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Previous";
    }


    INOUT MIR-MEDIC-CRNT-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Current";
    }


    INOUT MIR-MEDIC-BLD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Build";
    }


    INOUT MIR-MEDIC-PULSE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Pulse";
    }


    INOUT MIR-MEDIC-BD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - BD";
    }


    INOUT MIR-MEDIC-URINE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Urine";
    }


    INOUT MIR-MEDIC-BLOOD-SUGAR-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Sugar";
    }


    INOUT MIR-MEDIC-LIVER-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Liver";
    }


    INOUT MIR-MEDIC-LIPID-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Lipid";
    }


    INOUT MIR-MEDIC-ANEM-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Anemia";
    }


    INOUT MIR-MEDIC-ECG-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - ECG";
    }

    INOUT MIR-MEDIC-ADJ-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Adjust";
    }

    INOUT MIR-MEDIC-STD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Standard";
    }

    INOUT MIR-MEDIC-TOT-AMT
    {
          Length = "05";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Hospital - Total";
    }

    INOUT MIR-EXCL-PREV-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- Previous";
    }

    INOUT MIR-EXCL-BLD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- Build";
    }

    INOUT MIR-EXCL-CRNT-DIS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- Current";
    }

    INOUT MIR-EXCL-PULSE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- PULSE";
    }

    INOUT MIR-EXCL-BD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- BD";
    }

    INOUT MIR-EXCL-URINE-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- URINE";
    }

    INOUT MIR-EXCL-BLOOD-SUGAR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- BLOOD SUGAR";
    }

    INOUT MIR-EXCL-LIVER-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- LIVER";
    }

    INOUT MIR-EXCL-LIPID-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- LIPID";
    }

    INOUT MIR-EXCL-ANEM-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- ANEM";
    }

    INOUT MIR-EXCL-ECG-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- ECG";
    }

    INOUT MIR-EXCL-ADJ-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "EXCL- ADJUST";
    }

    INOUT MIR-EXCL-PREV-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Previous";
    }


    INOUT MIR-EXCL-CRNT-DIS-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Current";
    }


    INOUT MIR-EXCL-BLD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Build";
    }


    INOUT MIR-EXCL-PULSE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Pulse";
    }


    INOUT MIR-EXCL-BD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - BD";
    }


    INOUT MIR-EXCL-URINE-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Urine";
    }


    INOUT MIR-EXCL-BLOOD-SUGAR-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Sugar";
    }


    INOUT MIR-EXCL-LIVER-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Liver";
    }


    INOUT MIR-EXCL-LIPID-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Lipid";
    }


    INOUT MIR-EXCL-ANEM-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Anemia";
    }


    INOUT MIR-EXCL-ECG-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - ECG";
    }

    INOUT MIR-EXCL-ADJ-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Adjust";
    }

    INOUT MIR-EXCL-STD-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Standard";
    }

    INOUT MIR-EXCL-TOT-AMT
    {
          Length = "05";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Exclusion - Total";
    }

    INOUT MIR-MLJ-HLTH-ASSESS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MLJ DECISION";
    }

    INOUT MIR-MLJ-HLTH-ASSESS-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
    CodeType = "CLDEC";
          SType = "Selection";
          Label = "MLJ DECISION";
    }
    INOUT MIR-REINS-HLTH-ASSESS-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }

    INOUT MIR-REINS-HLTH-ASSESS-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
    CodeType = "CLDEC";
          SType = "Selection";
          Label = "REINS DECISION";
    }

    INOUT MIR-EXCL-BODY-PART-1-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }

    INOUT MIR-EXCL-BODY-PART-2-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }

    INOUT MIR-EXCL-BODY-PART-3-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }


    INOUT MIR-EXCL-BODY-PART-4-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }


    INOUT MIR-EXCL-BODY-PART-5-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }


    INOUT MIR-EXCL-BODY-PART-6-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }


    INOUT MIR-EXCL-BODY-PART-7-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "REINS DECISION";
    }

    INOUT MIR-EXCL-BODY-PART-1-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 1";
    }


    INOUT MIR-EXCL-BODY-PART-2-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 2";
    }


    INOUT MIR-EXCL-BODY-PART-3-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 3";
    }


    INOUT MIR-EXCL-BODY-PART-4-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 4";
    }


    INOUT MIR-EXCL-BODY-PART-5-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 5";
    }


    INOUT MIR-EXCL-BODY-PART-6-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 6";
    }


    INOUT MIR-EXCL-BODY-PART-7-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "XCLUD";
          SType = "Selection";
          Label = "Parts of Body - 7";
    }
    INOUT MIR-DISABL-NOT-COVD-IND
    {
         Length = "01";
         DBTableName = "TUWFD";
         SType = "Indicator";
         Label = "Specific disability not covered";
    }


    INOUT MIR-REASN-1-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Reason Code -1";
    }


    INOUT MIR-REASN-2-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Reason Code -2";
    }


    INOUT MIR-REASN-3-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Reason Code -3";
    }


    INOUT MIR-REASN-4-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Reason Code -4";
    }


    INOUT MIR-REASN-5-CD
    {
          Length = "03";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Reason Code -5";
    }

    INOUT MIR-FRST-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-FRST-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-FRST-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }
    INOUT MIR-FRST-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-FRST-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-FRST-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-FRST-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-SEC-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-SEC-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-SEC-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-SEC-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-SEC-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-SEC-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-SEC-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-THRD-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-THRD-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-THRD-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-THRD-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-THRD-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-THRD-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-THRD-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-FRTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-FRTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-FRTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-FRTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-FRTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-FRTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-FRTH-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-FIFTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-FIFTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-FIFTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-FIFTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-FIFTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-FIFTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-FIFTH-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-SIXTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-SIXTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-SIXTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-SIXTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-SIXTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-SIXTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-SIXTH-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-SVNTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-SVNTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-SVNTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-SVNTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-SVNTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-SVNTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-SVNTH-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-EIGTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-EIGTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-EIGTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-EIGTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-EIGTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-EIGTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-EIGTH-ADDL-INFO-TXT
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-NINTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-NINTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-NINTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-NINTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-NINTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-NINTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-NINTH-ADDL-INFO-TXT
    {
          Length = "20";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-TENTH-DFCT-1-CD
    {
          Length = "07";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -1";
    }

    INOUT MIR-TENTH-DFCT-2-CD
    {
          Length = "06";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Defect Code -2";
    }

    INOUT MIR-TENTH-ELAPS-YRS-DUR
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Elapsed Years";
    }

    INOUT MIR-TENTH-SURGY-1-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -1";
    }

    INOUT MIR-TENTH-SURGY-2-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -2";
    }

    INOUT MIR-TENTH-SURGY-3-CD
    {
          Length = "02";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Surgery Code -3";
    }

    INOUT MIR-TENTH-ADDL-INFO-TXT
    {
          Length = "20";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Additional Info";
    }

    INOUT MIR-DV-UW-NM-T [20]
    {
          Length = "75";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "User";
    }

    INOUT MIR-CREAT-DT-T [20]
    {
          Length = "75";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Creation Day";
    }
    INOUT MIR-UW-COMNT-TXT-T [20]
    {
          Length = "200";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "UW Note";
    }

    INOUT MIR-DOCTOR-CMNT-TXT-T [20]
    {
          Length = "200";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "DR Commment";
    }


    INOUT MIR-PHYS-COND-TXT
    {
          Length = "400";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "Physical Conditions";
    }


    INOUT MIR-ADULT-DIS-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Adult Disease Rider";
    }

    INOUT MIR-FEM-DIS-HOSP-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Female Disease Hospitalization Rider";
    }

    INOUT MIR-INJURY-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Injury Rider";
    }

    INOUT MIR-ACCDNT-DTH-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Accidental Death Rider";
    }

    INOUT MIR-ACCDNT-HOSP-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Accidental Hospitaliztion Rider";
    }

    INOUT MIR-DIS-HOSP-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Disease Hospitalization Rider";
    }

    INOUT MIR-CTYP-HOSP-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "C Type Hospitalization Rider";
    }

    INOUT MIR-DSCHRG-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Discharge Disease Rider";
    }

    INOUT MIR-CANCER-REL-CVG-IND
    {
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Cancer Related Rider";
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
          Length = "200";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "UW Note";
    }

    INOUT MIR-DOCTOR-CMNT-TXT
    {
          Length = "200";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "DR Commment";
    }
    INOUT MIR-MNGR-DECID-INFO-CD
    {
          Length = "01";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "MNDEC";
          SType = "Selection";
          Label = "Manager's decision";
    }

    INOUT MIR-CASE-TYP-INFO-CD
    {
          Length = "01";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "CASE";
          SType = "Selection";
          Label = "Case Type ";
    }

    INOUT MIR-MNGR-COMNT-TXT
    {
          Length = "200";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "Manger's Comments";
    }

    INOUT MIR-MNGR-OTHR-INFO-TXT
    {
          DisplayOnly;
          Label = "Manger's Comments";
          Length = "60";
          SType = "TextArea";
    }
}

