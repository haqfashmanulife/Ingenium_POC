# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9676Create.f                                                *
#*  Description: Client Moral Risk Table (CLIM) Create function                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9675Retrieve-P.p";
INCLUDE "BF9676Create-P.p";
INCLUDE "BF9677Update-P.p";
INCLUDE "BF9675Retrieve-I.s";
INCLUDE "BF9675Retrieve-O.s";
INCLUDE "BF9677Update-I.s";

PROCESS BF9676Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9676Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9675Retrieve-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record

    MIR-FTXT-TEXT-KEY = MIR-CLI-ID;
    MIR-FTXT-TEXT-TYP-CD = "MR";
    MIR-FTXT-TEXT-SEQ-NBR = "0001";

    STEP Create
    {
        USES P-STEP "BF9676Create-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF9675Retrieve-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF9677Update-I";
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
        USES P-STEP "BF9677Update-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9675Retrieve-O";
    }

}

