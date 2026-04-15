# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1260Trnxinq.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1260-I.s";
INCLUDE "BF1260-O.s";
INCLUDE "BF1260-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1260Trnxinq
{
    Title = STRINGTABLE.IDS_TITLE_BF1260Trnxinq;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF1260-I
    {
        USES S-STEP "BF1260-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF1260-P
    {
        USES P-STEP "BF1260-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF1260-I;

#23774A CHANGES BEGIN

        temp-DTL-INFO  = MIR-USER-ID + " " + MIR-TRNXT-DT;    

  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF1260-I;
        

#23774A CHANGES END

    ButtonBar = "ButtonBarListsScroll";

    STEP BF1260-O
    {
        USES S-STEP "BF1260-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_MORE"
    {
        MIR-DV-BCKWRD-SCROLL-IND = "N";

        BRANCH BF1260-P;

    }
    IF action == "ACTION_PREVIOUS"
    {
        MIR-DV-BCKWRD-SCROLL-IND = "Y";

        BRANCH BF1260-P;

    }
}

