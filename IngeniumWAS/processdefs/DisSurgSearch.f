# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   DisSurgSearch.f                                               *
#*  Description: Disease/Surgery Search function                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  HCL103  HIN/CL   Correction - ensure S-Steps have lower case extension     *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************
# Input screen

INCLUDE "DisSearch-I.s";
INCLUDE "SurgSearch-I.s";

# List retrieve process

INCLUDE "BF9894-P.p";

# List output screens for Disease or Surgery

INCLUDE "DisSearch-O.s";
INCLUDE "SurgSearch-O.s";

PROCESS DisSurgSearch
{
  VARIABLES
  {
    IN MIR-MEDIC-CD;

    OUT SRCH-MEDC-ID;

    OUT SRCH-MEDC-DESC-2-TXT;

    OUT SRCH-GRP-MEDC-ID;

    OUT SRCH-MEDC-SUBTYP-CD;

    OUT SRCH-LAST-ACTION;
  }

    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the output fields

    SRCH-MEDC-ID = " ";
    SRCH-MEDC-DESC-2-TXT = " ";
    SRCH-GRP-MEDC-ID = " ";
    SRCH-MEDC-SUBTYP-CD = " ";


    # Ask the user where they'd like to start the list

    IF MIR-MEDIC-CD == "D"
    {
        Title = STRINGTABLE.IDS_TITLE_DiseaseCodeSearch;
        ListStartS = "DisSearch-I";

    }
    IF MIR-MEDIC-CD == "S"
    {
        Title = STRINGTABLE.IDS_TITLE_SurgeryCodeSearch;
        ListStartS = "SurgSearch-I";

    }

    STEP ListStart
    {
        USES S-STEP ListStartS;
    }

    SRCH-LAST-ACTION = action;

    IF action == "ACTION_BACK"
        EXIT;

    MIR-ORIG-DESC-1-TXT = "";

    STEP RetrieveList
    {
        USES P-STEP "BF9894-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH ListStart;

    }
    IF MIR-MEDIC-CD == "D"
    {
        Title = STRINGTABLE.IDS_TITLE_DiseaseCodeSearchResultList;
        DisplayListS = "DisSearch-O";

    }
    IF MIR-MEDIC-CD == "S"
    {
        Title = STRINGTABLE.IDS_TITLE_SurgeryCodeSearchResultList;
        DisplayListS = "SurgSearch-O";

    }

    ButtonBar = "ButtonBarDisSurgList";

    STEP DisplayList
    {
        USES S-STEP DisplayListS;
    }

    SRCH-LAST-ACTION = action;

    IF action == "ACTION_CANCEL"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Pass back the details needed for the record the user selected

    SRCH-MEDC-ID = MIR-MEDC-ID-T[index];
    SRCH-MEDC-DESC-2-TXT = MIR-LANG-DESC-2-TXT-T[index];

    IF MIR-MEDIC-CD == "D"
    {
        SRCH-GRP-MEDC-ID = MIR-GRP-MEDC-ID-T[index];

    }
    IF MIR-MEDIC-CD == "S"
    {
        SRCH-MEDC-SUBTYP-CD = MIR-MEDC-SUBTYP-CD-T[index];

    }
}

