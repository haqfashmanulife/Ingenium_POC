# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   MoneyMain.f                                                   *
#*  Description: Financial Snapshot used to provide a consolidated view        *
#*               of Owner policy funds                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016053  6.1      New for release 6.1                                       *
#*  016892  6.1.2    Fix presentation problems for pathfinder 1.2              *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*******************************************************************************
# Identify client by Client ID, Policy ID, or
# through Client Search.

INCLUDE "ServiceEntryPoint.f";

# Retrieve Policy Relationships for owner Client ID

INCLUDE "BF6940-P.p";

# Enhanced Client Owner Detail

INCLUDE "BF1008Money-O.s";
INCLUDE "BF1008-P.p";

# Quote single policy value detail

INCLUDE "BF1008Msg-O.s";
INCLUDE "MoneyDetail.f";

PROCESS MoneyMain
{

    # Primary key input to MoneyMain

  VARIABLES
  {
      IN MIR-CLI-ID;

    # If flow is called and Client ID is known, bypass input

    IN BypassInput;


    # Check for errors from PolicyOwner process

    IN LSIR-RETURN-CD;


    # Test user action from search or detail process

    IN ReturnAction;


    # Use date from MoneyDetail as quote effective date

    IN ReturnDate;


    # Return action to calling flow

    OUT LastAction;
  }

    Title = STRINGTABLE.IDS_TITLE_MoneyMain;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "MoneyButtonBar";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    OnePolicy = "FALSE";

    # Initialize the quote effective date if MoneyMain called from another flow

    MIR-APPL-CTL-PRCES-DT = SESSION.LSIR-PRCES-DT;

    IF BypassInput == "TRUE" && MIR-CLI-ID != ""
        BRANCH RetrievePolicyList;



    # Ask the user for Client ID, Policy ID, or allow option of client search

    STEP GetClient
    {
        USES PROCESS "ServiceEntryPoint";
        STRINGTABLE.IDS_TITLE_MoneyMain -> SearchTitle;
        STRINGTABLE.IDS_TITLE_MoneyMain -> ListTitle;
        ReturnAction <- LastAction;
    }

    IF ReturnAction == "ACTION_CANCEL"
    {
        LastAction = action;

        EXIT;

    }


    # Re-initialize the quote date to the Process Effective Date after each 'GetClient'

    MIR-APPL-CTL-PRCES-DT = SESSION.LSIR-PRCES-DT;

    IF ReturnAction == "ACTION_SUBMIT_CLIENTID" || ReturnAction == "ACTION_SELECT" || ReturnAction == "ACTION_SEARCH_CLIENT"
    {
        IF MIR-CLI-ID != ""
            BRANCH RetrievePolicyList;


        BRANCH GetClient;

    }
    IF ReturnAction == "ACTION_SUBMIT_POLICYID"
    {
        IF MIR-POL-ID-BASE != ""
            BRANCH PolicyOwner;


        BRANCH GetClient;

    }


    # Using one policy id, identify the owner client id

    STEP PolicyOwner
    {
        USES P-STEP "BF6940-P";
        MIR-CLI-ID <- MIR-CLI-ID-T[1];
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH GetClient;


    # Test the results to confirm a Client ID was returned. If not, return to the client search

    IF MIR-CLI-ID == ""
        BRANCH GetClient;



    # The Client ID has not been directly entered by the user. Save ID in session.

    SESSION.MIR-CLI-ID = MIR-CLI-ID;


    # The Owner Client ID should be known at this point.

    STEP RetrievePolicyList
    {
        USES P-STEP "BF1008-P";
    }


    # If errors are found for this client or if no policies are owned by this client,
    # display server messages

    IF LSIR-RETURN-CD != "00" || MIR-POL-ID-BASE-T[1] == ""
        BRANCH GetClient;



    # If only one policy is returned, go straight to Detail view

    OnePolicy = "FALSE";

    IF MIR-POL-ID-BASE-T[2] == ""
    {
        MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[1];
        MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[1];
        SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
        SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;
        OnePolicy = "TRUE";

        BRANCH PolicyDetail;

    }

    STEP DisplayPolicyList
    {
        USES S-STEP "BF1008Money-O";
        STRINGTABLE.IDS_TITLE_MoneyMain -> Title;
        "MoneyButtonBar" -> ButtonBar;
    }


    # MoneyButtonBar will provide links to other processes, but the actions will
    # be invoked through PageServer calls using a new window and will not set a 
    # page action.  This page will remain open for reference.
    # Selection of a policy will not be passed to the linked processes, as this
    # requires update of Session fields which can only be done if an action is to 
    # be tested in the flow.  Similar links are available in the Detail, but
    # will allow the policy id to be passed to the linked process.

    IF action == "ACTION_BACK"
    {
        IF ByPassInput == "TRUE"
        {
            LastAction = action;

            EXIT;

        }
        ELSE
        {
            MESSAGES-T[0] = "";

            BRANCH GetClient;

        }

    }
    IF action == "ACTION_EXIT"
        EXIT;


    # Intitial policy limit per client will be ten.  BF1008-P.p supports "More" as an option.
    # If "More" is desired as an option, BRANCH statement and process state code = "2" is required.
    # Default action is ACTION_NEXT = "Refresh Quote" 

    IF action == "ACTION_NEXT"
        BRANCH RetrievePolicyList;


    # If a policy was not selected, re-display the list

    IF index == "0" || action != "ACTION_DETAIL"
        BRANCH DisplayPolicyList;



    # Otherwise, the user has selected a policy.  Save the Policy ID for Quote Policy Detail
    # and in the session record

    MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
    MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];
    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;


    # Pass the date used for the summary quote to the detail quote
    # Return the date used for the detail quote to the summary quote

    STEP PolicyDetail
    {
        USES PROCESS "MoneyDetail";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MIR-APPL-CTL-PRCES-DT -> QuoteEffectiveDate;
        MIR-APPL-CTL-PRCES-DT <- ReturnDate;
    }

    IF ReturnAction == "ACTION_BACK"
    {
        IF OnePolicy == "TRUE"
        {
            MESSAGES-T[0] = "";

            BRANCH GetClient;

        }

        BRANCH RetrievePolicyList;

    }
    IF ReturnAction == "ACTION_CANCEL"
    {
        LastAction = action;

        EXIT;

    }
}

