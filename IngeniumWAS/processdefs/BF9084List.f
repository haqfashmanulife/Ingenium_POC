#*******************************************************************************
#*  Component:   BF9084List.f                                                  *
#*  Description: Benefit Category-Name Table (CQBC) List function              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9084-I.s";
INCLUDE "BF9084-O.s";
INCLUDE "BF9084-P.p";
INCLUDE "BF9081Create.f";


PROCESS BF9084List
{
    Title = STRINGTABLE.IDS_TITLE_BF9084List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9084-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9084-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9084List;
    ButtonBar = "ButtonBarListsCD";

    STEP DisplayList
    {
        USES S-STEP "BF9084-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_PREV"
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
            USES PROCESS "BF9081Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-BNFT-CAT-CD;
            " " -> MIR-BNFT-NM-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9084List;
        ButtonBar = "ButtonBarListsCD";
        BRANCH DisplayList;
    }



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-BNFT-CAT-CD = MIR-BNFT-CAT-CD-T[index];
    MIR-BNFT-NM-ID = MIR-BNFT-NM-ID-T[index];
   

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"       
        BRANCH Retrieve;

    STEP Retrieve
    {
        USES P-STEP "BF9070-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9084List;
        ButtonBar = "ButtonBarListsCD";
        BRANCH DisplayList;
    }

    ButtonBar = "ButtonBarDeleteCancel";
    ButtonBarSize = "40";

    Title = STRINGTABLE.IDS_TITLE_BF9083Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";

    STEP Output
    {
        USES S-STEP "BF9081-O";
    }

    IF action == "ACTION_BACK" 
    {
       Title = STRINGTABLE.IDS_TITLE_BF9084List;
       ButtonBar = "ButtonBarListsCD"; 
       BRANCH DisplayList;  
    }

    STEP Delete
    {
        USES P-STEP "BF9083-P";
    }
    
    BRANCH RetrieveList;

}

 