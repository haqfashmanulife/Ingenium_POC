# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppMedicalQuestions.f                                         *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0420-P.p";
INCLUDE "AppMedicalQuestions.s";
INCLUDE "BF0422-P.p";

PROCESS AppMedicalQuestions
{
  VARIABLES
  {
      OUT LSIR-RETURN-CD;
      OUT action;
  }

    Title = "Medical Details";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP MedicalQuestionsRetrieve
    {
        USES P-STEP "BF0420-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;


    STEP MedicalQuestionsInput
    {
        USES S-STEP "AppMedicalQuestions";
        STRINGTABLE.IDS_TITLE_AppMedicalDetails -> Title;
    }

    IF action != "ACTION_NEXT"
        EXIT;


    STEP MedicalQuestionsProcess
    {
        USES P-STEP "BF0422-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH MedicalQuestionsInput;

}

