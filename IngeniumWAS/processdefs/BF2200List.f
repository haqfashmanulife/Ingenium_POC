# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2200List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Adjusted to blank out CLI-ID for new searches             *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - JP-CLI-ADDR-LOC-CD deleted                              *
#*                   - new Address Code added                                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2200-I.s";
INCLUDE "BF2200-O.s";
INCLUDE "BF2200-P.p";
INCLUDE "BF1220Retrieve.f";
INCLUDE "BF1221Create.f";
INCLUDE "BF1222Update.f";
INCLUDE "BF1223Delete.f";

PROCESS BF2200List
{
    Title = STRINGTABLE.IDS_TITLE_BF2200List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2200-I";
    }


    # Blank out the value of CLI-ID to prevent the list from 
    # starting in the wrong place

    MIR-CLI-ID = "";

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2200-P";
    }


    # We'll need to keep a record of the key to determine if the user has
    # changed it.

    FLOW-BTH-DT = MIR-CLI-BTH-DT;
    FLOW-CLI-ADDR-LOC-CD = MIR-CLI-ADDR-LOC-CD;
    FLOW-CRNT-LOC = MIR-CLI-CRNT-LOC-CD;
    FLOW-CO-NM = MIR-CLI-ENTR-CO-NM;
    FLOW-GIV-NM = MIR-CLI-ENTR-GIV-NM;
    FLOW-SUR-NM = MIR-CLI-ENTR-SUR-NM;
    FLOW-INTI-NM = MIR-CLI-MID-INIT-NM;
    FLOW-PSTL-CD = MIR-CLI-PSTL-CD;
    FLOW-SEX-CD = MIR-CLI-SEX-CD;
    FLOW-TAX-ID = MIR-CLI-TAX-ID;
    FLOW-SRCH-IND = MIR-DV-CLI-NM-SRCH-IND;
    FLOW-GIV-NM-SRCH-CD = MIR-DV-GIV-NM-SRCH-CD;
    FLOW-SUR-NM-SRCH-CD = MIR-DV-SUR-NM-SRCH-CD;
    FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
    FLOW-PREFCT-TXT = MIR-CLI-PREFCT-TXT;
    FLOW-CITY-NM = MIR-CLI-CITY-NM-TXT;
    Title = STRINGTABLE.IDS_TITLE_BF2200List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF2200-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list
    # If the key has changed, then treat this as a new search and blank out CLI-ID

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        IF FLOW-BTH-DT != MIR-CLI-BTH-DT || FLOW-CLI-ADDR-LOC-CD != MIR-CLI-ADDR-LOC-CD || FLOW-CO-NM != MIR-CLI-ENTR-CO-NM || FLOW-GIV-NM != MIR-CLI-ENTR-GIV-NM || FLOW-SUR-NM != MIR-CLI-ENTR-SUR-NM || FLOW-INTI-NM != MIR-CLI-MID-INIT-NM || FLOW-PSTL-CD != MIR-CLI-PSTL-CD || FLOW-SEX-CD != MIR-CLI-SEX-CD || FLOW-TAX-ID != MIR-CLI-TAX-ID || FLOW-SRCH-IND != MIR-DV-CLI-NM-SRCH-IND || FLOW-GIV-NM-SRCH-CD != MIR-DV-GIV-NM-SRCH-CD || FLOW-SUR-NM-SRCH-CD != MIR-DV-SUR-NM-SRCH-CD || FLOW-SRCH-GR-CD != MIR-DV-SRCH-GR-CD || FLOW-CRNT-LOC != MIR-CLI-CRNT-LOC-CD || FLOW-CITY-NM != MIR-CLI-CITY-NM-TXT
        {
            MIR-CLI-ID = "";

        }

        BRANCH RetrieveList;

    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1221Create";
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
    # by the following steps and pass them to each step. MIR-CLI-ID is 
    # used here as an example only.

    MIR-CLI-ID = MIR-CLI-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1220Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1222Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1223Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

