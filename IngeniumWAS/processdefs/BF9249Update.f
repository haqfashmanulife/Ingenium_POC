# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9249Update.f                                                *
#*  Description: ASSOCIATE OTHER MASTER CLAIM                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   ASSOCIATE OTHER MASTER CLAIM     (HCL106D)                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9248-I.s";
INCLUDE "BF9248-P.p";
INCLUDE "BF9249-I.s";
INCLUDE "BF9249-P.p";

PROCESS BF9249Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9249Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to update

    STEP Input
    {
        USES S-STEP "BF9248-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Reset variables used in Flow

    More = "";
    MIR-START-CLM-ID = "";


    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9248-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # ASSIGN index WITH ROW POSITION RELATING TO THE ASSOCIATED CLAIM  

    COUNTER = 50;

    WHILE (COUNTER > 0)
    {
        IF MIR-SELECT-CD-T[COUNTER] == "Y"
            index = COUNTER;


        COUNTER = COUNTER - 1;

    }


    # Set up Button Bar dependant on whether there are more records to 
    # display to user

    IF More == "Y"
        BRANCH Edit-I;


    IF MIR-START-CLM-ID != ""
    {
        ButtonBar = "ButtonBarUpdateCancelMore";
        More = "Y";

    }
    ELSE
        ButtonBar = "ButtonBarUpdateCancel";


    STEP Edit-I
    {
        USES S-STEP "BF9249-I";
    }

    # If the user hits Cancel, return to menu.

    IF action == "ACTION_BACK"
        EXIT;


    # If the user hits More, refresh the screen with more data

    IF action == "ACTION_MORE"
    {
        BRANCH Retrieve;

    }


    ## Update the associated Claim Id as selected by the user

    STEP Update-P
    {
        USES P-STEP "BF9249-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

