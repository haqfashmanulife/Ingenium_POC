# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A62Update.f                                                *
#*  Description: Death Claim Adjudicator Decision set Screen                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS      DEATH CLAIM ADJUDICATOR DECISION SCREEN                   *
#*  R15582  CTS      AUDIT LOG RELATED CHNAGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A60-I.s";
INCLUDE "BF9A62-I.s";
INCLUDE "BF9A60-P.p";
INCLUDE "BF9A62-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END


PROCESS BF9A62Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9A62Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Display the key entry screen

    STEP KeyFields-S
    {
        USES S-STEP "BF9A60-I";
    }

   # If the User clicks the cancel button
    IF action == "ACTION_BACK"
        EXIT;


   # Retrieve Death Claim Adjudicator Decision Inquiry information

    STEP Retrieve
    {
        USES P-STEP "BF9A60-P";
        "2" -> MIR-DV-PRCES-STAT-CD;

    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    ButtonBar = "ClmButtonBarAdjDecsnSum";


    # Display the Adjudicator Decision Input Screen
TEMP-POL-ID = MIR-POL-ID;
MIR-POL-ID = SUBSTRING (MIR-POL-ID,1,7);

    STEP Update-S
    {
        USES S-STEP "BF9A62-I";
    }
    
MIR-POL-ID = TEMP-POL-ID;

    # Perform the appropriate processing depending on which button
    # the user clicked

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        EXIT;
    }

    IF action == "GoToAutoDecisionSet"
    { 
        index=1;
        WHILE (index<50)
        {
          MIR-BNFT-DECID-CD-T [index] = MIR-AUTO-BNFT-DECID-CD;
          index = index + 1;
        }
        BRANCH Update-S;
    }
          
    IF action == "ACTION_EXIT"
        EXIT;

   IF action == "SelectItem1"
     {
        
        LSIR-RETURN-CD = "00";
        MESSAGES-T[0] = "";
        
             
       STEP CreateManlmod
       {
            USES PROCESS "BF9A64Manlmod";
            "SelectItem1" -> USER-SELECTION;
            MIR-PLAN-ID-T[index] -> MIR-PLAN-ID;
            "S" -> MIR-CLM-INSRD-CD;
            MIR-CVG-NUM-T[index] ->MIR-CVG-NUM;
   
        }
        
     }  
     
    IF action == "SelectItem2"
         {
            
            LSIR-RETURN-CD = "00";
            MESSAGES-T[0] = "";
            
                 
           STEP CreateManlmod2
           {
                USES PROCESS "BF9A64Manlmod";
                "SelectItem2" -> USER-SELECTION;
                MIR-OTHR-PLAN-ID-T[index] -> MIR-PLAN-ID;
                "O" -> MIR-CLM-INSRD-CD;
                MIR-OTHR-CVG-NUM-T[index] ->MIR-CVG-NUM;
                
       
            }
            
     }  
   
    IF action == "ACTION_UALL"
    {
        STEP UpdateAll
        {
            USES P-STEP "BF9A62-P";
            "A" -> MIR-FCN-UPDT-CD;
        }

    }
    IF action == "ACTION_UCLBN"
    {
        STEP UpdateCLBN
        {
            USES P-STEP "BF9A62-P";
            "D" -> MIR-FCN-UPDT-CD;
        }

    }
    IF action == "ACTION_UCRQT"
    {
        STEP UpdateCRQT
        {
            USES P-STEP "BF9A62-P";
            "R" -> MIR-FCN-UPDT-CD;
        }

    }

    IF action == "ACTION_CCRQT"
    {
        LSIR-RETURN-CD = "00";
        MESSAGES-T[0] = "";

        STEP CreateCRQT
        {
            USES PROCESS "BF9A61ReqirCre";
            "P" -> MIR-DTH-CLM-REQIR-OPT-CD;
            "01" -> MIR-CVG-NUM;
            "NTO" -> MIR-DTH-CRQT-STAT-CD;
        }
        BRANCH Retrieve;
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


    # Re-Retrieve Adjudicator Decision Summary information

    STEP Retrieve2
    {
        USES P-STEP "BF9A60-P";
    }

#123718 CHANGES BEGIN      

  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

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
      
    # Go back to the Adjudicator Decision Summary screen 
#123718 CHANGES BEGIN
#R15582 CHANGES BEGIN      

  
   #STEP AUTROutput
    #{
        #USES P-STEP "BF9G99-P";
    
    #SESSION.MIR-USER-ID -> MIR-USER-ID;
    #SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

    #MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    #}

    #IF LSIR-RETURN-CD != "00"
       #BRANCH Update-S;    
#R15582 CHANGES END       
#123718 CHANGES END
   
    BRANCH Update-S;
}

