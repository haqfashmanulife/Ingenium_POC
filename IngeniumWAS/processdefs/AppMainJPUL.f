# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   AppMainJPUL                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016824  611J     Move Effective date fields to Application Data page       *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppApplicationDataJPUL.s";
INCLUDE "AppIndivSearchJP.f";
INCLUDE "AppCompSearchJP.f";
INCLUDE "AppAddressMailRetrieve.f";
INCLUDE "AppAddressUpdateJP.f";
INCLUDE "BF8001-P.p";
INCLUDE "BF8026-P.p";
INCLUDE "BF1651-P.p";
INCLUDE "BF1652-P.p";
INCLUDE "AppBF8002-P.p";
INCLUDE "AppPolicyDataUL.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8024-P.p";
INCLUDE "AppBF8025-P.p";
INCLUDE "BF8004-P.p";
INCLUDE "AppAllocationsUL.f";
INCLUDE "AppBillingJPUL.s";
INCLUDE "AppInsuredJP.f";
INCLUDE "BF0591-P.p";
INCLUDE "AppAnalysisJPUL.s";
INCLUDE "AppAgentSearch.f";
INCLUDE "AppSignatures.s";
INCLUDE "AppBene.f";
INCLUDE "AppCwaJPUL.f";

PROCESS AppMainJPUL
{
    Title = "Application Entry";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    MIR-POL-CLI-INSRD-CD-T[1] = "SAME";


    #*****************************************************************
    # Collect Client Search information.  A sub-process will be
    # invoked to allow for re-use. Returning from the search will be
    # a client number that can be retained for later use.
    #*****************************************************************

    STEP IndividualSearchPrimaryInsured
    {
        USES PROCESS "AppIndivSearchJP";
        STRINGTABLE.IDS_TITLE_AppSearchPrimaryInsured -> SearchTitle;
        STRINGTABLE.IDS_TITLE_AppListPrimaryInsured -> ListTitle;
        STRINGTABLE.IDS_TITLE_AppCreatePrimaryInsured -> CreateTitle;
        STRINGTABLE.IDS_TITLE_AppUpdatePrimaryInsured -> UpdateTitle;

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
    # re-executed the search sub-process to correct errors,
    # but then cancelled out of that process, return to the point where
    # they asked for the correction in the first place.

    IF ReturnToList == "FALSE" || DataCorrection == "FALSE"
        BRANCH ApplicationDataInput;

    IF LastAction == "ACTION_CANCEL"
        EXIT;


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


    # to produce the entry page, retrieve the mailing address in the
    # format it would be used for mailing purposes.

    STEP MailingAddressRetrieve
    {
        USES PROCESS "AppAddressMailRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MailName <- MIR-DV-OWN-CLI-NM-T[1];
    }


    # preserve the name and address for the primary insured, just in case
    # the user changes owner to other, and then back again.  Page script
    # will perform the moving of these variables to and from their
    # originating names, based on the user selecting the "SAME" or other
    # value from the selection box for this field.

    IF MIR-POL-CLI-INSRD-CD-T[1] == "SAME"
    {
        PrimaryInsuredMailAddressLine-T[1] = MailAddressLine-T[1];
        PrimaryInsuredMailAddressLine-T[2] = MailAddressLine-T[2];
        PrimaryInsuredMailAddressLine-T[3] = MailAddressLine-T[3];
        PrimaryInsuredMailAddressLine-T[4] = MailAddressLine-T[4];
        PrimaryInsuredMailAddressLine-T[5] = MailAddressLine-T[5];
        PrimaryInsuredMailAddressLine-T[6] = MailAddressLine-T[6];
        PrimaryInsuredMailAddressLine-T[7] = MailAddressLine-T[7];
        PrimaryInsuredTAX-ID-T[1] = MIR-CLI-TAX-ID-T[1];
        PrimaryInsuredName = MIR-DV-OWN-CLI-NM-T[1];
        PrimaryInsuredMailName = MailName;
        PrimaryInsuredADDR-TYP-CD-T[1] = MIR-CLI-ADDR-TYP-CD-T[1];
        PrimaryInsuredOwnerClientID = MIR-CLI-ID-T[1];

    }


    #*****************************************************************
    # Collect Application data.  This includes information to filter
    # a product selection box, owner information, and policy
    # replacement information.
    #*****************************************************************

    STEP ApplicationDataInput
    {
        USES S-STEP "AppApplicationDataJPUL";
        "AppButtonBar" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_AppApplicationData -> Title;
    }

    # if user presses PREVIOUS, send them back to where they
    # came from.  Preserving LastActions in the search sub-flows
    # allows us to evaluate these values here and send the user
    # back to either the Search List page, or the Details page.
    # The presumption here is that if the user came from the List
    # page and had attached the wrong client as the primary
    # insured, a return to the list page is the quickest way for the
    # user to select a different primary insured.
    # If the user had either created a new client or updated an
    # existing one, and received messages they wanted to act upon,
    # then a previous action will send them back to the Details
    # page where they can make corrections.

    IF action == "ACTION_PREVIOUS"
    {
        IF LastAction == "ACTION_ATTACH"
        {
            ReturnToList = "TRUE";

            BRANCH IndividualSearchPrimaryInsured;

        }

        DataCorrection = "TRUE";
        MIR-CLI-ID = MIR-INSRD-CLI-ID-T[1];

        BRANCH IndividualSearchPrimaryInsured;

    }

    # the user has indicated that a different owner is required
    # re-do an individual client search to return owner data

    IF action == "GoToIndividualSearch"
    {
        STEP IndividualSearchOwner
        {
            USES PROCESS "AppIndivSearchJP";
            STRINGTABLE.IDS_TITLE_AppSearchIndivOwner -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListIndivOwner -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreateIndivOwner -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdateIndivOwner -> UpdateTitle;

            # send values to the sub-flow for preservation
            # of data should the user cancel from that sub-flow

            MIR-CLI-ID-T[1] -> MIR-CLI-ID;
            MIR-CLI-TAX-ID-T[1] -> MIR-CLI-TAX-ID;
            MIR-DV-OWN-CLI-NM-T[1] -> MIR-DV-CLI-NM;

            # return values from the search sub-flow

            MIR-CLI-ID-T[1] <- MIR-CLI-ID;
            MIR-CLI-TAX-ID-T[1] <- MIR-CLI-TAX-ID;
            MIR-DV-OWN-CLI-NM-T[1] <- MIR-DV-CLI-NM;
        }

        BRANCH MailingAddressRetrieve;

    }
    IF action == "GoToCompanySearch"
    {
        STEP CompanySearchOwner
        {
            USES PROCESS "AppCompSearchJP";
            STRINGTABLE.IDS_TITLE_AppSearchCompanyOwner -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListCompanyOwner -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreateCompanyOwner -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdateCompanyOwner -> UpdateTitle;

            # send values to the sub-flow for preservation
            # of data should the user cancel from that sub-flow

            MIR-CLI-ID-T[1] -> MIR-CLI-ID;
            MIR-CLI-TAX-ID-T[1] -> MIR-CLI-TAX-ID;
            MIR-DV-OWN-CLI-NM-T[1] -> MIR-DV-CLI-NM;

            # return values from the search sub-flow

            MIR-CLI-ID-T[1] <- MIR-CLI-ID;
            MIR-CLI-TAX-ID-T[1] <- MIR-CLI-TAX-ID;
            MIR-DV-OWN-CLI-NM-T[1] <- MIR-DV-CLI-NM;
        }

        BRANCH MailingAddressRetrieve;

    }

    # the user has indicated they need to refresh the product
    # selection box, or has changed their country value.
    # Pageserver will re-build the page, using the filtered
    # selection box set up for this field.

    IF action == "ACTION_REFRESH"
        BRANCH ApplicationDataInput;

    IF action == "ACTION_SEARCH"
    {
        STEP CompanySearchReplacement
        {
            USES PROCESS "AppCompSearchJP";
            STRINGTABLE.IDS_TITLE_AppSearchReplacementCompany -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListReplacementCompany -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreateReplacementCompany -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdateReplacementCompany -> UpdateTitle;
            MIR-REPL-CO-CLI-ID <- MIR-CLI-ID;
            MIR-DV-REPL-CO-CLI-NM <- MIR-DV-CLI-NM;
        }

        BRANCH ApplicationDataInput;

    }
    IF action == "ChangeMailingAddress"
    {
        STEP ChangeMailingAddress
        {
            USES PROCESS "AppAddressUpdateJP";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

        }

        BRANCH MailingAddressRetrieve;

    }
    IF action == "ACTION_NEXT"
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

                BRANCH ApplicationDataInput;

            }

            BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
            BannerProductID = MIR-PLAN-ID;

            STEP UpdateCoveragePrimaryInsured
            {
                USES P-STEP "BF8026-P";
                MIR-INSRD-CLI-ID-T[1] -> MIR-CLI-ID;
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH ApplicationDataInput;


        }

        # Create a replacement record if user has indicated
        # the policy is being replaced.  This step will be executed
        # as above, but only if the above step is successful.

        IF ReplacementQuestion == "Y"
        {
            IF MIR-POL-REPL-SEQ-NUM == ""
            {
                STEP ReplacementRecord
                {
                    USES P-STEP "BF1651-P";
                }

                IF LSIR-RETURN-CD != "00"
                    BRANCH ApplicationDataInput;


            }
            IF ReplacementCode == "Internal"
                MIR-POL-REPL-TYP-CD = "I";

            IF ReplacementCode == "External"
                MIR-POL-REPL-TYP-CD = "E";


            STEP ReplacementRecordUpdate
            {
                USES P-STEP "BF1652-P";
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH ApplicationDataInput;


        }

        STEP PolicyUpdate
        {
            USES P-STEP "AppBF8002-P";
            "P" -> MIR-DV-OWN-SUB-CD-T[1];

            # 16824                  MIR-POL-APP-RECV-DT -> MIR-POL-ISS-EFF-DT;

        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH ApplicationDataInput;


    }

    BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    BannerProductID = MIR-PLAN-ID;

    # update the session object for the policy number just created
    # so that any new window opened will assume this value

    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;


    #*****************************************************************
    # Collect Policy data.  This includes rider information as well
    # as Death Benefit Option.
    #
    #*****************************************************************

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
        MIR-CVG-AD-FACE-AMT-T[1] = temp-face-adamt-1;
        MIR-CVG-AD-FACE-AMT-T[2] = temp-face-adamt-2;
        MIR-CVG-AD-FACE-AMT-T[3] = temp-face-adamt-3;
        MIR-CVG-AD-FACE-AMT-T[4] = temp-face-adamt-4;
        MIR-CVG-AD-FACE-AMT-T[5] = temp-face-adamt-5;
        ReturnToPolicyData = "";

    }

    STEP PolicyDataInput
    {
        USES S-STEP "AppPolicyDataUL";
        STRINGTABLE.IDS_TITLE_AppPolicyData -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "GoToInsuredSearch"
    {
        STEP IndividualSearchInsured
        {
            USES PROCESS "AppIndivSearchJP";
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
        # RE-SET TO BLANKS TO AVOID POSSSIBLE ISSUES LATER IN THE FLOW

        LastAction = "";

        BRANCH PolicyDataInput;

    }
    IF action == "GoToOtherSearch"
    {
        STEP IndividualSearchOther
        {
            USES PROCESS "AppIndivSearchJP";
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
    {
        STEP CoverageDataProcess
        {
            USES P-STEP "AppBF8025-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH PolicyDataInput;



        # preserve coverage values for a return to this page.
        # This is only required to allow the user to see the
        # values they have entered, which may have produced errors they
        # wish to correct.

        temp-face-amt-1 = MIR-CVG-FACE-AMT-T[1];
        temp-face-amt-2 = MIR-CVG-FACE-AMT-T[2];
        temp-face-amt-3 = MIR-CVG-FACE-AMT-T[3];
        temp-face-amt-4 = MIR-CVG-FACE-AMT-T[4];
        temp-face-amt-5 = MIR-CVG-FACE-AMT-T[5];
        temp-face-adamt-1 = MIR-CVG-AD-FACE-AMT-T[1];
        temp-face-adamt-2 = MIR-CVG-AD-FACE-AMT-T[2];
        temp-face-adamt-3 = MIR-CVG-AD-FACE-AMT-T[3];
        temp-face-adamt-4 = MIR-CVG-AD-FACE-AMT-T[4];
        temp-face-adamt-5 = MIR-CVG-AD-FACE-AMT-T[5];
        ReturnToPolicyData = "TRUE";

        BRANCH MailingAddressRetrieve;

    }
    IF action == "ACTION_NEXT"
    {
        STEP PolicyDataProcess
        {
            USES P-STEP "AppBF8002-P";
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

    temp-msg-t = MESSAGES-T;

    # preserve coverage values from this last page for a return
    # to this page.  This is only required to allow the user to see the
    # values they have entered, which may have produced errors they
    # wish to correct.

    temp-face-amt-1 = MIR-CVG-FACE-AMT-T[1];
    temp-face-amt-2 = MIR-CVG-FACE-AMT-T[2];
    temp-face-amt-3 = MIR-CVG-FACE-AMT-T[3];
    temp-face-amt-4 = MIR-CVG-FACE-AMT-T[4];
    temp-face-amt-5 = MIR-CVG-FACE-AMT-T[5];
    temp-face-adamt-1 = MIR-CVG-AD-FACE-AMT-T[1];
    temp-face-adamt-2 = MIR-CVG-AD-FACE-AMT-T[2];
    temp-face-adamt-3 = MIR-CVG-AD-FACE-AMT-T[3];
    temp-face-adamt-4 = MIR-CVG-AD-FACE-AMT-T[4];
    temp-face-adamt-5 = MIR-CVG-AD-FACE-AMT-T[5];


    #*****************************************************************
    # Collect Allocation Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP Allocations
    {
        USES PROCESS "AppAllocationsUL";
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
        ReturnToPolicyData = "TRUE";

        BRANCH PolicyDataRetrieve;

    }

    # if for any reason, allocation records could not be created, sub-flow
    # will return a blank value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.

    IF AllocationCreateSuccessful == ""
        BRANCH Beneficiary;


    # if for any reason, allocation records could not be retrieved, sub-flow
    # will return a FALSE value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.

    IF AllocationRetrieveSuccessful == "FALSE"
        BRANCH Beneficiary;


    # if for any reason, DCA records could not be created, sub-flow
    # will return a blank value for the next variable.  Send user on to
    # Beneficiary data.  Correction for misentered data will have to be
    # made out of flow, or re-tried via Previous button on Bene page.
    # Note:  this variable will also be blank if no DCA instructions
    # were provided.  In this case it is still appropriate to branch to
    # beneficiary.

    IF DCACreateSuccessful == ""
        BRANCH Beneficiary;



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


    #*****************************************************************
    # Collect Billing Information
    # And display the banking for the default payor
    #*****************************************************************
    # Retrieve policy billing information

    STEP BillingInfoRetrieve
    {
        USES P-STEP "BF8000-P";
    }


    # primary owner client info returned by policy retrieve will be in
    # MIR-CLI-ID-T-1.  Set the Payor client id = this value, and retrieve
    # the client record (for banking info).  this is done to preempt the
    # users choice of PAC as the billing type.

    MIR-DV-PAYR-CLI-ID = MIR-CLI-ID-T[1];

    # set the value of the listbill draw day field, equal to that of
    # the policy default for the pac draw day field.  this is done to
    # produce the same set of values in the draw day selection boxes
    # for each of these fields.  only one of these field values will
    # be sent to the server upon submission, as they share the same
    # destination field on the server (mir-pol-pac-drw-dy).

    MIR-POL-LBILL-DRW-DY = MIR-POL-PAC-DRW-DY;

    STEP BankingInfoRetrieve
    {
        USES P-STEP "BF1220-P";
        MIR-DV-PAYR-CLI-ID -> MIR-CLI-ID;

        # return the name from the client retrieve (who is the owner
        # /payor) to a page variable used for display only

        PayorName <- MIR-DV-CLI-NM;
    }


    # Billing method/mode selection box is a composite of method
    # and mode.  combine these 2 fields that reside on the policy
    # in separate fields, into 1

    MIR-DV-SBOX-CD-T = MIR-POL-BILL-TYP-CD + MIR-POL-BILL-MODE-CD;


    # default a value to SFB start date if one is not present.  this is
    # done to preempt the users choice of listbill as the billing type.
    # if the field was valued already, then this means the user is returning
    # to this page after having already selected a start date.  in this case
    # we do not want to override that field value.

    IF MIR-SFB-STRT-DT == ""
        MIR-SFB-STRT-DT = MIR-POL-ISS-EFF-DT;


    STEP BillingInfoUpdate
    {
        USES S-STEP "AppBillingJPUL";
        STRINGTABLE.IDS_TITLE_AppBillingData -> Title;
    }

    IF action == "ACTION_PREVIOUS"
        BRANCH Beneficiary;

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
            # only 4 variables that need to be initialized (birth date
            # sex, tax id, and location - these are shared mir fields
            # between the 2200 and 1220 functions).  The company search
            # sub-process already initializes 3 of these (sex, tax,
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
            STEP ClientUpdateBilling
            {
                USES P-STEP "BF1222-P";
                MIR-DV-PAYR-CLI-ID -> MIR-CLI-ID;
            }


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


    #*****************************************************************
    # Collect Insured Detailed Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP InsuredData
    {
        USES PROCESS "AppInsuredJP";
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
        LastAction = "";

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

        BRANCH BillingInfoUpdate;

    }


    #*****************************************************************
    # Indicate whether the signatures have been captured and lists the
    # agents that participate in the policy
    #*****************************************************************

    STEP Signatures
    {
        USES S-STEP "AppSignatures";
        STRINGTABLE.IDS_TITLE_AppSignatures -> Title;
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

        # if only 1 agent was entered and regardless of the entry
        # to the percent field (either none or any value),
        # default the percent to 100.

        IF MIR-AGT-ID-T[3] == "" && MIR-AGT-ID-T[2] == ""
            MIR-POL-AGT-SHR-PCT-T[1] = "100.00";


        STEP UpdateSignatures
        {
            USES P-STEP "AppBF8002-P";
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
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                BRANCH Signatures;


        }

        BRANCH CWA;

    }
    IF action == "ACTION_PREVIOUS"
        BRANCH InsuredData;



    #*****************************************************************
    # Collect Cash with Application
    # Call a sub-flow for this
    #*****************************************************************

    STEP CWA
    {
        USES PROCESS "AppCwaJPUL";
    }

    IF LastAction == "ACTION_PREVIOUS"
    {
        LastAction = "";

        BRANCH Signatures;

    }


    #*****************************************************************
    # Display Application Summary data and give the ability to cross edit
    # and clear case u/w.
    #*****************************************************************

    STEP ApplicationAnalysisPolicyRetrieve
    {
        USES P-STEP "BF8000-P";
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
        BRANCH CWA;

    IF action == "ACTION_NEXT"
        EXIT;

}

