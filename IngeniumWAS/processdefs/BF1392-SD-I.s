# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:40 PM EDT


#*******************************************************************************
#*  Component:   BF1392-SD-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Self Disclosure Form                          *
#*  B00131  BMB      Correct decimal fields                                    *
#*  B00172  BMB      Add parent or guardian question to forms - MIR-FLD-ID-070 *
#*  B00514  SRO      Change #26 & #27 (height & weight) to remove decimals     *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD HANDWRITTEN NOTES AND INCOMPLETE CHECKBOX -           *
#*                   MIR-DV-QSTN-RESP-TXT-081                                  *
#*  NWLUWF  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  C17785  CTS      CHANGES FOR MP171 DISEASE INFORMATION                     *
#*  MP253F  CTS      CHANGES DONE FOR ULE U/W FORMS REVISION                   *
#*******************************************************************************

S-STEP BF1392-SD-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-DV-QSTN-RESP-TXT-001";
        FocusFrame = "ContentFrame";
    }

    IN FocusField
    {
        SType = "Hidden";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    OUT QuestionText
    {
        SType = "Hidden";
    }

    INOUT PageFocus
    {
        SType = "Hidden";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-001
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-002
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-003
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-004
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-005
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-006
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-007
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-008
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-009
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-010
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-011
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-012
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-013
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-014
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-015
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-016
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-017
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-018
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-019
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-020
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-021
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-022
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-023
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-024
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-025
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-026
    {
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-027
    {
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-057
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-070
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-075
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-081
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
   
    #NWLUWF CHANGES START.
    INOUT MIR-DV-QSTN-RESP-TXT-082
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-083
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #NWLUWF CHANGES END.
    
    #ATF008- CHNAGES STARTS
    INOUT MIR-DV-QSTN-RESP-TXT-084
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #ATF008- CHANGES ENDS
    
    #MP253F- CHNAGES STARTS
    INOUT MIR-DV-QSTN-RESP-TXT-107
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    INOUT MIR-DV-QSTN-RESP-TXT-108
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    
    #MP253F- ENDS STARTS

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
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

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Date of Birth";
    }

    IN MIR-STCKR-ID
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Insured Sticker Number";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
#C17785 changes start here
    INOUT MIR-CORCT-IND
    {
        Length = "1";
	DBTableName = "TAPPV";
	SType = "Indicator";
        Label = "Correction Indicator";
    }
    INOUT MIR-1-DISEASE-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Code";
    }
    INOUT MIR-1-CRNT-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    INOUT MIR-1-OUTP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient Start Date";
    }
    INOUT MIR-1-OUTP-END-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient End Date";
    }
    INOUT MIR-1-OUTP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of outpatient days";
    }
    INOUT MIR-1-TRTMNT-INFO-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    INOUT MIR-1-DRUG-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    INOUT MIR-1-DRUG-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    INOUT MIR-1-HOSP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    INOUT MIR-1-HOSP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    INOUT MIR-1-SURGY-TYP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    INOUT MIR-1-SURGY-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    INOUT MIR-1-BODY-PART-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Body part code";
    }
    INOUT MIR-1-SURGY-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    INOUT MIR-1-LAST-EXAM-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    INOUT MIR-1-HOSP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    INOUT MIR-1-FULL-RECOV-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    INOUT MIR-1-TRTMNT-SPND-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    INOUT MIR-1-COMNT-TXT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    INOUT MIR-1-MAX-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Maximal blood pressure";
    }
    INOUT MIR-1-MIN-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Minimal blood pressure";
    }
    INOUT MIR-1-URIC-ACID-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Uric acid value";
    }
    INOUT MIR-1-TOT-CHLSTRL-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Value of total cholesterol";
    }
    INOUT MIR-1-NEUTRAL-FAT-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Neutral fat";
    }
    INOUT MIR-1-LDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "LDL range";
    }
    INOUT MIR-1-HDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "HDL range";
    }
    INOUT MIR-2-DISEASE-CD 
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Code";
    }
    INOUT MIR-2-CRNT-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    INOUT MIR-2-OUTP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient Start Date";
    }
    INOUT MIR-2-OUTP-END-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient End Date";
    }
    INOUT MIR-2-OUTP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of outpatient days";
    }
    INOUT MIR-2-TRTMNT-INFO-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    INOUT MIR-2-DRUG-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    INOUT MIR-2-DRUG-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    INOUT MIR-2-HOSP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    INOUT MIR-2-HOSP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    INOUT MIR-2-SURGY-TYP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    INOUT MIR-2-SURGY-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    INOUT MIR-2-BODY-PART-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Body part code";
    }
    INOUT MIR-2-SURGY-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    INOUT MIR-2-LAST-EXAM-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    INOUT MIR-2-HOSP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    INOUT MIR-2-FULL-RECOV-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    INOUT MIR-2-TRTMNT-SPND-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    INOUT MIR-2-COMNT-TXT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    INOUT MIR-2-MAX-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Maximal blood pressure";
    }
    INOUT MIR-2-MIN-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Minimal blood pressure";
    }
    INOUT MIR-2-URIC-ACID-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Uric acid value";
    }
    INOUT MIR-2-TOT-CHLSTRL-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Value of total cholesterol";
    }
    INOUT MIR-2-NEUTRAL-FAT-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "Neutral fat";
    }
    INOUT MIR-2-LDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "LDL range";
    }
    INOUT MIR-2-HDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Number";
	Label = "HDL range";
    }
#C17785 changes end.

}

