# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9094List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys and added Process Day    *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the S that displays the list

INCLUDE "BF9094-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9094-O.s";
INCLUDE "BF9094-P.p";
INCLUDE "BF9090Retrieve.f";
INCLUDE "BF9091Create.f";
INCLUDE "BF9092Update.f";
INCLUDE "BF9093Delete.f";

PROCESS BF9094List
{
    Title = STRINGTABLE.IDS_TITLE_BF9094List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9094-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9094-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9094List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9094-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add
    # e.g.  IMPLICIIT:
    # " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9091Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-PRCES-DT-YYYY;
            " " -> MIR-PRCES-DT-MM;
            " " -> MIR-PRCES-DT-DD;
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
    # MIR-CVG-NUM = VALUEOF("MIR-CVG-NUM-T-" + index);

    MIR-PRCES-DT-YYYY = SUBSTRING (MIR-BT-BILL-RUN-DT-T[index],1,4);
    MIR-PRCES-DT-MM = SUBSTRING (MIR-BT-BILL-RUN-DT-T[index],6,2);
    MIR-PRCES-DT-DD = SUBSTRING (MIR-BT-BILL-RUN-DT-T[index],9,2);


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9090Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRCES-DT-YYYY -> MIR-PRCES-DT-YYYY;
            MIR-PRCES-DT-MM -> MIR-PRCES-DT-MM;
            MIR-PRCES-DT-DD -> MIR-PRCES-DT-DD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9092Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRCES-DT-YYYY -> MIR-PRCES-DT-YYYY;
            MIR-PRCES-DT-MM -> MIR-PRCES-DT-MM;
            MIR-PRCES-DT-DD -> MIR-PRCES-DT-DD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9093Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRCES-DT-YYYY -> MIR-PRCES-DT-YYYY;
            MIR-PRCES-DT-MM -> MIR-PRCES-DT-MM;
            MIR-PRCES-DT-DD -> MIR-PRCES-DT-DD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

