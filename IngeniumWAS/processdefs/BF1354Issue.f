# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1354Issue.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup - chg Ok to OK in buttonbar assignment       *
#*  01AD25  BMB      Change flow to handle more than 20 coverages              *
#*                   Confirm button bar changed to contain the 'More' action   *
#*******************************************************************************
# This is a process that will implement the PPRO-ISSUE process where the process may require
# a second verify step if the insured age changes.
# In this process, when the user is verifiying he/she has the option to
# Confirm or Cancel. 

INCLUDE "BF1354-I.s";
INCLUDE "BF1354-P.p";
INCLUDE "BF1354-O.s";

PROCESS BF1354Issue
{

    # Set up the title strings. 

    ProcessTitle = STRINGTABLE.IDS_TITLE_BF1354Process;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF1354Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF1354Phase3;
    Phase4Title = STRINGTABLE.IDS_TITLE_BF1354Phase4;

    # Set the names of the S and P steps to be used

    Title = ProcessTitle;
    TitleBar = "TitleBar";
    TitleBarSize = "120";
    ButtonBar = "ButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # This flow has three phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD. 
    # The P performs different functions based on this value:
    #        P State
    #    2 = Perform edits, generate informational messages
    #    3 = Update server
    #    4 = Update server again when age has changed
    # PPRO starts with Phase 2.

    InitialState = "2";
    MIR-DV-AUTO-SETL-CD = "S";

    STEP DataInput-S
    {
        USES S-STEP "BF1354-I";
        "ButtonBarOKCancel" -> ButtonBar;
        Phase2Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to menu.

    IF action == "ACTION_BACK"
        EXIT;



    # Set the process state code to indicate this is edit stage 

    MIR-DV-PRCES-STATE-CD = "2";

    # set start value for coverage display

    MIR-CVG-NUM = "01";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1354-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF1354-O";

        # Changes due to SAD25 - display more than 25 coverages
        # The "ButtonBarConfirmCancelMore" buttonbar returns:
        # ACTION_CANCEL for Cancel;
        # ACTION_CONFIRM   for Confirm;
        # ACTION_MORE   for More;
        # ACTION_NEXT   for More;

        "ButtonBarConfirmCancelMore" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # This action signifies the users request to view more coverages 

    IF action == "ACTION_MORE"
        BRANCH PerformHostEdits-P;

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }


    # If action is not Cancel or More, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHost-P
    {
        USES P-STEP "BF1354-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH Confirm-S;


    # If the UpdateHost step caused the issue age to change, PRCES-STATE-CD will
    # returned as a 4 to indicate that another confirm step is required. 
    # Otherwise the transaction  is complete.

    IF MIR-RETRN-CD != "03"
    {
        MIR-POL-ID-BASE = "";
        MIR-POL-ID-SFX = "";
        MIR-POL-ISS-EFF-DT = "";
        MIR-DV-AUTO-SETL-CD = "S";
        MIR-POL-ISS-DT-TYP-CD = "";

        BRANCH DataInput-S;

    }

    STEP ConfirmAgeChange-S
    {
        USES S-STEP "BF1354-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_CANCEL for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        Phase4Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }


    # If action is not Cancel, it is assumed that the User is confirming
    # the age change; update the host 

    STEP UpdateHostAgain-P
    {
        USES P-STEP "BF1354-P";
        "4" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmAgeChange-S;



    # At this point the transaction is complete,
    # blank out input fields and
    # return to the DataInput page with host messages.

    MIR-POL-ID-BASE = "";
    MIR-POL-ID-SFX = "";
    MIR-POL-ISS-EFF-DT = "";
    MIR-DV-AUTO-SETL-CD = "S";
    MIR-POL-ISS-DT-TYP-CD = "";

    BRANCH DataInput-S;
}

