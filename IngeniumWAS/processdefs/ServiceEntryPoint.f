# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   ServiceEntryPoint.f                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added Language Group Code to search key                   * 
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "ServiceEntryPoint.s";
INCLUDE "BF2200-P.p";

PROCESS ServiceEntryPoint
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
    IN SearchTitle;

    IN ListTitle;


    # output values from this sub-flow, to the main flow.  These values
    # will be used in the main flow for processing or evaluation.

    OUT MIR-CLI-ID;

    OUT MIR-POL-ID-BASE;

    OUT MIR-POL-ID-SFX;


    # output a variable so that the main flow recognizes where the user
    # was last, for return action to this flow.

    OUT LastAction;

    OUT ReturnToIdentification;


    # output values from this sub-flow, to the main flow.  These particular
    # values may be used to save the search criteria for a return to the flow.

    OUT Search-first-name;

    OUT Search-last-name;

    OUT Search-group-cd;
  }

    Title = "Select a Client or Search again";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ServiceInitialButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # preserve values that may arrive in this flow if the user
    # has returned to the search process more than once.  These
    # values will be used to reset the original values if the
    # user decides to cancel out of any updates and wants to
    # return to the main flow

    original-cli-id = MIR-CLI-ID;
    original-pol-id-base = MIR-POL-ID-BASE;
    original-pol-id-sfx = MIR-POL-ID-SFX;

    # clear values each time a new search process is started to avoid
    # retention of data inadvertently.

    MIR-CLI-ENTR-SUR-NM = " ";
    MIR-CLI-ENTR-GIV-NM = " ";
    MIR-CLI-MID-INIT-NM = " ";
    MIR-CLI-TAX-ID = " ";
    MIR-CLI-BTH-DT = " ";
    MIR-CLI-SEX-CD = " ";
    MIR-CLI-PSTL-CD = " ";
    MIR-CLI-CRNT-LOC-CD = " ";
    MIR-CLI-JP-ADDR-CD = " ";
    MIR-CLI-CITY-NM-TXT = " ";
    index = "00";

    IF ReturnToIdentification == "TRUE"
    {
        ReturnToIdentification = "FALSE";
        MIR-CLI-ENTR-SUR-NM = Search-last-name;
        MIR-CLI-ENTR-GIV-NM = Search-first-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;

        IF MIR-CLI-ENTR-SUR-NM == ""
            BRANCH InitialPageInput;


        BRANCH InitialSearchProcess;

    }


    #*****************************************************************
    # Collect the criteria and filter for a client search
    #*****************************************************************

    STEP InitialPageInput
    {
        USES S-STEP "ServiceEntryPoint";
        SearchTitle -> Title;
    }

 #UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH InitialPageInput;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

 #UY3004 CHANGES END
 
    IF action == "ACTION_CANCEL"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-POL-ID-BASE = original-pol-id-base;
        MIR-POL-ID-SFX = original-pol-id-sfx;

        EXIT;

    }
    IF action == "ACTION_SUBMIT_CLIENTID" || action == "ACTION_SUBMIT_POLICYID"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_SEARCH_CLIENT"
    {
        BRANCH InitialSearchProcess;

    }


    # if user has not selected a defined action button, then by default
    # execute a client search.
    # the server will react with messages to indicate the user
    # should enter a minimum of last name for a search, and we
    # will rely upon user to take corrective action.
    #******************************************************************
    # Do the client search
    #*****************************************************************

    STEP InitialSearchProcess
    {
        USES P-STEP "BF2200-P";
        "Y" -> MIR-DV-CLI-NM-SRCH-IND;
        "E" -> MIR-DV-GIV-NM-SRCH-CD;
        "E" -> MIR-DV-SUR-NM-SRCH-CD;

        # Values for first and last name switching, as well as
        # phonetic versus exact name matches are being set here
        # to prevent confusion on their use by the user.
        # This provides for a more conservative output list,
        # which may be altered readily by clients.

    }


    # assign temporary variables to hold the user search
    # criteria for later re-use, should the user return
    # back to a search page.  This preserves their original
    # search criteria.

    Search-first-name = MIR-CLI-ENTR-GIV-NM;
    Search-last-name = MIR-CLI-ENTR-SUR-NM;
    Search-group-cd = MIR-DV-SRCH-GR-CD;


    # if we have forced a search because the user entered no data at all
    # on the initial page, the server will respond with a message.  this
    # will be interpretted as a failure and the user will be sent back
    # to the initial page.

    IF LSIR-RETURN-CD != "00"
        BRANCH InitialPageInput;


    # 3 outcomes are possible from a search:
    # 1.  if there are no clients returned from the search, return the
    # user to the initial search page for further refinement

    IF MIR-DV-CLI-SRCH-QTY == "00"
        BRANCH InitialPageInput;


    # 2.  if only 1 client matched the criteria, assume that we have found
    # the proper client record, set the individual client id field,
    # preserve the action, and exit the process.  if however, the user
    # was returning to this list from a search where only 1 client had
    # been found, then display the single entry on the search list
    # step below.  without this, the user will be in a loop from the main
    # flow.

    IF MIR-DV-CLI-SRCH-QTY == "01" && ReturnToIdentification == "FALSE"
    {
        BRANCH SearchList;

    }
    IF MIR-DV-CLI-SRCH-QTY == "01"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[1];
        LastAction = action;
        ReturnToIdentification = "";

        EXIT;

    }

    # 3.  multiple clients match the search criteria and user intervention
    # is required to select 1 of the clients, or re-enter search criteria.

    IF MIR-DV-CLI-SRCH-QTY > "01"
        BRANCH SearchList;



    #*****************************************************************
    # Display a list of all the clients returned by the search step
    #*****************************************************************

    STEP SearchList
    {
        USES S-STEP "ServiceEntryPoint";
        ListTitle -> Title;
        "ServiceListButtonBar" -> ButtonBar;
    }

    # if the user has selected a client, set the client id value,
    # preserve the action taken, and exit the process.

    IF action == "ACTION_SUBMIT_CLIENTID" || action == "ACTION_SUBMIT_POLICYID"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_SELECT"
    {
        LastAction = action;
        MIR-CLI-ID = MIR-CLI-ID-T[index];
        ReturnToIdentification = "";

        EXIT;

    }

    # if the user has requested another search (presumably because
    # they have narrowed or revised the search criteria), check that
    # they have completed entries to the required search fields.
    # if so, invoke the search again.
    # if not, the same rationale as above is used.
    # check to see if entries exist in either of the policy or client
    # id fields, and if not, re-attempt a search with no data.
    # same server response as above will force user to take corrective
    # action.  if entries do exist in policy and/or client id fields
    # retain that data and exit the process.

    IF action == "ACTION_SEARCH_CLIENT"
    {
        BRANCH InitialSearchProcess;

    }

    # if cancelling out of this subprocess, check to see if the user
    # had come here as a result of a Previous button on the main flow
    # page.  upon arriving back in this flow from that main flow
    # the ReturnToIdentification field will have a false value by the
    # time this part of the flow is executed.  this signifies that we should
    # preserve the original values that arrived in this flow, and exit.
    # the main flow should then evaluate if it should really exit, or simply
    # return to the point where a previous invocation was attempted.  only
    # the value of false needs to be tested for ReturnToIdentification.

    IF action == "ACTION_CANCEL" && ReturnToIdentification == "FALSE"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-POL-ID-BASE = original-pol-id-base;
        MIR-POL-ID-SFX = original-pol-id-sfx;

        EXIT;

    }

    # on any original trip through this flow, or on a return trip where
    # the user has not indicated preservation of data was required,
    # the ReturnToIdentification field will have a blank value.

    IF action == "ACTION_CANCEL"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-POL-ID-BASE = original-pol-id-base;
        MIR-POL-ID-SFX = original-pol-id-sfx;

        EXIT;

    }
}

