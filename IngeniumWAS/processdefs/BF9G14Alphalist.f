# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9G14Alphalist.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

INCLUDE "BF2236-I.s";
INCLUDE "BF2236-O.s";
INCLUDE "BF2236-P.p";


PROCESS BF9G14Alphalist
{
  VARIABLES
  {
      OUT MIR-CLI-ID; 
  }
    Title = STRINGTABLE.IDS_TITLE_BF9G14Alphalist;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2236-I";
        STRINGTABLE.IDS_TITLE_BF9G14Alphalist -> Title;
    }


    # Blank out the value of CLI-ID to prevent the list from 
    # starting in the wrong place

    MIR-CLI-ID = "";
    TEMP-CLI-CO-NM= MIR-CLI-CO-NM;
    IF action == "ACTION_BACK"
        EXIT;
    MIR-RECORD-CTR1 ="000";
    MIR-FLOW-CTRL-IND = "Y";
    FLOW-PAGE = 0;
   
    STEP RetrieveList
    {
        USES P-STEP "BF2236-P";
    }


    # We'll need to keep a record of the key to determine if the user has
    # changed it.

    FLOW-CO-NM = MIR-CLI-CO-NM;
    FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
    Title = STRINGTABLE.IDS_TITLE_BF9G14Alpharslt;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

    
    #ButtonBar = "ButtonBarOKCancelMore";
    ButtonBar = "BF9G14ButtonBarOKCancelMore";
 

    STEP DisplayList
    {
        USES S-STEP "BF2236-O";
    }

    IF action == "ACTION_BACK"
    {
       MIR-CLI-ID = "";
       BRANCH ListStart;
       EXIT;
    }

    # If the user has pressed the more button, go back and reget the list
    # If the key has changed, then treat this as a new search and blank out CLI-ID

    IF action == "ACTION_MORE" 
    {
        IF FLOW-CO-NM != MIR-CLI-CO-NM || FLOW-SRCH-GR-CD != MIR-DV-SRCH-GR-CD
        {
            MIR-CLI-ID = "";
       }

        BRANCH RetrieveList;
     }
   
    
    #IF action == "ACTION_PREV"
    # {
    #      MIR-CLI-CO-NM=TEMP-CLI-CO-NM;
    #      MIR-CLI-ID = "";
    #      MIR-FLOW-CTRL-IND = "Y";
    #      FLOW-PAGE = FLOW-PAGE - 1;
    #      MIR-RECORD-CTR1 = FLOW-PAGE;
    #      TRACE ("MIR-RECORD-CTR1-N PREV" + MIR-RECORD-CTR1);
    #      BRANCH RetrieveList;
    # }  
    
    #IF action == "ACTION_MORE" 
    #   {
    #        MIR-CLI-CO-NM=TEMP-CLI-CO-NM;
    #        MIR-CLI-ID = "";
    #        MIR-FLOW-CTRL-IND = "Y";
    #        FLOW-PAGE = FLOW-PAGE + 1;
    #        MIR-RECORD-CTR1 = FLOW-PAGE;
    #      TRACE ("MIR-RECORD-CTR1-N MORE" + MIR-RECORD-CTR1);
    #         BRANCH RetrieveList;
    #  }
    
   IF index == "0"
    BRANCH DisplayList;
    MIR-CLI-ID = MIR-CLI-ID-T[index];
	           EXIT;
 }

