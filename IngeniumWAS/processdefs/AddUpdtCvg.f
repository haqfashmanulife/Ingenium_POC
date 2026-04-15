# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:08:29 AM EST

#*******************************************************************************
#*  Component:   AddUpdtCvg                                                    *
#*  Description:  Flow for adding/updating coverages on Inforce policies       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*  HIS032  HIN/LJ   Add Billing screen loop for Sundry Amount error.          *
#*                   Add new P-Step BF9801Update-P to ensure rollback of       *
#*                   Sundry Amount update if fatal error                       *
#*  B01850  PF2.2    initialize temp-msg-t table before calling subflows       *
#*                                                                             *
#*  5-0363  ACR      Add new owner UW screen to the PIRA flow                  *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*******************************************************************************

INCLUDE "BF9800List.f";
INCLUDE "AddUpdtCvgBene.f";
INCLUDE "BF8000-P.p";
INCLUDE "BF9801Update-P.p";
INCLUDE "BF8024-P.p";
INCLUDE "BF8004-P.p";
INCLUDE "AddUpdtCvgBill.s";
INCLUDE "AppInsuredFTJUL.f";
INCLUDE "BF0592Select.f";
INCLUDE "AppAnalysisJPUL.s";
INCLUDE "AppOwnerUW.f";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS AddUpdtCvg
{
    Title = "Add Coverages To Inforce Policy";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    ReturnToCvgList = "FALSE";
     
# initialize the temp message area for the subflows
   MESSAGES-T[0] = "";
   temp-msg-t = MESSAGES-T;
 
    STEP CoverageList
    {
        USES PROCESS "BF9800List";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        ReturnToCvgList -> ReturnAgain;
    }

    IF LastAction == "ACTION_CANCEL" || LastAction == "ACTION_BACK"
        EXIT;


    BannerPrimaryInsured = MIR-DV-OWN-CLI-NM;
    BannerPolicyID = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    BannerProductID = MIR-POL-PLAN-ID;
    ReturnToCvgList = "TRUE";
    LastAction = "";


    #*****************************************************************
    # Collect Beneficiary Information
    # Call a sub-flow for this
    #*****************************************************************

    STEP Beneficiary
    {
        USES PROCESS "AddUpdtCvgBene";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

    }

    IF LastAction == "ACTION_BACK"
    {
        LastAction = "";

        BRANCH CoverageList;

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
        BRANCH PolicyRetrieve;
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
    # Display Summary data and give the ability to cross edit
    # and clear case u/w.
    #*****************************************************************

    STEP PolicyRetrieve
    {
        USES P-STEP "BF8000-P";
    }

    STEP BillPage
    {
        USES S-STEP "AddUpdtCvgBill";
        STRINGTABLE.IDS_TITLE_AppBillingData -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "ACTION_LANGCHANGE"
        BRANCH BillPage;


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


    STEP PolicyUpdate
    {
        USES P-STEP "BF9801Update-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BillPage;

# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF9801" -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH BillPage;
        
# 23774A CHANGES END


    STEP AnalysisCoverageRetrieve
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


    STEP AnalysisDisplay
    {
        USES S-STEP "AppAnalysisJPUL";
        STRINGTABLE.IDS_TITLE_AppAnalysis -> Title;
        "AppButtonBar" -> ButtonBar;
    }

    IF action == "ACTION_LANGCHANGE"
        BRANCH AnalysisDisplay;

    IF action == "GoToCheckPolicy"
    {
        STEP ReCheckPolicyForErrors
        {
            USES P-STEP "BF8004-P";
        }

        BRANCH AnalysisDisplay;

    }
    IF action == "GoToClearCase"
    {
        STEP SubmitToUnderwriting
        {
            USES PROCESS "BF0592Select";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            "FALSE" -> DisplayInput;
        }

        BRANCH AnalysisDisplay;

    }
    IF action == "ACTION_PREVIOUS"
        BRANCH BillPage;

    IF action == "ACTION_NEXT"
        EXIT;

}

