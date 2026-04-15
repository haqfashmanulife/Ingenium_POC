# Converted from PathFinder 2.2 to 3.0 on May 28, 2008 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9557Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Author Description                                        *
#*  FEID11  28MAY08 CTS   Issue Reversal for policy                            *
#*******************************************************************************


INCLUDE "BF9557-I.s";
INCLUDE "BF9557-P.p";
INCLUDE "BF9557-O.s";

PROCESS BF9557Reversal
{

    # Set up the title strings.

    ProcessTitle = STRINGTABLE.IDS_TITLE_BF9557Process;
    Phase2Title  = STRINGTABLE.IDS_TITLE_BF9557Phase2;
    Phase3Title  = STRINGTABLE.IDS_TITLE_BF9557Phase3;

    # Set the names of the S and P steps to be used

    Title = ProcessTitle;
    TitleBar = "TitleBar";
    TitleBarSize = "120";
    ButtonBar = "ButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # This flow has two phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD.
    # The P performs different functions based on this value:
    #        P State
    #    2 = Retrieve information, generate informational messages
    #    3 = Confirmation screen
    # PPRO starts with Phase 2.

            
    STEP DataInput-S
    {
        USES S-STEP "BF9557-I";
        "ButtonBarOKCancel" -> ButtonBar;
        Phase2Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to menu.

    IF action == "ACTION_BACK"
        EXIT;
    
    # Set the process state code
    
    MIR-DV-PRCES-STATE-CD = "2";

    # set start value for coverage display
    MIR-CVG-NUM = "01";
    
    STEP Retrieve-P
    {
        USES P-STEP "BF9557-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF9557-O";

        # The "ButtonBarConfirmCancelMore" buttonbar returns:
        # ACTION_CANCEL for Cancel;
        # ACTION_CONFIRM   for Confirm;
        # ACTION_MORE   for More;

        "ButtonBarConfirmCancelMore" -> ButtonBar;
        Phase3Title -> Title;
    }


    # This action signifies the users request to view more coverages

    IF action == "ACTION_MORE"
        BRANCH Retrieve-P;

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }


    # If action is not Cancel or More, it is assumed that the User is confirming
    # the changes; update the host

    STEP ReverseHost-P
    {
        USES P-STEP "BF9557-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;


    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }

    # At this point the transaction is complete,
    # blank out input fields and
    # return to the DataInput page with host messages.

    MIR-POL-ID-BASE = "";
    MIR-POL-ID-SFX = "";
    
    BRANCH DataInput-S;
}

