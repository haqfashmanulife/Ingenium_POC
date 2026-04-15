# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCompUpdateJP.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppCompUpdateJP.s";
INCLUDE "AppClientRetrieve-P.p";
INCLUDE "AppClientUpdate-P.p";

PROCESS AppCompUpdateJP
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

    OUT MIR-CLI-TAX-ID;

    OUT SearchAgain;

    OUT LastAction;

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


    #*****************************************************************
    # Retrieve client information
    #*****************************************************************

    STEP CompanyRetrieve
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

    STEP CompanyUpdateInput
    {
        USES S-STEP "AppCompUpdateJP";

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
        BRANCH CompanyUpdateInput;

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
        STEP CompanyRecordUpdate
        {
            USES P-STEP "AppClientUpdate-P";
        }

        IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
            BRANCH CompanyUpdateInput;



        # reset the postal lines

        MIR-PSTL-ADDR-LN-1-TXT = " ";
        MIR-PSTL-ADDR-LN-1-TXT-2 = " ";
        MIR-PSTL-ADDR-LN-2-TXT = " ";
        MIR-PSTL-ADDR-LN-2-TXT-2 = " ";
        LastAction = action;

    }
}

