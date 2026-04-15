# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9252Update.f                                                *
#*  Description:   Master Medical Claim Update                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*  EN0395  CTS      11-4 TASK (ADD THE QUESTIONS BUTTON BAR)                  *
#*  AFF027  CTS      CHANGES FOR INPUT DISPLAY                                 *
#*                                                                             *
#*  M280P2  CTS      CHANGES DONE FOR ARM III                                  *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9250-I.s";
INCLUDE "BF9252AD-I.s";
INCLUDE "BF9252NB-I.s";
INCLUDE "BF9250-O.s";
INCLUDE "BF9250-P.p";
INCLUDE "BF9252-P.p";
INCLUDE "DisSurgSearch.f";
#* EN0395 CHANGES START
INCLUDE "BF9002Update.f";
#* EN0395 CHANGES END
#R15582 CHANGES START
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9252Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9252Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9250-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Claim Details                

    STEP Retrieve
    {
        USES P-STEP "BF9250-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;



    # Default update non-benift data only...  

    UpdatePrcesI = "BF9252NB-I";


    # If the claim is still "Open" or no payments made yet, allow 
    # all data to be updated...

    IF MIR-CLMA-CLM-STAT-CD == "O" || MIR-CLMA-CLM-STAT-CD == "NERF" || MIR-CLMA-CLM-STAT-CD == "NERN" || MIR-CLMA-CLM-STAT-CD == "NECF" || MIR-CLMA-CLM-STAT-CD == "NECN" || MIR-CLMA-CLM-STAT-CD == "NCRF" || MIR-CLMA-CLM-STAT-CD == "NCRN" || MIR-CLMA-CLM-STAT-CD == "NCCF" || MIR-CLMA-CLM-STAT-CD == "NCCN"
    {
        UpdatePrcesI = "BF9252AD-I";

    }

    STEP Update-S
    {
        USES S-STEP UpdatePrcesI;
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
#M280P2 CHANGES STARTS HERE
    IF action == "GoToSearchAssocDisease"
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

        STEP AssocDisSearch
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
            MIR-ASSOC-DIS-MAJ-CD-T[index] = SRCH-GRP-MEDC-ID;
            MIR-ASSOC-DIS-MINR-CD-T[index] = SRCH-MEDC-ID;
            MIR-ASSOC-DIS-MINR-DESC-TXT-T[index] = SRCH-MEDC-DESC-2-TXT;

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
#M280P2 CHANGES ENDS HERE       
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
        MESSAGES-T[0] = "";

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
    IF action == "GoToListPayee"
    {
        STEP PayeeList
        {
            USES PROCESS "ClmPayeeList";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # Send Master Claim ID.

            MIR-CLM-ID -> MIR-CLM-ID;
        }

        BRANCH Update-S;

    }


    # Update the Claim                           

    STEP UpdateHost-P
    {
        USES P-STEP "BF9252-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;
        
#23774A CHANGES START
 
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    "C" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
          BRANCH Update-S;
                    
#23774A CHANGES END

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
    
#* EN0395 CHANGES START

#EN0395  ButtonBar = "ButtonBarOK";
    ButtonBar = "ButtonBarOKQuestions";

#* EN0395 CHANGES END

    # Display the output of the update process

    STEP Getit
    {
        USES P-STEP "BF9250-P";
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

    STEP Output
    {
        USES S-STEP "BF9250-O";
    }


#* EN0395 CHANGES START

    IF action == "ACTION_QUESTIONS"
    {
       LSIR-RETURN-CD = "00";
       MESSAGES-T[0] = "";
      
       STEP Questions
       {
           USES PROCESS "BF9002Update"; 
#AFF027 CHANGES START
           "FALSE" -> DisplayInput; 
#AFF027 CHANGES END
       }

        BRANCH Getit;
    }

#* EN0395 CHANGES END
  
    # Go and ask for another Claim to update

      MESSAGES-T[0] = "";
      ButtonBar = "ButtonBarOKCancel";

#123718 CHANGES BEGIN
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
#123718 CHANGES END 

#23774A CHANGES START
#R15582 CHANGES START        
#  
#   STEP AUTROutput
#    {
#        USES P-STEP "BF9G99-P";
#    
#    SESSION.MIR-USER-ID -> MIR-USER-ID;
#    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
#
#    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
#    
#    }
#
#    IF LSIR-RETURN-CD != "00"
#          BRANCH Output;
#                    
#R15582 CHANGES END
#23774A CHANGES END
#123718 CHANGES BEGIN
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
#123718 CHANGES END
 
      BRANCH KeyFields-S;

}

