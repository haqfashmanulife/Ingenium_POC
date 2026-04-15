# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2054List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2054-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2054-O.s";
INCLUDE "BF2054-P.p";
INCLUDE "BF2051Create.f";
INCLUDE "BF2053Delete.f";

PROCESS BF2054List
{
    Title = STRINGTABLE.IDS_TITLE_BF2054List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2054-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2054-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF2054List;
    ButtonBar = "ButtonBarListsCD";

    STEP DisplayList
    {
        USES S-STEP "BF2054-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2051Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            "" -> MIR-REQIR-LTST-RGN-CD;
            "" -> MIR-LAB-ID;
            "" -> MIR-LTST-ID;
            "" -> MIR-REQIR-ID;
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

    MIR-LTST-ID = MIR-LTST-ID-T[index];


    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2053Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LTST-ID -> MIR-LTST-ID;
            "FALSE" -> DisplayInput;
        }


        # SEND KEY WORD TO THE SERVER SO IT KNOWS TO CLEAR THE TWRK AREA
        # AND DISPLAY THE APPROPRIATE VALUES BASED ON THE KEY

        MIR-LTST-ID = "DELETE_TWRK";

        BRANCH RetrieveList;

    }
    IF action == "ACTION_RETURN"
        BRANCH RetrieveList;

}

