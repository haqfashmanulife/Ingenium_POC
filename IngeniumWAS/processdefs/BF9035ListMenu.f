# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9035ListMenu.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01   New for NB10                                             *
#*  B00102  01AUG01  REWORK ON THE PROCESS FLOW                                *
#*  23774A  CTS      Audit Log Related Changes                                                                          *
#*******************************************************************************

INCLUDE "BF9035-I.s";
INCLUDE "BF9035-O.s";
INCLUDE "BF9035-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9035ListMenu
{
    Title = STRINGTABLE.IDS_TITLE_BF9035ListMenu;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP ListStart
    {
        USES S-STEP "BF9035-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9035-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

#23774A CHANGES BEGIN

        temp-DTL-INFO  = MIR-UWRT-TBL-TYP-CD + " " + MIR-UWRT-MAX-AGE;    

  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;        

#23774A CHANGES END

    Title = STRINGTABLE.IDS_TITLE_BF9035ListMenu;
    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF9035-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;

}

