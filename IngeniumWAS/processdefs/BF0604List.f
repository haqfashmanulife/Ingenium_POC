# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0604List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0604-I.s";
INCLUDE "BF0604-O.s";
INCLUDE "BF0604-P.p";
INCLUDE "BF0600Retrieve.f";
INCLUDE "BF0601Create.f";
INCLUDE "BF0602Update.f";
INCLUDE "BF0603Delete.f";

PROCESS BF0604List
{
    Title = STRINGTABLE.IDS_TITLE_BF0604List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # DEFINE A VARIABLE USED TO ENSURE CLIENT NUMBER IS SET CORRECTLY

    COUNTER = 0;


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0604-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0604-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF0604List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0604-O";
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
            USES PROCESS "BF0601Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # REMOVE EXTRA KEY FIELDS BELOW AND THEN USER SEARCH TO
            # SKIP TO NEXT SECTION OF KEY FIELDS TO MAINTAIN

            " " -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # REDEFINE THE COMMON KEY FIELDS

    MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
    MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];


    # REDEFINE THE KEY FIELD "MIR-CLI-ID" ONLY IF A VALUE EXISTS FOR THAT FIELD
    # IN THE ROW (INDEX) SELECTED BY THE USER.  OTHERWISE, REVIEW EACH KEY PREVIOUS
    # TO THE CURRENT FOR THE LAST KEY THAT HAD A CLIENT NUMBER AVAILABLE FOR THE 
    # CLIENT NUMBER TO USE IN THE KEY

    IF MIR-CLI-ID-T[index] == ""
    {

        # ASSIGN NEW VALUE TO VARIABLE COUNTER EQUAL TO ONE LESS THE CURRENT INDEX

        COUNTER = index - 1;

        WHILE (COUNTER > 0)
        {

            # WHILE LOOP WILL ONLY BE ENTERED IF THE INDEX VALUE IS GREATER THAN ZERO

            IF MIR-CLI-ID-T[COUNTER] == ""
            {

                # IF THIS INDEX VALUE FAILED TO PRODUCE A CLIENT NUMBER
                # REDUCE THE COUNTER BY ONE (TO CHECK ONE PREVIOUS INDEX)

                COUNTER = COUNTER - 1;

            }
            ELSE
            {

                # IF THIS INDEX VALUE PRODUCED A CLIENT NUMBER, ASSIGN THAT VALUE
                # TO FIELD MIR-CLI-ID AND RESET THE VARIABLE COUNTER TO ZERO
                # TO EXIT THE WHILE LOOP

                MIR-CLI-ID = MIR-CLI-ID-T[COUNTER];
                COUNTER = 0;

            }

        }

    }
    ELSE

        # IF THE CURRENT KEY HAS A CLIENT NUMBER, ASSIGN IT TO FIELD MIR-CLI-ID	

        MIR-CLI-ID = MIR-CLI-ID-T[index];



    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0600Retrieve";
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
            USES PROCESS "BF0602Update";
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
            USES PROCESS "BF0603Delete";
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

