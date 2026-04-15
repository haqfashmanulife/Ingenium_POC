# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   ClmClientNameSearch.f                                         *
#*  Description:   performs client name search                                 *
#*                                                                                                                                 *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                                                                               *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)                *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "ClmEntrySearch.s";
INCLUDE "BF2200-P.p";
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END

PROCESS ClmClientNameSearch
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
    IN SearchTitle;

    IN ListTitle;


    INOUT RestoreScreenIndicator;

    INOUT SavedIn-MIR-CLI-ID;

    INOUT SavedIn-MIR-POL-ID-BASE;

    INOUT SavedIn-MIR-POL-IF-SFX;

    INOUT SavedIn-MIR-CLI-ENTR-SUR-NM;

    INOUT SavedIn-MIR-CLI-ENTR-GIV-NM;

    INOUT SavedIn-MIR-DV-SRCH-GR-CD;

    INOUT SavedIn-EnhancedSearchIndicator;

    INOUT SavedIn-MIR-CLI-BTH-DT;

    INOUT SavedIn-MIR-CLI-SEX-CD;

    INOUT SavedIn-MIR-CLI-PSTL-CD;

    INOUT SavedIn-MIR-CLI-CRNT-LOC-CD;

    INOUT SavedIn-MIR-CLI-ADDR-LOC-CD;

    INOUT SavedIn-MIR-CLI-CITY-NM-TXT;



    # output values from this sub-flow, to the main flow.  These values
    # will be used in the main flow for processing or evaluation.

    OUT MIR-CLI-ID;

    OUT MIR-POL-ID-BASE;

    OUT MIR-POL-ID-SFX;


    # output a variable so that the main flow recognizes where the user
    # was last, for return action to this flow.

    OUT LastAction;
  }

    Title = "Select a Client or Search again";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ClmButtonBarClientSearchInitial";
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

    IF RestoreScreenIndicator != "YES"
    {
        MIR-CLI-ENTR-SUR-NM = "";
        MIR-CLI-ENTR-GIV-NM = "";
        MIR-CLI-BTH-DT = "";
        MIR-CLI-SEX-CD = "";
        MIR-CLI-PSTL-CD = "";
        MIR-CLI-CRNT-LOC-CD = "";
        MIR-CLI-ADDR-LOC-CD = "";
        MIR-CLI-CITY-NM-TXT = "";
        index = "00";

        BRANCH InitialPageInput;

    }
    ELSE
    {
        MIR-CLI-ID = SavedIn-MIR-CLI-ID;
        MIR-POL-ID-BASE = SavedIn-MIR-POL-ID-BASE;
        MIR-POL-IF-SFX = SavedIn-MIR-POL-IF-SFX;
        MIR-CLI-ENTR-SUR-NM = SavedIn-MIR-CLI-ENTR-SUR-NM;
        MIR-DV-SRCH-GR-CD = SavedIn-MIR-DV-SRCH-GR-CD;
        EnhancedSearchIndicator = SavedIn-EnhancedSearchIndicator;
        MIR-CLI-ENTR-GIV-NM = SavedIn-MIR-CLI-ENTR-GIV-NM;
        MIR-CLI-BTH-DT = SavedIn-MIR-CLI-BTH-DT;
        MIR-CLI-SEX-CD = SavedIn-MIR-CLI-SEX-CD;
        MIR-CLI-PSTL-CD = SavedIn-MIR-CLI-PSTL-CD;
        MIR-CLI-CRNT-LOC-CD = SavedIn-MIR-CLI-CRNT-LOC-CD;
        MIR-CLI-ADDR-LOC-CD = SavedIn-MIR-CLI-ADDR-LOC-CD;
        MIR-CLI-CITY-NM-TXT = SavedIn-MIR-CLI-CITY-NM-TXT;

        BRANCH InitialSearchProcess;

    }


    #*****************************************************************
    # Collect the criteria and filter for a client search
    #*****************************************************************

    STEP InitialPageInput
    {
        USES S-STEP "ClmEntrySearch";
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


    # save search criteria in case user chooses "previous" to return to this screen

    SavedIn-MIR-CLI-ID = MIR-CLI-ID;
    SavedIn-MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SavedIn-MIR-POL-IF-SFX = MIR-POL-IF-SFX;
    SavedIn-MIR-CLI-ENTR-SUR-NM = MIR-CLI-ENTR-SUR-NM;
    SavedIn-MIR-CLI-ENTR-GIV-NM = MIR-CLI-ENTR-GIV-NM;
    SavedIn-MIR-DV-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
    SavedIn-EnhancedSearchIndicator = EnhancedSearchIndicator;
    SavedIn-MIR-CLI-BTH-DT = MIR-CLI-BTH-DT;
    SavedIn-MIR-CLI-SEX-CD = MIR-CLI-SEX-CD;
    SavedIn-MIR-CLI-PSTL-CD = MIR-CLI-PSTL-CD;
    SavedIn-MIR-CLI-CRNT-LOC-CD = MIR-CLI-CRNT-LOC-CD;
    SavedIn-MIR-CLI-ADDR-LOC-CD = MIR-CLI-ADDR-LOC-CD;
    SavedIn-MIR-CLI-CITY-NM-TXT = MIR-CLI-CITY-NM-TXT;


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

    IF MIR-DV-CLI-SRCH-QTY == "01" && RestoreScreenIndicator == "YES"
    {

        #   reset the RestoreScreenIndicator so that the subsequent search 
        #   returning a single row will go straight onto Claims List

        RestoreScreenIndicator = "NO";

        BRANCH SearchList;

    }
    IF MIR-DV-CLI-SRCH-QTY == "01"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[1];
        LastAction = action;

        EXIT;

    }

    # 3.  multiple clients match the search criteria and user intervention
    # is required to select 1 of the clients, or re-enter search criteria.

    IF MIR-DV-CLI-SRCH-QTY > "01"
        BRANCH SearchList;



    #*****************************************************************
    # Display a list of all the clients returned by the search step
    #****************************************************************

    SearchList:

    RestoreScreenIndicator = "NO";

    STEP SearchListStep
    {
        USES S-STEP "ClmEntrySearch";
        ListTitle -> Title;
        "ClmButtonBarClientSearch" -> ButtonBar;
    }

    # if the user has selected a client, set the client id value,
    # preserve the action taken, and exit the process.

    IF action == "ACTION_SUBMIT_CLIENTID"
    {
        IF MIR-CLI-ID == "" || MIR-CLI-ID == " "
            BRANCH SearchList;

        ELSE
        {
            LastAction = action;

            EXIT;

        }

    }
    IF action == "ACTION_SUBMIT_POLICYID"
    {
        IF MIR-POL-ID-BASE == "" || MIR-POL-ID-BASE == " "
            BRANCH SearchList;

        ELSE
        {
            LastAction = action;

            EXIT;

        }

    }
    IF action == "ACTION_SELECT" || action == "ACTION_DATALIST"
    {
        LastAction = action;
        MIR-CLI-ID = MIR-CLI-ID-T[index];
        SESSION.MIR-CLI-ID = MIR-CLI-ID;

        EXIT;

    }
    IF action == "ACTION_SEARCH_CLIENT"
    {
        MIR-CLI-ID-T[0] = "";

        BRANCH InitialSearchProcess;

    }
    IF action == "ACTION_CANCEL"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-POL-ID-BASE = original-pol-id-base;
        MIR-POL-ID-SFX = original-pol-id-sfx;

        EXIT;

    }
}

