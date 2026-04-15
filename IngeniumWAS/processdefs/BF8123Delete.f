# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8123Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8121-I.s";
INCLUDE "BF8123-P.p";

PROCESS BF8123Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF8123Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarDeleteReturn";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Delete;


    STEP Input
    {
        USES S-STEP "BF8121-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_RETURN"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to STEP Input

            ButtonBar = "ButtonBarDeleteReturn";

            BRANCH Input;

        }
        ELSE
        {

            # If originating from list, Exit Delete Process

            EXIT;

        }

    }
    STEP Delete
    {
        USES P-STEP "BF8123-P";

        # Delete the record

    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    IF DisplayInput != "FALSE"
    {
        STEP ReInput
        {
            USES S-STEP "BF8121-I";
            "" -> MIR-CTRY-CD;
            "" -> MIR-CO-ID;
            "" -> MIR-CTRY-LOC-TYP-CD;
            "" -> MIR-CTRY-LOC-TYP-CD;
        }

        IF action == "ACTION_BACK"
            EXIT;

        IF action == "ACTION_RETURN"
        {
            IF DisplayInput != "FALSE"
            {

                # If not orignating from list, Return to STEP Input

                ButtonBar = "ButtonBarDeleteReturn";

                BRANCH ReInput;

            }
            ELSE
            {

                # If originating from list, Exit Delete Process

                EXIT;

            }

        }

        BRANCH Delete;

    }
}

