# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9514List.f                                                  *
#*  Description: This module perform the table list function for the           *
#*               PAXT table                                                    *
#*******************************************************************************
#*  Date     Author  Description                                               *
#*                                                                             *
#*  01AUG01  SRO     Created for 01PR11                                        *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9514-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9514-O.s";
INCLUDE "BF9514-P.p";
INCLUDE "BF9511Create.f";
INCLUDE "BF9513Delete.f";

PROCESS BF9514List
{
    Title = STRINGTABLE.IDS_TITLE_BF9514List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9514-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9514-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9514List;
    ButtonBar = "ButtonBarListsCD";

    STEP DisplayList
    {
        USES S-STEP "BF9514-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and regenerate the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank except the three
    # first fields so that the key will be partly populated on an add

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9511Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-PAXT-PLAN-ID -> MIR-PAXT-PLAN-ID;
            " " -> MIR-PAXT-ADDL-PLAN-ID;
            " " -> MIR-PAXT-RULE-TYP-CD;
            " " -> MIR-PAXT-CVG-TYP-CD;
            " " -> MIR-PAXT-SEX-CD;
            " " -> MIR-PLAN-DPND-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-PAXT-PLAN-ID = MIR-PAXT-PLAN-ID-T[index];
    MIR-PAXT-ADDL-PLAN-ID = MIR-PAXT-ADDL-PLAN-ID-T[index];
    MIR-PAXT-RULE-TYP-CD = MIR-PAXT-RULE-TYP-CD-T[index];
    MIR-PAXT-CVG-TYP-CD = MIR-PAXT-CVG-TYP-CD-T[index];
    MIR-PAXT-SEX-CD = MIR-PAXT-SEX-CD-T[index];
    MIR-PLAN-DPND-PLAN-ID = MIR-PLAN-DPND-PLAN-ID-T[index];


    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9513Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-PAXT-PLAN-ID -> MIR-PAXT-PLAN-ID;
            MIR-PAXT-ADDL-PLAN-ID -> MIR-PAXT-ADDL-PLAN-ID;
            MIR-PAXT-RULE-TYP-CD -> MIR-PAXT-RULE-TYP-CD;
            MIR-PAXT-CVG-TYP-CD -> MIR-PAXT-CVG-TYP-CD;
            MIR-PAXT-SEX-CD -> MIR-PAXT-SEX-CD;
            MIR-PLAN-DPND-PLAN-ID -> MIR-PLAN-DPND-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

