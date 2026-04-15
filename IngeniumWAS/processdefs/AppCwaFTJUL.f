# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCwaFTJUL.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016763  611J     fix posting to misc. susp                                 *
#*  016480  611J     fix retained comm. message appearing                      *
#*  01NB01  GW       New App Entry flow                                        *
#*  B00344  KRW      Identify App Entry as the process using BF9040            *
#*  B00394  WBP      Display MIR-DV-MISC-BAL                                   *
#*  02GL57  DPK      CWA Suspense Account and Refund - changed MIR-DV-MISC-BAL *
#*                   to MIR-DV-CWA-SUSP-BAL.                                   *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  Q18239  CTS      Changes for CWA proces date check                         *      
#*******************************************************************************

INCLUDE "AppCwaFTJUL.s";
INCLUDE "BF9040-P.p";

PROCESS AppCwaFTJUL
{

    # ENSURE REQUIRED FIELD VALUES ARE
    # PASSED INTO THIS SUB-PROCESS

  VARIABLES
  {
    IN MIR-POL-ID-BASE;
    IN MIR-POL-ID-SFX;


    INOUT MIR-DV-CWA-SUSP-BAL;


    OUT LastAction;
  }

    Title = "App Cash With Application";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";

    # WE MUST SAVE MIR-DV-CWA-SUSP-BAL IN tempCashAmount
    # AND RESTORE IT AFTER THE S-STEP BECAUSE THE
    # S-STEP WIPES IT OUT

    tempCashAmount = MIR-DV-CWA-SUSP-BAL;

    STEP AppCwaInput
    {
        USES S-STEP "AppCwaFTJUL";
        STRINGTABLE.IDS_TITLE_AppCwa -> Title;
    }

    MIR-DV-CWA-SUSP-BAL = tempCashAmount;

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;

    }

    # IF THE USER HAS SELECTED THE VALUE OF "N"
    # FOR THE CASH WITH APP QUESTION SKIP THIS
    # PROCESS

    IF cashYesNo == "Y"
    {

        # SAVE MIR FIELDS TO TEMPORARY VARIABLES IN CASE
        # THE P-STEPS FAIL AND CLEAR THEM OUT

        policyId = MIR-POL-ID-BASE;
        policySfx = MIR-POL-IS-SFX;
        tempCashAmount = MIR-DV-CWA-SUSP-BAL;

        STEP UpdateHost-P
        {
            USES P-STEP "BF9040-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
            "A" -> MIR-DV-BUS-PRCES-ID;
    #Changes for Q18239 starts here            
            "N" -> MIR-CWA-PRCES-CHK-IND;
    #Changes for Q18239 ends here             
        }

        IF LSIR-RETURN-CD != "00"
        {

            # RESET THE POLICY AND SUFFIX VALUES
            # INITIALLY BROUGHT INTO THIS FLOW
            # AS THEY ARE CHANGED TO BLANKS BY
            # THIS PROCESS DRIVER

            MIR-POL-ID-BASE = policyId;
            MIR-POL-ID-SFX = policySfx;
            MIR-DV-CWA-SUSP-BAL = tempCashAmount;

            BRANCH AppCwaInput;

        }

    }

    LastAction = action;

    EXIT;
}

