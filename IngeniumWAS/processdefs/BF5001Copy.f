# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5001Copy.f                                                  *
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
INCLUDE "BF5000-I.s";
INCLUDE "BF5000-P.p";
INCLUDE "BF5001Life-I.s";
INCLUDE "BF5001Ann-I.s";
INCLUDE "BF5001Dis-I.s";
INCLUDE "BF5002-P.p";
INCLUDE "BF5002Life-I.s";
INCLUDE "BF5002Ann-I.s";
INCLUDE "BF5002Dis-I.s";
INCLUDE "BF5000Life-O.s";
INCLUDE "BF5000Ann-O.s";
INCLUDE "BF5000Dis-O.s";

PROCESS BF5001Copy
{
    Title = STRINGTABLE.IDS_TITLE_BF5001Copy;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the Policy ID of the policy to be cloned 

    STEP BF5000-I
    {
        USES S-STEP "BF5000-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the policy record

    STEP BF5000-P
    {
        USES P-STEP "BF5000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF5000-I;


    ClonePrcesI = "BF5001Life-I";
    UpdatePrcesI = "BF5002Life-I";
    CreatePrcesO = "BF5000Life-O";


    # Determine if the policy is Life or Health or Annuity/Equity and display
    # the appropriate Input page

    IF MIR-POL-BUS-CLAS-CD == "A" || MIR-POL-BUS-CLAS-CD == "E"
    {
        ClonePrcesI = "BF5001Ann-I";
        UpdatePrcesI = "BF5002Ann-I";
        CreatePrcesO = "BF5000Ann-O";

    }
    IF MIR-POL-BUS-CLAS-CD == "H"
    {
        ClonePrcesI = "BF5001Dis-I";
        UpdatePrcesI = "BF5002Dis-I";
        CreatePrcesO = "BF5000Dis-O";

    }

    MIR-CVG-RT-AGE-T[1] = "   ";
    MIR-CVG-RT-AGE-T[2] = "   ";
    MIR-CVG-RT-AGE-T[3] = "   ";
    MIR-CVG-RT-AGE-T[4] = "   ";
    MIR-CVG-RT-AGE-T[5] = "   ";
    MIR-CVG-RT-AGE-T[6] = "   ";
    MIR-CVG-RT-AGE-T[7] = "   ";
    MIR-CVG-RT-AGE-T[8] = "   ";


    # Display the retrieved record for create input

    STEP Create-I
    {
        USES S-STEP ClonePrcesI;
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Process create

    STEP BF5001Create-P
    {
        USES P-STEP "BF5001Create-P";
    }

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05"
        BRANCH Create-I;

    IF LSIR-RETURN-CD == "00" && MIR-POL-CSTAT-CD == "C"
        BRANCH Create-O;

    IF LSIR-RETURN-CD == "00"
        BRANCH Output;



    #If return code is other than 00 or 05 (i.e., error but with no roll back), 
    #update step is displayed for user to correct the errors

    STEP Update-I
    {
        USES S-STEP UpdatePrcesI;
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF5002-P
    {
        USES P-STEP "BF5002-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-I;

    IF MIR-POL-CSTAT-CD != "C"
        BRANCH Output;


    STEP Create-O
    {
        USES S-STEP CreatePrcesO;
        "ButtonBarSettleCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;


    STEP BF5003-P
    {
        USES P-STEP "BF5003-P";
    }

    STEP Output
    {
        USES S-STEP CreatePrcesO;
        "ButtonBarOK" -> ButtonBar;
    }

}

