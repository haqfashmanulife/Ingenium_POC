# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9G44List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB15C   CTS      REINSURANCE CHANGES                                      *
#*  TL0906   CTS      DEFECT FIX FOR MORE BUTTON                               *
#*  TL1052   CTS      DEFECT FIX FOR TLB-1052                                  *
#*******************************************************************************

INCLUDE "BF9G44-I.s";
INCLUDE "BF9G44-O.s";
INCLUDE "BF9G40-O.s";
INCLUDE "BF9G44-P.p";
INCLUDE "BF9G40-P.p";
INCLUDE "BF9G40Retrieve.f";

PROCESS BF9G44List
{
    Title = STRINGTABLE.IDS_TITLE_BF9G44List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9G44-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

# TL1052 CHANGES STARTS       
#    FLOW-PAGE = 0;
#    MIR-RECORD-CTR = "0";
    FLOW-PAGE = 1;
# TL1052 CHANGES ENDS 
    STEP RetrieveList
    {
        USES P-STEP "BF9G44-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9G44List;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF9G44-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

     IF action == "ACTION_MORE" 
     {
       #  TL0906 CHANGES STARTS HERE 
# TL1052 CHANGES STARTS 
         FLOW-PAGE = FLOW-PAGE + 1;
       #  MIR-RECORD-CTR = FLOW-PAGE;
         SAVE-RECORD-CTR[FLOW-PAGE] = MIR-RECORD-CTR-N;
         BRANCH RetrieveList;
       #   IF MIR-MORE-EXISTS-FLAG == "Y"
       #   {
       #     FLOW-PAGE = FLOW-PAGE + 1;
       #     MIR-RECORD-CTR = FLOW-PAGE;
       #     BRANCH RetrieveList;
       #   }
       #   BRANCH DisplayList;
# TL1052 CHANGES ENDS
       #  TL0906 CHANGES ENDS HERE 
      }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

    MIR-POL-ID = MIR-POL-ID-T[index];

    STEP SelectItem
    {
        USES PROCESS "BF9G40Retrieve";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }
        "FALSE" -> DisplayInput;
    }

# TL1052 CHANGES STARTS
#    BRANCH RetrieveList;
     EXIT;
# TL1052 CHANGES ENDS

}

