# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2044List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2044-I.s";
INCLUDE "BF2044-O.s";
INCLUDE "BF2044-P.p";
INCLUDE "BF2040Retrieve.f";
INCLUDE "BF2041Create.f";
INCLUDE "BF2042Update.f";
INCLUDE "BF2043Delete.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF2044List
{
    Title = STRINGTABLE.IDS_TITLE_BF2044List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF2044-I
    {
        USES S-STEP "BF2044-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF2044-P
    {
        USES P-STEP "BF2044-P";
    }
    
  
    IF LSIR-RETURN-CD != "00"
        BRANCH BF2044-I;
        
#23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-TXT-SRC-ID + " " + MIR-TXT-SRC-REF-ID + " " + MIR-TXT-LANG-CD;   
       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO;  
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF2044-I;
        
#23774A CHANGES END 

    Title = STRINGTABLE.IDS_TITLE_BF2044List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP BF2044-O
    {
        USES S-STEP "BF2044-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF2044-P;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT:
    #     " " -> MIR-USER-EXIT-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2041Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-TXT-LANG-CD;
            " " -> MIR-TXT-SRC-REF-ID;
            MIR-TXT-SRC-ID -> MIR-TXT-SRC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2044-P;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF2044-O;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-USER-EXIT-ID is 
    # used here as an example only.

    MIR-TXT-LANG-CD = MIR-TXT-LANG-CD-T[index];
    MIR-TXT-SRC-REF-ID = MIR-TXT-SRC-REF-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2040Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-TXT-LANG-CD -> MIR-TXT-LANG-CD;
            MIR-TXT-SRC-REF-ID -> MIR-TXT-SRC-REF-ID;
            MIR-TXT-SRC-ID -> MIR-TXT-SRC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2044-P;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2042Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-TXT-LANG-CD -> MIR-TXT-LANG-CD;
            MIR-TXT-SRC-REF-ID -> MIR-TXT-SRC-REF-ID;
            MIR-TXT-SRC-ID -> MIR-TXT-SRC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2044-P;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2043Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-TXT-LANG-CD -> MIR-TXT-LANG-CD;
            MIR-TXT-SRC-REF-ID -> MIR-TXT-SRC-REF-ID;
            MIR-TXT-SRC-ID -> MIR-TXT-SRC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2044-P;

    }
}

