# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0636Psramt.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MP4FB1  H.L      Change to support firm banking                            *
#*  U40018  BP       Only Show Firm Banking When Payout Method is Firm Banking *
#*  M142F2  CTS      CHANGES TO SUPPORT SURVIVORSHIP BENEFIT PROCESSING        *
#*******************************************************************************

INCLUDE "BF0636CliData-I.s";
INCLUDE "BF0636Data-I.s";
INCLUDE "BF0636Change-I.s";
INCLUDE "BF0636-O.s";
INCLUDE "BF0636-P.p";

PROCESS BF0636Psramt
{
    Title = STRINGTABLE.IDS_TITLE_BF0636Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # The confirm flow has three phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD. 
    # The P performs different functions based on this value:
    #        P State
    #    1 = Get system options
    #    2 = Perform edits, generate informational messages
    #    3 = Update server
    #    4 = Change limited number of fields (not the same fields as on the original input pages)

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";
    MIR-DV-WTHDR-TYP-CD = "RW";
    MIR-DV-SRVBEN-TYP-CD = " ";

    STEP KeyFields-S
    {
        USES S-STEP "BF0636Data-I";
        STRINGTABLE.IDS_TITLE_BF0636Phase1 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;


    MIR-DV-PRCES-STATE-CD = "1";

    STEP GetInitialHostData-P
    {
        USES P-STEP "BF0636-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;

    # If the Payout Method is Firm Banking then we will bypass       
    # the screen where Firm Banking Info is input.              

    IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
        BRANCH Confirm-S;


    STEP DataInput-S
    {
        USES S-STEP "BF0636CliData-I";
        STRINGTABLE.IDS_TITLE_BF0636Phase2 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hits Cancel, return to menu if this is the first screen.
    # Otherwise, return to the key input screen.
    # If the user came from a list, return to the list

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            IF InitialState == "2"
                EXIT;
            ELSE
            {
                MESSAGES-T[0] = "";
                BRANCH KeyFields-S;
            }
        }
        ELSE
            EXIT;
    }

    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF0636-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    # For Firm Banking there is an extra input screen (DataInput-S) and
    # the Confirm screen will have a Back Button which isn't in the 
    # regular flow.                                                 

    STEP ConfirmFB-S
    {
        USES S-STEP "BF0636-O";

        # The "ButtonBarConfirmBack" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;
        # ACTION_PREVIOUS   for Back;

        "ButtonBarConfirmBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0636Phase3 -> Title;
    }

    IF action == "ACTION_CONFIRM"
    {
        DataWasChanged = "FALSE";
        BRANCH UpdateHostFB-P;
    }

    # If the user came from a list, return to the list 
    # if the initial state = 2, otherwise return to the 
    # DataInput page.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            MESSAGES-T[0] = "";
            BRANCH KeyFields-S;
        }
        ELSE
        {
            IF InitialState == "1"
                BRANCH KeyFields-S;
            ELSE
                EXIT;
        }
    }

    # If the user selects Back on the Confirm page, return to the DataInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput-S;
    }

    # The user has neither confirmed nor aborted the transaction -
    # assume "CHANGE" and redo the input, edit and confirm phases.
    # First, the messages are blanked out so that extraneous messages
    # are not carried forward to the change step.

    MESSAGES-T[0] = "";
    BRANCH Change-S;


    # If it is not Firm Banking then we don't have a Back Button on    
    # the Confirm screen.                                             

    STEP Confirm-S
    {
        USES S-STEP "BF0636-O";

        # The "ButtonBarConfirm" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirm" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0636Phase3 -> Title;
    }

    IF action == "ACTION_CONFIRM"
    {
        DataWasChanged = "FALSE";
        BRANCH UpdateHost-P;
    }

    # If the user came from a list, return to the list 
    # if the initial state = 2, otherwise return to the 
    # DataInput page.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            MESSAGES-T[0] = "";
            BRANCH KeyFields-S;
        }
        ELSE
        {
            IF InitialState == "1"
                BRANCH KeyFields-S;
            ELSE
                EXIT;
        }
    }

    # The user has neither confirmed nor aborted the transaction -
    # assume "CHANGE" and redo the input, edit and confirm phases.
    # First, the messages are blanked out so that extraneous messages
    # are not carried forward to the change step.

    MESSAGES-T[0] = "";

    STEP Change-S
    {
        USES S-STEP "BF0636Change-I";
        "ButtonBarOK" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0636Change -> Title;
    }


    STEP PerformHostEditsOnChange-P
    {
        USES P-STEP "BF0636-P";
        "4" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Change-S;

    # Again if the Payout Method is Firm Banking then we need to           
    # use a Confirm Screen without a Back Button.              

    IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
        BRANCH ConfirmAfterChange-S;


    STEP ConfirmAfterChangeFB-S
    {
        USES S-STEP "BF0636-O";

        # The "ButtonBarConfirmBack" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;
        # ACTION_PREVIOUS   for Back;

        "ButtonBarConfirmBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0636Phase3 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH KeyFields-S;
    }

    # If the user selects Back on the Confirm page, return to the DataInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput-S;
    }

    IF action == "ACTION_CHANGE"
        BRANCH Change-S;

    # We want to know where we should return if the updateHost call fails.  If
    # DataWasChanged is TRUE then we'll return to the ConfirmAfterChange-S

    DataWasChanged = "TRUE";


    # User confirmed the changes, update the host 

    STEP UpdateHostFB-P
    {
        USES P-STEP "BF0636-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {

        # If the user went through the change flow, then we go back to a different
        # S screen.

        IF DataWasChanged == "TRUE"
            BRANCH ConfirmAfterChangeFB-S;


        BRANCH ConfirmFB-S;

    }

    BRANCH KeyFields-S;


    STEP ConfirmAfterChange-S
    {
        USES S-STEP "BF0636-O";

        # The "ButtonBarConfirm" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirm" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0636Phase3 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH KeyFields-S;
    }

    IF action == "ACTION_CHANGE"
        BRANCH Change-S;

    # We want to know where we should return if the updateHost call fails.  If
    # DataWasChanged is TRUE then we'll return to the ConfirmAfterChange-S

    DataWasChanged = "TRUE";


    # User confirmed the changes, update the host 

    STEP UpdateHost-P
    {
        USES P-STEP "BF0636-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {

        # If the user went through the change flow, then we go back to a different
        # S screen.

        IF DataWasChanged == "TRUE"
            BRANCH ConfirmAfterChange-S;


        BRANCH Confirm-S;

    }

    BRANCH KeyFields-S;

}

