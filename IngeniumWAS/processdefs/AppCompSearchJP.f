# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCompSearchJP.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added new search key fields                               *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppCompSearchJP.s";
INCLUDE "AppCompListJP.s";
INCLUDE "BF2200-P.p";
INCLUDE "AppCompCreateJP.f";
INCLUDE "AppCompUpdateJP.f";

PROCESS AppCompSearchJP
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
    IN SearchTitle;
    IN ListTitle;


    # input a variable that identifies if the user is returning to the
    # search from the add or edit client sub-flow

    IN SearchAgain;



    # output values from this sub-flow, to the main flow.  These values
    # will be used in the main flow for processing or evaluation.

    OUT MIR-CLI-ID;

    OUT MIR-DV-CLI-NM;

    OUT MIR-CLI-TAX-ID;


    # output values from this sub-flow, to the main flow.  These particular
    # values may be used to create a new client record if the user so desires.

    OUT Search-crnt-loc-cd;

    OUT Search-comp-name;

    OUT Search-zip-cd;

    OUT Search-tax-id;

    OUT Search-JP-address-code;

    OUT Search-city-name;

    OUT Searh-group-cd;
  }

    Title = "Select a Client or Search again";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarSearch";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # preserve values that may arrive in this flow if the user
    # has returned to the search process more than once.  These
    # values will be used to reset the original values if the
    # user decides to cancel out of any updates and wants to
    # return to the main flow

    original-cli-id = MIR-CLI-ID;
    original-cli-nm = MIR-DV-CLI-NM;
    original-cli-tax-id = MIR-CLI-TAX-ID;

    # clear values each time a new search process is started to avoid
    # retention of data inadvertently.

    MIR-CLI-ENTR-CO-NM = "";
    MIR-CLI-TAX-ID = "";
    MIR-CLI-PSTL-CD = "";
    MIR-CLI-CRNT-LOC-CD = "";
    MIR-CLI-JP-ADDR-CD = "";
    MIR-CLI-CITY-NM-TXT = "";
    MIR-DV-SRCH-GR-CD = "";


    #*****************************************************************
    # Collect the criteria and filter for a client search
    #*****************************************************************

    STEP CompanySearchInput
    {
        USES S-STEP "AppCompSearchJP";
        SearchTitle -> Title;
    }

    IF action == "ACTION_CANCEL"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-TAX-ID = original-cli-tax-id;

        EXIT;

    }
    IF action == "ACTION_SEARCH"
        BRANCH CompanySearchProcess;



    #*****************************************************************
    # Do the client search
    #*****************************************************************

    STEP CompanySearchProcess
    {
        USES P-STEP "BF2200-P";
        "N" -> MIR-DV-CLI-NM-SRCH-IND;
        "E" -> MIR-DV-GIV-NM-SRCH-CD;
        "E" -> MIR-DV-SUR-NM-SRCH-CD;
        "C" -> MIR-CLI-SEX-CD;
    }


    # assign temporary variables to hold the user search
    # criteria for later re-use, should the user return
    # back to a search page.  This preserves their original
    # search criteria.

    Search-crnt-loc-cd = MIR-CLI-CRNT-LOC-CD;
    Search-comp-name = MIR-CLI-ENTR-CO-NM;
    Search-zip-cd = MIR-CLI-PSTL-CD;
    Search-tax-id = MIR-CLI-TAX-ID;
    Search-JP-address-code = MIR-CLI-JP-ADDR-CD;
    Search-city-name = MIR-CLI-CITY-NM-TXT;
    Search-group-cd = MIR-DV-SRCH-GR-CD;

    IF LSIR-RETURN-CD != "00"
        BRANCH CompanySearchInput;


    # If there are no clients returned from the search, we are assuming
    # that a new client creation is the action the user wants
    # to take.

    IF MIR-DV-CLI-SRCH-QTY == "00"
        BRANCH CompanyCreate;


    # if only 1 client matched the criteria, assume that we have found
    # the proper client record, send the user to the input page.
    # retrieving the client information first.

    IF MIR-DV-CLI-SRCH-QTY == "01"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[1];

        BRANCH CompanyRetrieve;

    }


    #*****************************************************************
    # Display a list of all the clients returned by the search step
    #*****************************************************************

    STEP CompanySearchList
    {
        USES S-STEP "AppCompListJP";
        ListTitle -> Title;
        "AppButtonBarSearchList" -> ButtonBar;
    }

    IF action == "ACTION_CANCEL"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-TAX-ID = original-cli-tax-id;

        EXIT;

    }

    # the user has selected a client via the check box next to
    # do one of 2 things:  see more details for the client, or
    # attach the selected client to the application.

    IF action == "ACTION_DETAILS"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[index];

        BRANCH CompanyRetrieve;

    }
    IF action == "ACTION_ATTACH"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[index];
        MIR-CLI-TAX-ID = MIR-CLI-TAX-ID-T[index];
        MIR-DV-CLI-NM = MIR-DV-CLI-NM-T[index];

        EXIT;

    }

    # the user has changed search criteria

    IF action == "ACTION_SEARCH"
        BRANCH CompanySearchProcess;


    # the user indicates that a new client is to be added

    IF action == "ACTION_ADDCLIENT"
        BRANCH CompanyCreate;



    #*****************************************************************
    # Invoke sub-flows depending upon requirement to
    # create or update a client record.
    #*****************************************************************

    STEP CompanyCreate
    {
        USES PROCESS "AppCompCreateJP";
    }


    # Evaluate actions taken on the create page to determine
    # where to send the user next
    # if the user intentionally returns to the search process
    # from the add client sub-flow, then reset the
    # search input values to avoid the user keying them in again

    IF SearchAgain == "TRUE"
    {
        MIR-CLI-ENTR-CO-NM = Search-comp-name;
        MIR-CLI-TAX-ID = Search-tax-id;
        MIR-CLI-PSTL-CD = Search-zip-cd;
        MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
        MIR-CLI-JP-ADDR-CD = Search-JP-address-code;
        MIR-CLI-CITY-NM-TXT = Search-city-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;

        # reset this variable for next use

        SearchAgain = "FALSE";

        BRANCH CompanySearchList;

    }
    IF LastAction == "ACTION_CANCEL"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-TAX-ID = original-cli-tax-id;

        EXIT;

    }
    IF LastAction == "ACTION_OK"
        EXIT;


    STEP CompanyRetrieve
    {
        USES PROCESS "AppCompUpdateJP";
    }


    # Evaluate actions taken on the update page to determine
    # where to send the user next
    # if the sub-process for information retrieve fails to locate
    # the client record requested, produce the list page again
    # to enable the message display area.

    IF LastAction == "ClientRetrieveFailure"
        BRANCH CompanySearchList;


    # if the user intentionally returns to the search process
    # from the add client sub-flow, then reset the
    # search input values to avoid the user keying them in again

    IF SearchAgain == "TRUE"
    {
        IF DataCorrection == "TRUE"
        {
            MIR-CLI-ID-T[1] = "";

        }

        MIR-CLI-ENTR-CO-NM = Search-comp-name;
        MIR-CLI-TAX-ID = Search-tax-id;
        MIR-CLI-PSTL-CD = Search-zip-cd;
        MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
        MIR-CLI-JP-ADDR-CD = Search-JP-address-code;
        MIR-CLI-CITY-NM-TXT = Search-city-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;

        # reset this variable for next use

        SearchAgain = "FALSE";

        BRANCH CompanySearchList;

    }
    IF LastAction == "ACTION_CANCEL"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-TAX-ID = original-cli-tax-id;

        EXIT;

    }
    IF LastAction == "ACTION_OK"
        EXIT;

}

