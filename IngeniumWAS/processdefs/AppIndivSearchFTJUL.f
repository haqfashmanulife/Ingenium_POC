# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppIndivSearchFTJUL.f                                         *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added new key fields for search                           *
#*  B00411  WBP      Added hyperlink check from client list                    *
#*  B10012  WBP      If SearchAgain is TRUE then we are returning because of a *
#*                   problem so display the error messages sent to us          *
#*  B10148  WBP      Postal Code was being defaulted by mistake                *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppIndivSearchFTJUL.s";
INCLUDE "AppIndivListFTJUL.s";
INCLUDE "BF2200-P.p";
INCLUDE "AppIndivCreateFTJUL.f";
INCLUDE "AppIndivUpdateFTJUL.f";

PROCESS AppIndivSearchFTJUL
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

    OUT MIR-CLI-ADDR-LOC-CD;

    OUT MIR-CLI-CRNT-LOC-CD;

    OUT MIR-CLI-CTRY-CD;


    # output a variable so that the main flow recognizes where the user
    # was last, for return action to this flow.

    OUT LastAction;

    OUT DataCorrection;

    OUT ReturnToList;


    # output values from this sub-flow, to the main flow.  These particular
    # values may be used to create a new client record if the user so desires.

    OUT Search-bth-dt;

    OUT Search-crnt-loc-cd;

    OUT Search-first-name;

    OUT Search-last-name;

    OUT Search-mid-init;

    OUT Search-pstl-cd;

    OUT Search-sex-cd;

    OUT Search-cli-addr-loc-cd;

    OUT Search-city-name;

    OUT Search-group-cd;
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
    original-cli-crnt-loc-cd = MIR-CLI-CRNT-LOC-CD;
    original-cli-ctry-cd = MIR-CLI-CTRY-CD;
    original-address-cd = MIR-CLI-ADDR-LOC-CD;

    # clear values each time a new search process is started to avoid
    # retention of data inadvertently.

    MIR-CLI-ENTR-SUR-NM = "";
    MIR-CLI-ENTR-GIV-NM = "";
    MIR-CLI-MID-INIT-NM = "";
    MIR-CLI-BTH-DT = "";
    MIR-CLI-SEX-CD = "";
    MIR-CLI-CRNT-LOC-CD = "";
    MIR-CLI-ADDR-LOC-CD = "";
    MIR-CLI-PSTL-CD = "";
    MIR-CLI-CITY-NM-TXT-T[1] = "";
    MIR-DV-SRCH-GR-CD = "";

    IF DataCorrection == "TRUE"
        BRANCH IndividualRetrieve;

    IF ReturnToList == "TRUE" || SearchAgain == "TRUE"
    {
        MIR-CLI-ENTR-SUR-NM = Search-last-name;
        MIR-CLI-ENTR-GIV-NM = Search-first-name;
        MIR-CLI-MID-INIT-NM = Search-mid-init;
        MIR-CLI-BTH-DT = Search-bth-dt;
        MIR-CLI-SEX-CD = Search-sex-cd;
        MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
        MIR-CLI-ADDR-LOC-CD = Search-cli-addr-loc-cd;
        MIR-CLI-PSTL-CD = Search-pstl-cd;
        MIR-CLI-CITY-NM-TXT-T[1] = Search-city-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;
        temp-msg-t = MESSAGES-T;

        BRANCH IndividualSearchProcess;

    }


    #*****************************************************************
    # Collect the criteria and filter for a client search
    #*****************************************************************

    STEP IndividualSearchInput
    {
        USES S-STEP "AppIndivSearchFTJUL";
        SearchTitle -> Title;
    }

    IF action == "ACTION_CANCEL"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;

        EXIT;

    }
    IF action == "ACTION_SEARCH"
        BRANCH IndividualSearchProcess;



    #*****************************************************************
    # Do the client search
    #*****************************************************************

    STEP IndividualSearchProcess
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

    Search-bth-dt = MIR-CLI-BTH-DT;
    Search-crnt-loc-cd = MIR-CLI-CRNT-LOC-CD;
    Search-first-name = MIR-CLI-ENTR-GIV-NM;
    Search-last-name = MIR-CLI-ENTR-SUR-NM;
    Search-mid-init = MIR-CLI-MID-INIT-NM;
    Search-sex-cd = MIR-CLI-SEX-CD;
    Search-client-addr-loc-cd = MIR-CLI-ADDR-LOC-CD;
    Search-city-name = MIR-CLI-CITY-NM-TXT-T[1];
    Search-group-cd = MIR-DV-SRCH-GR-CD;
    Search-co-nm = MIR-CLI-ENTR-CO-NM;
    Search-pstl-cd = MIR-CLI-PSTL-CD;
    Search-srch-ind = MIR-DV-CLI-NM-SRCH-IND;
    Search-giv-nm-srch-cd = MIR-DV-GIV-NM-SRCH-CD;
    Search-sur-nm-srch-cd = MIR-DV-SUR-NM-SRCH-CD;
    Search-prefct-txt = MIR-CLI-PREFCT-TXT;

    IF LSIR-RETURN-CD != "00"
        BRANCH IndividualSearchInput;


    # If there are no clients returned from the search, we are assuming
    # that a new client creation is the action the user wants
    # to take.

    IF MIR-DV-CLI-SRCH-QTY == "00"
        BRANCH IndividualCreate;

    IF SearchAgain == "TRUE"
    {
        MESSAGES-T = temp-msg-t;

    }


    #*****************************************************************
    # Display a list of all the clients returned by the search step
    #*****************************************************************

    STEP IndividualSearchList
    {
        USES S-STEP "AppIndivListFTJUL";
        ListTitle -> Title;
        "AppButtonBarSearchList" -> ButtonBar;
    }

    IF action == "ACTION_CANCEL" && ReturnToList == "TRUE"
    {
        ReturnToList = "FALSE";
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;

        BRANCH IndividualSearchInput;

    }
    IF action == "ACTION_CANCEL" && DataCorrection == "TRUE"
    {
        DataCorrection = "FALSE";
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;

        BRANCH IndividualSearchInput;

    }
    IF action == "ACTION_CANCEL"
    {
        LastAction = action;
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;


        #   BRANCH IndividualSearchInput;

        EXIT;

    }

    # the user has selected a client via the check box next to
    # do one of 2 things:  see more details for the client, or
    # attach the selected client to the application.

    IF action == "ACTION_DETAILS"
    {
        LastAction = action;
        MIR-CLI-ID = MIR-CLI-ID-T[index];

        BRANCH IndividualRetrieve;

    }
    IF action == "ACTION_ATTACH"
    {
        IF ReturnToList == "TRUE"
        {
            ReturnToList = "";

        }

        LastAction = action;
        MIR-CLI-ID = MIR-CLI-ID-T[index];

        STEP IndividualRetrieveForApplicationData
        {
            USES P-STEP "BF1220-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH IndividualSearchList;


        EXIT;

    }

    # the user has changed search criteria

    IF action == "ACTION_SEARCH"
        BRANCH IndividualSearchProcess;


    # the user indicates that a new client is to be added

    IF action == "ACTION_ADDCLIENT"
    {
        LastAction = action;

        BRANCH IndividualCreate;

    }
    IF action == "SelectItem"
    {
        LastAction = action;
        MIR-CLI-ID = MIR-CLI-ID-T[index];

        BRANCH IndividualRetrieve;

    }


    #*****************************************************************
    # Invoke sub-flows depending upon requirement to
    # create or update a client record.
    #*****************************************************************

    STEP IndividualCreate
    {
        USES PROCESS "AppIndivCreateFTJUL";
    }


    # Evaluate actions taken on the create page to determine
    # where to send the user next
    # if the user intentionally returns to the search process
    # from the add client sub-flow, then reset the
    # search input values to avoid the user keying them in again

    IF SearchAgain == "TRUE"
    {
        MIR-CLI-ENTR-SUR-NM = Search-last-name;
        MIR-CLI-ENTR-GIV-NM = Search-first-name;
        MIR-CLI-MID-INIT-NM = Search-mid-init;
        MIR-CLI-BTH-DT = Search-bth-dt;
        MIR-CLI-SEX-CD = Search-sex-cd;
        MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
        MIR-CLI-ADDR-LOC-CD = Search-cli-addr-loc-cd;
        MIR-CLI-CITY-NM-TXT-T[1] = Search-city-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;
        MIR-CLI-ENTR-CO-NM = Search-co-nm;
        MIR-CLI-PSTL-CD = Search-pstl-cd;
        MIR-DV-CLI-NM-SRCH-IND = Search-srch-ind;
        MIR-DV-GIV-NM-SRCH-CD = Search-giv-nm-srch-cd;
        MIR-DV-SUR-NM-SRCH-CD = Search-sur-nm-srch-cd;
        MIR-CLI-PREFCT-TXT = Search-prefct-txt;

        # reset this variable for next use

        SearchAgain = "FALSE";

        BRANCH IndividualSearchList;

    }
    IF LastAction == "ACTION_CANCEL"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;

        BRANCH IndividualSearchInput;

    }
    IF LastAction == "ACTION_OK"
        EXIT;


    STEP IndividualRetrieve
    {
        USES PROCESS "AppIndivUpdateFTJUL";
    }


    # Evaluate actions taken on the update page to determine
    # where to send the user next
    # if the sub-process for information retrieve fails to locate
    # the client record requested, produce the list page again
    # to enable the message display area.

    IF LastAction == "ClientRetrieveFailure"
        BRANCH IndividualSearchList;


    # if the user intentionally returns to the search process
    # from the add client sub-flow, then reset the
    # search input values to avoid the user keying them in again

    IF SearchAgain == "TRUE"
    {
        IF DataCorrection == "TRUE"
        {
            MIR-CLI-ID-T[1] = "";

        }

        MIR-CLI-ENTR-SUR-NM = Search-last-name;
        MIR-CLI-ENTR-GIV-NM = Search-first-name;
        MIR-CLI-MID-INIT-NM = Search-mid-init;
        MIR-CLI-BTH-DT = Search-bth-dt;
        MIR-CLI-SEX-CD = Search-sex-cd;
        MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
        MIR-CLI-ADDR-LOC-CD = Search-cli-addr-loc-cd;
        MIR-CLI-CITY-NM-TXT-T[1] = Search-city-name;
        MIR-DV-SRCH-GR-CD = Search-group-cd;
        MIR-CLI-ENTR-CO-NM = Search-co-nm;
        MIR-CLI-PSTL-CD = Search-pstl-cd;
        MIR-DV-CLI-NM-SRCH-IND = Search-srch-ind;
        MIR-DV-GIV-NM-SRCH-CD = Search-giv-nm-srch-cd;
        MIR-DV-SUR-NM-SRCH-CD = Search-sur-nm-srch-cd;
        MIR-CLI-PREFCT-TXT = Search-prefct-txt;

        # reset this variable for next use

        SearchAgain = "FALSE";

        BRANCH IndividualSearchList;

    }
    IF LastAction == "ACTION_CANCEL" || LastAction == "ACTION_OK"
    {
        MIR-CLI-ID = original-cli-id;
        MIR-DV-CLI-NM = original-cli-nm;
        MIR-CLI-CRNT-LOC-CD = original-cli-crnt-loc-cd;
        MIR-CLI-CTRY-CD = original-cli-ctry-cd;
        MIR-CLI-ADDR-LOC-CD = original-address-cd;

        BRANCH IndividualSearchList;

    }

    #    IF LastAction == "ACTION_OK"
    #        EXIT;

}

