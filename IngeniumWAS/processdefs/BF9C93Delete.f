#*  Component:   BF9C93Delete.f                                          *
#*  Description: Future request Table(FTRQ) Delete Process                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      As Survivorship Benefit is included in the system         *  
#*                   as another Future Dated Activity,two more flow files will *
#*                   be called from this flow file depending on the future     *
#*                   activity type.If future activity ype is "Billing Change"  *
#*                   t then "BF9C93BC.f" will be called and if future activity *  
#*                   type is "Survivorship Benefit" then "BF9C93SB.f" will be  * 
#*                   called. For this reason few parts of the code are 	       *
#*                   commented.                                                *
# * MP142G  CTS      Changes for new activity type sundry amount change        *
# *  M142U2  CTS      Rider Switch Enhancements                                *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS025  CTS      Future dated advance payment activity delete changes      *
#*  UY3064  CTS      Whole Life Premium Payment Completion                     *
#*  UY3066  CTS      CHANGES FOR SAVING RIDER                                  *
#*  S15287  CTS      JIRA FIX FOR KATA CHANGE                                  *
#*  UY3094  CTS      CHANGES FOR TERM TERM ADJUSTMENT PROCESSING               *
#*  UY3049  CTS      Annuity Request Reception Process                         *
#*  UY3048  CTS      CHANGES FOR MATURITY STREAM 3                             *
#*  U3C120  CTS      CHANGES FOR CR120-FUTURE DATED ACTIVITY SCREEN            *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step
INCLUDE "BF9C90-I.s";

#MP142F CHANGES STARTS
# Retrieve flow for Billing change
INCLUDE "BF9C93BC.f";

# Retrieve flow for Survivorship Benefit
INCLUDE "BF9C93SB.f";
#MP142G CHANGES STARTS
INCLUDE "BF9C93SC.f";
#MP142G CHANGES ENDS
#M142U2 CHANGES STARTS
INCLUDE "BF9C93CR.f";
#M142U2 CHANGES ENDS
#UYS025 CHANGES STARTS
INCLUDE "BF9C93AP.f";
#UYS025 CHANGES ENDS
#UY3064 CHANGES STARTS
INCLUDE "BF9C93WL.f";
#UY3064 CHANGES ENDS
#UY3066 CHANGES STARTS
INCLUDE "BF9C93SM.f";
#UY3066 CHANGES ENDS
#S15287 CHANGES STARTS
INCLUDE "BF9C93KC.f";
#S15287 CHANGES ENDS
#UY3094 CHANGES STARTS
INCLUDE "BF9C93TI.f";
#UY3094 CHANGES ENDS
#UY3049 CHANGES STARTS
INCLUDE "BF9C93AR.f";
#UY3049 CHANGES ENDS
#UY3048 CHANGES STARTS
INCLUDE "BF9C93MP.f";
INCLUDE "BF9C93MD.f";
#UY3048 CHANGES ENDS
#U3C120 CHANGES STARTS
INCLUDE "BF9C93DP.f";
INCLUDE "BF9C93HC.f";
#UC3120 CHANGES ENDS
## Retrieve P Step
#
#INCLUDE "BF9C90-I.s";
#
## Retrieve Output S Step (Verify)
#
#INCLUDE "BF9C90-P.p";
#
## Delete P Step
#
#INCLUDE "BF9C90-O.s";
#
## Delete Output S Step
#
#INCLUDE "BF9C93-P.p";
#INCLUDE "BF9C93-O.s";
#
## Parameterized Flow
#
#INCLUDE "GenDelete.f";
#MP142F CHANGES ENDS

PROCESS BF9C93Delete
{
#MP142F CHANGES STARTS
    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C93Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


#    STEP Main
#    {
#        USES PROCESS "GenDelete";
#        STRINGTABLE.IDS_TITLE_BF9C93Delete -> Title;
#
#        # Retrieve Input S Step
#
#        "BF9C90-I" -> InputS;
#
#        # ENSURE THE DRIVERS BELOW ARE CORRECT
#        # Retrieve Input P Step
#
#        "BF9C90-P" -> RetrieveP;
#
#        # Retrieve Output S Step
#
#        "BF9C90-O" -> ConfirmS;
#        
#
#        # Delete P Step
#
#        "BF9C93-P" -> DeleteP;
#
#        # Delete Output S Step
#
#        "BF9C93-O" -> OutputS;
#    }
#
#
#    # Return To Main Menu
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#    # Return To List
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#
#    BRANCH Main;
    

    STEP Input
    {
        USES S-STEP "BF9C90-I";

    }


    # Return to Previous Step if Cancelling Out

   IF action == "ACTION_BACK"
        EXIT;
        
# UY3004 CHANGES START
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
        BRANCH Input;
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

# UY3004 CHANGES END 

   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "BC"
   {
       STEP CALLBC
       {
              USES PROCESS "BF9C93BC";
        
       }                   
     
    }
    
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SB"
   {  
 
       STEP CALLSB
       {
              USES PROCESS "BF9C93SB";

       }                   
           
    }
#UY3064 CHANGES START HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "WL"
      {  
    
          STEP CALLWL
          {
                 USES PROCESS "BF9C93WL";
   
          }                   
              
    }
#UY3064 CHANGES END HERE

#MP142G CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SC"
   {  
 
       STEP CALLSC
       {
              USES PROCESS "BF9C93SC";

       }                   
           
    }
#MP142G CHANGES ENDS
    
#M142U2 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "CV"
   {  
 
       STEP CALLCR
       {
              USES PROCESS "BF9C93CR";

       }                   
           
   }
#M142U2 CHANGES ENDS

#UYS025 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AP"
   {
       STEP CALLAP
       {
              USES PROCESS "BF9C93AP";
       
       } 
   }
#UYS025 CHANGES ENDS

#UY3066 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SM"
      {  
    
          STEP CALLSM
          {
                 USES PROCESS "BF9C93SM";
   
          }                   
              
    }
#UY3066 CHANGES ENDS HERE

#S15287 KATA CHANGES START	 
    IF MIR-DV-POL-FUT-ACTV-TYP-CD == "KC"
	{
       STEP CALLKC
       {
              USES PROCESS "BF9C93KC";
       
       } 
   }
#UY3094 CHANGES START HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "TI"
      {  
    
          STEP CALLWL
          {
                 USES PROCESS "BF9C93TI";
   
          }                   
              
    }
#UY3094 CHANGES END HERE   
#S15287 KATA CHANGES END	         
#UY3049 CHANGES START HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AR"
      {  
    
          STEP CALLAR
          {
                 USES PROCESS "BF9C93AR";
   
          }                   
              
    }
#UY3049 CHANGES END HERE 	         
#UY3048 CHANGES START HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MP"
      {  
    
          STEP CALLMP
          {
                 USES PROCESS "BF9C93MP";
   
          }                   
              
    }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MD"
      {  
    
          STEP CALLMD
          {
                 USES PROCESS "BF9C93MD";
   
          }                   
              
    }
#UY3048 CHANGES END HERE
#U3C120 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "DP"
      {  
    
          STEP CALLDP
          {
                 USES PROCESS "BF9C93DP";
   
          }                   
              
    }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "HC"
      {  
    
          STEP CALLHC
          {
                 USES PROCESS "BF9C93HC";
   
          }                   
              
    }
#U3C120 CHANGES ENDS HERE 	         
  BRANCH Input;
#MP142F CHANGES ENDS  
  }