# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8001Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8001NB-I.s";
INCLUDE "BF8001-P.p";
INCLUDE "BF8002Update-P.p";
INCLUDE "BF8002NB-I.s";
INCLUDE "BF8000NB-O.s";
INCLUDE "BF8000-P.p";

PROCESS BF8001Create
{

    # Set the values that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF8001Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF8001NB-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Set the APP-CTL-NB to indicate this is a New Business policy

    MIR-POL-APPL-CTL-CD = "NB";


    # Create the new record and retrieve it to get the system defaults

    STEP Create
    {
        USES P-STEP "BF8001-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # set default values

    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;


    # Retrieve the record just created

    STEP Retrieve
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF8002NB-I";
    }

    IF action == "ACTION_REFRESH"
        BRANCH Edit;

    IF action == "ACTION_BACK"
        EXIT;

    # Update the record who's data was just entered and perform diagnostics.

    STEP Update
    {
        USES P-STEP "BF8002Update-P";
    }

    # The value of SESSION.LSIR-MORE-MESSAGES-IND that has been produced
    # by the Update P-Step needs to be retained to properly display the 'MORE' link
    # on the message box, but the next P-Step will overwrite this value before the 
    # page is displayed. To fix this, the value will be stored in the variable
    # LSIR-MORE-MESSAGES-IND which is defined as an 'IN' field on the S-Step
    # for the page display.  When the page is displayed, the value of 
    # LSIR-MORE-MESSAGES-IND will override the value of 
    # SESSION.LSIR-MORE-MESSAGES-IND.
    # Explicitly retrieve values which may have been updated by the
    # Diagnostics process before branching 

    STEP DiagnosticsOutput-NB
    {
        USES P-STEP "BF8000-P";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
        MIR-POL-CSTAT-CD <- MIR-POL-CSTAT-CD;
        MIR-POL-NXT-ACTV-DT <- MIR-POL-NXT-ACTV-DT;
        MIR-NXT-ACTV-TYP-CD <- MIR-NXT-ACTV-TYP-CD;
        MIR-POL-APP-CMPLT-DT <- MIR-POL-APP-CMPLT-DT;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF8000NB-O";
    }

}

