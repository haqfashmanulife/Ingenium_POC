# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F96List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS     BANK SEARCH SCREEN                                         *
#*  105532  CTS      FIX DONE FOR CWA REFUND/REJECTION REQUEST BANK SCREEN     *
#*                   PREVIOUS BUTTON FIX                                       *
#*                                                                             *
#*  CA02CR  CTS     CHANGES DONE TO POPULATE MESSAGE FOR JAPAN POSTAL          *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9F96-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9F96-O.s";
INCLUDE "BF9F96-P.p";

PROCESS BF9F96List
{
  VARIABLES
  {
      OUT MIR-BNK-ID-1;
      OUT MIR-BNK-BR-ID-1;
      OUT MIR-BNK-NM-1;
      OUT MIR-BNK-BR-NM-1;
  }
    Title = STRINGTABLE.IDS_TITLE_BF9F96List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    # CA02CR CHANGES STARTS
    SAVE-MSGS-OUTPUT1 = STRINGTABLE.IDS_MESSAGE_JP_check1;
    SAVE-MSGS-OUTPUT2 = STRINGTABLE.IDS_MESSAGE_JP_check2;
    SAVE-MSGS-OUTPUT3 = STRINGTABLE.IDS_MESSAGE_JP_check3;
     MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
     MESSAGES-T[2] = SAVE-MSGS-OUTPUT2;
     MESSAGES-T[3] = SAVE-MSGS-OUTPUT3;

    # CA02CR CHANGES ENDS
    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9F96-I";
        STRINGTABLE.IDS_TITLE_BF9F96Input -> Title;
    }
    # CA02CR CHANGES BEGINS
            MESSAGES-T[1] = " ";
            MESSAGES-T[2] = " ";         
            MESSAGES-T[3] = " "; 
    # CA02CR CHANGES ENDS 
    IF action == "ACTION_BACK"
        EXIT;

    # 105532 CHANGES STARTS
    # MIR-RECORD-CTR ="000"; 
    # 105532 CHANGES ENDS

    # 105532 CHANGES STARTS
      FLOW-PAGE = 1;
    # 105532 CHANGES ENDS

    STEP RetrieveList
    {
        USES P-STEP "BF9F96-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
  

    Title = STRINGTABLE.IDS_TITLE_BF9F96List;
    ButtonBar = "ButtonBarOkCancelBackMore";

    STEP DisplayList
    {
        USES S-STEP "BF9F96-O";
        STRINGTABLE.IDS_TITLE_BF9F96Output -> Title;
    }
        
    IF action == "ACTION_NEXT"
    {
        IF index != ""
        {
           MIR-BNK-ID-1 = MIR-BNK-ID-T[index];
           MIR-BNK-BR-ID-1 = MIR-BNK-BR-ID-T[index];
           MIR-BNK-NM-1 = MIR-BNK-NM-T[index];
           MIR-BNK-BR-NM-1 = MIR-BNK-BR-NM-T[index];
           EXIT;
        }
    }

    # If the user has pressed the more button, go back and reget the list
    IF action == "ACTION_PREV"
    {
    # 105532 CHANGES STARTS
    #  MIR-RECORD-CTR-N = MIR-RECORD-CTR-N - 010 ;
    #  IF  MIR-RECORD-CTR-N < 0 
    #      MIR-RECORD-CTR-N = 0;
       FLOW-PAGE = FLOW-PAGE - 1;
       MIR-RECORD-CTR-N = SAVE-RECORD-CTR[FLOW-PAGE];
    # 105532 CHANGES ENDS
       BRANCH RetrieveList;
    }

    IF action == "ACTION_MORE"
    {
    # 105532 CHANGES STARTS
        FLOW-PAGE = FLOW-PAGE + 1;
        SAVE-RECORD-CTR[FLOW-PAGE] = MIR-RECORD-CTR-N;
    # 105532 CHANGES ENDS
       BRANCH RetrieveList;
     }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

    IF action == "ACTION_BACK" 
        EXIT;
}