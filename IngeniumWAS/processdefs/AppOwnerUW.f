# Created 01Jun2005 for funds project

#*******************************************************************************
#*  Component:   AppOwnerUW.f                                                  *
#*  Description:  new flow to display policyholder income and UW info          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFFFU4  ACR      created: UW changes for funds project; new out fields to  *
#*                   pass info to new step (AppOwnerUW) in application entry   *
#*                   main flow                                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9060-P.p";
INCLUDE "BF1060-P.p";
INCLUDE "AppOwnerUW-I.s";
INCLUDE "BF9062-P.p";
INCLUDE "BF1062-P.p";


PROCESS AppOwnerUW
{
  VARIABLES
  {
    OUT LSIR-RETURN-CD;
    OUT LastAction
    {
        SType = "Hidden";
    }

    # screen 'key' fields calculated in AppInsuredFTJUL flow

    IN MIR-STCKR-ID;
    IN MIR-CLI-ID;
    IN MIR-CLI-INCM-EFF-DT;
    IN MIR-DV-OWN-CLI-NM;
  }

    Title = "Policyholder Underwriting";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    #*****************************************************************
    # retrieve the Policyholder CLIU (UW) record
    #*****************************************************************

    STEP RetrieveOwnerUW
    {
        USES P-STEP "BF9060-P";
    }

    #*****************************************************************
    # retrieve the Policyholder CLII (Income) record
    #*****************************************************************

    STEP RetrieveOwnerIncome
    {
        USES P-STEP "BF1060-P";
    }

    #*****************************************************************
    # display owner UW & Income info on new screen for update
    #*****************************************************************

    STEP DisplayOwnerUW
    {
        USES S-STEP "AppOwnerUW-I";
        STRINGTABLE.IDS_TITLE_AppOwnerUw -> Title;
    }

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;
    }

    #*****************************************************************
    # update the owner CLIU information
    #*****************************************************************

    STEP UpdateOwnerUW
    {
        USES P-STEP "BF9062-P";
        "APPOUW" -> MIR-BUS-FCN-SUB-ID;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayOwnerUW;

    #*****************************************************************
    # update the owner CLII information
    #*****************************************************************

    STEP UpdateOwnerIncome
    {
        USES P-STEP "BF1062-P";
        "APPOUW" -> MIR-BUS-FCN-SUB-ID;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayOwnerUW;

}

