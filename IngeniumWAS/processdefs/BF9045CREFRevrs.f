# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9045CREFRevrs.f                                             *
#*  Description: Cash Refund Reversal Processing for FB remittances            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP168D  CTS      CREATED FOR CASH REFUND REVERSAL BUSINESS PROCESS         *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY
#*******************************************************************************

INCLUDE "BF9045-I.s";
INCLUDE "BF9045-P.p";
INCLUDE "BF9045-O.s";
INCLUDE "BF1351-P.p";

PROCESS BF9045CREFRevrs
{              

    Title = STRINGTABLE.IDS_TITLE_BF9045Phase2;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP DataInput
    {
        USES S-STEP "BF9045-I";
        STRINGTABLE.IDS_TITLE_BF9045Phase2 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.
    IF action == "ACTION_LANGCHANGE"
        BRANCH DataInput;

    # If the user hit Cancel, return to menu if this is the first screen.
    # Otherwise, return to the key input screen.
    # If the user came from a list, return to the list
    IF action == "ACTION_BACK"
        EXIT;

    #UY3004 CHANGES START

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

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH DataInput;
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

    #UY3004 CHANGES ENDS
        
    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits
    {
        USES P-STEP "BF9045-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput;

    STEP Confirm
    {
        USES S-STEP "BF9045-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9045Phase3 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput;
    }

    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHost
    {
        USES P-STEP "BF9045-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;

    # If changes are OK and it is a Full Refund then Reject the policy

    IF MIR-CSH-RFND-TYP-CD == "F"
    {
        MIR-CVG-NUM = "01";
        MIR-POL-REJ-REASN-CD = "";
        MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

        # First we must call BF1351 in State 2 in order to initialize fields

        STEP ReinstInit
        {
            USES P-STEP "BF1351-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        # Then we call BF1351 in State 3 to do the actual Reinstatement

        STEP Reinst
        {
            USES P-STEP "BF1351-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }

        # Initialize BF9045 MIR fields after returning from Policy Reject

        MIR-HID-CSH-RFND-CD = "";
    }

    BRANCH DataInput;

}

