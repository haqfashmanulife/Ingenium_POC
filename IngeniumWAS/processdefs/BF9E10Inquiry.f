# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E10Inquiry.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS026  6.0      ONLINE CHANGES FOR UNISYS                                 *
#*  128577           CHANGES HAS BEEN DONE FOR BUG FIX                         *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

INCLUDE "BF9E10-I.s";
INCLUDE "BF9E10-P.p";
INCLUDE "BF9E10-O.s";
INCLUDE "GenRetrieveMore.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9E10Inquiry
{
    Title = STRINGTABLE.IDS_TITLE_BF9E10Inquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9E10-I";
        " " -> MIR-DV-TO-DT;
    }

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;

    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;

        WS-POL-ID-BASE <- WS9D34-POL-ID;

        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
      }


            


    STEP RetrieveList1
    {
    # UY3004 CHANGES END 
        USES P-STEP "BF9E10-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
	
#23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO;  
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        
#23774A CHANGES END
    


#128577 changes begins
#Title = STRINGTABLE.IDS_TITLE_BF0484List;
    Title = STRINGTABLE.IDS_TITLE_BF9E10Inquiry;
#128577 changes ends
    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF9E10-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
       BRANCH RetrieveList;
    }
}