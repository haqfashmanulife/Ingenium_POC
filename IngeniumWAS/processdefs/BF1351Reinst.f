# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1351Reinst.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  01AD25  BMB      Change flow to handle more than 20 coverages              *
#*                   Confirm button bar changed to contain the 'More' action   *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1351-I.s";
INCLUDE "BF1351-O.s";
INCLUDE "BF1351-P.p";

PROCESS BF1351Reinst
{

    # Set up the title strings. The names of the string table

    ProcessTitle = STRINGTABLE.IDS_TITLE_BF1351Process;
    Phase1Title = STRINGTABLE.IDS_TITLE_BF1351Phase1;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF1351Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF1351Phase3;
    Title = ProcessTitle;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    InitialState = "2";


    # The confirm flow has three phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD. 
    # The P performs different functions based on this value:
    #        P State
    #    1 = Get system options (not used in this case) 
    #    2 = Perform edits, generate informational messages
    #    3 = Update server
    # Determine if the process was invoked from a list.
    # If yes, skip directly to the P step.
    # Skip keyfields step for two step confirm:

    STEP DataInput-S
    {
        USES S-STEP "BF1351-I";
        Phase2Title -> Title;
    }


    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    MIR-DV-PRCES-STATE-CD = "2";

    # set start value for coverage display

    MIR-CVG-NUM = "01";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1351-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF1351-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK     for Cancel;
        # ACTION_CONFIRM  for Confirm;
        # ACTION_MORE     for More;

        "ButtonBarConfirmCancelMore" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # This action signifies the users request to view more coverages

    IF action == "ACTION_MORE"
        BRANCH PerformHostEdits-P;


    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }


    # If action is not Cancel or More, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHost-P
    {
        USES P-STEP "BF1351-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;


    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH DataInput-S;
}

