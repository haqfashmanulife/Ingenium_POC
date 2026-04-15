# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   FTXTCNList.f                                                  *
#*  Description: Claim Notes (FTXT - "CN") List function                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9670-P.p";
INCLUDE "BF9671-P.p";
INCLUDE "BF9672-P.p";
INCLUDE "BF9673-P.p";
INCLUDE "BF9674-P.p";

# Retrieve Client Information

INCLUDE "BF1220-P.p";

# Retrieve Claim Information

INCLUDE "BF9250-P.p";
INCLUDE "ClaimNotesList-O.s";
INCLUDE "ClaimNotesUpdate-I.s";
INCLUDE "ClaimNotesRetrieve-I.s";
INCLUDE "ClaimNotesRetrieve-O.s";

PROCESS FTXTCNList
{
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to work with

    StartPoint:

    Title = STRINGTABLE.IDS_TITLE_FTXTCNList;
    ButtonBar = "ButtonBarOKCancel";
    MIR-FTXT-TEXT-SEQ-NBR = "";

    STEP ListStart
    {
        USES S-STEP "ClaimNotesRetrieve-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH ListStart;



    # Retrieve all Claim details for Claim 

    STEP ClaimRetrieve
    {
        USES P-STEP "BF9250-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH StartPoint;



    # Retrieve all Client details for Insured

    MIR-CLI-ID = MIR-CLMA-INSRD-CLI-ID;

    STEP ClientRetrieve
    {
        USES P-STEP "BF1220-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH StartPoint;



    # Retrieve all Notes details for Claim

    MIR-FTXT-TEXT-KEY = MIR-CLM-ID;
    MIR-FTXT-TEXT-TYP-CD = "CN";

    STEP RetrieveList
    {
        USES P-STEP "BF9674-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH StartPoint;


    Title = STRINGTABLE.IDS_TITLE_FTXTCNList;
    ButtonBar = "ButtonBarListsCUD";

    STEP DisplayList
    {
        USES S-STEP "ClaimNotesList-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH ClaimRetrieve;

    IF index != "0"
    {
        stored-text-seq-nbr = MIR-FTXT-TEXT-SEQ-NBR-T[index];
        MIR-FTXT-TEXT-SEQ-NBR = MIR-FTXT-TEXT-SEQ-NBR-T[index];

    }

    # Check in case of change of Claim Number

    IF MIR-CLM-ID != MIR-FTXT-TEXT-KEY
    {
        MIR-FTXT-TEXT-KEY = MIR-CLM-ID;

        STEP ChangeClaimRetrieve
        {
            USES P-STEP "BF9250-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH ClaimRetrieve;



        # Retrieve all Client details for Insured

        MIR-CLI-ID = MIR-CLMA-INSRD-CLI-ID;

        STEP ChangeClaimClientRetrieve
        {
            USES P-STEP "BF1220-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH ClaimRetrieve;


        STEP ChangeClaimRetrieveList
        {
            USES P-STEP "BF9674-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH ClaimRetrieve;


    }
    IF action == "ACTION_ADD"
    {
        Title = STRINGTABLE.IDS_TITLE_FTXTCNCreate;
        ButtonBar = "ButtonBarOKCancel";
        MIR-FTXT-TEXT-KEY = MIR-CLM-ID;
        MIR-FTXT-TEXT-SEQ-NBR = "    ";

        STEP AddCreate
        {
            USES P-STEP "BF9671-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH StartPoint;



        # Retrieve the newly created record to ensure that we've got the default
        # values, if any.

        STEP AddRetrieve
        {
            USES P-STEP "BF9670-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH StartPoint;



        # Edit the new record

        STEP AddEdit
        {
            USES S-STEP "ClaimNotesUpdate-I";
        }


        # If user selects Cancel, then clear messages 
        # and branch back.

        IF action == "ACTION_BACK"
        {
            MESSAGES-T[0] = "";

            BRANCH RetrieveList;

        }
        IF action == "ACTION_REFRESH"
            BRANCH AddEdit;



        # Update the record who's data was just entered.

        STEP AddUpdate
        {
            USES P-STEP "BF9672-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH AddEdit;



        # Retrieve all data for record where notes were just created.

        BRANCH RetrieveList;

    }

    # If the user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH RetrieveList;



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step. 
    # Sequence number selected has been stored above

    MIR-FTXT-TEXT-SEQ-NBR = stored-text-seq-nbr;

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_UPDATE if they pressed the update button.
    # Both actions will be interpreted as if the user wants to update
    # that particular entry.
    # The user wants to update an item in the list

    ButtonBar = "ButtonBarOKCancel";

    IF action == "ACTION_UPDATE" || action == "SelectItem"
    {
        STEP UpdateRetrieve
        {
            USES P-STEP "BF9670-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayList;



        # Edit the record

        Title = STRINGTABLE.IDS_TITLE_FTXTCNUpdate;

        STEP UpdateEdit
        {
            USES S-STEP "ClaimNotesUpdate-I";
        }


        # Return to STEP Edit if changing Language

        # Action to Take if Edit Cancelled

        IF action == "ACTION_BACK"
        {
            BRANCH RetrieveList;

        }

        STEP ACTION_UPDATE
        {
            USES P-STEP "BF9672-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH UpdateEdit;



        # Retrieve all data for record where notes were just updated.

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP DeleteRetrieve
        {
            USES P-STEP "BF9670-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayList;



        # New Button Bar for STEP Confirm

        ButtonBar = "ButtonBarDeleteCancel";
        Title = STRINGTABLE.IDS_TITLE_FTXTCNDelete;

        STEP DeleteConfirm
        {
            USES S-STEP "ClaimNotesRetrieve-O";

            # Display the key and ask for confirmation

        }


        # Action to Take if Confirm Cancelled

        IF action == "ACTION_BACK"
        {
            BRANCH RetrieveList;

        }

        # Return to STEP Confirm if changing Language

        STEP ACTION_DELETE
        {
            USES P-STEP "BF9673-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DeleteConfirm;


        BRANCH RetrieveList;

    }
}

