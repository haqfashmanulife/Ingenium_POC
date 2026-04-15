# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2084List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015734  6.1.1J   Removed unnecessary asignment instructions                *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the List

INCLUDE "BF2084-I.s";

# Change this to the P that retrieves the List

INCLUDE "BF2084-O.s";
INCLUDE "BF2084-P.p";
INCLUDE "BF2080Retrieve.f";
INCLUDE "BF2081Create.f";
INCLUDE "BF2082Update.f";
INCLUDE "BF2083Delete.f";

PROCESS BF2084List
{
    Title = STRINGTABLE.IDS_TITLE_BF2084List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the List

    STEP ListStart
    {
        USES S-STEP "BF2084-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2084-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF2084List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF2084-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the List

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the List

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2081Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-REQIR-ID;
            " " -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected

    MIR-UPLD-FLD-APEX-NM = MIR-UPLD-FLD-APEX-NM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2080Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-REQIR-ID -> MIR-REQIR-ID;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the List

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2082Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-REQIR-ID -> MIR-REQIR-ID;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the List

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2083Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-REQIR-ID -> MIR-REQIR-ID;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

