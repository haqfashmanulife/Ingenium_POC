# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2120Billchg.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2120Key-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2120Data-I.s";
INCLUDE "BF2120-P.p";
INCLUDE "BF2120-O.s";

PROCESS BF2120Billchg
{

    # Set up the title strings. 

    ProcessTitle = STRINGTABLE.IDS_TITLE_BF2120Process;
    Phase1Title = STRINGTABLE.IDS_TITLE_BF2120Phase1;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF2120Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF2120Phase3;
    FinalTitle = STRINGTABLE.IDS_TITLE_BF2120Final;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2120Key-I";
        Phase1Title -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2120-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsChg";

    STEP DisplayList
    {
        USES S-STEP "BF2120Data-I";
        Phase2Title -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    STEP ChangeEdits
    {
        USES P-STEP "BF2120-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayList;


    STEP Confirm-S
    {
        USES S-STEP "BF2120-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        #	ACTION_CANCEL for Cancel;
        #	ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DisplayList;

    }


    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host	

    STEP UpdateHost-P
    {
        USES P-STEP "BF2120-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;


    STEP Output-S
    {
        USES S-STEP "BF2120-O";
        "ButtonBarOK" -> ButtonBar;
        FinalTitle -> Title;
    }
}

