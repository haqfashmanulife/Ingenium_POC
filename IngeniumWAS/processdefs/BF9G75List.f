# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9G75List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSDMI     CTS      INITIAL VERSION OF Do Not Process Movement Screen      *
#*  UYDM25     CTS      CHANGES FOR STREAM3                                    *
#*******************************************************************************

INCLUDE "BF9G75-I.s";
INCLUDE "BF9G75-O.s";
INCLUDE "BF9G75-P.p";

PROCESS BF9G75List
{
    Title = STRINGTABLE.IDS_TITLE_BF9G75List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9G75-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
# UYDM25 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD != "00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
       {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
       }

    IF WS-POL-COUNTER >"01"
       {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
       }

# UYDM25 CHANGES END

    STEP RetrieveList
    {
        USES P-STEP "BF9G75-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9G75List;

   ButtonBar = "ButtonBarOKCancel";

    STEP DisplayList
    {
        USES S-STEP "BF9G75-O";
    }

    IF action == "ACTION_BACK"
        BRANCH ListStart;

}

