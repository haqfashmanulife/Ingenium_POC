# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9H30Wlset.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9H30-I.s";
INCLUDE "BF9H30-P.p";
INCLUDE "BF9H31-I.s";
INCLUDE "BF9H30-O.s";
INCLUDE "BF9G99-P.p";

PROCESS BF9H30Wlset
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9H30Wlset;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    #IF DisplayInput == "FALSE"
    #    BRANCH Retrieve;
    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

# 1st screen-WL Premium Payment Completion Processing - input details 
    MIR-PAY-OUT-MTHD-CD = "F";
    STEP Input1
    {
        USES S-STEP "BF9H30-I";
        STRINGTABLE.IDS_TITLE_BF9H30Wlset -> Title;
    }
    TRACE ("POLICY NUMBER :" +MIR-POL-ID-BASE);
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

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
        BRANCH KeyFields-S;
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

#UY3004 CHANGES END

    # Retrieve the data for the key value
     MIR-DV-PRCES-STATE-CD = "1";
    STEP Retrieve
    {
        USES P-STEP "BF9H30-P";
    }
    IF LSIR-RETURN-CD != "00"
    {
        BRANCH Input1;
    }

    #2nd screen-WL Premium Payment Completion Processing - Details 


    STEP Input2
    {
        USES S-STEP "BF9H31-I";
        STRINGTABLE.IDS_TITLE_BF9H30Phase1 -> Title;
    }


        IF action == "ACTION_BACK"
        {
            MESSAGES-T[0] = "";
            BRANCH Input;
        }
    STEP Retrieve1
    {
        USES P-STEP "BF9H30-P";
         "2"-> MIR-DV-PRCES-STATE-CD;
    }
 
    IF LSIR-RETURN-CD != "00"
    {
        BRANCH Input2;
    }

    #3rd screen-WL Premium Payment Completion Processing - Confirm Transaction

    STEP Output2
    {
        USES S-STEP "BF9H30-O";
        STRINGTABLE.IDS_TITLE_BF9H30Phase2 -> Title;
        "ButtonBarConfirmCancelBack" -> ButtonBar;
    }
    IF action == "ACTION_BACK"
    {
       MESSAGES-T[0] = "";
       BRANCH Input1;
    }


    STEP Retrieve2
    {
        USES P-STEP "BF9H30-P";    
        "3" -> MIR-DV-PRCES-STATE-CD ;

    }
    # If the user selects Cancel on the Confirm page, return to the Input page.

       IF action == "ACTION_BACK"
       {
          MESSAGES-T[0] = "";
          BRANCH Input1;
       }

    # If the user selects Back on the Confirm page, return to the FBNKInput page.

       IF action == "ACTION_PREVIOUS"
       {
          MESSAGES-T[0] = "";
          BRANCH Input1;
       }


    BRANCH Input1;
    ButtonBar = "ButtonBarOK";

}

