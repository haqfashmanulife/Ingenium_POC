# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*********************************************************************************
#*  Component:   ClmClientSearch.f                                                                              
#*  Description:  Client Claim Search can be used to assign an insured
#*                           client id to session variable as well as assigning a 
#*                           claim id to a session variable                                                                            
#*                                                                             
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                                                                                 *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)                *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  BU3283  CTS      Commented the usage of table variables MIR-CLI-ID-T[0]    *
#*                   and MIR-CLI-BTH-DT-T[0] for search operation on           *
#*                   Client Claim Search-Claim List Screen                     *             
#*******************************************************************************
# Identify client by Client ID, Policy ID, or
# through Client Search.

INCLUDE "ClmEntryPolicy.s";

# P-step to get list of  insured for a policy

INCLUDE "BF8041-P.p";

# P-Step to get list of Master Claims for Client Id

INCLUDE "BF9244-P.p";
INCLUDE "ClmEntryList.s";

PROCESS ClmClientSearch
{

    # Check for errors from RetrieveInsuredList process

  VARIABLES
  {
    IN LSIR-RETURN-CD;

    # Test user action from search or detail process

    IN ReturnAction;



    # Return action to calling flow

    OUT LastAction;


    INOUT RestoreScreenIndicator;

    INOUT restoreMIR-CLI-ID;

    INOUT restoreMIR-POL-ID-BASE;

    INOUT restoreMIR-POL-IF-SFX;

    INOUT restoreMIR-CLI-ENTR-SUR-NM;

    INOUT restoreMIR-CLI-ENTR-GIV-NM;

    INOUT restoreMIR-DV-SRCH-GR-CD;

    INOUT restoreMIR-CLI-BTH-DT;

    INOUT restoreMIR-CLI-SEX-CD;

    INOUT restoreMIR-CLI-PSTL-CD;

    INOUT restoreMIR-CLI-CRNT-LOC-CD;

    INOUT restoreMIR-CLI-ADDR-LOC-CD;

    INOUT restoreMIR-CLI-CITY-NM-TXT;
  }

    Title = STRINGTABLE.IDS_TITLE_ClientClmSearch;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ClmButtonBarClientSrch";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    RestoreScreenIndicator = "NO";
    restoreMIR-CLI-ID = "";
    restoreMIR-POL-ID-BASE = "";
    restoreMIR-POL-ID-SFX = "";
    restoreMIR-CLI-ENTR-SUR-NM = "";
    restoreMIR-CLI-ENTR-GIV-NM = "";
    restoreMIR-DV-SRCH-GR-CD = "KJ";
    restoreEnhancedSearchIndicator = "";
    restoreMIR-CLI-BTH-DT = "";
    restoreMIR-CLI-SEX-CD = "";
    restoreMIR-CLI-PSTL-CD = "";
    restoreMIR-CLI-CRNT-LOC-CD = "";
    restoreMIR-CLI-ADDR-LOC-CD = "";
    restoreMIR-CLI-CITY-NM-TXT = "";

    # prevScreen is used to remember if the process last displayed a pol insrd list of a search screen

    PrevScreen = "";
    AllowSingleClientDisplay = "N";


    # Prompt  the user for Client ID, Policy ID, or allow option of client search
    #***************************************

    GetClient:


    # values passed back from the lst search process are passed back into the search
    # if the RestoreScreenIndicator is set to YES then the search will be resubmitted with these values
    # The search screen will be restored to display the same search criteria as was last used

    STEP GetClientStep
    {
        USES PROCESS "ClmClientNameSearch";
        STRINGTABLE.IDS_TITLE_ClientClmSearch -> SearchTitle;
        STRINGTABLE.IDS_TITLE_ClientClmSearch -> ListTitle;
        RestoreScreenIndicator -> RestoreScreenIndicator;
        restoreMIR-CLI-ID -> SavedIn-MIR-CLI-ID;
        restoreMIR-POL-ID-BASE -> SavedIn-MIR-POL-ID-BASE;
        restoreMIR-POL-ID-SFX -> SavedIn-MIR-POL-ID-SFX;
        restoreMIR-CLI-ENTR-SUR-NM -> SavedIn-MIR-CLI-ENTR-SUR-NM;
        restoreMIR-CLI-ENTR-GIV-NM -> SavedIn-MIR-CLI-ENTR-GIV-NM;
        restoreMIR-DV-SRCH-GR-CD -> SavedIn-MIR-DV-SRCH-GR-CD;
        restoreEnhancedSearchIndicator -> SavedIn-EnhancedSearchIndicator;
        restoreMIR-CLI-BTH-DT -> SavedIn-MIR-CLI-BTH-DT;
        restoreMIR-CLI-SEX-CD -> SavedIn-MIR-CLI-SEX-CD;
        restoreMIR-CLI-PSTL-CD -> SavedIn-MIR-CLI-PSTL-CD;
        restoreMIR-CLI-CRNT-LOC-CD -> SavedIn-MIR-CLI-CRNT-LOC-CD;
        restoreMIR-CLI-ADDR-LOC-CD -> SavedIn-MIR-CLI-ADDR-LOC-CD;
        restoreMIR-CLI-CITY-NM-TXT -> SavedIn-MIR-CLI-CITY-NM-TXT;
        RestoreScreenIndicator <- RestoreScreenIndicator;
        restoreMIR-CLI-ID <- SavedIn-MIR-CLI-ID;
        restoreMIR-POL-ID-BASE <- SavedIn-MIR-POL-ID-BASE;
        restoreMIR-POL-ID-SFX <- SavedIn-MIR-POL-ID-SFX;
        restoreMIR-CLI-ENTR-SUR-NM <- SavedIn-MIR-CLI-ENTR-SUR-NM;
        restoreMIR-CLI-ENTR-GIV-NM <- SavedIn-MIR-CLI-ENTR-GIV-NM;
        restoreMIR-DV-SRCH-GR-CD <- SavedIn-MIR-DV-SRCH-GR-CD;
        restoreEnhancedSearchIndicator <- SavedIn-EnhancedSearchIndicator;
        restoreMIR-CLI-BTH-DT <- SavedIn-MIR-CLI-BTH-DT;
        restoreMIR-CLI-SEX-CD <- SavedIn-MIR-CLI-SEX-CD;
        restoreMIR-CLI-PSTL-CD <- SavedIn-MIR-CLI-PSTL-CD;
        restoreMIR-CLI-CRNT-LOC-CD <- SavedIn-MIR-CLI-CRNT-LOC-CD;
        restoreMIR-CLI-ADDR-LOC-CD <- SavedIn-MIR-CLI-ADDR-LOC-CD;
        restoreMIR-CLI-CITY-NM-TXT <- SavedIn-MIR-CLI-CITY-NM-TXT;
        ReturnAction <- LastAction;
    }

    PrevScreen = "SearchScreen";

    IF ReturnAction == "ACTION_CANCEL"
    {
        LastAction = action;

        EXIT;

    }
    IF ReturnAction == "ACTION_SELECT"
    {

        #      user has selected a client from the search sceen, 
        #      session variable has been set

        LastAction = action;

        EXIT;

    }
    IF ReturnAction == "ACTION_DATALIST"
    {
        IF MIR-CLI-ID != ""
        {
            RestoreScreenIndicator = "YES";

            BRANCH RetrieveClaimList;

        }

        BRANCH GetClient;

    }
    IF ReturnAction == "ACTION_SUBMIT_CLIENTID" || ReturnAction == "ACTION_SEARCH_CLIENT"
    {
        IF ReturnAction == "ACTION_SEARCH_CLIENT"
            RestoreScreenIndicator = "YES";

        ELSE
            RestoreScreenIndicator = "NO";

        IF MIR-CLI-ID != ""
            BRANCH RetrieveClaimList;

        ELSE
            BRANCH GetClient;


    }
    IF ReturnAction == "ACTION_SUBMIT_POLICYID"
    {
        IF MIR-POL-ID-BASE != ""
        {
            RestoreScreenIndicator = "NO";

            BRANCH RetrievePolicyInsureds;

        }

        BRANCH GetClient;

    }


    #***************************************

    STEP RetrievePolicyInsureds
    {
        USES P-STEP "BF8041-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH GetClient;


    STEP GetPolicyStatus
    {
        USES P-STEP "BF6920-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }
    IF MIR-CLI-ID-T[1] != "" && MIR-CLI-ID-T[2] == "" && AllowSingleClientDisplay == "N"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[1];
        PrevScreen = "PolicyInsuredList";

        BRANCH RetrieveClaimList;

    }

    AllowSingleClientDisplay = "N";

    STEP DisplayPolicyInsuredList
    {
        USES S-STEP "ClmEntryPolicy";
        STRINGTABLE.IDS_TITLE_ClientClmSearchPolicy -> Title;
        "ClmButtonBarEntryPolicy" -> ButtonBar;
    }

    PrevScreen = "PolicyInsuredList";

    IF action == "ACTION_DATALIST"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[index];

        BRANCH RetrieveClaimList;

    }
    IF action == "ACTION_SELECT"
    {
        MIR-CLI-ID = MIR-CLI-ID-T[index];
        SESSION.MIR-CLI-ID = MIR-CLI-ID;

        EXIT;

    }
    IF action == "ACTION_SEARCH"
    {
        MESSAGES-T[0] = "";
        MIR-CLI-ID-T[0] = "";
        MIR-CLI-BTH-DT-T[0] = "";

        BRANCH GetClient;

    }
    IF action == "ACTION_EXIT" || action == "ACTION_CANCEL"
        EXIT;



    #***************************************            

    RetrieveClaimList:


    # first time through we are after all of the claims

    MIR-DV-MORE-CLM-ID = "99999999";


    #***************************************

    RetrieveClaimListMore:

    SESSION.MIR-CLI-ID = MIR-CLI-ID;

    STEP BF9244
    {
        USES P-STEP "BF9244-P";
    }

    IF LSIR-RETURN-CD != "00" || MIR-CLI-ID == ""
        BRANCH GetClient;



    # there are 2 button bars for the screen, with and without the MORE

    IF MIR-DV-MORE-CLM-IND == "Y"
        ClmListButtonBar = "ClmButtonBarClmListMore";

    ELSE
        ClmListButtonBar = "ClmButtonBarClmList";



    #***************************************         

    STEP DisplayMasterClaimList
    {
        USES S-STEP "ClmEntryList";
        STRINGTABLE.IDS_TITLE_ClientClmSearchClaim -> Title;
        ClmListButtonBar -> ButtonBar;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to Client search screen.

    IF action == "ACTION_PREVIOUS" && PrevScreen == "PolicyInsuredList"
    {
        MESSAGES-T[0] = "";
        RestoreScreenIndicator = "NO";
        AllowSingleClientDisplay = "Y";

        BRANCH RetrievePolicyInsureds;

    }
    IF action == "ACTION_PREVIOUS" && PrevScreen != "PolicyInsuredList"
    {
        MESSAGES-T[0] = "";

        BRANCH GetClient;

    }
    IF action == "ACTION_CANCEL"
        EXIT;

    IF action == "ACTION_SELECT" && index != "0"
    {
        SESSION.MIR-CLI-ID = MIR-CLI-ID;
        SESSION.MIR-CLM-ID = MIR-CLMA-CLM-ID-T[index];

        EXIT;

    }
    IF action == "ACTION_SEARCH"
    {
        RestoreScreenIndicator = "NO";
        MESSAGES-T[0] = "";
    # Changes for BU3283 begin   
    #    MIR-CLI-ID-T[0] = "";
    #    MIR-CLI-BTH-DT-T[0] = "";
    # Changes for BU3283 end       

        BRANCH GetClient;

    }
    IF action == "ACTION_MORE"
        BRANCH RetrieveClaimListMore;



    # If a Claim was not selected, re-display the list

    BRANCH DisplayMasterClaimList;
}

