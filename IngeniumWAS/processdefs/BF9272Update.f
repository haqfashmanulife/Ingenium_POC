# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9272Update.f                                                *
#*  Description: Adjudicator Decision Summary                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   INITIAL VERSION                                           *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*  MP302M  Aug/2016 Added the link to the Screen Survival Benefit / Deferral  *
#*                   Benefit Chargeback Details                                *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT
#*******************************************************************************

INCLUDE "BF9270-I.s";
INCLUDE "BF9272-I.s";
INCLUDE "BF9270-O.s";
INCLUDE "BF9270-P.p";
INCLUDE "BF9272-P.p";
#R15582 CHANGES START
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9272Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9272Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Display the key entry screen

    STEP KeyFields-S
    {
        USES S-STEP "BF9270-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Adjudicator Decision Summary information

    STEP Retrieve
    {
        USES P-STEP "BF9270-P";
        "U" -> MIR-FCN-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    ButtonBar = "ClmButtonBarAdjDecsnSum";


    # Display the Adjudicator Decision Summary screen

    WS-SRVBEN-CHRGBCK-AMT = MIR-SRVBEN-CHRGBCK-AMT;
    STEP Update-S
    {
        USES S-STEP "BF9272-I";
    }


    # Perform the appropriate processing depending on which button
    # the user clicked

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        EXIT;

    }
    IF action == "ACTION_EXIT"
        EXIT;

    IF action == "ACTION_UALL"
    {
        STEP UpdateAll
        {
            USES P-STEP "BF9272-P";
            "A" -> MIR-FCN-UPDT-CD;
            WS-SRVBEN-CHRGBCK-AMT -> MIR-SRVBEN-CHRGBCK-AMT;
        }

    }
    IF action == "ACTION_UCLBN"
    {
        STEP UpdateCLBN
        {
            USES P-STEP "BF9272-P";
            "D" -> MIR-FCN-UPDT-CD;
           WS-SRVBEN-CHRGBCK-AMT -> MIR-SRVBEN-CHRGBCK-AMT;
        }

    }
    MIR-SRVBEN-CHRGBCK-AMT = WS-SRVBEN-CHRGBCK-AMT;
    IF action == "ACTION_UCRQT"
    {
        STEP UpdateCRQT
        {
            USES P-STEP "BF9272-P";
            "R" -> MIR-FCN-UPDT-CD;
           WS-SRVBEN-CHRGBCK-AMT -> MIR-SRVBEN-CHRGBCK-AMT;
        }

    }
    IF action == "ACTION_CCRQT"
    {
        LSIR-RETURN-CD = "00";
        MESSAGES-T[0] = "";

        STEP CreateCRQT
        {
            USES PROCESS "BF9274Create";
            "C" -> MIR-CLM-REQIR-OPT-CD;
        }

    }
    IF action == "SelectItem"
    {
        STEP UpdateDetail
        {
            USES PROCESS "BF9273Update";
            MIR-POL-ID-T[index] -> MIR-POL-ID;
            MIR-CVG-NUM-T[index] -> MIR-CVG-NUM;
            MIR-PLAN-ID-T[index] -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID-T[index] -> MIR-BNFT-NM-ID;
            MIR-BNFT-STAT-CD-T[index] -> MIR-BNFT-STAT-CD;
            MIR-CVG-FACE-AMT-T[index] -> MIR-CVG-FACE-AMT;
            MIR-BNFT-PAYBL-AMT-T[index] -> MIR-BNFT-PAYBL-AMT;
            MIR-CLBN-FINAL-MAJ-CD-T[index] -> MIR-CLBN-FINAL-MAJ-CD;
        }

        BRANCH Retrieve;

    }

    # MP302M Changes Starts
    IF action == "GoToSrvbenChrgbckDet"
    {
        STEP SrvbenChrgbckDet
        {
            USES PROCESS "BF9D11SrvbChrbc";
            ATTRIBUTES
            {
                GetMessages = "YES";
            }
            MIR-POL-ID-T[1]        -> MIR-POL-ID;
        }
        BRANCH Retrieve;
    }
    # MP302M Changes Ends

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


    # Re-Retrieve Adjudicator Decision Summary information

    STEP Retrieve2
    {
        USES P-STEP "BF9270-P";
    }

#123718 CHANGES START        
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    }

    IF LSIR-RETURN-CD != "00"
          BRANCH Update-S;  
          
#123718 CHANGES END 


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

#123718 CHANGES START 
#R15582 CHANGES START        
  
   #STEP AUTROutput
    #{
        #USES P-STEP "BF9G99-P";
    
    #SESSION.MIR-USER-ID -> MIR-USER-ID;
    #SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    #MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    #}

    #IF LSIR-RETURN-CD != "00"
          #BRANCH Update-S;  
          
#R15582 CHANGES END
#123718 CHANGES END


    # Go back to the Adjudicator Decision Summary screen

    BRANCH Update-S;

}

