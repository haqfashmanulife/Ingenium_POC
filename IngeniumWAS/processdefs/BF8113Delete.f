# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8113Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8111-I.s";
INCLUDE "BF8113-P.p";

PROCESS BF8113Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF8113Delete;
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
        USES S-STEP "BF8111-I";
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

            # If originating from list, Exit Delete Process

            EXIT;


    }
    STEP Delete
    {
        USES P-STEP "BF8113-P";

        # Delete the record

    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    IF DisplayInput != "FALSE"
    {
        STEP ReturntoInput
        {
            USES S-STEP "BF8111-I";
            "" -> MIR-DM-AV-TBL-CD;
            "" -> MIR-DM-AV-CD;
            "" -> MIR-DM-AV-SUBSET-CD;
        }

        IF action == "ACTION_BACK"
            EXIT;

        IF action == "ACTION_RETURN"
        {
            IF DisplayInput != "FALSE"
            {

                # If not orignating from list, Return to STEP ReturntoInput

                ButtonBar = "ButtonBarDeleteReturn";

                BRANCH ReturntoInput;

            }
            ELSE

                # If originating from list, Exit Delete Process

                EXIT;


        }

        BRANCH Delete;

    }
}

