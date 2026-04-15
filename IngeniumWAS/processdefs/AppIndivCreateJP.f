# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppIndivCreateJP.f                                            *
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

INCLUDE "AppIndivCreateJP.s";
INCLUDE "BF1221-P.p";
INCLUDE "AppClientUpdate-P.p";
INCLUDE "BF1921-P.p";
INCLUDE "BF1922-P.p";
INCLUDE "BF0491-P.p";
INCLUDE "BF0492-P.p";

PROCESS AppIndivCreateJP
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
      IN CreateTitle;

    # input values from the search sub-flow that will be used
    # to create a new client record

    IN Search-bth-dt;

    IN Search-crnt-loc-cd;

    IN Search-first-name;

    IN Search-last-name;

    IN Search-mid-init;

    IN Search-zip-cd;

    IN Search-sex-cd;

    IN Search-tax-id;

    IN Search-JP-address-code;

    IN Search-city-name;



    # after successful creation, output these values to the main flow

    OUT MIR-CLI-ID;

    OUT MIR-DV-CLI-NM;

    OUT MIR-CLI-CRNT-LOC-CD;

    OUT MIR-CLI-TAX-ID;

    OUT MIR-CLI-CTRY-CD;

    OUT SearchAgain;

    OUT LastAction;

    OUT ReturnToList;

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

    MIR-CLI-ENTR-GIV-NM-T[1] = Search-first-name;
    MIR-CLI-MID-INIT-NM-T[1] = Search-mid-init;
    MIR-CLI-ENTR-SUR-NM-T[1] = Search-last-name;
    MIR-CLI-PSTL-CD-T[1] = Search-zip-cd;
    MIR-CLI-BTH-DT = Search-bth-dt;
    MIR-CLI-CRNT-LOC-CD = Search-crnt-loc-cd;
    MIR-CLI-SEX-CD = Search-sex-cd;
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

    # Set variable to indicated whether the client, prev name
    # and prev address has been created
    # if a problem occurs, we don't want to recreate them, but 
    # still bring up the s-step to fix the problem

    CreatedClient = "N";
    CreatedPrevName = "N";
    CreatedPrevAddr = "N";


    #*****************************************************************
    # Collect Client information.
    #*****************************************************************

    STEP IndividualClientCreate
    {
        USES S-STEP "AppIndivCreateJP";
        CreateTitle -> Title;
    }

    IF action == "ACTION_REFRESH"
        BRANCH IndividualClientCreate;


    # if the user decided to abandon a record create because
    # they were here to pick a new client from a list (and decided
    # to add a new client), reset the variable and
    # exit the sub-flow

    IF action == "ACTION_CANCEL" && ReturnToList == "TRUE"
    {
        ReturnToList = "FALSE";
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_CANCEL"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_SEARCH"
    {
        LastAction = action;
        SearchAgain = "TRUE";

        EXIT;

    }

    #*****************************************************************
    # Create Client record (s)
    #*****************************************************************

    IF action == "ACTION_OK"
    {

        # If the client ID is blank, then we have to create a client
        #         IF MIR-CLI-ID == "" 

        IF CreatedClient == "N"
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

                BRANCH IndividualClientCreate;

            }

            CreatedClient = "Y";

        }

        STEP IndividualRecordUpdate
        {
            USES P-STEP "AppClientUpdate-P";
        }


        # set up a temp. return code to test postal edits
        # to do both of primary and prev and once

        PrimReturnCode = LSIR-RETURN-CD;


        # set a variable for the address and after the prev address is updated
        # if either codes are 03, then returen to the indiv. page with line 1 
        # options and line 2 options populated.  Add "03" for AP's new postal
        # code edit

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH IndividualClientCreate;


        # Updates to Previous address or name information via this flow
        # are not being provided.  As a result, we need only determine if
        # the user has keyed in additional information, and upon that
        # decide to create a new record or not.

        IF prevAddrEntry == "Y"
        {
            IF CreatedPrevAddr == "N"
            {
                STEP IndividualPreviousAddressCreate
                {
                    USES P-STEP "BF0491-P";
                    "PA" -> MIR-CLI-ADDR-TYP-CD;
                    MIR-CLI-ADDR-SEQ-NUM <- MIR-CLI-ADDR-SEQ-NUM;
                }

                IF LSIR-RETURN-CD != "00"
                    BRANCH IndividualClientCreate;


                CreatedPrevAddr = "Y";

            }

            STEP IndividualPreviousAddressUpdate
            {
                USES P-STEP "BF0492-P";

                # send in the update for a new previous address entry
                # created above, by assigning the page values to the
                # proper values expected by the process driver.

                "PA" -> MIR-CLI-ADDR-TYP-CD;
                MIR-CLI-ADDR-SEQ-NUM -> MIR-CLI-ADDR-SEQ-NUM;
                MIR-CLI-ADDR-LN-1-TXT-T-1-ADDITIONAL -> MIR-CLI-ADDR-LN-1-TXT-T[1];
                MIR-CLI-ADDR-LN-2-TXT-T-1-ADDITIONAL -> MIR-CLI-ADDR-LN-2-TXT-T[1];
                MIR-CLI-ADDR-LN-3-TXT-T-1-ADDITIONAL -> MIR-CLI-ADDR-LN-3-TXT-T[1];
                MIR-CLI-ADDR-MUN-CD-ADDITIONAL -> MIR-CLI-ADDR-MUN-CD;
                MIR-CLI-ADDR-YR-DUR-ADDITIONAL -> MIR-CLI-ADDR-YR-DUR;
                MIR-CLI-CITY-NM-TXT-T-1-ADDITIONAL -> MIR-CLI-CITY-NM-TXT-T[1];
                MIR-CLI-CRNT-LOC-CD-ADDITIONAL -> MIR-CLI-CRNT-LOC-CD;
                MIR-CLI-CTRY-CD-ADDITIONAL -> MIR-CLI-CTRY-CD;
                MIR-CLI-PSTL-CD-ADDITIONAL -> MIR-CLI-PSTL-CD;
                MIR-CLI-RES-NUM-T-1-ADDITIONAL -> MIR-CLI-RES-NUM-T[1];
                MIR-CLI-RES-TYP-CD-ADDITIONAL -> MIR-CLI-RES-TYP-CD;
                MIR-CLI-ADDR-CNTY-CD-ADDITIONAL -> MIR-CLI-ADDR-CNTY-CD;

                #       MIR-PSTL-ADDR-LN-1-TXT-ADDITIONAL -> MIR-PSTL-ADDR-LN-1-TXT;
                #       MIR-PSTL-ADDR-LN-2-TXT-ADDITIONAL -> MIR-PSTL-ADDR-LN-2-TXT;

                MIR-CLI-JP-ADDR-CD-T-1-ADDITIONAL -> MIR-CLI-JP-ADDR-CD-T[1];
                MIR-CLI-ADDR-ADDL-TXT-T-1-ADDITIONAL -> MIR-CLI-ADDR-ADDL-TXT-T[1];
                "" -> MIR-CLI-ADDR-LN-1-TXT-T[2];
                "" -> MIR-CLI-ADDR-LN-2-TXT-T[2];
                "" -> MIR-CLI-ADDR-LN-3-TXT-T[2];
                "" -> MIR-CLI-CITY-NM-TXT-T[2];
                "" -> MIR-CLI-RES-NUM-T[2];
                "" -> MIR-CLI-JP-ADDR-CD-T[2];
                "" -> MIR-CLI-ADDR-ADDL-TXT-T[2];

                # immediately return those same values to this step
                # so that the other values on the same page with these
                # identical mir names, are not updated inadvertently.

                MIR-CLI-ADDR-LN-1-TXT-T-1-ADDITIONAL <- MIR-CLI-ADDR-LN-1-TXT-T[1];
                MIR-CLI-ADDR-LN-2-TXT-T-1-ADDITIONAL <- MIR-CLI-ADDR-LN-2-TXT-T[1];
                MIR-CLI-ADDR-LN-3-TXT-T-1-ADDITIONAL <- MIR-CLI-ADDR-LN-3-TXT-T[1];
                MIR-CLI-ADDR-MUN-CD-ADDITIONAL <- MIR-CLI-ADDR-MUN-CD;
                MIR-CLI-ADDR-YR-DUR-ADDITIONAL <- MIR-CLI-ADDR-YR-DUR;
                MIR-CLI-CITY-NM-TXT-T-1-ADDITIONAL <- MIR-CLI-CITY-NM-TXT-T[1];
                MIR-CLI-CRNT-LOC-CD-ADDITIONAL <- MIR-CLI-CRNT-LOC-CD;
                MIR-CLI-CTRY-CD-ADDITIONAL <- MIR-CLI-CTRY-CD;
                MIR-CLI-PSTL-CD-ADDITIONAL <- MIR-CLI-PSTL-CD;
                MIR-CLI-RES-NUM-T-1-ADDITIONAL <- MIR-CLI-RES-NUM-T[1];
                MIR-CLI-RES-TYP-CD-ADDITIONAL <- MIR-CLI-RES-TYP-CD;
                MIR-CLI-ADDR-CNTY-CD-ADDITIONAL <- MIR-CLI-ADDR-CNTY-CD;

                #       MIR-PSTL-ADDR-LN-1-TXT-ADDITIONAL <- MIR-PSTL-ADDR-LN-1-TXT;
                #       MIR-PSTL-ADDR-LN-2-TXT-ADDITIONAL <- MIR-PSTL-ADDR-LN-2-TXT;

                MIR-CLI-JP-ADDR-CD-T-1-ADDITIONAL <- MIR-CLI-JP-ADDR-CD-T[1];
                MIR-CLI-ADDR-ADDL-TXT-T-1-ADDITIONAL <- MIR-CLI-ADDR-ADDL-TXT-T[1];
            }


            # Of the plausible LSIR return codes (00,02,03,05), only return code
            # 02 and 05 roll back updates and prevent continuance.  Return code
            # 03, while producing errors which we want to inform the user about,
            # should not prevent the user from moving on in the flow.
            # We will add 03 for postal cd edit

            IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
                BRANCH IndividualClientCreate;


            prevAddrEntry = "N";

        }
        IF PrimReturnCode == "03"
            BRANCH IndividualClientCreate;

        IF prevNameEntry == "Y"
        {
            IF CreatedPrevName == "N"
            {
                STEP IndividualPreviousNameCreate
                {
                    USES P-STEP "BF1921-P";
                    MIR-CLI-INDV-SEQ-NUM <- MIR-CLI-INDV-SEQ-NUM;
                }

                IF LSIR-RETURN-CD != "00"
                    BRANCH IndividualClientCreate;


                CreatedPrevName = "Y";

            }

            STEP IndividualPreviousNameUpdate
            {
                USES P-STEP "BF1922-P";
                MIR-CLI-INDV-SEQ-NUM -> MIR-CLI-INDV-SEQ-NUM;
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH IndividualClientCreate;


            prevNameEntry = "N";

        }


        # reset the postal lines

        MIR-PSTL-ADDR-LN-1-TXT = " ";
        MIR-PSTL-ADDR-LN-1-TXT-2 = " ";
        MIR-PSTL-ADDR-LN-2-TXT = " ";
        MIR-PSTL-ADDR-LN-2-TXT-2 = " ";
        LastAction = action;
        ReturnToList = "";

    }
}

