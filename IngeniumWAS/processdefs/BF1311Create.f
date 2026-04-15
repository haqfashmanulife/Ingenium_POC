# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1311Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017406  612J     17151-Code cleanup; Replace update output with retrieve   *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1310-P.p";
INCLUDE "BF1311-P.p";
INCLUDE "BF1312-I.s";
INCLUDE "BF1310-O.s";
INCLUDE "BF1312-P.p";

PROCESS BF1311Create
{
    Title = STRINGTABLE.IDS_TITLE_BF1311Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Create the new record

    STEP Create
    {
        USES P-STEP "BF1311-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Output;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF1310-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Output;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF1312-I";
    }


    # If user selects Cancel and did not come from a list, then branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
        EXIT;

    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF1312-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1310-O";
    }

}

