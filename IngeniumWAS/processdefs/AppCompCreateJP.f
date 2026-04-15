# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCompCreateJP.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added new key fields from search                          *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppCompCreateJP.s";
INCLUDE "BF1221-P.p";
INCLUDE "AppClientUpdate-P.p";

PROCESS AppCompCreateJP
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
    IN CreateTitle;

    # input values from the search sub-flow that will be used
    # to create a new client record

    IN Search-crnt-loc-cd;

    IN Search-comp-name;

    IN Search-zip-cd;

    IN Search-tax-id;

    IN Search-JP-address-code;

    IN Search-city-name;



    # after successful creation, output these values to the main flow

    OUT MIR-CLI-ID;

    OUT MIR-DV-CLI-NM;

    OUT MIR-CLI-TAX-ID;

    OUT SearchAgain;

    OUT LastAction;
  }

    Title = "Create a New Client";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarClient";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # assign the values from the search input page
    # to MIR field names on the create page.

    MIR-CLI-ENTR-CO-NM-T[1] = Search-comp-name;
    MIR-CLI-PSTL-CD-T[1] = Search-zip-cd;
    MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
    MIR-CLI-TAX-ID = Search-tax-id;
    MIR-CLI-JP-ADDR-CD-T[1] = Search-JP-address-code;
    MIR-CLI-CITY-NM-TXT-T[1] = Search-city-name;

    # address line 1 on the list display uses the same mir name
    # as the detail page, therefore on an Add, set this value to
    # spaces to prevent this data from implicitly moving to the
    # detail record.  The setting of this variable to spaces here
    # will not impact this value on the list page, since the field
    # itself is not being output from this flow.
    #       MIR-CLI-JP-ADDR-CD-T-1 = "";

    MIR-CLI-ADDR-LN-1-TXT-T[1] = "";

    # to prevent inadvertently using a client id that may already
    # be in cache, set the id value to spaces for all create actions

    MIR-CLI-ID = "";

    # Set values to produce selection boxes from a Postal Code

    MIR-DV-RQST-PSTL-ADDR-GR-KJ = "KJ";
    MIR-DV-RQST-PSTL-ADDR-GR-KA = "KA";
    MIR-DV-RQST-PSTL-ADDR-LN-1-TXT = "1";
    MIR-DV-RQST-PSTL-ADDR-LN-2-TXT = "2";


    #*****************************************************************
    # Collect Client information.
    #*****************************************************************

    STEP CompanyClientCreate
    {
        USES S-STEP "AppCompCreateJP";
        CreateTitle -> Title;
    }

    IF action == "ACTION_REFRESH"
        BRANCH CompanyClientCreate;


    # if the user decided to abandon a record create because
    # they were here to pick a new client from a list (and decided
    # to add a new client), reset the variable and
    # exit the sub-flow

    IF action == "ACTION_CANCEL"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_SEARCH"
    {
        SearchAgain = "TRUE";
        LastAction = action;

        EXIT;

    }

    #*****************************************************************
    # Create Client record (s)
    #*****************************************************************

    IF action == "ACTION_OK"
    {

        # If the client ID is blank, then we have to create a client

        IF MIR-CLI-ID == ""
        {

            # Create the client record first before other updates

            STEP IndividualRecordCreate
            {
                USES P-STEP "BF1221-P";
                UserDefinedClientID -> MIR-CLI-ID;
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            {
                MIR-CLI-ID = "";

                BRANCH CompanyClientCreate;

            }

        }

        STEP CompanyRecordUpdate
        {
            USES P-STEP "AppClientUpdate-P";
            "C" -> MIR-CLI-SEX-CD;
            "*" -> MIR-CLI-SMKR-CD;
        }

        IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
            BRANCH CompanyClientCreate;



        # reset the postal lines

        MIR-PSTL-ADDR-LN-1-TXT = " ";
        MIR-PSTL-ADDR-LN-1-TXT-2 = " ";
        MIR-PSTL-ADDR-LN-2-TXT = " ";
        MIR-PSTL-ADDR-LN-2-TXT-2 = " ";
        LastAction = action;

    }
}

