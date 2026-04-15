# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT
#*******************************************************************************
#*  Component:   BF9962PAIClientCovList.f                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MFFPI    JE      A new set of button bar pages will replace the            *
#*                   existing ones.  Added new MIR variables to control        *
#*                   SA rider error message.                                   *
#*                   Add control variables for button functions                *
#*******************************************************************************

INCLUDE "BF9962-P.p";
INCLUDE "BF9962-O.s";

PROCESS BF9962PAIClientCovList
{

    Title = STRINGTABLE.IDS_TITLE_BF9962PAIClientCovList;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarListsPFCM";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    FLOW-PAGE = 1;
    SAVE-SYS-ID[99]  = " ";
    SAVE-POL-ID[99]  = " ";
    SAVE-CVG-NUM[99]  = " ";
     
    STEP RetrieveList
    {
        USES P-STEP "BF9962-P";
    }
 
    IF LSIR-RETURN-CD != "00"
        EXIT;

    SAVE-SYS-ID[FLOW-PAGE]  = MIR-PREV-REL-SYS-ID;
    SAVE-POL-ID[FLOW-PAGE]  = MIR-PREV-REL-SYS-POL-ID;
    SAVE-CVG-NUM[FLOW-PAGE] = MIR-PREV-REL-SYS-CVG-NUM;
     
#* MFFPI # set up the button bar page

    IF MIR-DV-MORE-IND == "N"  # last page 
     {
       IF FLOW-PAGE == 1 
          ButtonBar = "ButtonBarListsPFC";   # the list has one page, shows POLICY/FUND/CANCEL 
       ELSE
          ButtonBar = "ButtonBarListsPFCP";   # the list has previous page, shows  POLICY/FUND/CANCEL/PREVIOUS    
     }
    ELSE 
     {                          # NOT last page
       IF FLOW-PAGE == 1 
          ButtonBar = "ButtonBarListsPFCM";    # the list has next page, shows  POLICY/FUND/CANCEL/MORE
         ELSE
          ButtonBar = "ButtonBarListsPFCMP";   # the list has next/prev page, shows  POLICY/FUND/CANCEL/MORE/PREVIOUS
     }
     
    STEP DisplayList
    {
        USES S-STEP "BF9962-O";
    }
    

    IF action == "ACTION_CANCEL"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

# If the user has pressed the MORE or PREVIUOS button, go back and reload the list
    IF action == "ACTION_MORE" || action == "ACTION_PREV"
    {
       MIR-DV-FND-VAR-IND = "Y";

       IF action == "ACTION_PREV"
       {
          FLOW-PAGE = FLOW-PAGE - 1;
          MIR-REL-SYS-ID      = SAVE-SYS-ID[FLOW-PAGE];
          MIR-REL-SYS-POL-ID  = SAVE-POL-ID[FLOW-PAGE];
          MIR-REL-SYS-CVG-NUM = SAVE-CVG-NUM[FLOW-PAGE];
        }
       ELSE
          FLOW-PAGE = FLOW-PAGE + 1;
        
        BRANCH RetrieveList;
    }
     
# User has selected a policy
    MIR-POL-ID-BASE = MIR-POL-ID-T[index];
    MIR-POL-ID-SFX  = " ";

#* MFFPI
    IF action == "ACTION_POLD" && index > 0
    {
       IF MIR-FND-CVG-IND-TXT-T[index] == "YES"
          MIR-DV-FND-VAR-IND  = "Y";
       ELSE
          MIR-DV-FND-VAR-IND  = "N";

       STEP PolicyInquiryForAgent
          {
           USES PROCESS "BF9965PAIPolicyInquiry";
           MIR-POL-ID-T[index] -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           "01" -> MIR-CVG-NUM;
           MIR-DV-FND-VAR-IND -> MIR-HAS-VAR-IND;           
           "PD" -> MIR-SCRN-PATH-IND;
          }
       MESSAGES-T[0] = "";
       BRANCH DisplayList;
    }

   IF action == "ACTION_FNDD" && index > 0 && MIR-FND-CVG-IND-TXT-T[index] == "YES"
    {
        STEP FundInquiryForAgent
          {
           USES PROCESS "BF9985PAIFundInquiry";
           MIR-POL-ID-T[index] -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           "FD" -> MIR-SCRN-PATH-IND;
          }
       MESSAGES-T[0] = "";
       BRANCH DisplayList;
    }
    ELSE
    {
       MIR-DV-FND-VAR-IND  = "N";

       IF MIR-DV-MORE-IND == "Y"  # last page
        {
          MIR-REL-SYS-ID      = SAVE-SYS-ID[FLOW-PAGE];
          MIR-REL-SYS-POL-ID  = SAVE-POL-ID[FLOW-PAGE];
          MIR-REL-SYS-CVG-NUM = SAVE-CVG-NUM[FLOW-PAGE];
        }

       MESSAGES-T[0] = "";
       BRANCH RetrieveList;
    }   

    EXIT;
     
}