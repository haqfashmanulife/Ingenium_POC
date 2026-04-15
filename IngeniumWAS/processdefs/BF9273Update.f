# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9273Update.f                                                *
#*  Description: Adjudicator Decision Details                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   INITIAL VERSION                                           *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#* M242M1  CTS     CHANGES FOR ADD ADJUSTEMNET SCREEN-SURGERY BENEFIT          *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*******************************************************************************

INCLUDE "BF9273-I.s";
INCLUDE "BF9271-P.p";
    # CS0008 changes starts here
INCLUDE "BF9275-P.p";
    # CS0008 changes ends here
INCLUDE "BF9272-P.p";

PROCESS BF9273Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9272Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ClmButtonBarAdjDecsnDtl";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Retrieve Adjudicator Decision Details information

    STEP Retrieve
    {
        USES P-STEP "BF9271-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        EXIT;

    # CS0008 changes starts here

     STEP Retrieve1
     {
         USES P-STEP "BF9275-P";
     } 

     IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        EXIT;

    # CS0008 changes ends here

    # Display the Adjudicator Decision Detail screen

    STEP Update-S
    {
        USES S-STEP "BF9273-I";
    }


    # Perform the appropriate processing depending on which button
    # the user clicked

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        EXIT;

    }
    IF action == "ACTION_EXIT"
        TERMINATE;

    IF action == "ACTION_UCRQT"
    {
        STEP UpdateCRQT
        {
            USES P-STEP "BF9272-P";
            "R" -> MIR-FCN-UPDT-CD;
        }

    }
    IF action == "ACTION_CCRQT"
    {
        MESSAGES-T[0] = "";

        STEP CreateCRQT
        {
            USES PROCESS "BF9274Create";
            "C" -> MIR-CLM-REQIR-OPT-CD;
        }

    }
        #* CS0008 CHANGES STARTS HERE

    IF action == "ACTION_UPNPR"
    {
        STEP UpdateNPR
        {
            USES P-STEP "BF9272-P";            
            "B" -> MIR-FCN-UPDT-CD;
        }

    }
    
        #* CS0008 CHANGES ENDS HERE

    IF action == "ACTION_ADDA"
    {
        STEP AddAdj
        {
            USES PROCESS "ClmMaintainAdjExcl";
            "ADDA" -> USER-SELECTION;
            MIR-DTL-STRT-DT-T[index] -> MIR-DTL-STRT-DT;
            MIR-DTL-END-DT-T[index] -> MIR-DTL-END-DT;
            MIR-DTL-SEQ-NUM-T[index] -> MIR-DTL-SEQ-NUM;
            MIR-DTL-AGG-NUM-T[index] -> MIR-DTL-AGG-NUM;
        #* M242M1 CHANGES START
            MIR-DTL-SURG-CD-T[index] -> MIR-DTL-SURG-CD;
        #* M242M1 CHANGES END
        }

    }
    IF action == "ACTION_ADDE"
    {
        STEP AddExcl
        {
            USES PROCESS "ClmMaintainAdjExcl";
            "ADDE" -> USER-SELECTION;
            MIR-DTL-STRT-DT-T[index] -> MIR-DTL-STRT-DT;
            MIR-DTL-END-DT-T[index] -> MIR-DTL-END-DT;
            MIR-DTL-EXCL-QTY-T[index] -> MIR-DTL-EXCL-QTY;
            MIR-DTL-REASN-CD-T[index] -> MIR-DTL-REASN-CD;
            MIR-DTL-SEQ-NUM-T[index] -> MIR-DTL-SEQ-NUM;
        }

    }
    IF action == "ACTION_UPDT"
    {
        STEP UpdtAdjExcl
        {
            USES PROCESS "ClmMaintainAdjExcl";
            "UPDT" -> USER-SELECTION;
            MIR-DTL-STRT-DT-T[index] -> MIR-DTL-STRT-DT;
            MIR-DTL-END-DT-T[index] -> MIR-DTL-END-DT;
            MIR-DTL-EXCL-QTY-T[index] -> MIR-DTL-EXCL-QTY;
            MIR-DTL-REASN-CD-T[index] -> MIR-DTL-REASN-CD;
            MIR-DTL-SEQ-NUM-T[index] -> MIR-DTL-SEQ-NUM;
        }

    }
    IF action == "ACTION_DEL"
    {
        STEP DelAdjExcl
        {
            USES PROCESS "ClmMaintainAdjExcl";
            "DEL" -> USER-SELECTION;
            MIR-DTL-STRT-DT-T[index] -> MIR-DTL-STRT-DT;
            MIR-DTL-END-DT-T[index] -> MIR-DTL-END-DT;
            MIR-DTL-EXCL-QTY-T[index] -> MIR-DTL-EXCL-QTY;
            MIR-DTL-REASN-CD-T[index] -> MIR-DTL-REASN-CD;
            MIR-DTL-SEQ-NUM-T[index] -> MIR-DTL-SEQ-NUM;
        }

    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;



    # Save any output messages to a temporary location

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


    # Re-Retrieve Adjudicator Decision Details information

    STEP Retrieve2
    {
        USES P-STEP "BF9271-P";
    }
 
    # CS0008 changes starts here
    STEP Retrieve3
     {
         USES P-STEP "BF9275-P";
     }

    # CS0008 changes ends here

    # Show the messages from the update step
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


    # Go back to the Adjudicator Decision Details screen

    BRANCH Update-S;
}

