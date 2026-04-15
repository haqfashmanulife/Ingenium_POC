# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   ReqtMainUpdt.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  B11236  PF 2.0   LSIR-RETURN-CD == "01" - a 6.3 Ingenium change was removed*
#*                   it caused the user to press the submit button twice to    *
#*                   refresh the data.                                         *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  MAR225  CTS      CDI LOG FT DEFECT FIX                                     *
#*******************************************************************************

INCLUDE "ServiceEntryPoint.f";
INCLUDE "ReqtMainUWUpdt.s";
INCLUDE "ReqtMainIssUpdt.s";
INCLUDE "BF2360-P.p";
INCLUDE "BF2362-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS ReqtMainUpdt
{

    # output values from this flow, to the linked flow.  These values
    # will be used in the main flow for processing or evaluation.

  VARIABLES
  {
    OUT LastAction;
    OUT action;
  }

    Title = STRINGTABLE.IDS_TITLE_ReqtMainUWUpdt;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "MainFlowButtonBar";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter Policy #, Client # or Client Name for requirement one wishes to retrieve

    STEP Identification
    {
        USES PROCESS "ServiceEntryPoint";
        STRINGTABLE.IDS_TITLE_ReqtMainSearch -> SearchTitle;
        STRINGTABLE.IDS_TITLE_ReqtMainList -> ListTitle;
    }

    DisplayReqtPage = "FALSE";

    IF LastAction == "ACTION_CANCEL"
        EXIT;

    IF LastAction == "ACTION_SELECT" || LastAction == "ACTION_SUBMIT_CLIENTID" || LastAction == "ACTION_SEARCH_CLIENT"
    {
        temp-MIR-POL-ID-BASE = MIR-POL-ID-BASE;
        temp-MIR-POL-ID-SFX = MIR-POL-ID-SFX;
        MIR-POL-ID-BASE = " ";
        MIR-POL-ID-SFX = " ";

        BRANCH RetrieveRequirements;

    }
    IF LastAction == "ACTION_SUBMIT_POLICYID"
    {
        temp-MIR-CLI-ID = MIR-CLI-ID;
        MIR-CLI-ID = " ";

        BRANCH RetrieveRequirements;

    }

    STEP RetrieveRequirements
    {
        USES P-STEP "BF2360-P";
    }

#   PF 2.0 - remove the reference to LSIR-RETURN-CD == "01" 
#   IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
    IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
    {
        IF DisplayReqtPage == "FALSE"
        {
            DisplayReqtPage = "";

            BRANCH Identification;

        }

        DisplayReqtPage = "";

    } 
      
    # Reset the TEMP policy id, only if value was NOT Equal to Spaces.
    # If client number is returned, U/W requirements will be returned

    IF MIR-CLI-ID != ""
    {
        IF temp-MIR-POL-ID-BASE != ""
        {
            MIR-POL-ID-BASE = temp-MIR-POL-ID-BASE;
            MIR-POL-ID-SFX = temp-MIR-POL-ID-SFX;
            temp-MIR-POL-ID-BASE = " ";
            temp-MIR-POL-ID-SFX = " ";

        }

        BannerClientID = MIR-CLI-ID;
        ReqtMainUpdtS = "ReqtMainUWUpdt";
        ReqtMainTitle = STRINGTABLE.IDS_TITLE_ReqtMainUWUpdt;

        BRANCH ReqtMainUpdt-S;

    }

    # If Policy Number is returned, Issue Requirements will be Returned

    IF MIR-POL-ID-BASE != ""
    {
        IF temp-MIR-CLI-ID != ""
        {
            MIR-CLI-ID = temp-MIR-CLI-ID;
            temp-MIR-CLI-ID = " ";

        }

        BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
        ReqtMainUpdtS = "ReqtMainIssUpdt";
        ReqtMainTitle = STRINGTABLE.IDS_TITLE_ReqtMainPolUpdt;

        BRANCH ReqtMainUpdt-S;

    }


    # In the event that the no Policy or Client ID is entered on the Initial page
    # the following page will be displayed along with error message Client or Policy
    # number must be entered.  This action is being taken, due to the rational that
    # it would be less likely to ocurr where neither a policy or client id would have defaulted
    # from a previous session.

    ReqtMainUpdtS = "ReqtMainUWUpdt";
    ReqtMainTitle = STRINGTABLE.IDS_TITLE_ReqtMainUWUpdt;

    STEP ReqtMainUpdt-S
    {
        USES S-STEP ReqtMainUpdtS;
        ReqtMainTitle -> Title;
        "ButtonBarReqtUpdt" -> ButtonBar;
    }


    # If user selects Previous and did not come from a list, then branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_SEARCH"
    {
        ReturnToIdentification = "TRUE";
        MESSAGES-T[0] = "";
        i = 1;

        WHILE (i < 41)
        {
            MIR-CLI-ID-T[i] = "";
            i = i + 1;

        }

        BRANCH Identification;

    }
    IF action == "ACTION_CANCEL"
        EXIT;

    # Action ACTION_SUBMIT_POLICYID will transfer user to appropriate Policy Requirements.
    # If both the policy id and client ID exist at the time this action is selected, the
    # client ID must be moved to a temp client id, and the original client id spaced out.
    # this save the user from having to blank out the fields.

    IF action == "ACTION_SUBMIT_POLICYID"
    {
        IF MIR-POL-ID-BASE != "" && MIR-CLI-ID != ""
        {
            temp-MIR-CLI-ID = MIR-CLI-ID;
            MIR-CLI-ID = " ";

        }

        DisplayReqtPage = "TRUE";

        BRANCH RetrieveRequirements;

    }

    # Action ACTION_SUBMIT_CLIENTID will transfer user to appropriate Underwriting Requirements
    # If both the policy id and client ID exist at the time this action is selected, the
    # policy ID must be moved to a temp policy id, and the original policy id spaced out.
    # this save the user from having to blank out the fields.

    IF action == "ACTION_SUBMIT_CLIENTID"
    {
        IF MIR-POL-ID-BASE != "" && MIR-CLI-ID != ""
        {
            temp-MIR-POL-ID-BASE = MIR-POL-ID-BASE;
            temp-MIR-POL-ID-SFX = MIR-POL-ID-SFX;
            MIR-POL-ID-BASE = " ";
            MIR-POL-ID-SFX = " ";

        }

        DisplayReqtPage = "TRUE";

        BRANCH RetrieveRequirements;

    }

    # ACTION_SUBMIT will update the record for the data just entered.  Again, if
    # both the client id and policy id are being displayed, depending of the s-step
    # being updated, the non-required MIR field will be wiped out, in order to process
    # the applicable MIR correctly.

    IF action == "ACTION_UPDATE"
    {
        IF ReqtMainUpdtS == "ReqtMainUWUpdt"
        {
            temp-MIR-POL-ID-BASE = MIR-POL-ID-BASE;
            temp-MIR-POL-ID-SFX = MIR-POL-ID-SFX;
            MIR-POL-ID-BASE = " ";
            MIR-POL-ID-SFX = " ";

        }
        ELSE
            IF ReqtMainUpdtS == "ReqtMainIssUpdt"
            {
                temp-MIR-CLI-ID = MIR-CLI-ID;
                MIR-CLI-ID = " ";

            }


        STEP Update
        {
            USES P-STEP "BF2362-P";
        }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX + "" + MIR-CLI-ID;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
#  MAR225 CHANGES BEGIN  
#   SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  
    "BF2362"  -> MIR-BFCN-ID;  
#  MAR225 CHANGES ENDS  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }    
    IF LSIR-RETURN-CD != "00"
    {    
        BRANCH ReqtMainUpdt-S;

    }
#  23774A CHANGES END
        BRANCH ReqtMainUpdt-S;

    }
    #  action == "SelectItem"  BRANCH to U/W or Issue Requirements

    SELECTED-CLI-ID = MIR-CLI-ID-T[index];
    SELECTED-POL-ID-BASE = MIR-POL-ID-BASE-T[index];

    IF action == "SelectItem"
    {
        IF SELECTED-CLI-ID != ""
        {
            MIR-CLI-ID = MIR-CLI-ID-T[index];
            SESSION.MIR-CLI-ID = MIR-CLI-ID-T[index];
            temp-MIR-POL-ID-BASE = MIR-POL-ID-BASE;
            temp-MIR-POL-ID-SFX = MIR-POL-ID-SFX;
            MIR-POL-ID-BASE = " ";
            MIR-POL-ID-SFX = " ";
            DisplayReqtPage = "TRUE";

            BRANCH RetrieveRequirements;

        }
        IF SELECTED-POL-ID-BASE != ""
        {
            MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
            MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];
            SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
            SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];
            temp-MIR-CLI-ID = MIR-CLI-ID;
            MIR-CLI-ID = " ";
            DisplayReqtPage = "TRUE";

            BRANCH RetrieveRequirements;

        }

    }
}

