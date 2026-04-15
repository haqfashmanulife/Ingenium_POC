# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9883Delete.f                                                *
#*  Description: MCAT Medical Category Table Delete function                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************
#
# *NOTE*: Uses custom button bar ButtonBarMedCatDelete for delete confirmation
#         if associated codes exist.
#

INCLUDE "BF9880-I.s";
INCLUDE "BF9880-P.p";
INCLUDE "BF9880-O.s";
INCLUDE "BF9883-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9883Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF9883Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";

    # First Button Bar Seen on the Screen

    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip STEP Input if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    STEP Input
    {
        USES S-STEP "BF9880-I";

        # Enter the key(s) for the value that you'd like to create

    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;


    # Return to STEP Input if changing Language

    STEP Retrieve
    {
        USES P-STEP "BF9880-P";

        # Retrieve the record 

    }


    # Return to STEP Input if a CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # New Button Bar for STEP Confirm

    IF MIR-ASSOC-CODES-IND == "Y"
        ButtonBar = "ButtonBarMedCatDelete";

    ELSE
        ButtonBar = "ButtonBarDeleteCancel";


    STEP Confirm
    {
        USES S-STEP "BF9880-O";

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

    # Return to Confirm step if changing Language

    STEP Delete
    {
        USES P-STEP "BF9883-P";

        # Delete the record

    }


    # Return to Confirm step if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;


    # If Cancel, return to Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;



    # Reset button bar and return to input step

    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

