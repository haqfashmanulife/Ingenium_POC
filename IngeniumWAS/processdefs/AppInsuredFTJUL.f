# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppInsuredFTJUL.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*  016423  602J     New for release 602J                                      *
#*  01NB01  GW       New App Entry Flow....                                    *
#*  B00409  WBP      Change Buttons on Insured List Screen                     *
#*  B00418  WBP      Bypass InsuredList Step if returning from screen after    *
#*                   this flow in App Entry                                    *
#*  1CNB02  EKM      Add Conversion Policy Processing. If error on Insured     *
#*                   List screen, redisplay the Insured List screen.           *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  MFFFU4  ACR      UW changes for funds project; new out fields to pass info *
#*                   to new step (AppOwnerUW) in main flow                     *
#*  BU3283  CTS      Removed the table assignment syntax for the variable      *
#*                   banking-temp-msg-t                                        *  
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8041-P.p";
INCLUDE "AppInsuredListU-I.s";
INCLUDE "AppInsuredListU-P.p";
INCLUDE "AppInsuredListL-O.s";
INCLUDE "AppDR-Update.f";
INCLUDE "AppCH-Update.f";
INCLUDE "AppSD-Update.f";
INCLUDE "AppIR-Update.f";

PROCESS AppInsuredFTJUL
{
  VARIABLES
  {
    OUT LastAction;

    # output variables used to store and control messages
    # temporarily, back to the main flow.

    OUT BankingInfoMessages;

    OUT banking-temp-msg-t;


    OUT DataCollected-T[10];

    OUT MIR-OWN-STCKR-ID;
    OUT MIR-OWN-CLI-ID;
    OUT MIR-EFF-DT;
    OUT MIR-OWN-CLI-NM;
    OUT MIR-SKIP-UW-IND;

    INOUT ReturnListCliu;
  }

    Title = "Insured List";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    #*****************************************************************
    # Display all the Insureds and their U/W req'ts
    #*****************************************************************

    STEP RetrievePolicyInsureds
    {
        USES P-STEP "BF8041-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;


    # re-display any messages from the billing step.
    # messages from the step above are unlikely to be produced
    # and those from the billing step are important to note.
    # to determine if messages should be displayed from the
    # banking info step, or from the policy update step
    # evaluate a temporary variable with this information.

    IF BankingInfoMessages == "TRUE"
    {
        MESSAGES-T = banking-temp-msg-t;
        BankingInfoMessages = "FALSE";
    # Change for BU3283 begin    
    #    banking-temp-msg-t[0] = "";
        banking-temp-msg-t = "";
    # Change for BU3283 end    

        BRANCH InsuredList;

    }

    MESSAGES-T = temp-msg-t;

    IF ReturnListCliu == "TRUE"
    {
        ReturnListCliu = "FALSE";

        BRANCH UpdateCliuEntry;

    }

    STEP InsuredList
    {
        USES S-STEP "AppInsuredListU-I";
        STRINGTABLE.IDS_TITLE_AppInsuredList -> Title;
    }

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_NEXT"
        BRANCH UpdateCliuEntry;



    #*****************************************************************
    # ask the details for the insured to u/w (employmt, ins hist,
    # medical, etc.
    #*****************************************************************

    STEP UpdateCliuEntry
    {
        USES P-STEP "AppInsuredListU-P";
    }

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        BRANCH InsuredList;


    STEP ListCliuEntry
    {
        USES S-STEP "AppInsuredListL-O";
        "AppButtonBarOKPrevNext" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        BRANCH InsuredList;

    IF action == "ACTION_OK"
    {
        IF MIR-UW-TYP-CD-T[index] == "1"
            BRANCH QuestionDoctor;
#            BRANCH QuestionMore;

        IF MIR-UW-TYP-CD-T[index] == "2"
            BRANCH QuestionInterview;

        IF MIR-UW-TYP-CD-T[index] == "3"
            BRANCH QuestionSelfDisclosure;

        IF MIR-UW-TYP-CD-T[index] == "4"
            BRANCH QuestionCorporate;

    }
    IF action == "ACTION_NEXT"
    {
        LastAction = action;

        EXIT;

    }

    STEP QuestionMore
    {
        USES S-STEP "AppUWDecide";
        MIR-CLI-ID-T[index] -> MIR-CLI-ID;
        MIR-DV-CLI-NM-T[index] -> MIR-DV-INSRD-CLI-NM;
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_NEXT" && MIR-UW-QSTN-RESP-TXT-001 == "Y"
    {
        action = "";

        BRANCH QuestionDoctor;

    }
    IF action == "ACTION_NEXT" && MIR-UW-QSTN-RESP-TXT-001 == "N"
    {
        action = "";

        BRANCH QuestionCorporate;

    }
    IF action == "ACTION_BACK"
    {
        action = "";

        BRANCH ListCliuEntry;

    }

    STEP QuestionDoctor
    {
        USES PROCESS "AppDR-Update";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MIR-CLI-ID-T[index] -> MIR-CLI-ID;
    }

    IF LastAction == "ACTION_NEXT"
    {
        action = "";
        LastAction = "";

        BRANCH ListCliuEntry;

    }
    IF LastAction == "ACTION_BACK"
    {
        action = "";
        LastAction = "";

        BRANCH ListCliuEntry;

    }

    STEP QuestionCorporate
    {
        USES PROCESS "AppCH-Update";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MIR-CLI-ID-T[index] -> MIR-CLI-ID;
    }

    IF LastAction == "ACTION_NEXT"
    {
        action = "";
        LastAction = "";

        BRANCH ListCliuEntry;

    }
    IF LastAction == "ACTION_BACK"
    {
        action = "";
        LastAction = "";

        BRANCH ListCliuEntry;

    }

    STEP QuestionInterview
    {
        USES PROCESS "AppIR-Update";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MIR-CLI-ID-T[index] -> MIR-CLI-ID;
    }

    IF LastAction == "ACTION_NEXT"
    {
        action = "";

        BRANCH ListCliuEntry;

    }
    IF LastAction == "ACTION_BACK"
    {
        action = "";

        BRANCH ListCliuEntry;

    }

    STEP QuestionSelfDisclosure
    {
        USES PROCESS "AppSD-Update";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        MIR-CLI-ID-T[index] -> MIR-CLI-ID;
    }

    IF LastAction == "ACTION_NEXT"
    {
        action = "";

        BRANCH ListCliuEntry;

    }
    IF LastAction == "ACTION_BACK"
    {
        action = "";

        BRANCH ListCliuEntry;

    }
}

