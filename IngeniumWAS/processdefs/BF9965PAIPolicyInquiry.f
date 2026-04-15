# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9965PAIPolicyInquiry.f                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  FT2001   AT      New screen for PA Inquiry;                                *
#*                   Cloned from BF9830RetrieveList.f (Call Centre Inquiry)    *
#*  FT2C02   AC      Cover the last three digits of the bank account           *
#*  12APR05  FB      USE NEW P-STEP                                            *
#*  MFFPI    JE      Button bar updated to include new button "Fund Details"   *
#*                   Replace stepname Retrieve and Output with RetrieveList    *
#*                   and DisplayList respectively for consistency.             *
#*                   Added new variable MIR-SAVE-POL-ID to store and hold      *
#*                   current Policy ID for screen switching purposes.          *
#*******************************************************************************  
INCLUDE "BF9965-P.p";
INCLUDE "BF9965-O.s";

PROCESS BF9965PAIPolicyInquiry
{
    Title = STRINGTABLE.IDS_TITLE_BF9965PAIPolicyInquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarListsO";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;

    MIR-CVG-NUM = "01";

    STEP RetrieveList
    {
        USES P-STEP "BF9965-P";
    }

#* MFFPI
    IF (MIR-POL-CVG-REC-CTR < "21" || MIR-CVG-NUM-T[1] < "21") && MIR-HAS-VAR-IND != "Y" && MIR-SCRN-PATH-IND == "PD"
       ButtonBar = "ButtonBarListsO";

    IF (MIR-POL-CVG-REC-CTR < "21" || MIR-CVG-NUM-T[1] < "21") && MIR-HAS-VAR-IND == "Y" && MIR-SCRN-PATH-IND == "FD"
       ButtonBar = "ButtonBarListsO";

    IF (MIR-POL-CVG-REC-CTR < "21" || MIR-CVG-NUM-T[1] < "21") && MIR-HAS-VAR-IND == "Y" && MIR-SCRN-PATH-IND == "PD"
       ButtonBar = "ButtonBarListsFO";

    IF (MIR-POL-CVG-REC-CTR > "20" || MIR-CVG-NUM-T[1] > "20") && MIR-HAS-VAR-IND != "Y" && MIR-SCRN-PATH-IND == "PD"
       ButtonBar = "ButtonBarListsOM";

    IF (MIR-POL-CVG-REC-CTR > "20" || MIR-CVG-NUM-T[1] > "20") && MIR-HAS-VAR-IND == "Y" && MIR-SCRN-PATH-IND == "FD"
       ButtonBar = "ButtonBarListsOM";

    IF (MIR-POL-CVG-REC-CTR > "20" || MIR-CVG-NUM-T[1] > "20") && MIR-HAS-VAR-IND == "Y" && MIR-SCRN-PATH-IND == "PD"
       ButtonBar = "ButtonBarListsFOM";

#     AA = MIR-CVG-NUM;

      MESSAGES-T[0] = "";
     
    STEP DisplayList
    {
        USES S-STEP "BF9965-O";
    }

#     MIR-CVG-NUM = AA;
#* MFFPI      
    IF action == "ACTION_MORE"
    {
        BRANCH RetrieveList;
    }
     
    IF action == "ACTION_OK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }
    
    IF action == "ACTION_FNDD"
    {
       STEP FundInquiryForAgent
          {
           USES PROCESS "BF9985PAIFundInquiry";
           MIR-SAVE-POL-ID-BASE -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           "PD" -> MIR-SCRN-PATH-IND;           
          }
       BRANCH DisplayList;          
       MESSAGES-T[0] = "";
     }

     EXIT;
}
