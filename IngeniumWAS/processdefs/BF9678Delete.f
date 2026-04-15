# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9678Delete.f                                                *
#*  Description: Client Moral Risk Table (CLIM) Delete function                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9675Retrieve-P.p";
INCLUDE "BF9675Retrieve-I.s";
INCLUDE "BF9675Retrieve-O.s";
INCLUDE "BF9678Delete-P.p";

PROCESS BF9678Delete
{

    # ENSURE MESSAGES ARE RECEIVED FROM PREVIOUS STEPS
    # ENSURE MESSAGES ARE SENT TO OTHER STEPS
    # First Button Bar Seen on the Screen

    Title = STRINGTABLE.IDS_TITLE_BF9678Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip STEP Input if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH RetrieveSetUp;


    STEP Input
    {
        USES S-STEP "BF9675Retrieve-I";

        # Enter the key(s) for the value that you'd like to create

    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;


    # Return to STEP Input if changing Language

    RetrieveSetUp:

    MIR-FTXT-TEXT-KEY = MIR-CLI-ID;
    MIR-FTXT-TEXT-TYP-CD = "MR";
    MIR-FTXT-TEXT-SEQ-NBR = "0001";

    STEP Retrieve
    {
        USES P-STEP "BF9675Retrieve-P";

        # Retrieve the record 

    }


    # Return to STEP Input if a CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # New Button Bar for STEP Confirm

    ButtonBar = "ButtonBarDeleteCancel";

    STEP Confirm
    {
        USES S-STEP "BF9675Retrieve-O";

        # Display the key and ask for confirmation

    }


    # Actions to Take if Confirm Cancelled

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to STEP Input
            # Reset Button Bar to OK and CANCEL

            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }
        ELSE

            # If originating from list, Exit Delete Process

            EXIT;


    }

    # Return to STEP Confirm if changing Language

    STEP Delete
    {
        USES P-STEP "BF9678Delete-P";

        # Delete the record

    }


    # Return to STEP Confirm if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;

}

