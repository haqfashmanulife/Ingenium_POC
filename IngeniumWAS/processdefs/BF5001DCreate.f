# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5001DCreate.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5001Create-P.p";
INCLUDE "BF5003-P.p";
INCLUDE "BF5001Dis-I.s";
INCLUDE "BF5000Dis-O.s";
INCLUDE "BF5002-P.p";
INCLUDE "BF5002Dis-I.s";

PROCESS BF5001DCreate
{
    Title = STRINGTABLE.IDS_TITLE_BF5001DCreate;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF5001Dis-I
    {
        USES S-STEP "BF5001Dis-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH BF5001Dis-I;


    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;

    STEP BF5001Create-P
    {
        USES P-STEP "BF5001Create-P";
    }

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05"
        BRANCH BF5001Dis-I;

    IF LSIR-RETURN-CD == "00" && MIR-POL-CSTAT-CD == "C"
        BRANCH BF5000Dis-O;

    IF LSIR-RETURN-CD == "00"
        BRANCH Output;



    #If return code is other than 00 or 05 (i.e., error but with no roll back), 
    #update step is displayed for user to correct the errors

    STEP BF5002Dis-I
    {
        USES S-STEP "BF5002Dis-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH BF5002Dis-I;


    STEP BF5002-P
    {
        USES P-STEP "BF5002-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF5002Dis-I;

    IF MIR-POL-CSTAT-CD != "C"
        BRANCH Output;


    STEP BF5000Dis-O
    {
        USES S-STEP "BF5000Dis-O";
        "ButtonBarSettleCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;


    STEP Settle
    {
        USES P-STEP "BF5003-P";
    }

    STEP Output
    {
        USES S-STEP "BF5000Dis-O";
        "ButtonBarOK" -> ButtonBar;
    }

}

