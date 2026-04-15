# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0354List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0354-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0354-O.s";
INCLUDE "BF0354-P.p";
INCLUDE "BF0350Retrieve.f";
INCLUDE "BF0351Create.f";
INCLUDE "BF0352Update.f";
INCLUDE "BF0353Delete.f";

PROCESS BF0354List
{
    Title = STRINGTABLE.IDS_TITLE_BF0354List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # NEED TO STORE FIELD VALUES IN VARIABLES IN CASE USER CANCELS OUT FROM AN ADD STEP

    rateAge = " ";
    rateHeight = " ";
    rateWeight = " ";
    rateSex = " ";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0354-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0354-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0354List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0354-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {

        # SAVE FIELD VALUES TO VARIALBLES IN CASE OF CANCEL OUT OF ADD STEP

        rateAge = MIR-RAT-STD-AGE;
        rateHeight = MIR-RAT-STD-HT-QTY;
        rateWeight = MIR-RAT-STD-WGT-QTY;
        rateSex = MIR-RAT-STD-SEX-CD;

        STEP ACTION_ADD
        {
            USES PROCESS "BF0351Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            "0" -> MIR-RAT-STD-AGE;
            "000" -> MIR-RAT-STD-HT-QTY;
            "000" -> MIR-RAT-STD-WGT-QTY;
            " " -> MIR-RAT-STD-SEX-CD;
            "FALSE" -> DisplayInput;
        }


        # IF FIELD VALUES ARE BLANK, USER HAS CANCELLED FROM ADD STEP
        # NEED TO REASSIGN LAST KNOWN FIELD VALUES FROM THE VARIABLES

        TRACE("SEX (" + MIR-RAT-STD-HT-QTY + ")");

        IF (MIR-RAT-STD-HT-QTY == "000")
        {
            MIR-RAT-STD-AGE = rateAge;
            MIR-RAT-STD-HT-QTY = rateHeight;
            MIR-RAT-STD-WGT-QTY = rateWeight;
            MIR-RAT-STD-SEX-CD = rateSex;

        }


        # RESET VARIABLES TO BLANKS

        rateAge = " ";
        rateHeight = " ";
        rateWeight = " ";
        rateSex = " ";

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-RAT-STD-AGE = MIR-RAT-STD-AGE-T[index];
    MIR-RAT-STD-HT-QTY = MIR-RAT-STD-HT-QTY-T[index];
    MIR-RAT-STD-WGT-QTY = MIR-RAT-STD-WGT-QTY-T[index];
    MIR-RAT-STD-SEX-CD = MIR-RAT-STD-SEX-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0350Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RAT-STD-AGE -> MIR-RAT-STD-AGE;
            MIR-RAT-STD-HT-QTY -> MIR-RAT-STD-HT-QTY;
            MIR-RAT-STD-WGT-QTY -> MIR-RAT-STD-WGT-QTY;
            MIR-RAT-STD-SEX-CD -> MIR-RAT-STD-SEX-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0352Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RAT-STD-AGE -> MIR-RAT-STD-AGE;
            MIR-RAT-STD-HT-QTY -> MIR-RAT-STD-HT-QTY;
            MIR-RAT-STD-WGT-QTY -> MIR-RAT-STD-WGT-QTY;
            MIR-RAT-STD-SEX-CD -> MIR-RAT-STD-SEX-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0353Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RAT-STD-AGE -> MIR-RAT-STD-AGE;
            MIR-RAT-STD-HT-QTY -> MIR-RAT-STD-HT-QTY;
            MIR-RAT-STD-WGT-QTY -> MIR-RAT-STD-WGT-QTY;
            MIR-RAT-STD-SEX-CD -> MIR-RAT-STD-SEX-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

