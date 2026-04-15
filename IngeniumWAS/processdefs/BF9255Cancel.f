# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9255Cancel.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   CANCELY MASTER CLAIM  (HCL104A)                           *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9250-I.s";
INCLUDE "BF9250-O.s";
INCLUDE "BF9250-P.p";
INCLUDE "BF9255-P.p";

PROCESS BF9255Cancel
{

    # First Button Bar Seen on the Screen

    Title = STRINGTABLE.IDS_TITLE_BF9255Cancel;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
        USES S-STEP "BF9250-I";

        # Enter the key for the Claim to be cancelled

    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;


    # Return to STEP Input if changing Language

    STEP Retrieve
    {
        USES P-STEP "BF9250-P";

        # Retrieve the record 

    }


    # Return to STEP Input if a CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # New Button Bar for STEP Confirm

    ButtonBar = "ButtonBarConfirmCancel";

    STEP Confirm
    {
        USES S-STEP "BF9250-O";

        # Display the Claim and ask for confirmation

    }


    # Actions to Take if Confirm Cancelled

    IF action == "ACTION_BACK"
    {
        EXIT;

    }

    # Return to STEP Confirm if changing Language

    STEP CancelClaim
    {
        USES P-STEP "BF9255-P";

        # Make the Claim status "Cancelled"

    }


    # Return to STEP Confirm if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;


    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10];
    ButtonBar = "ButtonBarOK";


    # Display the of the CANCEL process

    STEP Getit
    {
        USES P-STEP "BF9250-P";
    }

    # PF13 - move array  
      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];

    STEP Output
    {
        USES S-STEP "BF9250-O";
    }

}

