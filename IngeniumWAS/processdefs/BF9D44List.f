#*******************************************************************************
#*  Component:   BF9D44List.f                                                  *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN              *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9D44-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9D44-O.s";
INCLUDE "BF9D44-P.p";
INCLUDE "BF9D40Retrieve.f";
INCLUDE "BF9D42Update.f";
INCLUDE "BF9D43Delete.f";


PROCESS BF9D44List
{
    Title = STRINGTABLE.IDS_TITLE_BF9D44List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
 
     
    # Ask the user where they'd like to start the list
     
    STEP ListStart
    {
        USES S-STEP "BF9D44-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START
    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

#UY3004 CHANGES END
		
    STEP RetrieveList
    {
        USES P-STEP "BF9D44-P";
    }
   
    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
       
        
    Title = STRINGTABLE.IDS_TITLE_BF9D44List;
    ButtonBar = "ButtonBarListsRUD";
    STEP DisplayList
    {
        USES S-STEP "BF9D44-O";
    }
        
    IF action == "ACTION_BACK"
        EXIT;
   
     
    # If the user has pressed the more button, go back and reget the list
    
    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;
        
    # action will be "SelectItem" if the user clicks on a checkbox  in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.
    
       # The user hasn't selected an item to work with.  Go back.
         
         IF index == "0"
            BRANCH DisplayList;
         
       
        
        # Build the key ID from the row that the user selected
        # You will have to build all of the key variables that will be required
        # by the following steps and pass them to each step. 
        
        MIR-POL-ID-BASE         = MIR-POL-ID-BASE;
        MIR-TRAD-SO-JRNL-DT     = MIR-TRAD-SO-JRNL-DT-T[index];
        MIR-SEQ-NUM  = MIR-SEQ-NUM-T[index];
       
   
    
    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9D40Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
        
            MIR-POL-ID-BASE         -> MIR-POL-ID-BASE;
            MIR-TRAD-SO-JRNL-DT     -> MIR-TRAD-SO-JRNL-DT;
            MIR-SEQ-NUM             -> MIR-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }
        
        BRANCH RetrieveList;
    
    }
       
    
      
    # The user wants to update an item in the list
         
    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9D42Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
            MIR-POL-ID-BASE         -> MIR-POL-ID-BASE;
            MIR-TRAD-SO-JRNL-DT -> MIR-TRAD-SO-JRNL-DT;
            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }
     
        BRANCH RetrieveList;
  
    }
      
    # The user wants to delete an item in the list
    
    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9D43Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
            MIR-POL-ID-BASE         -> MIR-POL-ID-BASE;
            MIR-TRAD-SO-JRNL-DT -> MIR-TRAD-SO-JRNL-DT;
            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            "FALSE" -> DisplayInput;

        }

        BRANCH RetrieveList;

    }
}

