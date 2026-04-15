# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0405Summary.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0405-I.s";
INCLUDE "BF0405-O.s";
INCLUDE "BF0405-P.p";
INCLUDE "BF0404List.f";
INCLUDE "BF0406Copy.f";

PROCESS BF0405Summary
{
    Title = STRINGTABLE.IDS_TITLE_BF0405Summary;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0405-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0405-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0405Summary;
    ButtonBar = "ButtonBarListsCopyDetail";

    STEP DisplayList
    {
        USES S-STEP "BF0405-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;


    # The user has indicated that they want to clone a packaging record

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF0406Copy";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }


    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-PLAN-ID = MIR-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-DI-PKG-NUM = MIR-DI-PKG-NUM-T[index];

    IF action == "ACTION_DETAIL"
    {
        STEP DetailList
        {
            USES PROCESS "BF0404List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-DI-PKG-NUM -> MIR-DI-PKG-NUM;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

