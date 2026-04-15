# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   AppMainFTJUL                                                  *
#*  Description:  Cloned from AppMainJPUL                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016824  611J     Move Effective date fields to Application Data page       *
#*  01NB01  GW       New App. Entry Flow for Family Term Japan.                *
#*  B00418  WBP      Fix flow going back from ApplicationAnalysisDisplay       *
#*  B00442  WBP      Save Servicing Agent ID for moving between screens        *
#*  B00454  WBP      Add in AppBF8002 (Policy Update) later in process         *
#*  B00457  WBP      When processing Owner check LastAction instead of action  *
#*  B00631  WBP      Fix Payor ID going into Billing screen                    *
#*  B10012  WBP      Set SearchAgain for other P-steps                         *
#*  P00251  EKM      Add error check after BF1222-P step.                      *
#*  02PR62  DPK      Joint to Single Change - Add Connected Policy Screen      *
#*  1CNB02  EKM      Add Conversion Policy Processing.                         *
#*  PR006Q  FB       Add Old Policy Information Processing (MY KEMPO)          *
#*  PF22    BMB      SendMessages = "NO" removed from Step ACTION_ADD as per D4*
#*  UCPUPL  SC       UCP Upload - fix a production error                       *
#*                   change MIR-POL-ID-BASE -> MIR-POL-ID;                     *
#*                       to MIR-POL-ID-BASE -> MIR-POL-ID-BASE;                *
#*  MFFFU4  ACR      add new process OwnerUnderwriting                         *
#*  NWLUWW  CTS      TO LIST ALL PRODUCTS UNDER PRODUCT DROP DOWN              *   
#*  M142S1  CTS      CHANGES TO HANDLE SPLIT POLICY                            *
#*  Q09507  CTS      M142S1 - CHANGES TO DISPLAY ERROR FOR POLICYHOLDER        *
#*                   RELATIONSHIP FIELD WHEN IT IS LEFT BLANK                  *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  C22579  CTS      CODE FIX TO AVOID DELETION OF CLIENT BANK DETAILS FROM    *
#*                   TCLIB TABLE WHILE CREATING SPLIT POLICY                   *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  CR1848  CTS      CHANGES FOR COUPON ACCOUNT INFORMATION                    *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

INCLUDE "AppApplicationDataFTJUL.s";
INCLUDE "AppIndivSearchFTJUL.f";
INCLUDE "AppCompSearchJP.f";
INCLUDE "BF8001-P.p";
INCLUDE "BF8026-P.p";
INCLUDE "BF1651-P.p";
INCLUDE "BF1652-P.p";
INCLUDE "AppBF8002-P.p";
INCLUDE "AppPolicyDataFTJUL.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8024-P.p";
INCLUDE "AppBF8025-P.p";
INCLUDE "BF8004-P.p";
INCLUDE "AppAllocationsUL.f";
INCLUDE "AppConnectedPolicy.s";
INCLUDE "AppBillingFTJUL.s";
INCLUDE "AppInsuredFTJUL.f";
INCLUDE "BF0591-P.p";
INCLUDE "AppAnalysisJPUL.s";
INCLUDE "AppAgentSearch.f";
INCLUDE "AppSignaturesFTJ.s";
INCLUDE "AppBene.f";
INCLUDE "AppCwaFTJUL.f";
INCLUDE "BF1220-P.p";
INCLUDE "BF1222-P.p";
INCLUDE "BF9842Update.f";
INCLUDE "AppOwnerUW.f";

PROCESS AppMainFTJUL
{
    Title = "Application Entry";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    MIR-POL-CLI-INSRD-CD-T[1] = "SAME";

    #**************************************************************** 
    # Collect Application data.  This includes information to filter
    # a product selection box. 
    #                             
    #**************************************************************** 

    MIR-POL-APP-RECV-DT = LSIR-PRCES-DT;
    #NWLUWW changes starts Here
    #MIR-APP-FORM-TYP-ID = "L";
    #NWLUWW Changes end Here
    MIR-SBSDRY-CO-ID = "S1";
    MIR-POL-ISS-LOC-CD = "41";
    MIR-POL-APP-REASN-CD = "NB";

    STEP ApplicationDataInput
    {
        USES S-STEP "AppApplicationDataFTJUL";
        STRINGTABLE.IDS_TITLE_AppApplicationData -> Title;
        "50000" -> MIR-PLAN-ID;
    }

    IF action == "ACTION_CANCEL"
        EXIT;

    IF action == "ACTION_OK"
        BRANCH IndividualSearchPrimaryOwner;



    #*****************************************************************
    # Collect Client Search information.  A sub-process will be
    # invoked to allow for re-use. Returning from the search will be
    # a client number that can be retained for later use.
    #*****************************************************************

    STEP IndividualSearchPrimaryOwner
    {
        USES PROCESS "AppIndivSearchFTJUL";
        STRINGTABLE.IDS_TITLE_AppSearchIndivOwner -> SearchTitle;
        STRINGTABLE.IDS_TITLE_AppListIndivOwner -> ListTitle;
        STRINGTABLE.IDS_TITLE_AppCreateIndivOwner -> CreateTitle;
        STRINGTABLE.IDS_TITLE_AppUpdateIndivOwner -> UpdateTitle;

        # send values to the sub-flow for preservation
        # of data should the user cancel from that sub-flow

        MIR-INSRD-CLI-ID-T[1] -> MIR-CLI-ID;
        MIR-DV-INSRD-CLI-NM -> MIR-DV-CLI-NM;

        # return values from search and assign to insured values

        MIR-INSRD-CLI-ID-T[1] <- MIR-CLI-ID;
        MIR-DV-INSRD-CLI-NM <- MIR-DV-CLI-NM;
    }


    # if the user had cancelled the search process because they inadvertently
    # initiated the flow, exit the flow entirely.  But if the user has
    # re-executed the search sub-process to correct errors,(or whatever...)
    # but then cancelled out of that process, return to the point where
    # they asked for the correction in the first place.

    IF ReturnToList == "FALSE" || DataCorrection == "FALSE"
    {
        ReturnToList = "";
        DataCorrection = "";

    }
    IF LastAction == "ACTION_CANCEL"
        BRANCH ApplicationDataInput;


    BannerPrimaryInsured = MIR-DV-INSRD-CLI-NM;

    # add initial defaults for product filter and owner table information
    # these values are used to provide the basis for the user to start
    # the entry process.  they are only ever set once and not executed again.

    index = "0";
    MIR-POL-ISS-LOC-CD = MIR-CLI-CRNT-LOC-CD;
    MIR-POL-CTRY-CD = MIR-CLI-CTRY-CD;


    # if the owner and primary insured are the same person
    # then default the primary insured to the owner.  This is
    # ok for the first time thru the process.
    # If on a return trip thru the process however, and the user
    # has indicated that the owner is not the same as the insured
    # then do not redefault the owner from the insured and leave
    # intact any relationship the user may have created.

    IF MIR-POL-CLI-INSRD-CD-T[1] == "SAME"
    {
        MIR-DV-OWN-CLI-NM-T[1] = MIR-DV-INSRD-CLI-NM;
        MIR-CLI-TAX-ID-T[1] = MIR-CLI-TAX-ID;
        MIR-CLI-ID-T[1] = MIR-INSRD-CLI-ID-T[1];

    }

    # the user has indicated they need to refresh the product
    # selection box, or has changed their country value.
    # Pageserver will re-build the page, using the filtered
    # selection box set up for this field.

    IF action == "ACTION_REFRESH"
        BRANCH ApplicationDataInput;

    IF action == "ACTION_CANCEL"
        EXIT;

    IF LastAction == "ACTION_OK" || LastAction == "ACTION_ATTACH"
    {

        # Determine if the policy id has been valued.
        # For the first time thru this step, this value will
        # be blank, and a create may occur.
        # For any other trip thru this step, this value may be
        # non-blank.  This means that a policy was created, but it
        # may have failed on subsequent processes.

        IF MIR-POL-ID-BASE == ""
        {
            STEP PolicyCreate
            {
                USES P-STEP "BF8001-P";
                "NB" -> MIR-POL-APPL-CTL-CD;
                UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
                UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            {
                MIR-POL-ID-BASE = "";
                MIR-POL-ID-SFX = "";
                SearchAgain = "TRUE";

                BRANCH IndividualSearchPrimaryOwner;

            }

            BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
            BannerProductID = MIR-PLAN-ID;

        # CHANGES FOR 29746F STARTS
            TEMP-PLAN-ID = MIR-PLAN-ID;
        # CHANGES FOR 29746F ENDS

        }

        STEP UpdateCoveragePrimaryInsured
        {
            USES P-STEP "BF8026-P";
            MIR-INSRD-CLI-ID-T[1] -> MIR-CLI-ID;
        }

        IF LSIR-RETURN-CD != "00"
        {
            SearchAgain = "TRUE";

            BRANCH IndividualSearchPrimaryOwner;

        }

        STEP UpdateCoveragePrimaryInsured2
        {
            USES P-STEP "AppBF8025-P";
        }


        # the flow for My Kempo Fields Update

        IF MIR-MY-KEMPO-TYP-CD == "1" || MIR-MY-KEMPO-TYP-CD == "2"
        {
            STEP ACTION_UPDATE_OLD_POLICY
            {
                USES PROCESS "BF9842Update";
                ATTRIBUTES
                {
                    GetMessages = "NO";
                }

                MIR-POL-ID-BASE -> MIR-POL-ID;
                "FALSE" -> DisplayInput;
            }

            IF action == "ACTION_PREVIOUS"
            {
                ReturnToList = "TRUE";

                BRANCH IndividualSearchPrimaryOwner;

            }

        }

        STEP PolicyUpdate
        {
            USES P-STEP "AppBF8002-P";
            "P" -> MIR-DV-OWN-SUB-CD-T[1];
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {
            SearchAgain = "TRUE";

            BRANCH IndividualSearchPrimaryOwner;

        }

    }

    BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    BannerProductID = MIR-PLAN-ID;

    # update the session object for the policy number just created
    # so that any new window opened will assume this value

    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;


    # If this is a Conversion Policy, then call the Conversion Policy
    # data list flow.
    # C22579-If bill type is Bank transfer then get the attached 
    # client bank details from TCLIB table.    

    IF MIR-POL-CNVR-TYP-CD == ""
    {
#C22579 changes starts here
#29746F changes starts here
#29746F IF  MIR-POL-BILL-TYP-CD == "4"
        IF  MIR-POL-BILL-TYP-CD == "4" || TEMP-PLAN-ID == "51520" || TEMP-PLAN-ID == "51521" || TEMP-PLAN-ID == "51532"
        || TEMP-PLAN-ID == "53920" || TEMP-PLAN-ID == "53921" || TEMP-PLAN-ID == "53932"
#29746F changes ends here
        {
        
            MIR-CLI-ID = MIR-CLI-ID-T[1];
            
            STEP ClientBankInquire
            {
                USES P-STEP "BF1220-P";
            }
        }
#C22579 changes ends here    
        BRANCH BillingInfoUpdate;

    }

    STEP RetrieveList
    {
        USES P-STEP "BF9194-P";
        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
    }

    Title = STRINGTABLE.IDS_TITLE_BF9194List;
    ButtonBar = "AppButton9141";

    STEP DisplayList
    {
        USES S-STEP "BF9194-O";
        "0" -> index;
    }

    # If the user has pressed the more button, go back and reget the list
    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9191Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF action == "ACTION_PREVIOUS"
    {
        ReturnToList = "TRUE";

        BRANCH IndividualSearchPrimaryOwner;

    }
    IF action == "ACTION_NEXT"
    {
        BRANCH BillingInfoUpdate;

    }
    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-POL-ID = MIR-POL-ID;
    MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9190Retrieve";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9192Update";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9193Delete";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    TRACE(action);

    IF action == "ACTION_PREVIOUS"
    {
        ReturnToList = "TRUE";

        BRANCH IndividualSearchPrimaryOwner;

    }
    IF action == "ACTION_NEXT"
    {
        BRANCH BillingInfoUpdate;

    }
    # Billing method/mode selection box is a composite of method
    # and mode.  combine these 2 fields that reside on the policy
    # in separate fields, into 1

    MIR-DV-SBOX-CD-T = MIR-POL-BILL-TYP-CD + MIR-POL-BILL-MODE-CD;

    # Get client banking info for displaying on the Billing screen

    MIR-CLI-ID = MIR-CLI-ID-T[1];

    STEP GetClientInfo
    {
        USES P-STEP "BF1220-P";
    }


    # default a value to SFB start date if one is not present.  this is
    # done to preempt the users choice of listbill as the billing type.
    # if the field was valued already, then this means the user is returning
    # to this page after having already selected a start date.  in this case
    # we do not want to override that field value.

    IF MIR-SFB-STRT-DT == ""
        MIR-SFB-STRT-DT = MIR-POL-ISS-EFF-DT;


    STEP BillingInfoUpdate
    {
        USES S-STEP "AppBillingFTJUL";
        STRINGTABLE.IDS_TITLE_AppBillingData -> Title;
        "AppButtonBar" -> ButtonBar;
        MIR-DV-INSRD-CLI-NM -> PayorName;
        MIR-CLI-ID-T[1] -> MIR-DV-PAYR-CLI-ID;
    }


    # if conversion policy branch to coversion list

    IF MIR-POL-CNVR-TYP-CD != ""
    {
        IF action == "ACTION_PREVIOUS"
        {
            BRANCH RetrieveList;

        }

    }
    IF action == "ACTION_PREVIOUS"
    {
        ReturnToList = "TRUE";

        BRANCH IndividualSearchPrimaryOwner;

    }
    # the following only applies to listbill situations (5,G, S).  the user will
    # not see this field in any other circumstance.

    IF action == "GoToCompanySearch"
    {
        STEP CompanyPayorSearch
        {
            USES PROCESS "AppCompSearchJP";
            STRINGTABLE.IDS_TITLE_AppSearchCompanyPayor -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListCompanyPayor -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreateCompanyPayor -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdateCompanyPayor -> UpdateTitle;

            # because the main flow calls a client retrieve function
            # within it (see the bank retrieve step above), the variables
            # for client now belong to the main flow.  As a result, we
            # need to set some of these variables to blank values in
            # order for the company search function to work.  There are
            # only 3 variables that need to be initialized (birth date
            # sex, and location - these are shared mir fields
            # between the 2200 and 1220 functions).  The company search
            # sub-process already initializes 2 of these (sex, 
            # location), so only the birth date requires initialization.

            "" -> MIR-CLI-BTH-DT;

            # send values to the sub-process for preservation
            # of data in case user decides to cancel from that
            # sub-process

            MIR-DV-LBILL-CLI-ID -> MIR-CLI-ID;
            MIR-DV-LBILL-CLI-NM -> MIR-DV-CLI-NM;

            # return values back from sub-process and map
            # to listbill fields

            MIR-DV-LBILL-CLI-ID <- MIR-CLI-ID;
            MIR-DV-LBILL-CLI-NM <- MIR-DV-CLI-NM;
        }

        BRANCH BillingInfoUpdate;

    }
    IF action == "ACTION_NEXT"
    {
        IF MIR-POL-BILL-TYP-CD == "4"
        {
            MIR-CLI-ID = MIR-CLI-ID-T[1];
            MIR-DV-PAYR-CLI-ID = MIR-CLI-ID-T[1];

            STEP ClientUpdateBilling
            {
                USES P-STEP "BF1222-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                BRANCH BillingInfoUpdate;



            # reset any listbill or SFB fields that may have been
            # inadvertently entered and not cleared properly.
            # although javascript exists for this page to reset values
            # to blanks, this only accommodates values within the page
            # and does not properly clear entries already made to the
            # server.  the value assignments below allow for return
            # visits to the page to clear values already stored on the
            # database.

            MIR-DV-LBILL-CLI-ID = "*";
            MIR-POL-SFB-CD = "**";

            # the index number of the row on the page will correspond
            # to the client bank account displayed, or added.
            # send to the process driver the value for the bank account
            # selected to the payor relationship sub code.
            # the payor relationship itself is a derived field and
            # will be set via the process driver (MIR-DV-PAYR-CLI-ID).
            # preserve value of the index field for a return to this
            # page.

            MIR-DV-PAYR-SUB-CD = index;
            BillingIndex = index;

            # preserve messages from this step for later display.
            # a variable indicating there are messages from this
            # step will be used to determine if these should
            # be displayed to the user or not.

            BankingInfoMessages = "TRUE";
            banking-temp-msg-t = MESSAGES-T;

            BRANCH PolicyUpdateBilling;

        }


        # CHANGES FOR CR1848 STARTS
        # CHANGES FOR 29746F STARTS
        # IF MIR-CPN-AUTO-PAYO-IND == "Y" && (TEMP-PLAN-ID == "51520" || TEMP-PLAN-ID == "51521" || TEMP-PLAN-ID == "51532"
        IF (TEMP-PLAN-ID == "51520" || TEMP-PLAN-ID == "51521" || TEMP-PLAN-ID == "51532"
        # CHANGES FOR CR1848 ENDS	 
        || TEMP-PLAN-ID == "53920" || TEMP-PLAN-ID == "53921" || TEMP-PLAN-ID == "53932")
        {
            MIR-CLI-ID = MIR-CLI-ID-T[1];
            MIR-CPN-PAYE-CLI-ID = MIR-CLI-ID-T[1];
            MIR-DV-PAYR-CLI-ID = SPACES;

            STEP ClientUpdateBilling
            {
                USES P-STEP "BF1222-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                BRANCH BillingInfoUpdate;

            # the index number of the row on the page will correspond
            # to the client bank account displayed, or added.
            # send to the process driver the value for the bank account
            # selected to the payor relationship sub code.
            # the payor relationship itself is a derived field and
            # will be set via the process driver (MIR-DV-PAYR-CLI-ID).
            # preserve value of the index field for a return to this
            # page.

            MIR-CPN-PAYE-SUB-TYP-CD = index;
            BillingIndex = index;

            # preserve messages from this step for later display.
            # a variable indicating there are messages from this
            # step will be used to determine if these should
            # be displayed to the user or not.

            BankingInfoMessages = "TRUE";
            banking-temp-msg-t = MESSAGES-T;

            BRANCH PolicyUpdateBilling;
        }
        # CHANGES FOR 29746F ENDS
        IF MIR-POL-BILL-TYP-CD == "5" || MIR-POL-BILL-TYP-CD == "G" || MIR-POL-BILL-TYP-CD == "S"
        {

            # if listbill, but no special frequency, send in the group
            # delete to the SFB type code.  this will clear the value
            # we have defaulted into the SFB-STRT-DT field.

            IF SFYesNo == "N"
                MIR-POL-SFB-CD = "**";



            # re-assign the single policy field for draw day, to that
            # of the listbill draw day

            MIR-POL-PAC-DRW-DY = MIR-POL-LBILL-DRW-DY;
            MIR-DV-PAYR-CLI-ID = "*";

            BRANCH PolicyUpdateBilling;

        }


        # if not pac or listbill, ensure any variables going to server are
        # properly cleared of values

        MIR-DV-LBILL-CLI-ID = "*";
        MIR-POL-SFB-CD = "**";
        MIR-DV-PAYR-CLI-ID = "*";
        MIR-POL-PAC-DRW-DY = "*";

        STEP PolicyUpdateBilling
        {
            USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH BillingInfoUpdate;



        # Preserve messages from the step above.
        # Messages are being overridden by the p-steps that follow, prior
        # to an s-step being displayed.  an evaluation will be made
        # in the Insured data flow to determine if the messages preserved
        # from this step, or the one above, are to be displayed to the user.

        temp-msg-t = MESSAGES-T;

        #****initial values for next screen ******************************
        #   MIR-POL-AGT-SHR-PCT-T[1] = "50.00";
        #   MIR-POL-AGT-SHR-PCT-T[2] = "50.00";
        #****if re-entering Agent screen - pick up these values **********

        MIR-AGT-ID-T[1] = agent-temp-id-1;
        MIR-DV-AGT-CLI-NM-T[1] = agent-temp-nm-1;
        MIR-POL-AGT-TYP-CD-T[1] = agent-tempt-typ-1;
        MIR-AGT-ID-T[2] = agent-temp-id-2;
        MIR-DV-AGT-CLI-NM-T[2] = agent-temp-nm-2;
        MIR-POL-AGT-TYP-CD-T[2] = agent-tempt-typ-2;
        MIR-SERV-AGT-ID = agent-temp-serv-id;

    }


    #*****************************************************************
    # Indicate whether the signatures have been captured and lists the
    # agents that participate in the policy
    #*****************************************************************

    STEP Signatures
    {
        USES S-STEP "AppSignaturesFTJ";
        STRINGTABLE.IDS_TITLE_AppSignatures -> Title;
        "AppButtonBar" -> ButtonBar;
        "50.00" -> MIR-POL-AGT-SHR-PCT-T[1];
        "50.00" -> MIR-POL-AGT-SHR-PCT-T[2];
    }

    IF action == "GoToAgentSearch"
    {
        STEP AgentSearch
        {
            USES PROCESS "AppAgentSearch";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # send values to the sub-flow for preservation
            # should the user cancel from that sub-flow

            MIR-AGT-ID-T[index] -> MIR-AGT-ID;
            MIR-DV-AGT-CLI-NM-T[index] -> MIR-DV-SRCH-CLI-NM;
            MIR-AGT-ID-T[index] <- MIR-AGT-ID;
            MIR-DV-AGT-CLI-NM-T[index] <- MIR-DV-SRCH-CLI-NM;
        }

        IF MIR-DV-AGT-CLI-NM-T[index] != ""
            MIR-POL-AGT-SHR-PCT-T[index] = "100.00";


        BRANCH Signatures;

    }
    IF action == "GoToAgentSearchService"
    {
        STEP AgentSearchService
        {
            USES PROCESS "AppAgentSearch";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # send values to the sub-flow for preservation
            # should the user cancel from that sub-flow

            MIR-SERV-AGT-ID -> MIR-AGT-ID;
            MIR-DV-SERV-AGT-NM -> MIR-DV-SRCH-CLI-NM;
            MIR-SERV-AGT-ID <- MIR-AGT-ID;
            MIR-DV-SERV-AGT-NM <- MIR-DV-SRCH-CLI-NM;
        }

        BRANCH Signatures;

    }
    IF action == "ACTION_NEXT"
    {

        # if only 1 agent was entered                                 
        # to the percent field (either none or any value),
        # default the percent split to 100.00%.  (only 2 agents now...01NB01.)

        IF MIR-AGT-ID-T[2] == ""
        {
            MIR-POL-AGT-SHR-PCT-T[1] = "100.00";
            MIR-POL-AGT-SHR-PCT-T[2] = "00.00";
            MIR-POL-AGT-TYP-CD-T[1] = "M";

        }

        # if 2 agents were entered ensure correct values...
        # default the percent to 50%.  1st.agent is MAIN 2nd Agent is SECONDARY.

        IF MIR-AGT-ID-T[2] != ""
        {
            MIR-POL-AGT-SHR-PCT-T[1] = "50.00";
            MIR-POL-AGT-SHR-PCT-T[2] = "50.00";

        }

        STEP UpdateSignatures
        {
            USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH Signatures;


        # default the policy servicing agent from the writing agent
        # if there is no value on the policy for the servicing agent.
        # only do this, if the policy writing agents were
        # successfully updated

        IF MIR-SERV-AGT-ID == ""
        {
            MIR-SERV-AGT-ID = MIR-AGT-ID-T[1];

            STEP UpdateServiceAgent
            {
                USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS                
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                BRANCH Signatures;


        }

        BRANCH CWA;

    }

    #*****************************************************************
    # going back to the previous screen we can't carry Agent-info with
    # (errors generated and we get locked out) - so....
    #*****************************************************************

    IF action == "ACTION_PREVIOUS"
    {
        agent-temp-id-1 = MIR-AGT-ID-T[1];
        agent-temp-nm-1 = MIR-DV-AGT-CLI-NM-T[1];
        agent-tempt-typ-1 = MIR-POL-AGT-TYP-CD-T[1];
        agent-temp-id-2 = MIR-AGT-ID-T[2];
        agent-temp-nm-2 = MIR-DV-AGT-CLI-NM-T[2];
        agent-tempt-typ-2 = MIR-POL-AGT-TYP-CD-T[2];
        agent-temp-serv-id = MIR-SERV-AGT-ID;
        MIR-AGT-ID-T[1] = "";
        MIR-DV-AGT-CLI-NM-T[1] = "";
        MIR-POL-AGT-TYP-CD-T[1] = "";
        MIR-AGT-ID-T[2] = "";
        MIR-DV-AGT-CLI-NM-T[2] = "";
        MIR-POL-AGT-TYP-CD-T[2] = "";
        MIR-SERV-AGT-ID = "";

        BRANCH BillingInfoUpdate;

    }


    #*****************************************************************
    # Collect Cash with Application
    # Call a sub-flow for this
    #*****************************************************************

    STEP CWA
    {
        USES PROCESS "AppCwaFTJUL";
    }

    IF LastAction == "ACTION_PREVIOUS"
    {

        # set the index value to the preserved variable for index
        # in order to re-display to the user, any bank account
        # selection they may have made.

        index = BillingIndex;

        # set the payor client id to the owner client id in order
        # to allow the user to re-select Pac as the billing type
        # and have a valid client id be sent to the policy for the
        # payor relationship.  set the payor name field to the owner
        # client name.  these settings are done only to preempt the
        # user changing their mind and setting a billing method
        # of pre-authorized payment from any other type, on revisiting
        # the billing page.

        MIR-DV-PAYR-CLI-ID = MIR-CLI-ID-T[1];
        PayorName = MIR-DV-OWN-CLI-NM-T[1];


        # branch to the s step instead of a full policy and client
        # retrieve, both to save response time, and to re-display to
        # the user, the information they may have keyed in on the
        # input page.  a straight retrieve of policy info would
        # wipe out messages and display only that data that made it
        # to the policy record

        BRANCH Signatures;

    }
    IF LastAction == "ACTION_NEXT"
        BRANCH PolicyDataRetrieve;



    #*****************************************************************
    # Collect Policy data.  This includes rider information as well
    # as Death Benefit Option.
    #
    #*****************************************************************
    # Preserve messages from the action_next step above.
    # Messages are being overridden by the p-steps that follow, prior
    # to an s-step being displayed.

    temp-msg-t = MESSAGES-T;

    STEP PolicyDataRetrieve
    {
        USES P-STEP "BF8000-P";
    }
    STEP CoverageDataRetrieve
    {
        USES P-STEP "BF8024-P";
    }

    IF ReturnToPolicyData == "TRUE"
    {
        MIR-CVG-FACE-AMT-T[1] = temp-face-amt-1;
        MIR-CVG-FACE-AMT-T[2] = temp-face-amt-2;
        MIR-CVG-FACE-AMT-T[3] = temp-face-amt-3;
        MIR-CVG-FACE-AMT-T[4] = temp-face-amt-4;
        MIR-CVG-FACE-AMT-T[5] = temp-face-amt-5;
        MIR-CVG-FACE-AMT-T[6] = temp-face-amt-6;
        MIR-CVG-FACE-AMT-T[7] = temp-face-amt-7;
        MIR-CVG-FACE-AMT-T[8] = temp-face-amt-8;
        MIR-CVG-FACE-AMT-T[9] = temp-face-amt-9;
        MIR-CVG-FACE-AMT-T[10] = temp-face-amt-10;
        MIR-CVG-FACE-AMT-T[11] = temp-face-amt-11;
        MIR-CVG-FACE-AMT-T[12] = temp-face-amt-12;
        MIR-CVG-FACE-AMT-T[13] = temp-face-amt-13;
        MIR-CVG-FACE-AMT-T[14] = temp-face-amt-14;
        MIR-CVG-FACE-AMT-T[15] = temp-face-amt-15;
        MIR-CVG-FACE-AMT-T[16] = temp-face-amt-16;
        MIR-CVG-FACE-AMT-T[17] = temp-face-amt-17;
        MIR-CVG-FACE-AMT-T[18] = temp-face-amt-18;
        MIR-CVG-FACE-AMT-T[19] = temp-face-amt-19;
        MIR-CVG-FACE-AMT-T[20] = temp-face-amt-20;

        #MIR-CVG-AD-FACE-AMT-T[1] = temp-face-adamt-1;
        #MIR-CVG-AD-FACE-AMT-T[2] = temp-face-adamt-2;
        #MIR-CVG-AD-FACE-AMT-T[3] = temp-face-adamt-3;
        #MIR-CVG-AD-FACE-AMT-T[4] = temp-face-adamt-4;
        #MIR-CVG-AD-FACE-AMT-T[5] = temp-face-adamt-5;

        ReturnToPolicyData = "";

    }
    # M241A3 changes STARTS here
    temp-plan-id-1 = MIR-PLAN-ID-T[1];
    temp-plan-id-2 = MIR-PLAN-ID-T[2];
    temp-plan-id-3 = MIR-PLAN-ID-T[3];
    temp-plan-id-4 = MIR-PLAN-ID-T[4];
    temp-plan-id-5 = MIR-PLAN-ID-T[5];
    temp-plan-id-6 = MIR-PLAN-ID-T[6];
    temp-plan-id-7 = MIR-PLAN-ID-T[7];
    temp-plan-id-8 = MIR-PLAN-ID-T[8];
    temp-plan-id-9 = MIR-PLAN-ID-T[9];
    temp-plan-id-10 = MIR-PLAN-ID-T[10];
    temp-plan-id-11 = MIR-PLAN-ID-T[11];
    temp-plan-id-12 = MIR-PLAN-ID-T[12];
    temp-plan-id-13 = MIR-PLAN-ID-T[13];
    temp-plan-id-14 = MIR-PLAN-ID-T[14];
    temp-plan-id-15 = MIR-PLAN-ID-T[15];
    temp-plan-id-16 = MIR-PLAN-ID-T[16];
    temp-plan-id-17 = MIR-PLAN-ID-T[17];
    temp-plan-id-18 = MIR-PLAN-ID-T[18];
    temp-plan-id-19 = MIR-PLAN-ID-T[19];
    temp-plan-id-20 = MIR-PLAN-ID-T[20];
    temp-plan-id-21 = MIR-PLAN-ID-T[21];
    temp-plan-id-22 = MIR-PLAN-ID-T[22];
    temp-plan-id-23 = MIR-PLAN-ID-T[23];
    temp-plan-id-24 = MIR-PLAN-ID-T[24];
    temp-plan-id-25 = MIR-PLAN-ID-T[25]; 
    # M241A3 changes END here
    
    # move overriden messages back prior to an s-step being displayed

    MESSAGES-T = temp-msg-t;

    STEP PolicyDataInput
    {
        USES S-STEP "AppPolicyDataFTJUL";
        STRINGTABLE.IDS_TITLE_AppPolicyData -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "GoToInsuredSearch"
    {
        STEP IndividualSearchInsured
        {
            USES PROCESS "AppIndivSearchFTJUL";
            STRINGTABLE.IDS_TITLE_AppSearchPrimaryInsured -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListPrimaryInsured -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreatePrimaryInsured -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdatePrimaryInsured -> UpdateTitle;
            MIR-INSRD-CLI-ID-T[index] -> MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-T[index] -> MIR-DV-CLI-NM;
            MIR-INSRD-CLI-ID-T[index] <- MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-T[index] <- MIR-DV-CLI-NM;
        }


        # BECAUSE VARIABLE LastAction IS NOT USED AT THIS POINT IN THE FLOW
        # RE-SET TO BLANKS TO AVOID POSSIBLE ISSUES LATER IN THE FLOW

        LastAction = "";

        BRANCH PolicyDataInput;

    }
    IF action == "GoToOtherSearch"
    {
        STEP IndividualSearchOther
        {
            USES PROCESS "AppIndivSearchFTJUL";
            STRINGTABLE.IDS_TITLE_AppSearchJointInsured -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListJointInsured -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreateJointInsured -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdateJointInsured -> UpdateTitle;
            MIR-INSRD-CLI-ID-2-T[index] -> MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-2-T[index] -> MIR-DV-CLI-NM;
            MIR-INSRD-CLI-ID-2-T[index] <- MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-2-T[index] <- MIR-DV-CLI-NM;
        }


        # BECAUSE VARIABLE LastAction IS NOT USED AT THIS POINT IN THE FLOW
        # RE-SET TO BLANKS TO AVOID POSSIBLE ISSUES LATER IN THE FLOW

        LastAction = "";

        BRANCH PolicyDataInput;

    }
    IF action == "ACTION_PREVIOUS"
    # M241A3 changes STARTS here
    {    
        MIR-PLAN-ID-T[1] = temp-plan-id-1;
        MIR-PLAN-ID-T[2] = temp-plan-id-2;    
        MIR-PLAN-ID-T[3] = temp-plan-id-3;    
        MIR-PLAN-ID-T[4] = temp-plan-id-4;    
        MIR-PLAN-ID-T[5] = temp-plan-id-5;    
        MIR-PLAN-ID-T[6] = temp-plan-id-6;    
        MIR-PLAN-ID-T[7] = temp-plan-id-7;  
        MIR-PLAN-ID-T[8] = temp-plan-id-8;
        MIR-PLAN-ID-T[9] = temp-plan-id-9;    
        MIR-PLAN-ID-T[10] = temp-plan-id-10;    
        MIR-PLAN-ID-T[11] = temp-plan-id-11;    
        MIR-PLAN-ID-T[12] = temp-plan-id-12;    
        MIR-PLAN-ID-T[13] = temp-plan-id-13;    
        MIR-PLAN-ID-T[14] = temp-plan-id-14; 
        MIR-PLAN-ID-T[15] = temp-plan-id-15;
        MIR-PLAN-ID-T[16] = temp-plan-id-16;    
        MIR-PLAN-ID-T[17] = temp-plan-id-17;    
        MIR-PLAN-ID-T[18] = temp-plan-id-18;    
        MIR-PLAN-ID-T[19] = temp-plan-id-19;    
        MIR-PLAN-ID-T[20] = temp-plan-id-20;    
        MIR-PLAN-ID-T[21] = temp-plan-id-21;         
        MIR-PLAN-ID-T[22] = temp-plan-id-22;         
        MIR-PLAN-ID-T[23] = temp-plan-id-23;         
        MIR-PLAN-ID-T[24] = temp-plan-id-24;         
        MIR-PLAN-ID-T[25] = temp-plan-id-25;         
    # M241A3 changes ENDS here
        BRANCH CWA;
    # M241A3 changes STARTS here
    } 
        
    IF action == "ACTION_REFRESH"
    {   
        MIR-PLAN-ID-T[1] = temp-plan-id-1;
        BRANCH PolicyDataInput;
    }        
    # M241A3 changes ENDS here

    IF action == "ACTION_NEXT"
    {
        STEP PolicyDataProcess
        {
            USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH PolicyDataInput;


        STEP CoverageDataProcess2
        {
            USES P-STEP "AppBF8025-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH PolicyDataInput;


    }


    # Preserve messages from the action_next step above.
    # Messages are being overridden by the p-steps that follow, prior
    # to an s-step being displayed.
    # preserve coverage values from this last page for a return
    # to this page.  This is only required to allow the user to see the
    # values they have entered, which may have produced errors they
    # wish to correct.

    temp-face-amt-1 = MIR-CVG-FACE-AMT-T[1];
    temp-face-amt-2 = MIR-CVG-FACE-AMT-T[2];
    temp-face-amt-3 = MIR-CVG-FACE-AMT-T[3];
    temp-face-amt-4 = MIR-CVG-FACE-AMT-T[4];
    temp-face-amt-5 = MIR-CVG-FACE-AMT-T[5];
    temp-face-amt-6 = MIR-CVG-FACE-AMT-T[6];
    temp-face-amt-7 = MIR-CVG-FACE-AMT-T[7];
    temp-face-amt-8 = MIR-CVG-FACE-AMT-T[8];
    temp-face-amt-9 = MIR-CVG-FACE-AMT-T[9];
    temp-face-amt-10 = MIR-CVG-FACE-AMT-T[10];
    temp-face-amt-11 = MIR-CVG-FACE-AMT-T[11];
    temp-face-amt-12 = MIR-CVG-FACE-AMT-T[12];
    temp-face-amt-13 = MIR-CVG-FACE-AMT-T[13];
    temp-face-amt-14 = MIR-CVG-FACE-AMT-T[14];
    temp-face-amt-15 = MIR-CVG-FACE-AMT-T[15];
    temp-face-amt-16 = MIR-CVG-FACE-AMT-T[16];
    temp-face-amt-17 = MIR-CVG-FACE-AMT-T[17];
    temp-face-amt-18 = MIR-CVG-FACE-AMT-T[18];
    temp-face-amt-19 = MIR-CVG-FACE-AMT-T[19];
    temp-face-amt-20 = MIR-CVG-FACE-AMT-T[20];


    #temp-face-adamt-1 = MIR-CVG-AD-FACE-AMT-T[1];
    #temp-face-adamt-2 = MIR-CVG-AD-FACE-AMT-T[2];
    #temp-face-adamt-3 = MIR-CVG-AD-FACE-AMT-T[3];
    #temp-face-adamt-4 = MIR-CVG-AD-FACE-AMT-T[4];
    #temp-face-adamt-5 = MIR-CVG-AD-FACE-AMT-T[5];
    #*****************************************************************
    # Collect Allocation Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP Allocations
    {
        USES PROCESS "AppAllocationsUL";
    }

    IF MIR-POL-APP-REASN-CD == "NB"
        BRANCH Beneficiary;



    # if for any reason, allocation records could not be created, sub-flow
    # will return a blank value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.
    #IF AllocationCreateSuccessful == ""
    #    BRANCH ConnectedPolicyInput;
    # if for any reason, allocation records could not be retrieved, sub-flow
    # will return a FALSE value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.
    #IF AllocationRetrieveSuccessful == "FALSE"
    #    BRANCH ConnectedPolicyInput;
    # if for any reason, DCA records could not be created, sub-flow
    # will return a blank value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.
    # Note:  this variable will also be blank if no DCA instructions
    # were provided.  In this case it is still appropriate to branch to
    # beneficiary.
    #IF DCACreateSuccessful == ""
    #    BRANCH ConnectedPolicyInput;
    #******************************************************************
    # If Changing from Joint to Single, Collect Connecting Policy Info
    #*****************************************************************

    MESSAGES-T = temp-msg-t;

    STEP ConnectedPolicyInput
    {
        USES S-STEP "AppConnectedPolicy";
        STRINGTABLE.IDS_TITLE_AppConnectedPolicy -> Title;
        "AppButtonBar" -> ButtonBar;
    }
    # Q09507 Changes Start
        LastAction = "";
    # Q09507 Changes End
    IF action == "ACTION_PREVIOUS"
    {
        BRANCH PolicyDataRetrieve;

    }
    IF action == "ACTION_NEXT"
    {
        STEP CoverageDataProcess3
        {
            USES P-STEP "AppBF8025-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH ConnectedPolicyInput;

    # M142S1 Changes Start
    # Q09507 Changes Start
        TEMP-POL-CONN-REL-CD = MIR-POL-CONN-REL-CD;
        IF MIR-POL-CONN-REL-CD == "" || MIR-POL-CONN-REL-CD == "*"
            MIR-POL-CONN-REL-CD = "#";
    # Q09507 Changes End

        STEP PolicyDataProcess2
        {
            USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
    # Q09507 Changes Start
    #        BRANCH ConnectedPolicyInput;
            {
                 MIR-POL-CONN-REL-CD = TEMP-POL-CONN-REL-CD;
                 BRANCH ConnectedPolicyInput;
            }
    # Q09507 Changes Start
    # M142S1 Changes End


    }

    temp-msg-t = MESSAGES-T;


    #*****************************************************************
    # Collect Beneficiary Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP Beneficiary
    {
        USES PROCESS "AppBene";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

    }

    IF LastAction == "ACTION_PREVIOUS"
    {
    # M142S1 Changes Start
    #    IF MIR-POL-APP-REASN-CD == "JS"
        IF MIR-POL-APP-REASN-CD == "JS" || MIR-POL-APP-REASN-CD == "SP"
    # M142S1 Changes End
        {
            BRANCH ConnectedPolicyInput;

        }

        LastAction = "";
        ReturnToAllocations = "TRUE";


        # if the allocations step was bypassed because there was
        # only 1 fund, send user back to the policy data page
        # instead of the allocations page.  Set an additional
        # flag which will preserve user-entered face amount values
        # should the user wish to correct entries made in error.

        IF temp-MIR-DV-FND-DESC-TXT-T[2] == ""
        {
            ReturnToPolicyData = "TRUE";

            BRANCH PolicyDataRetrieve;

        }

        BRANCH Allocations;

    }

    ReturnListCliu = "FALSE";


    #*****************************************************************
    # Collect Insured Detailed Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP InsuredData
    {
        USES PROCESS "AppInsuredFTJUL";
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
        LastAction = "";

        BRANCH Beneficiary;

    }

    #*****************************************************************
    # only perform the OwnerUnderwriting step if the policy has an
    # SA rider
    #*****************************************************************

    IF MIR-SKIP-UW-IND == "Y"
    {
        BRANCH ApplicationAnalysisPolicyRetrieve;
    }

    #*****************************************************************
    # Collect Insured Financial Information for Owner Underwriting
    # Call a sub-flow for this
    #*****************************************************************

    STEP OwnerUnderwriting
    {
        USES PROCESS "AppOwnerUW";
           MIR-OWN-STCKR-ID     -> MIR-STCKR-ID;
           MIR-OWN-CLI-ID       -> MIR-CLI-ID;
           MIR-EFF-DT           -> MIR-CLI-INCM-EFF-DT;
           MIR-OWN-CLI-NM       -> MIR-DV-OWN-CLI-NM;
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
       LastAction = "";

       ReturnListCliu = "TRUE";

       BRANCH InsuredData;
    }


    #*****************************************************************
    # This is the start of the Summary & Analysis screen in flow...
    # Display Application Summary data and give the ability to cross edit
    # and clear case u/w.
    #*****************************************************************

    STEP ApplicationAnalysisPolicyRetrieve
    {
        USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS        
    }
    STEP ApplicationAnalysisCoverageRetrieve
    {
        USES P-STEP "BF8024-P";
    }
    STEP CheckPolicyForErrors
    {
        USES P-STEP "BF8004-P";
    }


    # default a value to the billing name field

    BillingName = MIR-DV-OWN-CLI-NM;


    # override the default value for special billing types

    IF MIR-POL-BILL-TYP-CD == "5" || MIR-POL-BILL-TYP-CD == "G" || MIR-POL-BILL-TYP-CD == "S"
        BillingName = MIR-DV-LBILL-CLI-NM;

    IF MIR-POL-BILL-TYP-CD == "4"
        BillingName = MIR-DV-PAYR-CLI-NM;


    STEP ApplicationAnalysisDisplay
    {
        USES S-STEP "AppAnalysisJPUL";
        STRINGTABLE.IDS_TITLE_AppAnalysis -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "GoToCheckPolicy"
    {
        STEP ReCheckPolicyForErrors
        {
            USES P-STEP "BF8004-P";
        }

        BRANCH ApplicationAnalysisDisplay;

    }
    IF action == "GoToClearCase"
    {
        STEP SubmitToUnderwriting
        {
            USES P-STEP "BF0591-P";
        }

        BRANCH ApplicationAnalysisDisplay;

    }
    IF action == "ACTION_PREVIOUS"
    {
       IF MIR-SKIP-UW-IND == "Y"
       {
          ReturnListCliu = "TRUE";

          BRANCH InsuredData;
       }

       IF MIR-SKIP-UW-IND == "N"
       {
         BRANCH OwnerUnderwriting;
       }

    }
    IF action == "ACTION_NEXT"
        EXIT;

}

