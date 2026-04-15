# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2004List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2004-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2004-O.s";
INCLUDE "BF2004-P.p";
INCLUDE "BF2000Retrieve.f";
INCLUDE "BF2001Create.f";
INCLUDE "BF2002Update.f";
INCLUDE "BF2003Delete.f";

PROCESS BF2004List
{
    Title = STRINGTABLE.IDS_TITLE_BF2004List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # INITIALIZE VARIABLE TO STORE TABLE NAME IN CASE OF CANCELLING OUT OF ADD STEP

    cancelAdd = " ";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2004-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2004-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF2004List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF2004-O";
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

        # STORE THE CURRENT VALUE OF FIELD "MIR-ETBL-TYP-ID"
        # IN A VARIABLE NAMED cancelAdd.  THIS IS IN CASE THE
        # USER CANCELS OUT OF THE ADD PROCESS.  THIS WILL 
        # ALLOW THE LIST FLOW TO RE-RETRIEVE THE LIST BASED
        # ON THE LAST VALUES ENTERED (OTHERWISE SERVER RETURNS
        # AN ERROR BECAUSE THE RETRIEVE LIST WILL SEND IN BLANK
        # VALUES FOR THE "MIR-ETBL-TYPE-ID" FIELD

        cancelAdd = MIR-ETBL-TYP-ID;

        STEP ACTION_ADD
        {
            USES PROCESS "BF2001Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-ETBL-LANG-CD;
            " " -> MIR-ETBL-TYP-ID;
            " " -> MIR-ETBL-VALU-ID;
            "FALSE" -> DisplayInput;
        }


        # IF THE VALUE CURRENTLY IN THE "MIR-ETBL-TYP-ID" FIELD IS BLANK
        # IT MEANS THE USER HAS CANCELLED OUT OF THE ADD STEP.  THE FLOW
        # NEEDS TO REDEFINE THE VALUE OF FIELD "MIR-ETBL-TYP-ID" TO EQUAL
        # WHAT IT WAS PRIOR TO ENTERING THE FLOW

        IF (MIR-ETBL-TYP-ID == "")
        {

            # RESET VARIABLE TO BLANK

            MIR-ETBL-TYP-ID = cancelAdd;
            cancelAdd = "";

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

    MIR-ETBL-LANG-CD = MIR-ETBL-LANG-CD-T[index];
    MIR-ETBL-TYP-ID = MIR-ETBL-TYP-ID-T[index];
    MIR-ETBL-VALU-ID = MIR-ETBL-VALU-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2000Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2002Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2003Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

