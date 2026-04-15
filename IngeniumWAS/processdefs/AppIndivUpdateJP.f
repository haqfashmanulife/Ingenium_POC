# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppIndivUpdateJP.f                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppIndivUpdateJP.s";
INCLUDE "AppClientRetrieve-P.p";
INCLUDE "AppClientUpdate-P.p";
INCLUDE "BF1921-P.p";
INCLUDE "BF1922-P.p";
INCLUDE "BF0491-P.p";
INCLUDE "BF0492-P.p";

PROCESS AppIndivUpdateJP
{

    # input the page title from the main flow.  This may vary depending
    # upon the reason this sub-flow is being exercised.

  VARIABLES
  {
      IN UpdateTitle;


    # input values from the search sub-flow that will be used
    # to retrieve a client record prior to any other action

    INOUT MIR-CLI-ID;



    # after successful updating, output these values to the main flow
    # for use later on

    OUT MIR-DV-CLI-NM;

    OUT MIR-CLI-CRNT-LOC-CD;

    OUT MIR-CLI-TAX-ID;

    OUT MIR-CLI-CTRY-CD;

    OUT SearchAgain;

    OUT LastAction;

    OUT DataCorrection;

    OUT ReturnToList;
  }

    Title = "Update Current Client Information";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarClient";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Set values to produce selection boxes from a Postal Code

    MIR-DV-RQST-PSTL-ADDR-GR-KJ = "KJ";
    MIR-DV-RQST-PSTL-ADDR-GR-KA = "KA";
    MIR-DV-RQST-PSTL-ADDR-LN-1-TXT = "1";
    MIR-DV-RQST-PSTL-ADDR-LN-2-TXT = "2";

    # indicators to check if prev name/addr have already been
    # created, to update the record instead of recreating another
    # record if there is a fatal problem with 1222

    CreatedPrevName = "N";
    CreatedPrevAddr = "N";


    #*****************************************************************
    # Retrieve client information
    #*****************************************************************

    STEP IndividualRetrieve
    {
        USES P-STEP "AppClientRetrieve-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        LastAction = "ClientRetrieveFailure";

        EXIT;

    }


    #*****************************************************************
    # Edit or collect the information for a client
    #*****************************************************************

    STEP IndividualUpdateInput
    {
        USES S-STEP "AppIndivUpdateJP";

        # This is a customized S-step based on
        # - BF1074 - contact information
        # - BF1220 - client information
        # - BF0490 - address information (specifically previous info)
        #          - uses the same MIR field names
        # - BF1920 - name information (specifically previous info)
        #          - uses different MIR field names
        # Note that BF1220 already performs
        # retrieves of previous name and address information, hence
        # a separate step is not required to get this data.
        # However, BF1220 retrieves the information required for
        # BF0490 using the same MIR names.
        # Since the MIR names on the page must be unique, different
        # mir field names have been used on the s-step and html page
        # The flow below will then assign these temporary mir names
        # to the names required by the process driver.

        UpdateTitle -> Title;
    }

    IF action == "ACTION_REFRESH"
        BRANCH IndividualUpdateInput;


    # if the user decided to abandon changes being made because
    # they were here for data correction, reset the variable and
    # exit the sub-flow

    IF action == "ACTION_CANCEL" && DataCorrection == "TRUE"
    {
        DataCorrection = "FALSE";
        LastAction = action;

        EXIT;

    }

    # if the user decided to abandon changes being made because
    # they were here to pick a new client from a list (and needed
    # to review those details), reset the variable and
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
    # Update the Client record (s)
    #*****************************************************************

    IF action == "ACTION_OK"
    {
        STEP IndividualRecordUpdate
        {
            USES P-STEP "AppClientUpdate-P";
        }


        # set up a temp. return code to test postal edits
        # to do both of primary and prev and once

        PrimReturnCode = LSIR-RETURN-CD;


        # set a variable for the address and after the prev address is updated
        # if either codes are 03, then returen to the indiv. page with line 1 
        # options and line 2 options populated.

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH IndividualUpdateInput;


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
                    BRANCH IndividualUpdateInput;


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
            # Adding 03 since, the line options will be populated if postal cd chged

            IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
                BRANCH IndividualUpdateInput;


            prevAddrEntry = "N";

        }
        IF PrimReturnCode == "03"
            BRANCH IndividualUpdateInput;

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
                    BRANCH IndividualUpdateInput;


                CreatedPrevName = "Y";

            }

            STEP IndividualPreviousNameUpdate
            {
                USES P-STEP "BF1922-P";
                MIR-CLI-INDV-SEQ-NUM -> MIR-CLI-INDV-SEQ-NUM;
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH IndividualUpdateInput;


            prevNameEntry = "N";

        }


        # reset the postal lines

        MIR-PSTL-ADDR-LN-1-TXT = " ";
        MIR-PSTL-ADDR-LN-1-TXT-2 = " ";
        MIR-PSTL-ADDR-LN-2-TXT = " ";
        MIR-PSTL-ADDR-LN-2-TXT-2 = " ";
        LastAction = action;
        DataCorrection = "";
        ReturnToList = "";

    }
}

