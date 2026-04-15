# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9D94List.f                                                  *
#*  Description: List Disease/Surgery function                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP143R  CTS      DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************
# Input screen

INCLUDE "BF9894-I.s";

# List retrieve process

INCLUDE "BF9894-P.p";

# List output screens for Disease or Surgery

INCLUDE "BF9894D-O.s";
INCLUDE "BF9894S-O.s";
INCLUDE "BF9890Retrieve.f";

PROCESS BF9D94List
{
    Title = STRINGTABLE.IDS_TITLE_BF9D94List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9894-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    MIR-ORIG-DESC-1-TXT = "";

    STEP RetrieveList
    {
        USES P-STEP "BF9894-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    # Determine if the list is for Disease or Surgery records and 
    # display on the appropriate Output page

    IF MIR-MEDIC-CD == "D"
    {
        DisplayListS = "BF9894D-O";
        Title = STRINGTABLE.IDS_TITLE_BF9894ListD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        DisplayListS = "BF9894S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9894ListS;

    }

    ButtonBar = "ButtonBarListsCRUD1";

    STEP DisplayList
    {
        USES S-STEP DisplayListS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    
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
            USES PROCESS "BF9890Retrieve";
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

