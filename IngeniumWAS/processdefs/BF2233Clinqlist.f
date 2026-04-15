# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2233Clinqlist.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017088  6.1.1J   Added instructions to reset CLI-ID on new searches        *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2233-I.s";
INCLUDE "BF2233-O.s";
INCLUDE "BF2233-P.p";
INCLUDE "BF1220Retrieve.f";
INCLUDE "BF1221Create.f";
INCLUDE "BF1222Update.f";
INCLUDE "BF1223Delete.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF2233Clinqlist
{
    Title = STRINGTABLE.IDS_TITLE_BF2233Clinqlist;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2233-I";
    }


    # Blank out the value of CLI-ID to prevent the list from 
    # starting in the wrong place

    MIR-CLI-ID = "";

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2233-P";
    }


    # We'll need to keep a record of the key to determine if the user has
    # changed it.

    FLOW-GIV-NM = MIR-CLI-INDV-GIV-NM;
    FLOW-SUR-NM = MIR-CLI-INDV-SUR-NM;
    FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
    Title = STRINGTABLE.IDS_TITLE_BF2233Clinqlist;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-CLI-INDV-SUR-NM + " " + MIR-CLI-INDV-GIV-NM;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        

#23774A CHANGES END



    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF2233-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list
    # If the key has changed, then treat this as a new search and blank out CLI-ID

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        IF FLOW-GIV-NM != MIR-CLI-INDV-GIV-NM || FLOW-SUR-NM != MIR-CLI-INDV-SUR-NM || FLOW-SRCH-GR-CD != MIR-DV-SRCH-GR-CD
        {
            MIR-CLI-ID = "";

        }

        BRANCH RetrieveList;

    }

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
            " " -> MIR-CLI-CNTCT-SEQ-NUM;
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

