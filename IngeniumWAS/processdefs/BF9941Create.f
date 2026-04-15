#*******************************************************************************
#*  Component:   BF9941Create.f                                                *
#*  Description:   Question Rule Create                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS   INITIAL VERSION                                             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9941-P.p";
INCLUDE "BF9942-P.p";
INCLUDE "BF9941-I.s";
INCLUDE "BF9942-I.s";
INCLUDE "BF9940-O.s";
INCLUDE "BF9940-P.p";


PROCESS BF9941Create
{

    Title = STRINGTABLE.IDS_TITLE_BF9941Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
        USES S-STEP "BF9941-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record

    STEP Create
    {
        USES P-STEP "BF9941-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve1
    {
        USES P-STEP "BF9940-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF9942-I";
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";
            BRANCH Input;
        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF9942-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";

    STEP Retrieve2
    {
        USES P-STEP "BF9940-P";
    }

    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9940-O";
    }


    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

}

