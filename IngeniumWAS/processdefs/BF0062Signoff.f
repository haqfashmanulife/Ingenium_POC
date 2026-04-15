# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0062Signoff.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016057  6.1      Added check for language change                           *
#*******************************************************************************

INCLUDE "BF0062-P.p";
INCLUDE "BF2072-P.p";
INCLUDE "BF2072-O.s";

PROCESS BF0062Signoff
{
    ATTRIBUTES
    {
        SkipEpilog;
    }

    Title = "INGENIUM Sign Off";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    ButtonBar = "ButtonBar";
    ButtonBarSize = "40";

    #*****************************************************************
    # Sign Off - no input screen - produce session totals for user
    # to verify their session activity.  Provides a page to allow
    # user to cancel the sign-off process if desired.
    #*****************************************************************

    MIR-USER-ID = LSIR-USER-ID;

    STEP SessionTotalsRetrieve
    {
        USES P-STEP "BF2072-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;


    STEP SessionTotalsDisplay
    {
        USES S-STEP "BF2072-O";
        STRINGTABLE.IDS_TITLE_BF0062Signoff -> Title;
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP SignOff
    {
        USES P-STEP "BF0062-P";
    }

    IF LSIR-RETURN-CD == "00"
        EXIT;

}

