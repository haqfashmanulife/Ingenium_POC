# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF9F50Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  MP310B   CTS      CHANGES AS PER MP310B                                    *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************
INCLUDE "BF9F50-I.s";
INCLUDE "BF9F52-O.s";
INCLUDE "BF9F40Retrieve.f";
INCLUDE "BF9F50Pollist-I.s";
INCLUDE "BF9F50-P.p";
#  MP310B - CHANGES STARTS HERE
INCLUDE "BF9A24-O.s";
INCLUDE "BF9A24-P.p";
#  MP310B - CHANGES ENDS HERE
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9F50Retrieve
{

    # Title for the process

    VARIABLES
    {

        OUT action;
    }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

#  MP310B - CHANGES STARTS HERE
    FLOW-PAGE = 1;
    # Ask the user where they'd like to start the list

    MIR-COUNT-INIT = 0;
    IF DisplayInput == "FALSE"
    {
        BRANCH RetrieveList;
    }
#  MP310B - CHANGES ENDS HERE
    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9F50-I";
        STRINGTABLE.IDS_TITLE_BF9F50Input -> Title;
    }

    WS-INPUT-POL-ID = MIR-POL-ID;
    IF action == "ACTION_BACK"
        EXIT;
        
#  MP310B - CHANGES STARTS HERE
    STEP RetrieveList
    {
        USES P-STEP "BF9A24-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    Title = STRINGTABLE.IDS_TITLE_BF9F50Input;
    ButtonBar = "ButtonBarListsCRUD1";

    STEP DisplayList
    {
        USES S-STEP "BF9A24-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
       MIR-COUNT-INIT = FLOW-PAGE;
       FLOW-PAGE = FLOW-PAGE + 1;

       BRANCH RetrieveList;
     }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is
    # used here as an example only.

    MIR-POL-ID = MIR-POL-ID-T[index];
    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-USER-ID = MIR-USER-ID-T[index];
    MIR-APP-TYP-CD = MIR-APP-TYP-CD-T[index];
    MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];
    MIR-DV-PRCES-STATE-CD = 7;
    
#  MP310B - CHANGES ENDS HERE
        
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9F50-P";
    }
    
    WS-INPUT-POL-ID = MIR-POL-ID;
    WS-CLI-ID = MIR-CLI-ID;
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#23774A CHANGES BEGIN

        temp-DTL-INFO  = MIR-CLI-ID + " " + MIR-POL-ID;    

  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;        

#23774A CHANGES END

    MAX = 10;
    index5 = 1;
    #  Move policy details to WS Variable
    WHILE (index5 <= MAX)
    {
       
        WS-PDTL-POL-ID-T[index5] = MIR-PDTL-POL-ID-T[index5];
        WS-PDTL-POL-OWNER-T[index5] = MIR-PDTL-POL-OWNER-T[index5];
        WS-STCKR-ID-T[index5] = MIR-STCKR-ID-T[index5];
        WS-AMEX-SEQ-NUM-T[index5] = MIR-AMEX-SEQ-NUM-T[index5];
        index5 = index5+1;
    }
       
    WS-CLI-ID = MIR-CLI-ID;
    WS-DV-INSRD-CLI-NM = MIR-CLI-KANA-FULL-NM;

    ButtonBar = "ButtonBarOkCancelUWINQ";
    STEP Output
    {
        USES S-STEP "BF9F52-O";
        STRINGTABLE.IDS_TITLE_BF9F50Input -> Title;
    }
#  MP310B - CHANGES STARTS HERE
#   IF action == "ACTION_BACK"
#       EXIT; 
        IF action == "ACTION_BACK"
        {  
            MIR-POL-ID = WS-INPUT-POL-ID;
            ButtonBar = "ButtonBarListsCRUD1";
            MIR-USER-ID =" ";
            MIR-APP-TYP-CD = " ";
            MIR-SEQ-NUM = " ";            
            BRANCH RetrieveList;
        }
#  MP310B - CHANGES ENDS HERE
    IF action == "ACTION_LINCINQUIRE"
    {

        ButtonBar = "ButtonBarOKCancel";
        STEP LINCINPUT
        {
            USES S-STEP "BF9F50Pollist-I";
            STRINGTABLE.IDS_TITLE_BF9F50Pollist -> Title;
        }

        IF action == "ACTION_BACK"
        {  
            MIR-POL-ID = WS-INPUT-POL-ID;
            BRANCH Retrieve;
        }
        
        MIR-POL-ID = WS-PDTL-POL-ID-T[index];
        MIR-CLI-ID = WS-CLI-ID;
        
        STEP ACTION_LINCINQUIRE
         {
             USES PROCESS "BF9F40Retrieve";
             ATTRIBUTES
              {
                 GetMessages = "NO";
              }
                  
             "FALSE" -> DisplayInput;
          }
          IF LSIR-RETURN-CD != "00"
          BRANCH LINCINPUT;          
          MIR-POL-ID = WS-INPUT-POL-ID;
          BRANCH Retrieve;         
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Output;
    
    IF action == "ACTION_NEXT"
    EXIT;
}

