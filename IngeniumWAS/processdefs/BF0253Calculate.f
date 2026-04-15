# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0253Calculate.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0251-I.s";
INCLUDE "BF0251-O.s";
INCLUDE "BF0251-P.p";
INCLUDE "BF0252-I.s";
INCLUDE "BF0252-O.s";
INCLUDE "BF0252-P.p";
INCLUDE "BF0253Trad-O.s";
INCLUDE "BF0253Nontrad-O.s";
INCLUDE "BF0253-P.p";

PROCESS BF0253Calculate
{
    Title = STRINGTABLE.IDS_TITLE_BF0251Refresh;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Always perform a refresh when this process is invoked.

    STEP KeyRefresh-S
    {
        USES S-STEP "BF0251-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
   
   # UY3004 CHANGES START
   
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
        BRANCH KeyRefresh-S;
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

   # UY3004 CHANGES END
    
    STEP PerformRefresh-P
    {
        USES P-STEP "BF0251-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyRefresh-S;


    STEP DisplayRefresh-S
    {
        USES S-STEP "BF0251-O";
        "ButtonBarProjUpd" -> ButtonBar;
    }


    # If the user clicks Cancel, take the user back to the input page

    IF action == "ACTION_BACK"
        BRANCH KeyRefresh-S;

    # If the user clicks Update, display a page where all fields are
    # open for input.

    IF action == "ACTION_UPDATE"
        BRANCH KeyUpdate-S;



    # If action is none of the above, then it is assumed to be Calculate.
    # This is where the projection is calculated.

    STEP PerformCalculate-P
    {
        USES P-STEP "BF0253-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyUpdate-S;



    # The output page displayed for the projection will depend
    # on whether the policy is traditional or non-traditional.
    # Initialize DisplayProjectS

    DisplayProjectS = "BF0253Nontrad-O";

    IF MIR-POL-INS-TYP-CD == "D" || MIR-POL-INS-TYP-CD == "C" || MIR-POL-INS-TYP-CD == "N" || MIR-POL-INS-TYP-CD == "S"
        DisplayProjectS = "BF0253Nontrad-O";

    ELSE
        DisplayProjectS = "BF0253Trad-O";


    STEP DisplayProject-S
    {
        USES S-STEP DisplayProjectS;
        "ButtonBarOK" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0253Calculate -> Title;
    }

    # This is the end of the flow. Take the user back to the menu.

    EXIT;


    # Allow the user to input values that are different from
    # the policy default values for calculation purposes.

    STEP KeyUpdate-S
    {
        USES S-STEP "BF0252-I";
        "ButtonBarOKCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0252Update -> Title;
    }


    # If the user clicks Cancel, the key refresh page is displayed

    IF action == "ACTION_BACK"
        BRANCH KeyRefresh-S;

    STEP PerformUpdate-P
    {
        USES P-STEP "BF0252-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyUpdate-S;


    STEP DisplayUpdate-S
    {
        USES S-STEP "BF0252-O";
        "ButtonBarProj" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0252Update -> Title;
    }


    # If the user clicks Cancel, the key refresh page is displayed

    IF action == "ACTION_BACK"
        BRANCH KeyRefresh-S;

    # If none of the above, it is assumed that Calculate was chosen.
    # Perform the projection calculation.

    BRANCH PerformCalculate-P;
}

