#*******************************************************************************
#*  Component:   BF9D54List.f                                                  *
#*  Description: CURRENCY EXCHANGE RATE INQUIRE SCREEN                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O1  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9D54-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9D54-O.s";
INCLUDE "BF9D54-P.p";
INCLUDE "BF9D50Inquiry.f";
INCLUDE "BF9D52Update.f";
INCLUDE "BF9D53Delete.f";
INCLUDE "BF9D51Create.f";

PROCESS BF9D54List
{
    Title = STRINGTABLE.IDS_TITLE_BF9D54List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
 
     
    # Ask the user where they'd like to start the list
     
    STEP ListStart
    {
        USES S-STEP "BF9D54-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
   
    TRACE("Before P Step");
    STEP RetrieveList
    {
        USES P-STEP "BF9D54-P";
    }
       TRACE("After P Step NEw"+MIR-XCHNG-EFF-DT-T[2]);
    TRACE("Before P Step"+MIR-XCHNG-EFF-DT-T[1]);       
    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
    
    
        
    Title = STRINGTABLE.IDS_TITLE_BF9D54List;
    ButtonBar = "ButtonBarListsRUD";
    STEP DisplayList
    {
        USES S-STEP "BF9D54-O";
    }
       TRACE("After S Step");        
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
        

         MIR-XCHNG-EFF-DT         = MIR-XCHNG-EFF-DT-T[index];
       
   
    
    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9D50Inquiry";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
        
         # MIR-XCHNG-FROM-CRCY-CD = MIR-XCHNG-FROM-CRCY-CD-T[index];
         # MIR-XCHNG-TO-CRCY-CD   = MIR-XCHNG-TO-CRCY-CD-T[index];
         # MIR-XCHNG-EFF-DT       = MIR-XCHNG-EFF-DT-T[index];
        
            "FALSE" -> DisplayInput;
        }
        
        BRANCH RetrieveList;
    
    }
      
    # The user wants to update an item in the list
         
    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9D52Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
         # MIR-XCHNG-FROM-CRCY-CD = MIR-XCHNG-FROM-CRCY-CD-T[index];
 	 #  MIR-XCHNG-TO-CRCY-CD   = MIR-XCHNG-TO-CRCY-CD-T[index];
         #  MIR-XCHNG-EFF-DT         = MIR-XCHNG-EFF-DT-T[index]
            "FALSE" -> DisplayInput;
        }
     
        BRANCH RetrieveList;
  
    }
    # The user wants to delete an item in the list
    
    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9D53Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
       #   MIR-XCHNG-FROM-CRCY-CD = MIR-XCHNG-FROM-CRCY-CD-T[index];
  	#   MIR-XCHNG-TO-CRCY-CD   = MIR-XCHNG-TO-CRCY-CD-T[index];
       #   MIR-XCHNG-EFF-DT         = MIR-XCHNG-EFF-DT-T[index]
            "FALSE" -> DisplayInput;

        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_ADD"
    {
        STEP ACTION_CREATE
        {
            USES PROCESS "BF9D51Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
 
           "FALSE" -> DisplayInput;

        }

        BRANCH ListStart;

    }

}
