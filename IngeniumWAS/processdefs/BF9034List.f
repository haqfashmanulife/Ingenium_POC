# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9034List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01   New for NB10                                             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9034-I.s";
INCLUDE "BF9034-O.s";
INCLUDE "BF9034-P.p";
INCLUDE "BF9030Retrieve.f";
INCLUDE "BF9031Create.f";
INCLUDE "BF9032Update.f";
INCLUDE "BF9033Delete.f";

PROCESS BF9034List
{
    Title = STRINGTABLE.IDS_TITLE_BF9034List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # NEED TO STORE FIELD VALUES IN VARIABLES IN CASE USER CANCELS OUT FROM AN ADD STEP

    tableName = " ";
    maxAge = "000";
    sex = " ";
    tableRange1 = "0000";
    tableRange2 = "0000";

    STEP ListStart
    {
        USES S-STEP "BF9034-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9034-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9034List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9034-O";
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

        tableName = MIR-UWRT-TBL-TYP-CD;
        maxAge = MIR-UWRT-MAX-AGE;
        sex = MIR-UWRT-SEX-CD;
        tableRange1 = MIR-UWRT-UW-TBL-RNG-1-QTY;
        tableRange2 = MIR-UWRT-UW-TBL-RNG-1-QTY;

        STEP ACTION_ADD
        {
            USES PROCESS "BF9031Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-UWRT-TBL-TYP-CD;
            "000" -> MIR-UWRT-MAX-AGE;
            " " -> MIR-UWRT-SEX-CD;
            "0000" -> MIR-UWRT-UW-TBL-RNG-1-QTY;
            "0000" -> MIR-UWRT-UW-TBL-RNG-2-QTY;
            " " -> MIR-RAT-STD-SEX-CD;
            "FALSE" -> DisplayInput;
        }


        # IF FIELD VALUES ARE BLANK, USER HAS CANCELLED FROM ADD STEP
        # NEED TO REASSIGN LAST KNOWN FIELD VALUES FROM THE VARIABLES

        IF (MIR-UWRT-UW-TBL-RNG-1-QTY == "0")
        {
            MIR-UWRT-TBL-TYP-CD = tableName;
            MIR-UWRT-MAX-AGE = maxAge;
            MIR-UWRT-SEX-CD = sex;
            MIR-UWRT-UW-TBL-RNG-1-QTY = tableRange1;
            MIR-UWRT-UW-TBL-RNG-2-QTY = tableRange2;

        }


        # RESET VARIABLES TO BLANKS

        tableName = " ";
        maxAge = " ";
        sex = " ";
        tableRange1 = " ";
        tableRange2 = " ";

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-UWRT-TBL-TYP-CD = MIR-UWRT-TBL-TYP-CD-H[index];
    MIR-UWRT-MAX-AGE = MIR-UWRT-MAX-AGE-T[index];
    MIR-UWRT-SEX-CD = MIR-UWRT-SEX-CD-T[index];
    MIR-UWRT-UW-TBL-RNG-1-QTY = MIR-UWRT-UW-TBL-RNG-1-QTY-T[index];
    MIR-UWRT-UW-TBL-RNG-2-QTY = MIR-UWRT-UW-TBL-RNG-2-QTY-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9030Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UWRT-TBL-TYP-CD -> MIR-UWRT-TBL-TYP-CD;
            MIR-UWRT-MAX-AGE -> MIR-UWRT-MAX-AGE;
            MIR-UWRT-SEX-CD -> MIR-UWRT-SEX-CD;
            MIR-UWRT-UW-TBL-RNG-1-QTY -> MIR-UWRT-UW-TBL-RNG-1-QTY;
            MIR-UWRT-UW-TBL-RNG-2-QTY -> MIR-UWRT-UW-TBL-RNG-2-QTY;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9032Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UWRT-TBL-TYP-CD -> MIR-UWRT-TBL-TYP-CD;
            MIR-UWRT-MAX-AGE -> MIR-UWRT-MAX-AGE;
            MIR-UWRT-SEX-CD -> MIR-UWRT-SEX-CD;
            MIR-UWRT-UW-TBL-RNG-1-QTY -> MIR-UWRT-UW-TBL-RNG-1-QTY;
            MIR-UWRT-UW-TBL-RNG-2-QTY -> MIR-UWRT-UW-TBL-RNG-2-QTY;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9033Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UWRT-TBL-TYP-CD -> MIR-UWRT-TBL-TYP-CD;
            MIR-UWRT-MAX-AGE -> MIR-UWRT-MAX-AGE;
            MIR-UWRT-SEX-CD -> MIR-UWRT-SEX-CD;
            MIR-UWRT-UW-TBL-RNG-1-QTY -> MIR-UWRT-UW-TBL-RNG-1-QTY;
            MIR-UWRT-UW-TBL-RNG-2-QTY -> MIR-UWRT-UW-TBL-RNG-2-QTY;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

