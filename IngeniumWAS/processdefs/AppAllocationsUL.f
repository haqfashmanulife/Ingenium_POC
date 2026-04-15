# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppAllocationsUL                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0851-P.p";
INCLUDE "BF0850-P.p";
INCLUDE "AppBF0852-P.p";
INCLUDE "BF0941-P.p";
INCLUDE "BF0940-P.p";
INCLUDE "BF0942-P.p";
INCLUDE "BF0943-P.p";
INCLUDE "AppAllocationsUL.s";

PROCESS AppAllocationsUL
{

    # output variables to the main flow for evaluation

  VARIABLES
  {
    OUT LastAction;
     
    OUT AllocationCreateSuccessful;

    OUT AllocationRetrieveSuccessful;

    OUT DCACreateSuccessful;

    OUT ARCreateSuccessful;


    # output all variables used on the Allocations page to the main
    # flow, for a return visit to this flow and page.  This is required
    # in order to re-display the to the user, the values entered on
    # this page.  A more ideal solution is to re-retrieve values from
    # the server, however this requires a restructuring of this sub-flow
    # to re-map each field on the page to the server field and vice-versa.

    OUT temp-index;

    OUT temp-DollarCostAvg;

    OUT temp-InitialSubsequent;

    OUT temp-DCAPayoutNumber;

    OUT temp-MIR-AR-START-DT;


    OUT temp-MIR-CDI-ALLOC-AMT-T[20];

    OUT temp-MIR-CDI-ALLOC-PCT-S-T[20];

    OUT temp-MIR-CDI-ALLOC-PCT-T[20];

    OUT temp-MIR-DV-FND-DESC-TXT-T[20];


    OUT temp-MIR-POL-PAYO-AMT;

    OUT temp-MIR-POL-PAYO-EFF-DT;

    OUT temp-MIR-POL-PAYO-END-DT;

    OUT temp-MIR-POL-PAYO-MODE-CD;

    OUT temp-MIR-POL-PAYO-MODE-CD-2;



    # input messages from the main flow for display on the allocations
    # page.  This is done because of subsequent p-step action that
    # will override any message displays, for allocation create
    # and retrieve steps.

    IN ReturnToAllocations;

    IN temp-msg-t;
  }

    Title = "UL Participation Rates";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    #*****************************************************************
    # Collect Policy Allocation information.
    #
    #*****************************************************************
    # create an initial fund allocation

    IF AllocationCreateSuccessful == ""
    {
        STEP AllocationCreateInitial
        {
            USES P-STEP "BF0851-P";

            # send in fields not entered by user

            "I" -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-POL-ISS-EFF-DT -> MIR-CDI-EFF-DT;
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            EXIT;


        STEP AllocationCreateSubsequent
        {
            USES P-STEP "BF0851-P";

            # send in fields not entered by user

            "S" -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-POL-ISS-EFF-DT -> MIR-CDI-EFF-DT;
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            EXIT;


        AllocationCreateSuccessful = "TRUE";

    }


    # retrieve the list of funds that are available to the policy

    STEP AllocationInitialRetrieve
    {
        USES P-STEP "BF0850-P";

        # send in fields not entered by user

        "I" -> MIR-DV-POL-PAYO-TYP-CD;
        MIR-POL-ISS-EFF-DT -> MIR-CDI-EFF-DT;
    }

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
    {
        AllocationRetrieveSuccessful = "FALSE";

        EXIT;

    }


    # allow the user to input all information for initial, subsequent and
    # dollar cost data on one page
    # re-assign temporary messages that were from a policy update on the
    # last step before this sub-flow.  No messages are normally returned
    # from either a successful create or retrieve of allocation records.

    MESSAGES-T = temp-msg-t;


    # restore values saved for re-navigation to this page

    IF ReturnToAllocations == "TRUE"
    {
        index = temp-index;
        DollarCostAvg = temp-DollarCostAvg;
        InitialSubsequent = temp-InitialSubsequent;
        DCAPayoutNumber = temp-DCAPayoutNumber;
        MIR-AR-START-DT = temp-MIR-AR-START-DT;
        MIR-CDI-ALLOC-AMT-T[1] = temp-MIR-CDI-ALLOC-AMT-T[1];
        MIR-CDI-ALLOC-AMT-T[10] = temp-MIR-CDI-ALLOC-AMT-T[10];
        MIR-CDI-ALLOC-AMT-T[11] = temp-MIR-CDI-ALLOC-AMT-T[11];
        MIR-CDI-ALLOC-AMT-T[12] = temp-MIR-CDI-ALLOC-AMT-T[12];
        MIR-CDI-ALLOC-AMT-T[13] = temp-MIR-CDI-ALLOC-AMT-T[13];
        MIR-CDI-ALLOC-AMT-T[14] = temp-MIR-CDI-ALLOC-AMT-T[14];
        MIR-CDI-ALLOC-AMT-T[15] = temp-MIR-CDI-ALLOC-AMT-T[15];
        MIR-CDI-ALLOC-AMT-T[16] = temp-MIR-CDI-ALLOC-AMT-T[16];
        MIR-CDI-ALLOC-AMT-T[17] = temp-MIR-CDI-ALLOC-AMT-T[17];
        MIR-CDI-ALLOC-AMT-T[18] = temp-MIR-CDI-ALLOC-AMT-T[18];
        MIR-CDI-ALLOC-AMT-T[19] = temp-MIR-CDI-ALLOC-AMT-T[19];
        MIR-CDI-ALLOC-AMT-T[2] = temp-MIR-CDI-ALLOC-AMT-T[2];
        MIR-CDI-ALLOC-AMT-T[20] = temp-MIR-CDI-ALLOC-AMT-T[20];
        MIR-CDI-ALLOC-AMT-T[3] = temp-MIR-CDI-ALLOC-AMT-T[3];
        MIR-CDI-ALLOC-AMT-T[4] = temp-MIR-CDI-ALLOC-AMT-T[4];
        MIR-CDI-ALLOC-AMT-T[5] = temp-MIR-CDI-ALLOC-AMT-T[5];
        MIR-CDI-ALLOC-AMT-T[6] = temp-MIR-CDI-ALLOC-AMT-T[6];
        MIR-CDI-ALLOC-AMT-T[7] = temp-MIR-CDI-ALLOC-AMT-T[7];
        MIR-CDI-ALLOC-AMT-T[8] = temp-MIR-CDI-ALLOC-AMT-T[8];
        MIR-CDI-ALLOC-AMT-T[9] = temp-MIR-CDI-ALLOC-AMT-T[9];
        MIR-CDI-ALLOC-PCT-S-T[1] = temp-MIR-CDI-ALLOC-PCT-S-T[1];
        MIR-CDI-ALLOC-PCT-S-T[10] = temp-MIR-CDI-ALLOC-PCT-S-T[10];
        MIR-CDI-ALLOC-PCT-S-T[11] = temp-MIR-CDI-ALLOC-PCT-S-T[11];
        MIR-CDI-ALLOC-PCT-S-T[12] = temp-MIR-CDI-ALLOC-PCT-S-T[12];
        MIR-CDI-ALLOC-PCT-S-T[13] = temp-MIR-CDI-ALLOC-PCT-S-T[13];
        MIR-CDI-ALLOC-PCT-S-T[14] = temp-MIR-CDI-ALLOC-PCT-S-T[14];
        MIR-CDI-ALLOC-PCT-S-T[15] = temp-MIR-CDI-ALLOC-PCT-S-T[15];
        MIR-CDI-ALLOC-PCT-S-T[16] = temp-MIR-CDI-ALLOC-PCT-S-T[16];
        MIR-CDI-ALLOC-PCT-S-T[17] = temp-MIR-CDI-ALLOC-PCT-S-T[17];
        MIR-CDI-ALLOC-PCT-S-T[18] = temp-MIR-CDI-ALLOC-PCT-S-T[18];
        MIR-CDI-ALLOC-PCT-S-T[19] = temp-MIR-CDI-ALLOC-PCT-S-T[19];
        MIR-CDI-ALLOC-PCT-S-T[2] = temp-MIR-CDI-ALLOC-PCT-S-T[2];
        MIR-CDI-ALLOC-PCT-S-T[20] = temp-MIR-CDI-ALLOC-PCT-S-T[20];
        MIR-CDI-ALLOC-PCT-S-T[3] = temp-MIR-CDI-ALLOC-PCT-S-T[3];
        MIR-CDI-ALLOC-PCT-S-T[4] = temp-MIR-CDI-ALLOC-PCT-S-T[4];
        MIR-CDI-ALLOC-PCT-S-T[5] = temp-MIR-CDI-ALLOC-PCT-S-T[5];
        MIR-CDI-ALLOC-PCT-S-T[6] = temp-MIR-CDI-ALLOC-PCT-S-T[6];
        MIR-CDI-ALLOC-PCT-S-T[7] = temp-MIR-CDI-ALLOC-PCT-S-T[7];
        MIR-CDI-ALLOC-PCT-S-T[8] = temp-MIR-CDI-ALLOC-PCT-S-T[8];
        MIR-CDI-ALLOC-PCT-S-T[9] = temp-MIR-CDI-ALLOC-PCT-S-T[9];
        MIR-CDI-ALLOC-PCT-T[1] = temp-MIR-CDI-ALLOC-PCT-T[1];
        MIR-CDI-ALLOC-PCT-T[10] = temp-MIR-CDI-ALLOC-PCT-T[10];
        MIR-CDI-ALLOC-PCT-T[11] = temp-MIR-CDI-ALLOC-PCT-T[11];
        MIR-CDI-ALLOC-PCT-T[12] = temp-MIR-CDI-ALLOC-PCT-T[12];
        MIR-CDI-ALLOC-PCT-T[13] = temp-MIR-CDI-ALLOC-PCT-T[13];
        MIR-CDI-ALLOC-PCT-T[14] = temp-MIR-CDI-ALLOC-PCT-T[14];
        MIR-CDI-ALLOC-PCT-T[15] = temp-MIR-CDI-ALLOC-PCT-T[15];
        MIR-CDI-ALLOC-PCT-T[16] = temp-MIR-CDI-ALLOC-PCT-T[16];
        MIR-CDI-ALLOC-PCT-T[17] = temp-MIR-CDI-ALLOC-PCT-T[17];
        MIR-CDI-ALLOC-PCT-T[18] = temp-MIR-CDI-ALLOC-PCT-T[18];
        MIR-CDI-ALLOC-PCT-T[19] = temp-MIR-CDI-ALLOC-PCT-T[19];
        MIR-CDI-ALLOC-PCT-T[2] = temp-MIR-CDI-ALLOC-PCT-T[2];
        MIR-CDI-ALLOC-PCT-T[20] = temp-MIR-CDI-ALLOC-PCT-T[20];
        MIR-CDI-ALLOC-PCT-T[3] = temp-MIR-CDI-ALLOC-PCT-T[3];
        MIR-CDI-ALLOC-PCT-T[4] = temp-MIR-CDI-ALLOC-PCT-T[4];
        MIR-CDI-ALLOC-PCT-T[5] = temp-MIR-CDI-ALLOC-PCT-T[5];
        MIR-CDI-ALLOC-PCT-T[6] = temp-MIR-CDI-ALLOC-PCT-T[6];
        MIR-CDI-ALLOC-PCT-T[7] = temp-MIR-CDI-ALLOC-PCT-T[7];
        MIR-CDI-ALLOC-PCT-T[8] = temp-MIR-CDI-ALLOC-PCT-T[8];
        MIR-CDI-ALLOC-PCT-T[9] = temp-MIR-CDI-ALLOC-PCT-T[9];
        MIR-DV-FND-DESC-TXT-T[1] = temp-MIR-DV-FND-DESC-TXT-T[1];
        MIR-DV-FND-DESC-TXT-T[10] = temp-MIR-DV-FND-DESC-TXT-T[10];
        MIR-DV-FND-DESC-TXT-T[11] = temp-MIR-DV-FND-DESC-TXT-T[11];
        MIR-DV-FND-DESC-TXT-T[12] = temp-MIR-DV-FND-DESC-TXT-T[12];
        MIR-DV-FND-DESC-TXT-T[13] = temp-MIR-DV-FND-DESC-TXT-T[13];
        MIR-DV-FND-DESC-TXT-T[14] = temp-MIR-DV-FND-DESC-TXT-T[14];
        MIR-DV-FND-DESC-TXT-T[15] = temp-MIR-DV-FND-DESC-TXT-T[15];
        MIR-DV-FND-DESC-TXT-T[16] = temp-MIR-DV-FND-DESC-TXT-T[16];
        MIR-DV-FND-DESC-TXT-T[17] = temp-MIR-DV-FND-DESC-TXT-T[17];
        MIR-DV-FND-DESC-TXT-T[18] = temp-MIR-DV-FND-DESC-TXT-T[18];
        MIR-DV-FND-DESC-TXT-T[19] = temp-MIR-DV-FND-DESC-TXT-T[19];
        MIR-DV-FND-DESC-TXT-T[2] = temp-MIR-DV-FND-DESC-TXT-T[2];
        MIR-DV-FND-DESC-TXT-T[20] = temp-MIR-DV-FND-DESC-TXT-T[20];
        MIR-DV-FND-DESC-TXT-T[3] = temp-MIR-DV-FND-DESC-TXT-T[3];
        MIR-DV-FND-DESC-TXT-T[4] = temp-MIR-DV-FND-DESC-TXT-T[4];
        MIR-DV-FND-DESC-TXT-T[5] = temp-MIR-DV-FND-DESC-TXT-T[5];
        MIR-DV-FND-DESC-TXT-T[6] = temp-MIR-DV-FND-DESC-TXT-T[6];
        MIR-DV-FND-DESC-TXT-T[7] = temp-MIR-DV-FND-DESC-TXT-T[7];
        MIR-DV-FND-DESC-TXT-T[8] = temp-MIR-DV-FND-DESC-TXT-T[8];
        MIR-DV-FND-DESC-TXT-T[9] = temp-MIR-DV-FND-DESC-TXT-T[9];
        MIR-POL-PAYO-AMT = temp-MIR-POL-PAYO-AMT;
        MIR-POL-PAYO-EFF-DT = temp-MIR-POL-PAYO-EFF-DT;
        MIR-POL-PAYO-END-DT = temp-MIR-POL-PAYO-END-DT;
        MIR-POL-PAYO-MODE-CD = temp-MIR-POL-PAYO-MODE-CD;
        MIR-POL-PAYO-MODE-CD-2 = temp-MIR-POL-PAYO-MODE-CD-2;


        # rather than trying to update DCA records in place on a revisit
        # to this page, delete the old record if one exists.  A new record
        # will always then be created for DCA instructions.

        IF DCAPayoutNumber > "00000"
        {
            STEP DCADelete
            {
                USES P-STEP "BF0943-P";
                ATTRIBUTES
                {
                    Explicit;
                    GetMessages = "NO";
                }

                MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
                MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
                DCAPayoutNumber -> MIR-POL-PAYO-NUM;
            }

        }

        ReturnToAllocations = "";

    }

    # if the DCA start date field is blank
    # default the policy issue date to this field.

    IF MIR-POL-PAYO-EFF-DT == ""
        MIR-POL-PAYO-EFF-DT = MIR-POL-ISS-EFF-DT;

    IF MIR-DV-FND-DESC-TXT-T[2] == ""
    {
        MIR-CDI-ALLOC-PCT-T[1] = "100";
        MIR-CDI-ALLOC-PCT-S-T[1] = "100";
        AssetRebalance = "N";
        DollarCostAvg = "N";

        BRANCH AllocationUpdateInitial;

    }

    STEP AllocationInput
    {
        USES S-STEP "AppAllocationsUL";
        STRINGTABLE.IDS_TITLE_AppAllocationData -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    temp-msg-t[0] = "";

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_NEXT"
    {

        # to allow for back/forth navigation over this page, preserve all page values
        # here.  Restore these variables if this page is re-displayed.

        temp-index = index;
        temp-DollarCostAvg = DollarCostAvg;
        temp-InitialSubsequent = InitialSubsequent;
        temp-MIR-CDI-ALLOC-AMT-T[1] = MIR-CDI-ALLOC-AMT-T[1];
        temp-MIR-CDI-ALLOC-AMT-T[10] = MIR-CDI-ALLOC-AMT-T[10];
        temp-MIR-CDI-ALLOC-AMT-T[11] = MIR-CDI-ALLOC-AMT-T[11];
        temp-MIR-CDI-ALLOC-AMT-T[12] = MIR-CDI-ALLOC-AMT-T[12];
        temp-MIR-CDI-ALLOC-AMT-T[13] = MIR-CDI-ALLOC-AMT-T[13];
        temp-MIR-CDI-ALLOC-AMT-T[14] = MIR-CDI-ALLOC-AMT-T[14];
        temp-MIR-CDI-ALLOC-AMT-T[15] = MIR-CDI-ALLOC-AMT-T[15];
        temp-MIR-CDI-ALLOC-AMT-T[16] = MIR-CDI-ALLOC-AMT-T[16];
        temp-MIR-CDI-ALLOC-AMT-T[17] = MIR-CDI-ALLOC-AMT-T[17];
        temp-MIR-CDI-ALLOC-AMT-T[18] = MIR-CDI-ALLOC-AMT-T[18];
        temp-MIR-CDI-ALLOC-AMT-T[19] = MIR-CDI-ALLOC-AMT-T[19];
        temp-MIR-CDI-ALLOC-AMT-T[2] = MIR-CDI-ALLOC-AMT-T[2];
        temp-MIR-CDI-ALLOC-AMT-T[20] = MIR-CDI-ALLOC-AMT-T[20];
        temp-MIR-CDI-ALLOC-AMT-T[3] = MIR-CDI-ALLOC-AMT-T[3];
        temp-MIR-CDI-ALLOC-AMT-T[4] = MIR-CDI-ALLOC-AMT-T[4];
        temp-MIR-CDI-ALLOC-AMT-T[5] = MIR-CDI-ALLOC-AMT-T[5];
        temp-MIR-CDI-ALLOC-AMT-T[6] = MIR-CDI-ALLOC-AMT-T[6];
        temp-MIR-CDI-ALLOC-AMT-T[7] = MIR-CDI-ALLOC-AMT-T[7];
        temp-MIR-CDI-ALLOC-AMT-T[8] = MIR-CDI-ALLOC-AMT-T[8];
        temp-MIR-CDI-ALLOC-AMT-T[9] = MIR-CDI-ALLOC-AMT-T[9];
        temp-MIR-CDI-ALLOC-PCT-S-T[1] = MIR-CDI-ALLOC-PCT-S-T[1];
        temp-MIR-CDI-ALLOC-PCT-S-T[10] = MIR-CDI-ALLOC-PCT-S-T[10];
        temp-MIR-CDI-ALLOC-PCT-S-T[11] = MIR-CDI-ALLOC-PCT-S-T[11];
        temp-MIR-CDI-ALLOC-PCT-S-T[12] = MIR-CDI-ALLOC-PCT-S-T[12];
        temp-MIR-CDI-ALLOC-PCT-S-T[13] = MIR-CDI-ALLOC-PCT-S-T[13];
        temp-MIR-CDI-ALLOC-PCT-S-T[14] = MIR-CDI-ALLOC-PCT-S-T[14];
        temp-MIR-CDI-ALLOC-PCT-S-T[15] = MIR-CDI-ALLOC-PCT-S-T[15];
        temp-MIR-CDI-ALLOC-PCT-S-T[16] = MIR-CDI-ALLOC-PCT-S-T[16];
        temp-MIR-CDI-ALLOC-PCT-S-T[17] = MIR-CDI-ALLOC-PCT-S-T[17];
        temp-MIR-CDI-ALLOC-PCT-S-T[18] = MIR-CDI-ALLOC-PCT-S-T[18];
        temp-MIR-CDI-ALLOC-PCT-S-T[19] = MIR-CDI-ALLOC-PCT-S-T[19];
        temp-MIR-CDI-ALLOC-PCT-S-T[2] = MIR-CDI-ALLOC-PCT-S-T[2];
        temp-MIR-CDI-ALLOC-PCT-S-T[20] = MIR-CDI-ALLOC-PCT-S-T[20];
        temp-MIR-CDI-ALLOC-PCT-S-T[3] = MIR-CDI-ALLOC-PCT-S-T[3];
        temp-MIR-CDI-ALLOC-PCT-S-T[4] = MIR-CDI-ALLOC-PCT-S-T[4];
        temp-MIR-CDI-ALLOC-PCT-S-T[5] = MIR-CDI-ALLOC-PCT-S-T[5];
        temp-MIR-CDI-ALLOC-PCT-S-T[6] = MIR-CDI-ALLOC-PCT-S-T[6];
        temp-MIR-CDI-ALLOC-PCT-S-T[7] = MIR-CDI-ALLOC-PCT-S-T[7];
        temp-MIR-CDI-ALLOC-PCT-S-T[8] = MIR-CDI-ALLOC-PCT-S-T[8];
        temp-MIR-CDI-ALLOC-PCT-S-T[9] = MIR-CDI-ALLOC-PCT-S-T[9];
        temp-MIR-CDI-ALLOC-PCT-T[1] = MIR-CDI-ALLOC-PCT-T[1];
        temp-MIR-CDI-ALLOC-PCT-T[10] = MIR-CDI-ALLOC-PCT-T[10];
        temp-MIR-CDI-ALLOC-PCT-T[11] = MIR-CDI-ALLOC-PCT-T[11];
        temp-MIR-CDI-ALLOC-PCT-T[12] = MIR-CDI-ALLOC-PCT-T[12];
        temp-MIR-CDI-ALLOC-PCT-T[13] = MIR-CDI-ALLOC-PCT-T[13];
        temp-MIR-CDI-ALLOC-PCT-T[14] = MIR-CDI-ALLOC-PCT-T[14];
        temp-MIR-CDI-ALLOC-PCT-T[15] = MIR-CDI-ALLOC-PCT-T[15];
        temp-MIR-CDI-ALLOC-PCT-T[16] = MIR-CDI-ALLOC-PCT-T[16];
        temp-MIR-CDI-ALLOC-PCT-T[17] = MIR-CDI-ALLOC-PCT-T[17];
        temp-MIR-CDI-ALLOC-PCT-T[18] = MIR-CDI-ALLOC-PCT-T[18];
        temp-MIR-CDI-ALLOC-PCT-T[19] = MIR-CDI-ALLOC-PCT-T[19];
        temp-MIR-CDI-ALLOC-PCT-T[2] = MIR-CDI-ALLOC-PCT-T[2];
        temp-MIR-CDI-ALLOC-PCT-T[20] = MIR-CDI-ALLOC-PCT-T[20];
        temp-MIR-CDI-ALLOC-PCT-T[3] = MIR-CDI-ALLOC-PCT-T[3];
        temp-MIR-CDI-ALLOC-PCT-T[4] = MIR-CDI-ALLOC-PCT-T[4];
        temp-MIR-CDI-ALLOC-PCT-T[5] = MIR-CDI-ALLOC-PCT-T[5];
        temp-MIR-CDI-ALLOC-PCT-T[6] = MIR-CDI-ALLOC-PCT-T[6];
        temp-MIR-CDI-ALLOC-PCT-T[7] = MIR-CDI-ALLOC-PCT-T[7];
        temp-MIR-CDI-ALLOC-PCT-T[8] = MIR-CDI-ALLOC-PCT-T[8];
        temp-MIR-CDI-ALLOC-PCT-T[9] = MIR-CDI-ALLOC-PCT-T[9];
        temp-MIR-DV-FND-DESC-TXT-T[1] = MIR-DV-FND-DESC-TXT-T[1];
        temp-MIR-DV-FND-DESC-TXT-T[10] = MIR-DV-FND-DESC-TXT-T[10];
        temp-MIR-DV-FND-DESC-TXT-T[11] = MIR-DV-FND-DESC-TXT-T[11];
        temp-MIR-DV-FND-DESC-TXT-T[12] = MIR-DV-FND-DESC-TXT-T[12];
        temp-MIR-DV-FND-DESC-TXT-T[13] = MIR-DV-FND-DESC-TXT-T[13];
        temp-MIR-DV-FND-DESC-TXT-T[14] = MIR-DV-FND-DESC-TXT-T[14];
        temp-MIR-DV-FND-DESC-TXT-T[15] = MIR-DV-FND-DESC-TXT-T[15];
        temp-MIR-DV-FND-DESC-TXT-T[16] = MIR-DV-FND-DESC-TXT-T[16];
        temp-MIR-DV-FND-DESC-TXT-T[17] = MIR-DV-FND-DESC-TXT-T[17];
        temp-MIR-DV-FND-DESC-TXT-T[18] = MIR-DV-FND-DESC-TXT-T[18];
        temp-MIR-DV-FND-DESC-TXT-T[19] = MIR-DV-FND-DESC-TXT-T[19];
        temp-MIR-DV-FND-DESC-TXT-T[2] = MIR-DV-FND-DESC-TXT-T[2];
        temp-MIR-DV-FND-DESC-TXT-T[20] = MIR-DV-FND-DESC-TXT-T[20];
        temp-MIR-DV-FND-DESC-TXT-T[3] = MIR-DV-FND-DESC-TXT-T[3];
        temp-MIR-DV-FND-DESC-TXT-T[4] = MIR-DV-FND-DESC-TXT-T[4];
        temp-MIR-DV-FND-DESC-TXT-T[5] = MIR-DV-FND-DESC-TXT-T[5];
        temp-MIR-DV-FND-DESC-TXT-T[6] = MIR-DV-FND-DESC-TXT-T[6];
        temp-MIR-DV-FND-DESC-TXT-T[7] = MIR-DV-FND-DESC-TXT-T[7];
        temp-MIR-DV-FND-DESC-TXT-T[8] = MIR-DV-FND-DESC-TXT-T[8];
        temp-MIR-DV-FND-DESC-TXT-T[9] = MIR-DV-FND-DESC-TXT-T[9];
        temp-MIR-POL-PAYO-AMT = MIR-POL-PAYO-AMT;
        temp-MIR-POL-PAYO-EFF-DT = MIR-POL-PAYO-EFF-DT;
        temp-MIR-POL-PAYO-END-DT = MIR-POL-PAYO-END-DT;
        temp-MIR-POL-PAYO-MODE-CD = MIR-POL-PAYO-MODE-CD;
        temp-MIR-POL-PAYO-MODE-CD-2 = MIR-POL-PAYO-MODE-CD-2;

        # begin the process of sending in all user information to the
        # server

        LastAction = action;

        STEP AllocationUpdateInitial
        {
            USES P-STEP "AppBF0852-P";

            # send in fields not entered by user
            # a custom P step is used here to prevent the
            # server from returning the array of data in a
            # different sort order than sent in.  The update
            # step on the server will re-sort the data sent to
            # it based on the values entered by the user.  This would
            # cause subsequent p-steps using data from the original
            # p-steps that populated this page with data, to be out
            # of synch.

            "I" -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-POL-ISS-EFF-DT -> MIR-CDI-EFF-DT;
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH AllocationInput;


        STEP AllocationUpdateSubsequent
        {
            USES P-STEP "AppBF0852-P";

            # send in fields not entered by user

            "S" -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-POL-ISS-EFF-DT -> MIR-CDI-EFF-DT;

            # assign page values to proper server fields.
            # page fields were duplicated for same process
            # driver access on one page.

            MIR-CDI-ALLOC-PCT-S-T[1] -> MIR-CDI-ALLOC-PCT-T[1];
            MIR-CDI-ALLOC-PCT-S-T[2] -> MIR-CDI-ALLOC-PCT-T[2];
            MIR-CDI-ALLOC-PCT-S-T[3] -> MIR-CDI-ALLOC-PCT-T[3];
            MIR-CDI-ALLOC-PCT-S-T[4] -> MIR-CDI-ALLOC-PCT-T[4];
            MIR-CDI-ALLOC-PCT-S-T[5] -> MIR-CDI-ALLOC-PCT-T[5];
            MIR-CDI-ALLOC-PCT-S-T[6] -> MIR-CDI-ALLOC-PCT-T[6];
            MIR-CDI-ALLOC-PCT-S-T[7] -> MIR-CDI-ALLOC-PCT-T[7];
            MIR-CDI-ALLOC-PCT-S-T[8] -> MIR-CDI-ALLOC-PCT-T[8];
            MIR-CDI-ALLOC-PCT-S-T[9] -> MIR-CDI-ALLOC-PCT-T[9];
            MIR-CDI-ALLOC-PCT-S-T[10] -> MIR-CDI-ALLOC-PCT-T[10];
            MIR-CDI-ALLOC-PCT-S-T[11] -> MIR-CDI-ALLOC-PCT-T[11];
            MIR-CDI-ALLOC-PCT-S-T[12] -> MIR-CDI-ALLOC-PCT-T[12];
            MIR-CDI-ALLOC-PCT-S-T[13] -> MIR-CDI-ALLOC-PCT-T[13];
            MIR-CDI-ALLOC-PCT-S-T[14] -> MIR-CDI-ALLOC-PCT-T[14];
            MIR-CDI-ALLOC-PCT-S-T[15] -> MIR-CDI-ALLOC-PCT-T[15];
            MIR-CDI-ALLOC-PCT-S-T[16] -> MIR-CDI-ALLOC-PCT-T[16];
            MIR-CDI-ALLOC-PCT-S-T[17] -> MIR-CDI-ALLOC-PCT-T[17];
            MIR-CDI-ALLOC-PCT-S-T[18] -> MIR-CDI-ALLOC-PCT-T[18];
            MIR-CDI-ALLOC-PCT-S-T[19] -> MIR-CDI-ALLOC-PCT-T[19];
            MIR-CDI-ALLOC-PCT-S-T[20] -> MIR-CDI-ALLOC-PCT-T[20];
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH AllocationInput;

        IF DollarCostAvg == "Y"
        {
            STEP AllocationCreateDCA
            {
                USES P-STEP "BF0941-P";

                # send in fields not entered by user

                "C" -> MIR-POL-PAYO-TYP-CD;
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
                EXIT;


            temp-DCAPayoutNumber = MIR-POL-PAYO-NUM;
            DCACreateSuccessful = "TRUE";
            MIR-DEST-FND-ID-T[1] = MIR-FND-ID-T[1];
            MIR-DEST-FND-ID-T[2] = MIR-FND-ID-T[2];
            MIR-DEST-FND-ID-T[3] = MIR-FND-ID-T[3];
            MIR-DEST-FND-ID-T[4] = MIR-FND-ID-T[4];
            MIR-DEST-FND-ID-T[5] = MIR-FND-ID-T[5];
            MIR-DEST-FND-ID-T[6] = MIR-FND-ID-T[6];
            MIR-DEST-FND-ID-T[7] = MIR-FND-ID-T[7];
            MIR-DEST-FND-ID-T[8] = MIR-FND-ID-T[8];
            MIR-DEST-FND-ID-T[9] = MIR-FND-ID-T[9];
            MIR-DEST-FND-ID-T[10] = MIR-FND-ID-T[10];
            MIR-DEST-FND-ID-T[11] = MIR-FND-ID-T[11];
            MIR-DEST-FND-ID-T[12] = MIR-FND-ID-T[12];
            MIR-DEST-FND-ID-T[13] = MIR-FND-ID-T[13];
            MIR-DEST-FND-ID-T[14] = MIR-FND-ID-T[14];
            MIR-DEST-FND-ID-T[15] = MIR-FND-ID-T[15];
            MIR-DEST-FND-ID-T[16] = MIR-FND-ID-T[16];
            MIR-DEST-FND-ID-T[17] = MIR-FND-ID-T[17];
            MIR-DEST-FND-ID-T[18] = MIR-FND-ID-T[18];
            MIR-DEST-FND-ID-T[19] = MIR-FND-ID-T[19];
            MIR-DEST-FND-ID-T[20] = MIR-FND-ID-T[20];
            MIR-DEST-CVG-NUM-T[1] = MIR-CVG-NUM-T[1];
            MIR-DEST-CVG-NUM-T[2] = MIR-CVG-NUM-T[2];
            MIR-DEST-CVG-NUM-T[3] = MIR-CVG-NUM-T[3];
            MIR-DEST-CVG-NUM-T[4] = MIR-CVG-NUM-T[4];
            MIR-DEST-CVG-NUM-T[5] = MIR-CVG-NUM-T[5];
            MIR-DEST-CVG-NUM-T[6] = MIR-CVG-NUM-T[6];
            MIR-DEST-CVG-NUM-T[7] = MIR-CVG-NUM-T[7];
            MIR-DEST-CVG-NUM-T[8] = MIR-CVG-NUM-T[8];
            MIR-DEST-CVG-NUM-T[9] = MIR-CVG-NUM-T[9];
            MIR-DEST-CVG-NUM-T[10] = MIR-CVG-NUM-T[10];
            MIR-DEST-CVG-NUM-T[11] = MIR-CVG-NUM-T[11];
            MIR-DEST-CVG-NUM-T[12] = MIR-CVG-NUM-T[12];
            MIR-DEST-CVG-NUM-T[13] = MIR-CVG-NUM-T[13];
            MIR-DEST-CVG-NUM-T[14] = MIR-CVG-NUM-T[14];
            MIR-DEST-CVG-NUM-T[15] = MIR-CVG-NUM-T[15];
            MIR-DEST-CVG-NUM-T[16] = MIR-CVG-NUM-T[16];
            MIR-DEST-CVG-NUM-T[17] = MIR-CVG-NUM-T[17];
            MIR-DEST-CVG-NUM-T[18] = MIR-CVG-NUM-T[18];
            MIR-DEST-CVG-NUM-T[19] = MIR-CVG-NUM-T[19];
            MIR-DEST-CVG-NUM-T[20] = MIR-CVG-NUM-T[20];

            # Select the source fund from the list of funds
            # and move the information from the table
            # into the Source Coverage and Fund

            MIR-CVG-NUM = MIR-DEST-CVG-NUM-T[index];
            MIR-FND-ID = MIR-DEST-FND-ID-T[index];

            # the source fund must be sent to INGENIUM as
            # a blank, thereby deleting the CDI record for it.
            # sending a blank value will accomplish this.

            MIR-CDI-ALLOC-AMT-T[index] = "*";
            MIR-CDI-ALLOC-CD-T[index] = "*";

            STEP AllocationUpdateDCA
            {
                USES P-STEP "BF0942-P";
                temp-DCAPayoutNumber -> MIR-POL-PAYO-NUM;

                # need to explicitly send in payout number
                # since this could be a return visit to the
                # page, and we want to update the same record
                # that was created earlier.  This can't be
                # left to be sent in from cache, because
                # the Asset Rebalance step below will have
                # also used the same mir field for its output
                # on a different record create.

            }

        }

    }
}

