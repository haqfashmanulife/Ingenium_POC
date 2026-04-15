# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9214List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9214-I.s";
INCLUDE "BF9214-O.s";

# Change this to the P that retrieves the list

INCLUDE "BF9214-P.p";
INCLUDE "BF9210Retrieve.f";
INCLUDE "BF9211Create.f";
INCLUDE "BF9212Update.f";
INCLUDE "BF9213Delete.f";

PROCESS BF9214List
{
    Title = STRINGTABLE.IDS_TITLE_BF9214List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9214-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9214-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9214List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9214-O";
        "0" -> index;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9211Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CLI-ID;
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

    MIR-BUS-CAL-DT-YR = MIR-BUS-CAL-DT-YR-T[index];
    MIR-BUS-CAL-DT-MO = MIR-BUS-CAL-DT-MO-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9210Retrieve";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-BUS-CAL-DT-YR -> MIR-BUS-CAL-DT-YR;
            MIR-BUS-CAL-DT-MO -> MIR-BUS-CAL-DT-MO;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9212Update";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-BUS-CAL-DT-YR -> MIR-BUS-CAL-DT-YR;
            MIR-BUS-CAL-DT-MO -> MIR-BUS-CAL-DT-MO;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9213Delete";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-BUS-CAL-DT-YR -> MIR-BUS-CAL-DT-YR;
            MIR-BUS-CAL-DT-MO -> MIR-BUS-CAL-DT-MO;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

