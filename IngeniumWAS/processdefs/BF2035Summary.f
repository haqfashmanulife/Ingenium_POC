# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2035Summary.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2035-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2035-O.s";
INCLUDE "BF2035-P.p";
INCLUDE "BF2036Copy.f";
INCLUDE "BF2034List.f";

PROCESS BF2035Summary
{
    Title = STRINGTABLE.IDS_TITLE_BF2035Summary;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2035-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2035-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF2035Summary;
    ButtonBar = "ButtonBarListsCopyDetail";

    STEP DisplayList
    {
        USES S-STEP "BF2035-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-BASIC-PLAN-ID = MIR-BASIC-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];


    # The user wants to Copy an item in the list

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF2036Copy";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-BASIC-PLAN-ID -> MIR-BASIC-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_DETAIL"
    {
        STEP ACTION_DETAIL
        {
            USES PROCESS "BF2034List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BASIC-PLAN-ID -> MIR-BASIC-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

