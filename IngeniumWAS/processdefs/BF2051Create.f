# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2051Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2051-P.p";
INCLUDE "BF2051-I.s";

PROCESS BF2051Create
{
    Title = STRINGTABLE.IDS_TITLE_BF2051Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF2051-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record

    STEP Create
    {
        USES P-STEP "BF2051-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.
    # Display the output of the update process

    IF DisplayInput == "FALSE"
    {
        EXIT;

    }

    STEP Output
    {
        USES S-STEP "BF2051-I";
    }

    BRANCH Create;
}

