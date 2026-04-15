# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCH-Update.f                                                *
#*  Description: Cloned from CH-Update.f                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Interviewer's Report                          *
#*  B00173  BMB      Fields 046, 047, 048 are now radio selections 1 - 6 with  *
#*                   6 as the default value meaning unanswered                 *  
#*  B00148  BMB      for update, add SheetID 1 (MIR-FLD-ID-071) value = 20031  *
#*  01NB01  GW       New App Entry Flow                                        *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD 4 NEW HANDWRITTEN NOTES AND INCOMPLETE CHECKBOXES -   *
#*                   MIR-DV-QSTN-RESP-TXT-077 TO MIR-DV-QSTN-RESP-TXT-080      *
#*  NWLUWF  CTS      Changes for U/W forms revision                            *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS                            * 
#*******************************************************************************

INCLUDE "BF1390-P.p";
INCLUDE "BF1392-CH-I.s";
INCLUDE "BF1390-CH-O.s";
INCLUDE "BF1392-P.p";

PROCESS AppCH-Update
{
	VARIABLES
	{
	    OUT LastAction;
	}
    Title = STRINGTABLE.IDS_TITLE_CH-Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # The key(s) passed for the value that you'd like to create
    # Retrieve the record

    STEP Retrieve
    {
        USES P-STEP "BF1390-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    STEP Edit
    {
        USES S-STEP "BF1392-CH-I";
    }

    returnToEdit = "FALSE";


    # If user selects Cancel then exit flow;

    IF action == "ACTION_BACK"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;

    IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
        MIR-DV-QSTN-RESP-TXT-002 = "*";

    IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
        MIR-DV-QSTN-RESP-TXT-003 = "*";

    IF MIR-DV-QSTN-RESP-TXT-004 != "N" && MIR-DV-QSTN-RESP-TXT-004 != "Y"
        MIR-DV-QSTN-RESP-TXT-004 = "*";

    IF MIR-DV-QSTN-RESP-TXT-005 != "N" && MIR-DV-QSTN-RESP-TXT-005 != "Y"
        MIR-DV-QSTN-RESP-TXT-005 = "*";

    IF MIR-DV-QSTN-RESP-TXT-006 != "N" && MIR-DV-QSTN-RESP-TXT-006 != "Y"
        MIR-DV-QSTN-RESP-TXT-006 = "*";

    IF MIR-DV-QSTN-RESP-TXT-007 != "N" && MIR-DV-QSTN-RESP-TXT-007 != "Y"
        MIR-DV-QSTN-RESP-TXT-007 = "*";

    IF MIR-DV-QSTN-RESP-TXT-008 != "N" && MIR-DV-QSTN-RESP-TXT-008 != "Y"
        MIR-DV-QSTN-RESP-TXT-008 = "*";

    IF MIR-DV-QSTN-RESP-TXT-009 != "N" && MIR-DV-QSTN-RESP-TXT-009 != "Y"
        MIR-DV-QSTN-RESP-TXT-009 = "*";

    IF MIR-DV-QSTN-RESP-TXT-010 != "N" && MIR-DV-QSTN-RESP-TXT-010 != "Y"
        MIR-DV-QSTN-RESP-TXT-010 = "*";

    IF MIR-DV-QSTN-RESP-TXT-011 != "N" && MIR-DV-QSTN-RESP-TXT-011 != "Y"
        MIR-DV-QSTN-RESP-TXT-011 = "*";

    IF MIR-DV-QSTN-RESP-TXT-012 != "N" && MIR-DV-QSTN-RESP-TXT-012 != "Y"
        MIR-DV-QSTN-RESP-TXT-012 = "*";

    IF MIR-DV-QSTN-RESP-TXT-013 != "N" && MIR-DV-QSTN-RESP-TXT-013 != "Y"
        MIR-DV-QSTN-RESP-TXT-013 = "*";

    IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
        MIR-DV-QSTN-RESP-TXT-014 = "*";

    IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
        MIR-DV-QSTN-RESP-TXT-015 = "*";

    IF MIR-DV-QSTN-RESP-TXT-016 != "N" && MIR-DV-QSTN-RESP-TXT-016 != "Y"
        MIR-DV-QSTN-RESP-TXT-016 = "*";

    IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
        MIR-DV-QSTN-RESP-TXT-017 = "*";

    IF MIR-DV-QSTN-RESP-TXT-018 != "N" && MIR-DV-QSTN-RESP-TXT-018 != "Y"
        MIR-DV-QSTN-RESP-TXT-018 = "*";

    IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"
        MIR-DV-QSTN-RESP-TXT-019 = "*";

    IF MIR-DV-QSTN-RESP-TXT-020 != "N" && MIR-DV-QSTN-RESP-TXT-020 != "Y"
        MIR-DV-QSTN-RESP-TXT-020 = "*";

    IF MIR-DV-QSTN-RESP-TXT-021 != "N" && MIR-DV-QSTN-RESP-TXT-021 != "Y"
        MIR-DV-QSTN-RESP-TXT-021 = "*";

    IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
        MIR-DV-QSTN-RESP-TXT-024 = "*";

    IF MIR-DV-QSTN-RESP-TXT-041 != "N" && MIR-DV-QSTN-RESP-TXT-041 != "Y"
        MIR-DV-QSTN-RESP-TXT-041 = "*";

    IF MIR-DV-QSTN-RESP-TXT-045 != "N" && MIR-DV-QSTN-RESP-TXT-045 != "Y"
        MIR-DV-QSTN-RESP-TXT-045 = "*";

    IF MIR-DV-QSTN-RESP-TXT-058 != "N" && MIR-DV-QSTN-RESP-TXT-058 != "Y"
        MIR-DV-QSTN-RESP-TXT-058 = "*";

    IF MIR-DV-QSTN-RESP-TXT-060 != "N" && MIR-DV-QSTN-RESP-TXT-060 != "Y"
        MIR-DV-QSTN-RESP-TXT-060 = "*";

    IF MIR-DV-QSTN-RESP-TXT-061 != "N" && MIR-DV-QSTN-RESP-TXT-061 != "Y"
        MIR-DV-QSTN-RESP-TXT-061 = "*";

    IF MIR-DV-QSTN-RESP-TXT-062 != "N" && MIR-DV-QSTN-RESP-TXT-062 != "Y"
        MIR-DV-QSTN-RESP-TXT-062 = "*";

    IF MIR-DV-QSTN-RESP-TXT-063 != "N" && MIR-DV-QSTN-RESP-TXT-063 != "Y"
        MIR-DV-QSTN-RESP-TXT-063 = "*";

    IF MIR-DV-QSTN-RESP-TXT-067 != "N" && MIR-DV-QSTN-RESP-TXT-067 != "Y"
        MIR-DV-QSTN-RESP-TXT-067 = "*";

    IF MIR-DV-QSTN-RESP-TXT-068 != "N" && MIR-DV-QSTN-RESP-TXT-068 != "Y"
        MIR-DV-QSTN-RESP-TXT-068 = "*";

    IF MIR-DV-QSTN-RESP-TXT-046 != "1" && MIR-DV-QSTN-RESP-TXT-046 != "2" && MIR-DV-QSTN-RESP-TXT-046 != "3" && MIR-DV-QSTN-RESP-TXT-046 != "4" && MIR-DV-QSTN-RESP-TXT-046 != "5"
        MIR-DV-QSTN-RESP-TXT-046 = "6";

    IF MIR-DV-QSTN-RESP-TXT-047 != "1" && MIR-DV-QSTN-RESP-TXT-047 != "2" && MIR-DV-QSTN-RESP-TXT-047 != "3" && MIR-DV-QSTN-RESP-TXT-047 != "4" && MIR-DV-QSTN-RESP-TXT-047 != "5"
        MIR-DV-QSTN-RESP-TXT-047 = "6";

    IF MIR-DV-QSTN-RESP-TXT-077 != "N" && MIR-DV-QSTN-RESP-TXT-077 != "Y"
        MIR-DV-QSTN-RESP-TXT-077 = "*";

    IF MIR-DV-QSTN-RESP-TXT-078 != "N" && MIR-DV-QSTN-RESP-TXT-078 != "Y"
        MIR-DV-QSTN-RESP-TXT-078 = "*";

    IF MIR-DV-QSTN-RESP-TXT-079 != "N" && MIR-DV-QSTN-RESP-TXT-079 != "Y"
        MIR-DV-QSTN-RESP-TXT-079 = "*";

    IF MIR-DV-QSTN-RESP-TXT-080 != "N" && MIR-DV-QSTN-RESP-TXT-080 != "Y"
        MIR-DV-QSTN-RESP-TXT-080 = "*";

    # NWLUWF changes begin
    IF MIR-DV-QSTN-RESP-TXT-082 != "N" && MIR-DV-QSTN-RESP-TXT-082 != "Y"
        MIR-DV-QSTN-RESP-TXT-082 = "*";

    IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"
        MIR-DV-QSTN-RESP-TXT-083 = "*";
    #NWLUWF changes end        

    # ATF008 CHANGES BEGIN
    
    IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"
        MIR-DV-QSTN-RESP-TXT-084 = "*";

    # ATF008 CHANGES ENDS


    STEP Update
    {
        USES P-STEP "BF1392-P";
        "20031" -> MIR-DV-QSTN-RESP-TXT-071;
    }


    # Display the output of the update process

    STEP Display
    {
        USES S-STEP "BF1390-CH-O";
    }


    # If user selects OK then exit flow;

    IF action == "ACTION_BACK"
        BRANCH Retrieve;

    IF action == "ACTION_NEXT"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_REFRESH"
        BRANCH Retrieve;

}

