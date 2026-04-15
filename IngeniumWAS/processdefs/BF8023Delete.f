# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8023Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016863  612J     Code cleanup                                              *
#*  02NB64  WBP      Allow bypass of Input Screen (DisplayInput variable)      *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8020-I.s";
INCLUDE "BF8020-P.p";
INCLUDE "BF8020AD-O.s";
INCLUDE "BF8023-P.p";
INCLUDE "BF8020NB-O.s";

PROCESS BF8023Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF8023Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to delete

    STEP Input
    {
        USES S-STEP "BF8020-I";
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
        USES P-STEP "BF8020-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarDeleteCancel";


    # Determine whether policies is NB or Ad and display        
    # the coverage information on the appropriate page

    IF MIR-POL-APPL-CTL-CD == "NB"
        BRANCH Confirm-NB;



    # Update the record who's data was just entered.

    STEP Confirm-AD
    {
        USES S-STEP "BF8020AD-O";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    # Delete the record

    STEP Delete
    {
        USES P-STEP "BF8023-P";
    }

    IF LSIR-RETURN-CD != "00"
        MIR-POL-ID-BASE = "";


    MIR-POL-ID-SFX = "";
    MIR-CVG-NUM = "";
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;

    STEP Confirm-NB
    {
        USES S-STEP "BF8020NB-O";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    # Delete the record

    BRANCH Delete;

    IF LSIR-RETURN-CD != "00"
        MIR-POL-ID-BASE = "";


    MIR-POL-ID-SFX = "";
    MIR-CVG-NUM = "";
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

