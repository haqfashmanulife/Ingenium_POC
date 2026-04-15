# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:40 PM EDT

#*******************************************************************************
#*  Component:   BF1390-SD-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00131  BMB      Correct decimal fields                                    *
#*  B00172  BMB      Add parent or guardian question to forms - MIR-FLD-ID-070 *
#*  B00514  SRO      Change #26 & #27 (height & weight) to remove decimals     *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD HANDWRITTEN NOTES AND INCOMPLETE CHECKBOX -           *
#*                   MIR-DV-QSTN-RESP-TXT-81                                   *
#*  NWLUWF  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  C17785  CTS      CHANGES FOR MP171 DISEASE INFORMATION                     *
#*  MP253F  CTS      CHANGES DONE FOR ULE-2 U/W FORMS REVISION                 * 
#*******************************************************************************

S-STEP BF1390-SD-O
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

    IN MIR-DV-QSTN-RESP-TXT-001
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-002
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-003
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-004
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-005
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-006
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-007
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-008
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-009
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-010
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-011
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-012
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-013
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-014
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-015
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-016
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-017
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-018
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-019
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-020
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-021
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-022
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-023
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-024
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-025
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-026
    {
        DisplayOnly;
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-027
    {
        DisplayOnly;
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-057
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-070
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
     
    IN MIR-DV-QSTN-RESP-TXT-075
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
     
    IN MIR-DV-QSTN-RESP-TXT-081
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
    
    #NWLUWF CHANGES START.
    IN MIR-DV-QSTN-RESP-TXT-082
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-083
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #NWLUWF CHANGES END 
    
    #ATF008- CHNAGES STARTS
    IN MIR-DV-QSTN-RESP-TXT-084
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #ATF008- CHANGES ENDS
    
    #MP253F- CHNAGES STARTS
    IN MIR-DV-QSTN-RESP-TXT-107
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-108
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    
    #MP253F- CHANGES ENDS    
    
    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
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
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
# C17785 chagnes start here.
    IN MIR-CORCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Correction Indicator";
    }
    IN MIR-1-DISEASE-CD
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Disease Code";
    }
    IN MIR-1-CRNT-STAT-CD
    {
	DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    IN MIR-1-OUTP-STRT-DT
    {
	DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "outpatient Start Date";
    }
    IN MIR-1-OUTP-END-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "outpatient End Date";
    }
    IN MIR-1-OUTP-DY-DUR
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of INpatient days";
    }
    IN MIR-1-TRTMNT-INFO-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    IN MIR-1-DRUG-STAT-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    IN MIR-1-DRUG-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    IN MIR-1-HOSP-STRT-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    IN MIR-1-HOSP-DY-DUR
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    IN MIR-1-SURGY-TYP-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    IN MIR-1-SURGY-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    IN MIR-1-BODY-PART-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Body part code";
    }
    IN MIR-1-SURGY-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    IN MIR-1-LAST-EXAM-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    IN MIR-1-HOSP-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    IN MIR-1-FULL-RECOV-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    IN MIR-1-TRTMNT-SPND-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    IN MIR-1-COMNT-TXT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    IN MIR-1-MAX-BLOOD-PRES-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Maximal blood pressure";
    }
    IN MIR-1-MIN-BLOOD-PRES-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Minimal blood pressure";
    }
    IN MIR-1-URIC-ACID-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Uric acid value";
    }
    IN MIR-1-TOT-CHLSTRL-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Value of total cholesterol";
    }
    IN MIR-1-NEUTRAL-FAT-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Neutral fat";
    }
    IN MIR-1-LDL-RNG-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "LDL range";
    }
    IN MIR-1-HDL-RNG-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "HDL range";
    }
    IN MIR-2-DISEASE-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Code";
    }
    IN MIR-2-CRNT-STAT-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    IN MIR-2-OUTP-STRT-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "outpatient Start Date";
    }
    IN MIR-2-OUTP-END-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "outpatient End Date";
    }
    IN MIR-2-OUTP-DY-DUR
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of INpatient days";
    }
    IN MIR-2-TRTMNT-INFO-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    IN MIR-2-DRUG-STAT-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    IN MIR-2-DRUG-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    IN MIR-2-HOSP-STRT-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    IN MIR-2-HOSP-DY-DUR
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    IN MIR-2-SURGY-TYP-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    IN MIR-2-SURGY-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    IN MIR-2-BODY-PART-CD
    {
        DisplayOnly;
	    Length = "10";
	    DBTableName = "TAPPD";
	    SType = "Text";
	    Label = "Body part code";
    }
    IN MIR-2-SURGY-YR
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    IN MIR-2-LAST-EXAM-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    IN MIR-2-HOSP-CD
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    IN MIR-2-FULL-RECOV-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    IN MIR-2-TRTMNT-SPND-DT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    IN MIR-2-COMNT-TXT
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    IN MIR-2-MAX-BLOOD-PRES-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Maximal blood pressure";
    }
    IN MIR-2-MIN-BLOOD-PRES-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Minimal blood pressure";
    }
    IN MIR-2-URIC-ACID-NUM
	{
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Uric acid value";
    }
    IN MIR-2-TOT-CHLSTRL-NUM
	{
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Value of total cholesterol";
    }
    IN MIR-2-NEUTRAL-FAT-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Neutral fat";
    }
    IN MIR-2-LDL-RNG-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "LDL range";
    }
    IN MIR-2-HDL-RNG-NUM
    {
        DisplayOnly;
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "HDL range";
    }
#C17785 changes end here

}

