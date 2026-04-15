# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT
#*******************************************************************************
#*  Component:   BF9183MultiSwitch.f                                           *
#*  Description: This flow will process multiple switch riders depending       *
#*               on user selection of Option 2 or Option 3.                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFPLI5  CLB      Created for ManuFlex Plus Life Rider Switches             *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  MP185H   CTS     CHANGES DONE TO INCLUDE THE SUBTABLE 3 VALUE FOR LIFE     *
#*                   RIDERS                                                    *
#*  M213L1  CTS      Changes for RUM                                           *
#*******************************************************************************

INCLUDE "BF9183-I.s";
INCLUDE "BF9183-P.p";

PROCESS BF9183MultiSwitch
{


  VARIABLES
  {
    OUT MIR-DV-2-CVG-RENEW-CD;

    OUT MIR-DV-2-PLAN-ID;

    OUT MIR-DV-2-CVG-STBL-1-CD;

    OUT MIR-DV-2-CVG-NEW-FACE-AMT;
  }


    Title = STRINGTABLE.IDS_TITLE_BF9183MultiSwitch;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
   
   
    # Multi-Switch edits the original cvg selection with state 2
   
    MIR-DV-PRCES-STATE-CD = "1";
   
    STEP StartMulti
    {
        USES P-STEP "BF9183-P";
    }
   
    # If errors occurred, go back to the multi-switch process
   
    IF LSIR-RETURN-CD != "00"
        EXIT;
   
    IF MIR-RETRN-CD != "00"
        EXIT;
   

    # Store the values in temp variables

    temp-DV-2-CVG-RENEW-CD = MIR-DV-2-CVG-RENEW-CD;
    temp-OWN-CLI-NM        = MIR-DV-OWN-CLI-NM;
    temp-POL-SNDRY-AMT     = MIR-POL-SNDRY-AMT;
    temp-POL-BILL-MODE-CD  = MIR-POL-BILL-MODE-CD;
    temp-INSRD-CLI-NM      = MIR-DV-2-INSRD-CLI-NM;
    temp-CVG-NUM           = MIR-DV-2-CVG-NUM;
#* M213L1 CHANGES STARTS HERE 
    temp-PRIM-GR-ID        = MIR-DV-2-CVG-PRIM-GR-ID;
#* M213L1 CHANGES ENDS HERE 
    temp-PLAN-ID           = MIR-DV-2-PLAN-ID;
    temp-STBL-1-CD         = MIR-DV-2-CVG-STBL-1-CD;
    temp-PREM-CHNG-DT      = MIR-DV-2-CVG-PREM-CHNG-DT;
    temp-STBL-2-CD         = MIR-DV-2-CVG-STBL-2-CD;
    temp-FACE-AMT          = MIR-DV-2-CVG-FACE-AMT;
    temp-MPREM-AMT         = MIR-DV-2-CVG-MPREM-AMT;
#* MP185H Changes Begin
    temp-STBL-3-CD         = MIR-DV-2-CVG-STBL-3-CD;
#* MP185H Changes End 

    STEP EditMulti
    {
        USES S-STEP "BF9183-I";
    }

    # If the Cancel button is clicked, return to the calling process.
    # Blank out error messages so they won't be returned to Rider Switch Details Screen.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        MIR-DV-2-CVG-RENEW-CD = temp-DV-2-CVG-RENEW-CD;
        EXIT;
    }

    # Restore the values from the temp variables to repopulate the HTML
    # and pass into the source program

    MIR-DV-OWN-CLI-NM          = temp-OWN-CLI-NM;
    MIR-POL-SNDRY-AMT          = temp-POL-SNDRY-AMT;
    MIR-POL-BILL-MODE-CD       = temp-POL-BILL-MODE-CD;
    MIR-DV-2-INSRD-CLI-NM      = temp-INSRD-CLI-NM;
    MIR-DV-2-CVG-NUM           = temp-CVG-NUM;   
#* M213L1 CHANGES STARTS HERE 
    MIR-DV-2-CVG-PRIM-GR-ID    = temp-PRIM-GR-ID;
#* M213L1 CHANGES ENDS HERE 
    MIR-DV-2-PLAN-ID           = temp-PLAN-ID;
    MIR-DV-2-CVG-STBL-1-CD     = temp-STBL-1-CD;
    MIR-DV-2-CVG-PREM-CHNG-DT  = temp-PREM-CHNG-DT;
    MIR-DV-2-CVG-STBL-2-CD     = temp-STBL-2-CD;
    MIR-DV-2-CVG-FACE-AMT      = temp-FACE-AMT;
    MIR-DV-2-CVG-MPREM-AMT     = temp-MPREM-AMT;
#* MP185H Changes Begin
    MIR-DV-2-CVG-STBL-3-CD     = temp-STBL-3-CD;
#* MP185H Changes End 

    # Multi-Switch processes the input data with state 3

    MIR-DV-PRCES-STATE-CD = "2";

    STEP ProcessMulti
    {
        USES P-STEP "BF9183-P";
    }

    # If errors occurred, go back to the multi-switch process

    IF LSIR-RETURN-CD != "00"
        BRANCH EditMulti;

    IF MIR-RETRN-CD != "00"
        BRANCH EditMulti;

    IF DisplayInput == "FALSE"
        EXIT;

    # At end of processing, return to the multi-switch process 

        EXIT;
}
