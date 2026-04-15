#*******************************************************************************
#*  Component:   BF9351Create.f                                                *
#*  Description:   Major Question Create                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS   INITIAL VERSION                                             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9351-P.p";
INCLUDE "BF9352-P.p";
INCLUDE "BF9351-I.s";
INCLUDE "BF9352-I.s";
INCLUDE "BF9310-P.p";
INCLUDE "BF9352-O.s";

PROCESS BF9351Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9351Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

     MIR-DIS-TYP-CD = "NA"; 
     MIR-SUR-TYP-CD = "NA";

    STEP Input
    {
        USES S-STEP "BF9351-I";

    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;


    # Create the new record

    STEP Create
    {
        USES P-STEP "BF9351-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID;

    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF9310-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF9352-I";
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
        USES P-STEP "BF9352-P";
    }


    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";

    STEP Inquire
    {
        USES P-STEP "BF9310-P";
    }

    MESSAGES-T[1] = temp-MSGS-T[1];
    MESSAGES-T[2] = temp-MSGS-T[2];
    MESSAGES-T[3] = temp-MSGS-T[3];
    MESSAGES-T[4] = temp-MSGS-T[4];
    MESSAGES-T[5] = temp-MSGS-T[5];

    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9352-O";
    }


    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

}

