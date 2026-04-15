# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8003Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  01AUG01 SC       Use ButtonBarOKCancel after record has been deleted       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8000-I.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8000AD-O.s";
INCLUDE "BF8003-P.p";
INCLUDE "BF8000NB-O.s";

PROCESS BF8003Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF8003Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to delete

    STEP Input
    {
        USES S-STEP "BF8000-I";
    }

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

#UY3004 CHANGES END
		
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarDeleteCancel";


    # Determine whether policies is NB or Ad and display				
    # the policy information on the appropriate page

    IF MIR-POL-APPL-CTL-CD == "NB"
        BRANCH Confirm-NB;



    # Update the record who's data was just entered.

    STEP Confirm-AD
    {
        USES S-STEP "BF8000AD-O";
    }

    IF action == "ACTION_BACK"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    # Delete the record

    STEP Delete-AD
    {
        USES P-STEP "BF8003-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-AD;


    MIR-POL-ID-BASE = "";
    MIR-POL-ID-SFX = "";

    BRANCH Input;

    STEP Confirm-NB
    {
        USES S-STEP "BF8000NB-O";
    }

    IF action == "ACTION_BACK"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    # Delete the record

    STEP Delete-NB
    {
        USES P-STEP "BF8003-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-NB;


    MIR-POL-ID-BASE = "";
    MIR-POL-ID-SFX = "";
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

