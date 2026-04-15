# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F99Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  105532  CTS      FIX DONE FOR CWA REFUND/REJECTION REQUEST CA SCREEN       *
#*                   PREVIOUS BUTTON FIX                                       *
#*  112059  CTS      CHANGES DONE FOR CA02CR                                   *
#*******************************************************************************

INCLUDE "BF9F99Key-I.s";
INCLUDE "BF9F99Pol-I.s";
INCLUDE "BF9F99Upt-I.s";
INCLUDE "BF9F99-P.p";
INCLUDE "BF9F99-O.s";

PROCESS BF9F99Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9F99Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Enter the key(s) for the value that you'd like to create

    STEP InputKey
    {
        USES S-STEP "BF9F99Key-I";
        STRINGTABLE.IDS_TITLE_BF9F99Input -> Title;
        
    }

    IF action == "ACTION_BACK"
        EXIT;
        
    MIR-DV-PRCES-STATE-CD = "1";
    
    # 105532 CHANGES STARTS
    # MIR-RECORD-CTR ="000"; 
      FLOW-PAGE = 1;
    # 105532 CHANGES ENDS
        
    # Retrieve the record     
    STEP Retrieve
    {
        USES P-STEP "BF9F99-P";
        
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH InputKey;

     STEP InputPol
     {
     USES S-STEP "BF9F99Pol-I";
     STRINGTABLE.IDS_TITLE_BF9F99List -> Title;
     "ButtonBarOkCancelBackMore" -> ButtonBar;
     }
     
     IF action == "ACTION_BACK"
        BRANCH InputKey;
     IF action == "ACTION_PREV"
     {
       MIR-DV-PRCES-STATE-CD = "1";
    # 105532 CHANGES STARTS
    #  MIR-RECORD-CTR-N = MIR-RECORD-CTR-N - 010 ;
    #  IF  MIR-RECORD-CTR-N < 0 
    #      MIR-RECORD-CTR-N = 0;
       FLOW-PAGE = FLOW-PAGE - 1;
       MIR-RECORD-CTR-N = SAVE-RECORD-CTR[FLOW-PAGE];
    # 105532 CHANGES ENDS
         BRANCH Retrieve;
     }
      
     IF action == "ACTION_MORE" 
     {
         MIR-DV-PRCES-STATE-CD = "1";
    # 105532 CHANGES STARTS
         FLOW-PAGE = FLOW-PAGE + 1;
         SAVE-RECORD-CTR[FLOW-PAGE] = MIR-RECORD-CTR-N;
    # 105532 CHANGES ENDS
         BRANCH Retrieve;
      }
    
     MIR-DV-PRCES-STATE-CD = "2";
     
     MIR-POL-ID = MIR-POL-ID-T[index];
     MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];

    STEP Update
    {
        USES P-STEP "BF9F99-P";
        
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH InputPol;


    # Display the INPUT of the update process

   STEP InputUpt
    {
        USES S-STEP "BF9F99Upt-I";
        STRINGTABLE.IDS_TITLE_BF9F99Update -> Title;
        "ButtonBarOKCancel" -> ButtonBar;
    }
    #112059 CAHNGES BEGINS
       IF  MIR-POL-BILL-TYP-CD == "C" || MIR-POL-MPREM-AMT == "0.00"
       {
                MIR-BNK-ID-1 = " ";
                MIR-BNK-BR-ID-1 = " ";
                MIR-BNK-NM-1 = " ";
                MIR-BNK-BR-NM-1 = " ";
       }
    #112059 CHANGES ENDS
    IF action == "ACTION_BACK"
        BRANCH InputPol;
        
    IF action == "ACTION_BNK_SRCH"
         {
                STEP ACTION_BNK_SRCH
                 {
                     USES PROCESS "BF9F96List";
                     ATTRIBUTES
                     {
                         GetMessages = "NO";
                     }
                     "" -> MIR-BNK-ID;
                     "" -> MIR-BNK-BR-ID;
                     "" -> MIR-BNK-NM;
                     "" -> MIR-BNK-BR-NM;
                 }
                 BRANCH InputUpt;
        } 
        
    MIR-DV-PRCES-STATE-CD = "3";
    
    # Retrieve the record 

    STEP Retrieve1
    {
        USES P-STEP "BF9F99-P";
        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH InputUpt;

   #Display the Output of the confirm process
     STEP Output
     {
     USES S-STEP "BF9F99-O";
     STRINGTABLE.IDS_TITLE_BF9F99Output -> Title;
     "ButtonBarApproveReverseCancel" -> ButtonBar;
     }
     
     IF action == "ACTION_BACK"
        BRANCH InputUpt;
     
     IF action == "ACTION_APPROVE"
        MIR-DV-PRCES-STATE-CD = "4";
      
     IF action == "ACTION_REVERSE"
        MIR-DV-PRCES-STATE-CD = "5";   
      
         STEP Retrieve2
         {
             USES P-STEP "BF9F99-P";
         }
         
     IF LSIR-RETURN-CD != "00"
        BRANCH  InputUpt;

    BRANCH InputKey;
 }



