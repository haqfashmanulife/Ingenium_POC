#*******************************************************************************
#*  Component:   BF9C24ListMain.f                                              *
#*  Description: TD Reinstatement Information(REIN) List function              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9C24-O.s";
INCLUDE "BF9C24-P.p";
INCLUDE "BF9C20Retrieve.f";
INCLUDE "BF9C22Update.f";
INCLUDE "BF9C23Delete.f";
INCLUDE "BF9C25Print.f";

PROCESS BF9C24ListMain
{

    # Ask the user where they'd like to start the list

    STEP RetrieveList
    {
        USES P-STEP "BF9C24-P";
    }


    Title = STRINGTABLE.IDS_TITLE_BF9C24List;
    ButtonBar = "ButtonBarListsRUDPrt";

    STEP DisplayList
    {
        USES S-STEP "BF9C24-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step.

    MIR-PRCES-DT = MIR-PRCES-DT-T[index];
    MIR-INSRD-CLI-ID = MIR-INSRD-CLI-ID-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9C20Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID -> MIR-POL-ID;
            MIR-PRCES-DT -> MIR-PRCES-DT;
            MIR-INSRD-CLI-ID -> MIR-INSRD-CLI-ID;
            "FALSE" -> DisplayInput;
        }

         BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9C22Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID -> MIR-POL-ID;
            MIR-PRCES-DT -> MIR-PRCES-DT;
            MIR-INSRD-CLI-ID -> MIR-INSRD-CLI-ID;
            "FALSE" -> DisplayInput;
        }

         BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9C23Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID -> MIR-POL-ID;
            MIR-PRCES-DT -> MIR-PRCES-DT;
            MIR-INSRD-CLI-ID -> MIR-INSRD-CLI-ID;
            "FALSE" -> DisplayInput;
        }

         BRANCH RetrieveList;

    }

    # The user wants to print an item in the list

    IF action == "ACTION_PRINT"
    {
        STEP ACTION_PRINT
        {
            USES PROCESS "BF9C25Print";
            ATTRIBUTES
            {
                GetMessages = "YES";
            }

            MIR-POL-ID -> MIR-POL-ID;
            MIR-PRCES-DT -> MIR-PRCES-DT;
            MIR-INSRD-CLI-ID -> MIR-INSRD-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH DisplayList;

    }
}

