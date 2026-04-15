# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A82Update.f                                                *
#*  Description: Death Master Claim Payment                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*  Q52972  CTS      ADDED JPY BENEFIT INDICATOR                               *
#*  Q57608  CTS      ADDED MRF INDICATOR                                       *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                   *
#*  R15582  CTS      AUDIT LOG RELATED  CHANGES                                *         
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9A80-I.s";
INCLUDE "BF9A82-I.s";
INCLUDE "BF9A80-O.s";
INCLUDE "BF9A80-P.p";
INCLUDE "BF9A82-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9A82Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9A82Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9A80-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Claim Details  
    # Uses PRCES-STATE-CD to indicate it is being called
    # as part of the payment flow...

    STEP Retrieve
    {
        USES P-STEP "BF9A80-P";
        "P" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    ButtonBar = "ButtonBarPayeeListOkCan";
    STEP Update-S
    {
        USES S-STEP "BF9A82-I";
    }

    MIR-DV-PRCES-STATE-CD = " ";
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";       
        BRANCH KeyFields-S;

    }
   IF action == "ACTION_PAYEELIST"
       {
           STEP PayeeList
           {
               USES PROCESS "DthPayee";
               
               ATTRIBUTES
               {
                   GetMessages = "NO";
                
               }
               
   
               # Send Master Claim ID.
                MIR-CLM-ID -> MIR-CLM-ID;
                MIR-PAYO-JPY-BNFT-CD -> MIR-PAYO-JPY-BNFT-CD;                
             MIR-PREV-PAYO-JPY-BNFT-CD -> MIR-PREV-PAYO-JPY-BNFT-CD; 
             #Q57608 STARTS HERE
                MIR-MRF-IND -> MIR-MRF-IND;
                MIR-PREV-MRF-IND -> MIR-PREV-MRF-IND;
             #Q57608 ENDS HERE
             
             #M271A3 STARTS HERE
                MIR-MRF-2-IND -> MIR-MRF-2-IND;
                MIR-PREV-MRF-2-IND -> MIR-PREV-MRF-2-IND;
             #M271A3 ENDS HERE
             
          } 
                    
            BRANCH Update-S;
        }    
       

    # Update the Claim                           

    STEP UpdateHost-P
    {
        USES P-STEP "BF9A82-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;



    # Save any warnings to display on inquiry screen    

    temp-MSGS-T = MESSAGES-T;
    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Getit
    {
        USES P-STEP "BF9A80-P";
    }


    # Restore any warnings    

    MESSAGES-T = temp-MSGS-T;

    STEP Output
    {
        USES S-STEP "BF9A80-O";
    }
    
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
#R15582 CHANGES BEGIN

  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
#23774A CHANGES BEGIN
   "C" -> MIR-LOG-LEVL-CD;    
#23774A CHANGES BEGIN    
    }

    IF LSIR-RETURN-CD != "00"
#23774A CHANGES BEGIN
#      BRANCH output: 
       BRANCH Update-S;
#23774A CHANGES END
#R15582 CHANGES END       
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

}

