# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9274Create.f                                                *
#*  Description: Claim Requirement Create                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9274-I.s";
INCLUDE "BF9274-P.p";

PROCESS BF9274Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9272Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Display the entry screen for requirement information

    STEP InputInfo
    {
        USES S-STEP "BF9274-I";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        EXIT;

    }
    IF action == "ACTION_REFRESH"
        BRANCH InputInfo;



    # Process the entered information

    STEP ProcessInfo
    {
        USES P-STEP "BF9274-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH InputInfo;

}

