# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   AppMainUpdtFTJ                                                *
#*  Description:  App Update Flow - Cloned from AppMainFTJUL                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00386  WBP      New                                                       *
#*  B00631  WBP      Fix Payor ID going into Billing screen                    *
#*  B10012  WBP      Set SearchAgain for other P-steps                         *
#*  P00251  EKM      Add error check after BF1222-P step.                      *
#*  02PR62  DPK      Joint to Single Change - New Connected Policy Screen      *
#*  1CNB02  EKM      Add Conversion Policy Processing.                         *
#*  PR006Q  FB       Add Old Policy Information Processing (MY KEMPO)          *
#*  P02354  CY       Change   MIR-POL-ID-BASE -> MIR-POL-ID                    *
#*                   to       MIR-POL-ID-BASE -> MIR-POL-ID-BASE               *
#*  MFFFU4  ACR      add new process OwnerUnderwriting                         *
#*  M142S1  CTS      CHANGES TO HANDLE SPLIT POLICY                            *
#*  Q09507  CTS      M142S1 - CHANGES TO DISPLAY ERROR FOR POLICYHOLDER        *
#*                   RELATIONSHIP FIELD WHEN IT IS LEFT BLANK                  *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  CR1848  CTS      CHANGES FOR COUPON ACCOUNT INFORMATION                    *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

INCLUDE "AppUpdt-I.s";
INCLUDE "BF9540-P.p";
INCLUDE "AppApplicationDataFTJULU.s";
INCLUDE "AppIndivSearchFTJULU.f";
INCLUDE "AppCompSearchJP.f";
INCLUDE "BF8001-P.p";
INCLUDE "BF8026-P.p";
INCLUDE "BF1651-P.p";
INCLUDE "BF1652-P.p";
INCLUDE "AppBF8002-P.p";
INCLUDE "AppPolicyDataFTJUL.s";
INCLUDE "AppConnectedPolicy.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8024-P.p";
INCLUDE "AppBF8025-P.p";
INCLUDE "BF8004-P.p";
INCLUDE "AppAllocationsUL.f";
INCLUDE "AppBillingFTJUL.s";
INCLUDE "AppInsuredFTJUL.f";
INCLUDE "AppOwnerUW.f";
INCLUDE "BF0591-P.p";
INCLUDE "AppAnalysisJPUL.s";
INCLUDE "AppAgentSearch.f";
INCLUDE "AppSignaturesFTJ.s";
INCLUDE "AppCwaFTJULU.s";
INCLUDE "BF1220-P.p";
INCLUDE "BF1222-P.p";
INCLUDE "BF9842Update.f";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS AppMainUpdtFTJ
{
    Title = "Application Update";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";


    #**************************************************************** 
    # Get the policy number to work with. The user can enter either
    # the policy number or the application number to get this. 
    #**************************************************************** 

    STEP GetPolicyApplicationNumber
    {
        USES S-STEP "AppUpdt-I";
        STRINGTABLE.IDS_TITLE_AppUpdtRetrieve -> Title;
    }

    IF action == "ACTION_CANCEL"
        EXIT;
     
    # UY3004 CHANGES START
    
    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList1
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
        BRANCH GetPolicyApplicationNumber;
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
    # UY3004 CHANGES END

     
    IF action == "ACTION_OK"
    {
        STEP PolicySelect
        {
            USES P-STEP "BF9540-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH GetPolicyApplicationNumber;


        STEP GetPolicyData
        {
            USES P-STEP "BF8000-P";
        }

        BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
        BannerProductID = MIR-PLAN-ID;
        BannerPrimaryInsured = MIR-DV-OWN-CLI-NM;
        SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
        SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;
        TEMP-PLAN-ID = MIR-PLAN-ID;

        BRANCH ApplicationDataInput;

    }

    STEP ApplicationDataInput
    {
        USES S-STEP "AppApplicationDataFTJULU";
        STRINGTABLE.IDS_TITLE_AppApplicationData -> Title;
    }

    IF action == "ACTION_CANCEL"
        EXIT;

    IF action == "ACTION_OK"
    {
        STEP AppDataPolUpdate
        {
            USES P-STEP "AppBF8002-P";
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH ApplicationDataInput;

# 23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX + " " + MIR-POL-APP-FORM-ID;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF8002" -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH ApplicationDataInput;
        
# 23774A CHANGES END

        STEP GetCoverageData
        {
            USES P-STEP "BF8024-P";
        }

        BRANCH IndividualSearchPrimaryOwner;

    }


    #*****************************************************************
    # Collect Client Search information.  A sub-process will be
    # invoked to allow for re-use. Returning from the search will be
    # a client number that can be retained for later use.
    #*****************************************************************

    STEP IndividualSearchPrimaryOwner
    {
        USES PROCESS "AppIndivSearchFTJULU";
        STRINGTABLE.IDS_TITLE_AppSearchIndivOwner -> SearchTitle;
        STRINGTABLE.IDS_TITLE_AppListIndivOwner -> ListTitle;
        STRINGTABLE.IDS_TITLE_AppCreateIndivOwner -> CreateTitle;
        STRINGTABLE.IDS_TITLE_AppUpdateIndivOwner -> UpdateTitle;

        # send values to the sub-flow for preservation
        # of data should the user cancel from that sub-flow

        MIR-INSRD-CLI-ID-T[1] -> MIR-CLI-ID;
        MIR-DV-INSRD-CLI-NM -> MIR-DV-CLI-NM;
    }


    # return values from search and assign to insured values

    MIR-INSRD-CLI-ID-T[1] = MIR-CLI-ID;
    MIR-DV-INSRD-CLI-NM = MIR-DV-CLI-NM;


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
    IF LastAction == "ACTION_PREVIOUS"
        BRANCH ApplicationDataInput;

    IF LastAction == "ACTION_OK" || LastAction == "ACTION_ATTACH"
    {
        STEP OwnerUpdate
        {
            USES P-STEP "AppBF8002-P";
            "P" -> MIR-DV-OWN-SUB-CD-T[1];
            MIR-CLI-ID -> MIR-CLI-ID-T[1];
# NVCN01 CHANGES STARTS
            "Y" -> MIR-MTHLY-STD-MSG-IND;
# NVCN01 CHANGES ENDS            
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {
            SearchAgain = "TRUE";

            BRANCH IndividualSearchPrimaryOwner;

        }

        STEP UpdateCoveragePrimaryInsured
        {
            USES P-STEP "AppBF8025-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {
            SearchAgain = "TRUE";

            BRANCH IndividualSearchPrimaryOwner;

        }

        MIR-DV-OWN-CLI-NM-T[1] = MIR-DV-OWN-CLI-NM;
        MIR-CLI-TAX-ID-T[1] = MIR-CLI-TAX-ID;
        MIR-DV-PAYR-CLI-ID = MIR-INSRD-CLI-ID-T[1];
        MIR-DV-PAYR-CLI-NM = MIR-DV-OWN-CLI-NM;
        BannerPrimaryInsured = MIR-DV-OWN-CLI-NM;

    }

    #
    # the flow for My Kempo Fields Update
    #

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

    #
    # Conversion Policy Processing
    #
    #IF  MIR-POL-CNVR-TYP-CD == ""

    IF MIR-POL-CNVR-TYP-CD != ""
    {

        #        BRANCH BillingInfoUpdate;
        #    }

        STEP RetrieveList
        {
            USES P-STEP "BF9194-P";
    # P02354  CY  Dec 6, 2004
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
                    SendMessages = "NO";
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


        #   IF action == "ACTION_NEXT"
        #      {
        #       BRANCH BillingInfoUpdate;
        #      }
        #IF (index == "0") && (ACTION == "ACTION_NEXT")
        #  BRANCH DisplayList;
        # Build the key ID from the row that the user selected
        # You will have to build all of the key variables that will be required
        # by the following steps and pass them to each step. MIR-REQIR-ID is 
        # used here as an example only.

        MIR-POL-ID = MIR-POL-ID;
        MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];


        # action will be "SelectItem" if the user clicks on a hyperlink in the
        # row.  It will be ACTION_INQUIRE if they pressed the inquire button.
        # If this is a Conversion Policy, then call the Conversion Policy
        # data list flow.

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
        IF action == "ACTION_PREVIOUS"
        {
            ReturnToList = "TRUE";

            BRANCH IndividualSearchPrimaryOwner;

        }

        #IF action == "ACTION_NEXT"
        #   {
        #     BRANCH BillingInfoUpdate;
        #   }

    }


    # Billing method/mode selection box is a composite of method
    # and mode.  combine these 2 fields that reside on the policy
    # in separate fields, into 1

    MIR-DV-SBOX-CD-T = MIR-POL-BILL-TYP-CD + MIR-POL-BILL-MODE-CD;


    # Default Payor info if it doesn't exist

    IF MIR-DV-PAYR-CLI-ID == ""
    {
        MIR-DV-PAYR-CLI-ID = MIR-INSRD-CLI-ID-T[1];
        MIR-DV-PAYR-CLI-NM = MIR-DV-OWN-CLI-NM;

    }

    SavePayorId = MIR-DV-PAYR-CLI-ID;
    SavePayorNm = MIR-DV-PAYR-CLI-NM;

    # Get client banking info for displaying on the Billing screen

    MIR-CLI-ID = MIR-DV-PAYR-CLI-ID;

    # CHANGES FOR 29746F STARTS
    IF TEMP-PLAN-ID == "51520" || TEMP-PLAN-ID == "51521" || TEMP-PLAN-ID == "51532"
    || TEMP-PLAN-ID == "53920" || TEMP-PLAN-ID == "53921" || TEMP-PLAN-ID == "53932"
    {
        MIR-CLI-ID = MIR-CPN-PAYE-CLI-ID;
        SavePayorId = MIR-CPN-PAYE-CLI-ID;
    }
    # CHANGES FOR 29746F ENDS

    STEP GetClientInfo
    {
        USES P-STEP "BF1220-P";
    }

    STEP BillingInfoUpdate
    {
        USES S-STEP "AppBillingFTJUL";
        STRINGTABLE.IDS_TITLE_AppBillingData -> Title;
        "AppButtonBar" -> ButtonBar;
        SavePayorNm -> PayorName;
        SavePayorId -> MIR-DV-PAYR-CLI-ID;
        SavePayorId -> MIR-CPN-PAYE-CLI-ID;
    }

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
            IF MIR-DV-PAYR-CLI-ID == ""
                MIR-DV-PAYR-CLI-ID = SavePayorId;


            STEP ClientUpdateBilling
            {
                USES P-STEP "BF1222-P";
                MIR-DV-PAYR-CLI-ID -> MIR-CLI-ID;
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
        IF  (TEMP-PLAN-ID == "51520" || TEMP-PLAN-ID == "51521" || TEMP-PLAN-ID == "51532"
	# CHANGES FOR CR1848 ENDS
        || TEMP-PLAN-ID == "53920" || TEMP-PLAN-ID == "53921" || TEMP-PLAN-ID == "53932")
        {
            IF MIR-CPN-PAYE-CLI-ID == ""
               MIR-CPN-PAYE-CLI-ID = SavePayorId;
               MIR-DV-PAYR-CLI-ID = SPACES;


            STEP ClientUpdateBilling
            {
                USES P-STEP "BF1222-P";
                MIR-CPN-PAYE-CLI-ID -> MIR-CLI-ID;
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                BRANCH BillingInfoUpdate;

            # the index number of the row on the page will correspond
            # to the client bank account displayed, or added.
            # send to the process driver the value for the bank account
            # selected to the payor relationship sub code.
            # the payor relationship itself is a derived field and
            # will be set via the process driver (MIR-CPN-PAYE-SUB-TYP-CD).
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

    }

    agent-temp-shr-1 = MIR-POL-AGT-SHR-PCT-T[1];
    agent-temp-shr-2 = MIR-POL-AGT-SHR-PCT-T[2];


    #*****************************************************************
    # Indicate whether the signatures have been captured and lists the
    # agents that participate in the policy
    #*****************************************************************

    STEP Signatures
    {
        USES S-STEP "AppSignaturesFTJ";
        STRINGTABLE.IDS_TITLE_AppSignatures -> Title;
        "AppButtonBar" -> ButtonBar;
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

        agent-temp-shr-1 = MIR-POL-AGT-SHR-PCT-T[1];
        agent-temp-shr-2 = MIR-POL-AGT-SHR-PCT-T[2];

        BRANCH CWA;

    }
    IF action == "ACTION_PREVIOUS"
    {
        MIR-POL-AGT-SHR-PCT-T[1] = agent-temp-shr-1;
        MIR-POL-AGT-SHR-PCT-T[2] = agent-temp-shr-2;

        BRANCH BillingInfoUpdate;

    }


    #*****************************************************************
    # Collect Cash with Application
    # Call a sub-flow for this
    #*****************************************************************

    STEP CWA
    {
        USES S-STEP "AppCwaFTJULU";
        STRINGTABLE.IDS_TITLE_AppCwaDisplay -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "ACTION_PREVIOUS"
        BRANCH Signatures;



    #*****************************************************************
    # Collect Policy data.  This includes rider information as well
    # as Death Benefit Option.
    #
    #*****************************************************************
    # M241A3 Changes STARTS here
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
    # M241A3 Changes ENDS here
        
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
    # M241A3 Changes STARTS here
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
    # M241A3 Changes ENDS here
        BRANCH CWA;
    # M241A3 Changes STARTS here
    }    
        
    IF action == "ACTION_REFRESH"
    {   
        MIR-PLAN-ID-T[1] = temp-plan-id-1;
        BRANCH PolicyDataInput;
    }    
    # M241A3 Changes ENDS here

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


        STEP CheckForErrors
        {
            USES P-STEP "BF8004-P";
        }

    }


    # Preserve messages from the action_next step above.
    # Messages are being overridden by the p-steps that follow, prior
    # to an s-step being displayed.

    temp-msg-t = MESSAGES-T;


    #******************************************************************
    # If Changing from Joint to Single, Collect Connecting Policy Info
    #*****************************************************************

    IF MIR-POL-APP-REASN-CD == "NB"
        BRANCH InsuredData;


    MESSAGES-T = temp-msg-t;

    STEP ConnectedPolicyInput
    {
        USES S-STEP "AppConnectedPolicy";
        STRINGTABLE.IDS_TITLE_AppConnectedPolicy -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "ACTION_PREVIOUS"
    {
        BRANCH PolicyDataInput;

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


    #**********************************************************
    #**********************************************************
    # NOTE: The Allocation step doesn't really do anything for
    #       Manuflex policies at this time as there is only
    #       one fund currently available. When there is more 
    #       than one fund to choose from then an update version
    #       of the Allocation Process will have to written and
    #       can be called at this point in the flow.
    #**********************************************************
    #**********************************************************
    #*****************************************************************
    # Collect Allocation Information
    # Call a sub-flow for this
    #*****************************************************************
    #    STEP Allocations
    #    {
    #        USES PROCESS "AppAllocationsUL";
    #    }
    #    IF LastAction == "ACTION_PREVIOUS"
    #    {
    #        ReturnToPolicyData = "TRUE";
    #        BRANCH PolicyDataInput;
    #    }

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


        #        ReturnToAllocations = "TRUE";
        # if the allocations step was bypassed because there was
        # only 1 fund, send user back to the policy data page
        # instead of the allocations page.  Set an additional
        # flag which will preserve user-entered face amount values
        # should the user wish to correct entries made in error.
        #        IF temp-MIR-DV-FND-DESC-TXT-T[2] == ""
        #        {
    # M142S1 Changes Start
    #    IF MIR-POL-APP-REASN-CD == "JS"
        IF MIR-POL-APP-REASN-CD == "JS" || MIR-POL-APP-REASN-CD == "SP"
    # M142S1 Changes End
        {
            BRANCH ConnectedPolicyInput;

        }

        ReturnToPolicyData = "TRUE";

        BRANCH PolicyDataInput;

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
           MIR-OWN-STCKR-ID    -> MIR-STCKR-ID;
           MIR-OWN-CLI-ID      -> MIR-CLI-ID;
           MIR-EFF-DT          -> MIR-CLI-INCM-EFF-DT;
           MIR-OWN-CLI-NM      -> MIR-DV-OWN-CLI-NM;
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
       LastAction = "";

       ReturnListCliu = "TRUE";

       BRANCH InsuredData;
    }


    #        }
    #        BRANCH Allocations;
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

