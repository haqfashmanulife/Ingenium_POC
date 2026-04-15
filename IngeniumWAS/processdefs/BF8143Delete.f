# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8143Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BFDELETE-O.s";

# Delete P Step

INCLUDE "BF8143-I.s";
INCLUDE "BF8143-P.p";

PROCESS BF8143Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF8143Delete;
    TitleBar = "TitleBar";

    # First Button Bar Seen on the Screen

    TitleBarSize = "70";
    ButtonBar = "ButtonBarDeleteReturn";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip STEP Input if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH Delete;


    STEP Input1
    {
        USES S-STEP "BF8143-I";

        # Enter the key(s) for the value that you'd like to create

    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;


    # Return to STEP Input if changing Language

    # Actions to Take if Confirm Cancelled

    IF action == "ACTION_RETURN"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to STEP Input1
            # Reset Button Bar to OK and CANCEL

            ButtonBar = "ButtonBarDeleteReturn";

            BRANCH Input1;

        }
        ELSE

            # If originating from list, Exit Delete Process

            EXIT;


    }

    # Return to STEP Confirm if changing Language

    STEP Delete
    {
        USES P-STEP "BF8143-P";

        # Delete the record

    }


    # Return to STEP Confirm if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input1;


    # Display Confirmation Screen if originating from LIST

    IF DisplayInput == "FALSE"
    {

        # Set Button Bar to OK button only

        ButtonBar = "ButtonBarOK";

        STEP EndPage
        {
            USES S-STEP "BFDELETE-O";

            # Display confirmation page for messages

        }

    }
    IF DisplayInput != "FALSE"
    {
        STEP Input2
        {
            USES S-STEP "BF8143-I";

            # Enter the key(s) for the value that you'd like to create

        }


        # Return to Previous Step if Cancelling Out

        IF action == "ACTION_BACK"
            EXIT;


        # Return to STEP Input2 if changing Language

        # Actions to Take if Confirm Cancelled

        IF action == "ACTION_RETURN"
        {
            IF DisplayInput != "FALSE"
            {

                # If not orignating from list, Return to STEP Input2
                # Reset Button Bar to OK and CANCEL

                ButtonBar = "ButtonBarDeleteReturn";

                BRANCH Input2;

            }
            ELSE

                # If originating from list, Exit Delete Process

                EXIT;


        }

        BRANCH Delete;

    }
}

