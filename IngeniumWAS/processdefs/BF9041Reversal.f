# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9041Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  02GL57  WBP      Add Automatic Policy Reject (BF1352) for Full Refunds     *
#*  B00758  CSS      Initialize MIR fields after returning from Policy Reject  *
#*  MP168D  CTS      CHANGES TO ADD FIRM BANKING PAYOUT METHOD REMITTANCE      *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY
#*******************************************************************************

INCLUDE "BF9041-I.s";
INCLUDE "BF9041-O.s";
INCLUDE "BF9041-P.p";
INCLUDE "BF1352-P.p";
INCLUDE "BF9041FB-I.s";
INCLUDE "BF9041FB-O.s";

PROCESS BF9041Reversal
{
    Title = STRINGTABLE.IDS_TITLE_BF9041Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "";
#M245B2 CHANGES START HERE     
    MIR-PMT-CRCY-CD = "JP";
#M245B2 CHANGES END HERE     
    STEP DataInput
    {
        USES S-STEP "BF9041-I";
        STRINGTABLE.IDS_TITLE_BF9041Phase2 -> Title;
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
    
    # If the Payout Method is Firm Banking Then We have a different  
    # set of screens.                                                

    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
    {
        MIR-DV-PRCES-STATE-CD = "1";
        BRANCH PerformHostEditsFB1;
    }
        
    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits
    {
        USES P-STEP "BF9041-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput;


    STEP Confirm
    {
        USES S-STEP "BF9041-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9041Phase3 -> Title;
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
        USES P-STEP "BF9041-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;


    # If changes are OK and it is a Full Refund then Reject the policy

    PolReject:
    
    IF MIR-DV-TYP-CSH-RFND-CD == "F"
    {
        MIR-CVG-NUM = "01";
        MIR-POL-REJ-REASN-CD = "NP";
    #   MIR-DV-TRNXT-PAYO-MTHD-CD = "";


        # First we must call BF1352 in State 2 in order to initialize fields

        STEP RejectInit
        {
            USES P-STEP "BF1352-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        # Then we call BF1352 in State 3 to do the actual Reject            

        STEP Reject
        {
            USES P-STEP "BF1352-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }


        # Initialize BF9041 MIR fields after returning from Policy Reject

        MIR-DV-TYP-CSH-RFND-CD = "";
        MIR-RECPT-AMT = "";
        MIR-RECPT-DT = "";
        MIR-RECPT-NBR = "";

    }
    IF action == "ACTION_BACK"
        EXIT;

    BRANCH DataInput;

    # Flow For Firm Banking (Control comes here only when FB payout is chosen in first screen)

    STEP PerformHostEditsFB1
    {
        USES P-STEP "BF9041-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput;

    STEP DataInputFB
    {
        USES S-STEP "BF9041FB-I";
        STRINGTABLE.IDS_TITLE_BF9041Phase4 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH DataInputFB;

    # If the user hit Cancel, return to the key input screen.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput;
    }
        
    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEditsFB2
    {
        USES P-STEP "BF9041-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInputFB;

    STEP ConfirmFB
    {
        USES S-STEP "BF9041FB-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancelBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9041Phase3 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.
    
    IF action == "ACTION_LANGCHANGE"
        BRANCH ConfirmFB;

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput;

    }

    # If the user selects Back on the Confirm page, return to the DataInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInputFB;
    }
    
    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHostFB
    {
        USES P-STEP "BF9041-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmFB;
       
    BRANCH PolReject;
}

