# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1690Attach.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems for pathfinder 1.2              *
#*******************************************************************************

INCLUDE "BF1690-I.s";
INCLUDE "BF1690Select-O.s";
INCLUDE "BF1690-O.s";
INCLUDE "BF1690-P.p";

PROCESS BF1690Attach
{
    Title = STRINGTABLE.IDS_TITLE_BF1690Attach;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF1690Phase3;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # starting point is based on lab record selected

    MIR-DV-PRCES-STATE-CD = "1";

    STEP RetrieveList
    {
        USES P-STEP "BF1690-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayList;


    Title = STRINGTABLE.IDS_TITLE_BF1690Attach;
    ButtonBar = "ButtonBarListsAttc";

    STEP DisplayList
    {
        USES S-STEP "BF1690Select-O";
    }


    # reset scroll indicator

    MIR-DV-BCKWRD-SCROLL-IND = "N";

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        EXIT;

    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        MIR-DV-BCKWRD-SCROLL-IND = "N";

        BRANCH RetrieveList;

    }

    # When scrolling back, RETURN-CD = 04 means the top of the list 
    # has been reached and scrolling should be stopped 

    IF action == "ACTION_PREVIOUS"
    {
        IF MIR-RETRN-CD != "04"
        {
            MIR-CLI-ID = MIR-CLI-ID-T[1];
            MIR-DV-BCKWRD-SCROLL-IND = "Y";

            BRANCH RetrieveList;

        }
        IF MIR-RETRN-CD == "04"
            BRANCH DisplayList;


    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        EXIT;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-CLI-ID = MIR-CLI-ID-T[index];

    # Store the client ID for the confirm step

    FLOW-CLI-ID = MIR-CLI-ID-T[index];
    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1690-P";
        MIR-CLI-ID -> MIR-CLI-ID;
        MIR-CLI-LTST-SUR-NM -> MIR-CLI-LTST-SUR-NM;
        MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayList;


    # check the MIR return code
    # if it's '3', a confirm step is required
    # otherwise, the attach is complete  

    IF MIR-RETRN-CD == "03"
        BRANCH Confirm-S;


    ButtonBar = "ButtonBarOKCancel";

    EXIT;

    STEP Confirm-S
    {
        USES S-STEP "BF1690-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        #	ACTION_BACK for Cancel;
        #	ACTION_CONFIRM   for Confirm;

        FLOW-CLI-ID -> MIR-CLI-ID;
        "ButtonBarConfirmCancel" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        MIR-DV-PRCES-STATE-CD = "1";

        BRANCH DisplayList;

    }


    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host	

    STEP UpdateHost-P
    {
        USES P-STEP "BF1690-P";
        FLOW-CLI-ID -> MIR-CLI-ID;
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;


    ButtonBar = "ButtonBarOK";
}

