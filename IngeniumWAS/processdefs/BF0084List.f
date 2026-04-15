# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0084List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0084-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0084-O.s";
INCLUDE "BF0084-P.p";
INCLUDE "BF0080Retrieve.f";
INCLUDE "BF0081Create.f";
INCLUDE "BF0082Update.f";
INCLUDE "BF0083Delete.f";

PROCESS BF0084List
{
    Title = STRINGTABLE.IDS_TITLE_BF0084List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0084-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0084-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF0084List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0084-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0081Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-MSG-REF-ID;
            " " -> MIR-MSG-REF-NUM;
            " " -> MIR-MSG-LANG-CD;
            " " -> MIR-MSG-SECUR-CLAS-CD;
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

    MIR-MSG-REF-NUM = MIR-MSG-REF-NUM-T[index];
    MIR-MSG-LANG-CD = MIR-MSG-LANG-CD-T[index];
    MIR-MSG-SECUR-CLAS-CD = MIR-MSG-SECUR-CLAS-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0080Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MSG-REF-ID -> MIR-MSG-REF-ID;
            MIR-MSG-REF-NUM -> MIR-MSG-REF-NUM;
            MIR-MSG-LANG-CD -> MIR-MSG-LANG-CD;
            MIR-MSG-SECUR-CLAS-CD -> MIR-MSG-SECUR-CLAS-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0082Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MSG-REF-ID -> MIR-MSG-REF-ID;
            MIR-MSG-REF-NUM -> MIR-MSG-REF-NUM;
            MIR-MSG-LANG-CD -> MIR-MSG-LANG-CD;
            MIR-MSG-SECUR-CLAS-CD -> MIR-MSG-SECUR-CLAS-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0083Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MSG-REF-ID -> MIR-MSG-REF-ID;
            MIR-MSG-REF-NUM -> MIR-MSG-REF-NUM;
            MIR-MSG-LANG-CD -> MIR-MSG-LANG-CD;
            MIR-MSG-SECUR-CLAS-CD -> MIR-MSG-SECUR-CLAS-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

