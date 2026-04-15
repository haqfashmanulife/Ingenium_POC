#*******************************************************************************
#*  Component:   BF9C94List.f                                                  *
#*  Description: Future request Table(FTRQ) List Process                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*                                                                             *
#*  MP142F  CTS      As Survivorship Benefit is included in the system         *  
#*                   as another Future Dated Activity,two more flow files will *
#*                   be called from this flow file depending on the future     *
#*                   activity type.If future activity ype is "Billing Change"  *
#*                   t then "BF9C94BC.f" will be called and if future activity *  
#*                   type is "Survivorship Benefit" then "BF9C94SB.f" will be  * 
#*                   called. For this reason few parts of the code are 	       *
#*                   commented.                                                *
#*  Q07032  CTS      MP142F-CHANGES TO RETURN BACK TO 1ST LIST SCREEN FOR SAME *
#*                   ACTIVITY TYPE                                             *
#*  Q07069  CTS      MP142F- CHANGES TO DISPLAY BLANK SCREEN ON CLICKING       *
#*                   CANCEL BUTTON                                             *
#*  Q07081  CTS      MP142F-Displaying 1st list screen back without any message*
#*                   after clicking cancel button on the 2nd list screen       *
# *  MP142G  CTS     Changes for new activity type sundry amount change        *
# *  M142U2  CTS      Rider Switch Enhancements                                *
#*   UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                 *
#*  UYS025  CTS      Future dated advance payment List                         *
#*  UY3066  CTS      CHANGES FOR SAVING RIDER                                  *
#*   S15287  CTS      Kata Change                                              *
#*  UY3094  CTS      CHANGES FOR TERM TERM ADJUSTMENT PROCESSING               *
#*  UY3049  CTS      Annuity Transition Processing stream 3                    *
#*  UY3048  CTS      CHANGES FOR MATURITY STREAM 3                             *
#*  UC3120  CTS      CHANGES FOR CR120-FUTURE DATED ACTIVITY SCREEN            *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9C94-I.s";

# Change this to the P that retrieves the list

#MP142F CHANGES STARTS

INCLUDE "BF9C94BC.f";
INCLUDE "BF9C94SB.f";
#MP142G CHANGES STARTS
INCLUDE "BF9C94SC.f";
#MP142G CHANGES ENDS
#INCLUDE "BF9C94-O.s";
#INCLUDE "BF9C94-P.p";
#INCLUDE "BF9C90Retrieve.f";
#INCLUDE "BF9C91Create.f";
#INCLUDE "BF9C92Update.f";
#INCLUDE "BF9C93Delete.f";
#INCLUDE "BF9C92UpdateList.f";

#MP142F CHANGES ENDS
#M142U2 CHANGES STARTS
INCLUDE "BF9C94CR.f";
#M142U2 CHANGES ENDS
#UYS025 CHANGES STARTS
INCLUDE "BF9C94AP.f";
#UYS025 CHANGES ENDS
#UY3064 CHANGES STARTS
INCLUDE "BF9C94WL.f";
#UY3064 CHANGES ENDS
#UY3066 CHANGES STARTS
INCLUDE "BF9C94SM.f";
#UY3066 CHANGES ENDS
#UY3094 CHANGES STARTS
INCLUDE "BF9C94TI.f";
#UY3094 CHANGES ENDS
#S15287 CHANGES STARTS
INCLUDE "BF9C94KC.f";
#S15287 CHANGES ENDS
#UY3049 CHANGES STARTS
INCLUDE "BF9C94AR.f";
#UY3049 CHANGES ENDS
#UY3048 CHANGES STARTS
INCLUDE "BF9C94MP.f";
INCLUDE "BF9C94MD.f";
#UY3048 CHANGES ENDS
#UC3120 CHANGES STARTS
INCLUDE "BF9C94DP.f";
INCLUDE "BF9C94HC.f";
#UC3120 CHANGES ENDS
PROCESS BF9C94List
{
    Title = STRINGTABLE.IDS_TITLE_BF9C94List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9C94-I";
#        "BC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
         " " -> MIR-FTRQ-PREV-UPDT-DT;
         " " -> MIR-POL-ID;
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

    #UY3004 CHANGES ENDS
        
#MP142F CHANGES STARTS        
#            STEP RetrieveList
#	    {
#	        USES P-STEP "BF9C94-P";
#	    }
#	
#	    Title = STRINGTABLE.IDS_TITLE_BF9C94List;
#	
#	    IF LSIR-RETURN-CD != "00"
#	        BRANCH ListStart;
#	
#	
#	    ButtonBar = "ButtonBarListsCRUD";
#	
#	    STEP DisplayList
#	    {
#	        USES S-STEP "BF9C94-O";
#	    }
#	
#	    IF action == "ACTION_BACK"
#	        EXIT;
#	
#	
#	    # If the user has pressed the more button, go back and reget the list
#	
#	    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
#	        BRANCH RetrieveList;
#	
#	
#	    # The user has indicated that they want to add an element to the list
#	
#	    IF action == "ACTION_ADD"
#	    {
#	        STEP ACTION_ADD
#	        {
#	            USES PROCESS "BF9C91Create";
#	            ATTRIBUTES
#	            {
#	                GetMessages = "NO";
#	                SendMessages = "NO";
#	            }
#	
#	            " " -> MIR-PBRQ-EFF-DT;
#	            " " -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#	            " " -> MIR-POL-ID-BASE;
#	            " " -> MIR-POL-ID-SFX;
#	            "FALSE" -> DisplayInput;
#	        }
#	
#	        BRANCH RetrieveList;
#	
#	    }
#	
#	    # The user hasn't selected an item to work with.  Go back.
#	
#	    IF index == "0"
#	        BRANCH DisplayList;
#	
#	
#	
#	    # Build the key ID from the row that the user selected
#	    # You will have to build all of the key variables that will be required
#	    # by the following steps and pass them to each step. 
#	    
#	    MIR-PBRQ-EFF-DT = MIR-PBRQ-EFF-DT-T[index];
#	    MIR-DV-POL-FUT-ACTV-TYP-CD = MIR-DV-POL-FUT-ACTV-TYP-CD-T[index];
#	
#	    # action will be "SelectItem" if the user clicks on a hyperlink in the
#	    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.
#	
#	    IF action == "SelectItem" || action == "ACTION_INQUIRE"
#	    {
#	        STEP SelectItem
#	        {
#	            USES PROCESS "BF9C90Retrieve";
#	            ATTRIBUTES
#	            {
#	                Explicit;
#	                GetMessages = "NO";
#	            }
#	
#	            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
#	            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#	            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
#	            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
#	            "FALSE" -> DisplayInput;
#	        }
#	
#	        BRANCH RetrieveList;
#	
#	    }
#	
#	    # The user wants to update an item in the list
#	
#	    IF action == "ACTION_UPDATE"
#	    {
#	    STEP Main
#	    {
#	        USES PROCESS "BF9C92UpdateList";
#	        ATTRIBUTES
#	        {
#	            GetMessages = "NO";
#	        }
#	
#	        STRINGTABLE.IDS_TITLE_BF9C92UpdateList -> Title;
#	        MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
#	        MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#	        "FALSE" -> DisplayInput;
#	    }
#	
#	        BRANCH RetrieveList;
#	
#	    }
#	
#	    # The user wants to delete an item in the list
#	
#	    IF action == "ACTION_DELETE"
#	    {
#	        STEP ACTION_DELETE
#	        {
#	            USES PROCESS "BF9C93Delete";
#	            ATTRIBUTES
#	            {
#	                Explicit;
#	                GetMessages = "NO";
#	            }
#	
#	            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
#	            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#	            "FALSE" -> DisplayInput;
#	        }
#	
#	        BRANCH RetrieveList;
#	
#    }
        
    
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "BC"
    {
        STEP CALLBC
        {
               USES PROCESS "BF9C94BC";
          
        }                   
      
     }
     
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SB"
    {
	 
        STEP CALLSB
        {
               USES PROCESS "BF9C94SB";

        }                   
	           
     }
#UY3064 CHANGES START HERE
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "WL"
        {
    	 
            STEP CALLWL
            {
                   USES PROCESS "BF9C94WL";
    
            }                   
    	           
     }
#UY3064 CHANGES END HERE
     
#MP142G CHANGES STARTS
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SC"
    {

        STEP CALLSC
        {
               USES PROCESS "BF9C94SC";

        }                   
         
     }
#MP142G CHANGES ENDS
#M142U2 CHANGES STARTS
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "CV"
    {
	STEP CALLCR
        {
                USES PROCESS "BF9C94CR";
        } 
    }
   
#UYS025 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AP"
   {
       STEP CALLAP
       {
              USES PROCESS "BF9C94AP";
       
       } 
   }
#UYS025 CHANGES ENDS

#UY3066 CHANGES STARTS HERE
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SM"
    { 
        STEP CALLSM
        {
              USES PROCESS "BF9C94SM";
        }                         
     }
#UY3066 CHANGES ENDS HERE

#UY3094 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "TI"
   {
        STEP CALLTI
        {
               USES PROCESS "BF9C94TI";
        }                   
   }
#UY3094 CHANGES ENDS HERE 

#S15287 KATA CHANGES START	 
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "KC"
	{
       STEP CALLKC
       {
              USES PROCESS "BF9C94KC";
       
       } 
   }	
#S15287 KATA CHANGES END	
#M142U2 CHANGES ENDS

#UY3049 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AR"
   {
        STEP CALLAR
        {
               USES PROCESS "BF9C94AR";
        }                   
   }
#UY3049 CHANGES ENDS HERE 
#UY3048 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MP"
   {
        STEP CALLMP
        {
               USES PROCESS "BF9C94MP";
        }                   
   }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MD"
   {
        STEP CALLMD
        {
               USES PROCESS "BF9C94MD";
        }                   
   }
#UY3048 CHANGES ENDS HERE
#UC3120 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "DP"
      {  
    
          STEP CALLDP
          {
                 USES PROCESS "BF9C94DP";
   
          }                   
              
    }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "HC"
      {  
    
          STEP CALLHC
          {
                 USES PROCESS "BF9C94HC";
   
          }                   
              
    }
#UC3120 CHANGES ENDS HERE 	         
    BRANCH ListStart;
#MP142F CHANGES ENDS


}
