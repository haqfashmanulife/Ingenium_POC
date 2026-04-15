# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   HistClmCreate.f                                               *
#*  Description: Historical Claim Create - cloned from BF9251Create            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCCL05  HIN/CL   INITIAL VERSION                                           *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9250-O.s";
INCLUDE "BF9251-I.s";
INCLUDE "BF9252NC-I.s";
INCLUDE "BF9252NC-O.s";
INCLUDE "BF9250-P.p";
INCLUDE "BF9251-P.p";
INCLUDE "BF9252-P.p";
INCLUDE "DisSurgSearch.f";

PROCESS HistClmCreate
{
    Title = STRINGTABLE.IDS_TITLE_HistoricalClaimCreate;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9251-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Set the Historical Claim Indicator which will be stored on the 
    # "skeleton" CLMA record

    MIR-CLMA-HIST-CLM-IND = "Y";


    # Initial Create will set up "skeleton" CLMA / CLRL recs.

    STEP PerformCreatePart1-P
    {
        USES P-STEP "BF9251-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    SESSION.MIR-CLM-ID = MIR-CLM-ID;


    # Retrieve "skeleton" CLMA / CLRL recs.

    STEP Retrieve
    {
        USES P-STEP "BF9250-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    STEP Update-S
    {
        USES S-STEP "BF9252NC-I";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        EXIT;

    }
    IF action == "GoToSearchDisease"
    {
        temp-MSGS-T[1] = MESSAGES-T[1];
        temp-MSGS-T[2] = MESSAGES-T[2];
        temp-MSGS-T[3] = MESSAGES-T[3];
        temp-MSGS-T[4] = MESSAGES-T[4];
        temp-MSGS-T[5] = MESSAGES-T[5];
        temp-MSGS-T[6] = MESSAGES-T[6];
        temp-MSGS-T[7] = MESSAGES-T[7];
        temp-MSGS-T[8] = MESSAGES-T[8];
        temp-MSGS-T[9] = MESSAGES-T[9];
        temp-MSGS-T[10] = MESSAGES-T[10];
        MESSAGES-T[0] = "";

        STEP DisSearch
        {
            USES PROCESS "DisSurgSearch";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # send values to the sub-flow for preservation
            # of data should the user cancel from that sub-flow

            "D" -> MIR-MEDIC-CD;
        }

        IF SRCH-LAST-ACTION == "ACTION_SELECT"
        {
            MIR-DIS-MAJ-CD-T[index] = SRCH-GRP-MEDC-ID;
            MIR-DIS-MINR-CD-T[index] = SRCH-MEDC-ID;
            MIR-DIS-MINR-DESC-T[index] = SRCH-MEDC-DESC-2-TXT;

        }

     # PF13 - move array  
       MESSAGES-T[1] = temp-MSGS-T[1];
       MESSAGES-T[2] = temp-MSGS-T[2];
       MESSAGES-T[3] = temp-MSGS-T[3];
       MESSAGES-T[4] = temp-MSGS-T[4];
       MESSAGES-T[5] = temp-MSGS-T[5];
       MESSAGES-T[6] = temp-MSGS-T[6];
       MESSAGES-T[7] = temp-MSGS-T[7];
       MESSAGES-T[8] = temp-MSGS-T[8];
       MESSAGES-T[9] = temp-MSGS-T[9];
       MESSAGES-T[10] = temp-MSGS-T[10];
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Update-S;

    }
    IF action == "GoToSearchDisCause"
    {
        temp-MSGS-T[1] = MESSAGES-T[1];
        temp-MSGS-T[2] = MESSAGES-T[2];
        temp-MSGS-T[3] = MESSAGES-T[3];
        temp-MSGS-T[4] = MESSAGES-T[4];
        temp-MSGS-T[5] = MESSAGES-T[5];
        temp-MSGS-T[6] = MESSAGES-T[6];
        temp-MSGS-T[7] = MESSAGES-T[7];
        temp-MSGS-T[8] = MESSAGES-T[8];
        temp-MSGS-T[9] = MESSAGES-T[9];
        temp-MSGS-T[10] = MESSAGES-T[10];
        MESSAGES-T[0] = "";

        STEP DisCauseSearch
        {
            USES PROCESS "DisSurgSearch";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # send values to the sub-flow for preservation
            # of data should the user cancel from that sub-flow

            "D" -> MIR-MEDIC-CD;
        }

        IF SRCH-LAST-ACTION == "ACTION_SELECT"
        {
            MIR-CLMA-CAUS-MAJ-CD = SRCH-GRP-MEDC-ID;
            MIR-CLMA-CAUS-MINR-CD = SRCH-MEDC-ID;
            MIR-CLMA-DIS-CAUS-DESC = SRCH-MEDC-DESC-2-TXT;

        }

      # PF13 - move array  
        MESSAGES-T[1] = temp-MSGS-T[1];
        MESSAGES-T[2] = temp-MSGS-T[2];
        MESSAGES-T[3] = temp-MSGS-T[3];
        MESSAGES-T[4] = temp-MSGS-T[4];
        MESSAGES-T[5] = temp-MSGS-T[5];
        MESSAGES-T[6] = temp-MSGS-T[6];
        MESSAGES-T[7] = temp-MSGS-T[7];
        MESSAGES-T[8] = temp-MSGS-T[8];
        MESSAGES-T[9] = temp-MSGS-T[9];
        MESSAGES-T[10] = temp-MSGS-T[10];
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Update-S;

    }
    IF action == "GoToSearchSurgery"
    {
        temp-MSGS-T[1] = MESSAGES-T[1];
        temp-MSGS-T[2] = MESSAGES-T[2];
        temp-MSGS-T[3] = MESSAGES-T[3];
        temp-MSGS-T[4] = MESSAGES-T[4];
        temp-MSGS-T[5] = MESSAGES-T[5];
        temp-MSGS-T[6] = MESSAGES-T[6];
        temp-MSGS-T[7] = MESSAGES-T[7];
        temp-MSGS-T[8] = MESSAGES-T[8];
        temp-MSGS-T[9] = MESSAGES-T[9];
        temp-MSGS-T[10] = MESSAGES-T[10];

        STEP SurgerySearch
        {
            USES PROCESS "DisSurgSearch";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # send values to the sub-flow for preservation
            # of data should the user cancel from that sub-flow

            "S" -> MIR-MEDIC-CD;
        }

        IF SRCH-LAST-ACTION == "ACTION_SELECT"
        {
            MIR-SURGY-MINR-CD-T[index] = SRCH-MEDC-ID;
            MIR-SURGY-MINR-DESC-T[index] = SRCH-MEDC-DESC-2-TXT;
            MIR-SURGY-MEDC-SUBTYP-CD-T[index] = SRCH-MEDC-SUBTYP-CD;

        }

      # PF13 - move array  
        MESSAGES-T[1] = temp-MSGS-T[1];
        MESSAGES-T[2] = temp-MSGS-T[2];
        MESSAGES-T[3] = temp-MSGS-T[3];
        MESSAGES-T[4] = temp-MSGS-T[4];
        MESSAGES-T[5] = temp-MSGS-T[5];
        MESSAGES-T[6] = temp-MSGS-T[6];
        MESSAGES-T[7] = temp-MSGS-T[7];
        MESSAGES-T[8] = temp-MSGS-T[8];
        MESSAGES-T[9] = temp-MSGS-T[9];
        MESSAGES-T[10] = temp-MSGS-T[10];
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Update-S;

    }

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF9252-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;


    STEP Confirm-S
    {
        USES S-STEP "BF9252NC-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        #       ACTION_BACK      for Cancel;
        #       ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_HistoricalClaimConfirm -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH Update-S;

    }


    # User confirmed the changes, update the host

    STEP UpdateHost-P
    {
        USES P-STEP "BF9252-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;



    # Display the output of the update process

    ButtonBar = "ButtonBarOKPrev";

    STEP Output-S
    {
        USES S-STEP "BF9250-O";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Update-S;

    }
}

