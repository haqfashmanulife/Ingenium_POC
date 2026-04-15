# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9874List.f                                                  *
#*  Description: Disease/Surgery Major Code List function                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9874-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9874-P.p";
INCLUDE "BF9874-O.s";
INCLUDE "BF9870Retrieve.f";
INCLUDE "BF9871Create.f";
INCLUDE "BF9872Update.f";
INCLUDE "BF9873Delete.f";

PROCESS BF9874List
{
    Title = STRINGTABLE.IDS_TITLE_BF9874List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9874-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9874-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9874List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9874-O";
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
            USES PROCESS "BF9871Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-MEDIC-CD;
            " " -> MIR-MEDC-TYP-CD;
            " " -> MIR-MEDC-ID;
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

    MIR-MEDIC-CD = MIR-MEDIC-CD-T[index];
    MIR-MEDC-ID = MIR-MEDC-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9870Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9872Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9873Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

