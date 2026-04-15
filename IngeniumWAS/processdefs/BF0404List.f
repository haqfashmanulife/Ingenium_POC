# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0404List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0404-I.s";
INCLUDE "BF0404-O.s";
INCLUDE "BF0404-P.p";
INCLUDE "BF0400Retrieve.f";
INCLUDE "BF0401Create.f";
INCLUDE "BF0402Update.f";
INCLUDE "BF0403Delete.f";

PROCESS BF0404List
{
    Title = STRINGTABLE.IDS_TITLE_BF0404List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;



    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0404-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0404-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0404List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0404-O";
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
            USES PROCESS "BF0401Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-ID;
            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-DI-PKG-NUM;
            " " -> MIR-LOC-GR-ID;
            " " -> MIR-CONN-PLAN-ID;
            " " -> MIR-CONN-PKG-NUM;
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

    MIR-PLAN-ID = MIR-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-DI-PKG-NUM = MIR-DI-PKG-NUM-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-CONN-PLAN-ID = MIR-CONN-PLAN-ID-T[index];
    MIR-CONN-PKG-NUM = MIR-CONN-PKG-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0400Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-DI-PKG-NUM -> MIR-DI-PKG-NUM;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-CONN-PLAN-ID -> MIR-CONN-PLAN-ID;
            MIR-CONN-PKG-NUM -> MIR-CONN-PKG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0402Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-DI-PKG-NUM -> MIR-DI-PKG-NUM;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-CONN-PLAN-ID -> MIR-CONN-PLAN-ID;
            MIR-CONN-PKG-NUM -> MIR-CONN-PKG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0403Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-DI-PKG-NUM -> MIR-DI-PKG-NUM;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-CONN-PLAN-ID -> MIR-CONN-PLAN-ID;
            MIR-CONN-PKG-NUM -> MIR-CONN-PKG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

