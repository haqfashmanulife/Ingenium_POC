# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppAgentSearch.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppAgentSearch.s";
INCLUDE "BF2204-P.p";

PROCESS AppAgentSearch
{
  VARIABLES
  {
      OUT MIR-AGT-ID;
      OUT MIR-DV-SRCH-CLI-NM;
  }

    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "30";

    STEP ListStart
    {
        USES S-STEP "AppAgentSearch";
        STRINGTABLE.IDS_TITLE_AppAgentSearch -> Title;
    }

    IF action == "ACTION_NEXT"
    {
        IF index != ""
        {
            MIR-AGT-ID = MIR-AGT-ID-T[index];
            MIR-DV-SRCH-CLI-NM = MIR-DV-SRCH-CLI-NM-T[index];

            EXIT;

        }

        STEP RetrieveList
        {
            USES P-STEP "BF2204-P";
        }

        index = "";

        BRANCH ListStart;

    }
    IF action == "ACTION_BACK"
        EXIT;

}

