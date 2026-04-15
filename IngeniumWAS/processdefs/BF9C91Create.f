# *******************************************************************************
# *  Component:   BF9C91Create.f                                                *
# *  Description: Future request Table(FTRQ) Create Process                     *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
# *  M117PB  CTS      Intial Version                                            *
# *  Q01729  CTS      M117PB -Changes to Dispaly Activity status as pending in  *
# *  Q01729           Edit Screen of Create process                             *
# *  MP142F  CTS      As Survivorship Benefit is included in the system         *  
# *                   as another Future Dated Activity,two more flow files will *
# *                   be called from this flow file depending on the future     *
# *                   activity type.If future activity ype is "Billing Change"  *
# *                   t then "BF9C91BC.f" will be called and if future activity *  
# *                   type is "Survivorship Benefit" then "BF9C91SB.f" will be  * 
# *                   called. For this reason few parts of the code are 	*
# *                   commented.                                                *
# *  MP142G  CTS      Changes for new activity type sundry amount change        *
# *  M142U2  CTS      Rider Switch Enhancements                                 *
# *  Q16040  CTS      M142U2- Changes to clear the message array                *
# *  UYS025  CTS      Future dated advance payment activity create changes      *
# *  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
# *  UY3064  CTS      Whole Life Premium Payment Completion                     *
# *  UY3066  CTS      CHANGES FOR SAVING RIDER                                  *
# *  UY3095  CTS      CHANGES FOR FAMILY KATA CHANGE                            *
# *  UY3094  CTS      CHANGES FOR TERM TERM ADJUSTMENT PROCESSING               *
# *  UY3049 CTS       ANNUITY TRANSITION PROCESSING STREAM 3                    *
# *  UY3048  CTS      CHANGES FOR MATURITY STREAM 3                             *
# *  U3C120  CTS      CHANGES FOR CR120-FUTURE DATED ACTIVITY SCREEN            *
# *******************************************************************************
#MP142F CHANGES STARTS

INCLUDE "BF9C91SB.f";
INCLUDE "BF9C91BC.f";
#MP142G CHANGES STARTS
INCLUDE "BF9C91SC.f";
#MP142G CHANGES ENDS
#MP142F CHANGES ENDS
#M142U2 CHANGES STARTS
INCLUDE "BF9C91CR.f";
#M142U2 CHANGES ENDS
#UYS025 CHANGES STARTS
INCLUDE "BF9C91AP.f";
#UYS025 CHANGES ENDS
#UY3064 CHANGES STARTS
INCLUDE "BF9C91WL.f";
#UY3064 CHANGES ENDS
#UY3066 CHANGES STARTS
INCLUDE "BF9C91SM.f";
#UY3066 CHANGES ENDS
#UY3095 CHANGES STARTS
INCLUDE "BF9C91KC.f";
#UY3095 CHANGES ENDS
#UY3094 CHANGES STARTS
INCLUDE "BF9C91TI.f";
#UY3094 CHANGES ENDS
#UY3049 CHANGES STARTS
INCLUDE "BF9C91AR.f";
#UY3049 CHANGES ENDS
#UY3048 CHANGES STARTS
INCLUDE "BF9C91MP.f";
INCLUDE "BF9C91MD.f";
#UY3048 CHANGES ENDS
#U3C120 CHANGES STARTS
INCLUDE "BF9C91DP.f";
INCLUDE "BF9C91HC.f";
#UC3120 CHANGES ENDS
PROCESS BF9C91Create
{
        Title = STRINGTABLE.IDS_TITLE_BF9C91Create;
        TitleBar = "TitleBar";
        TitleBarSize = "70";
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        MessageFrame = "MessagesDisp";
        MessageFrameSize = "70";
        
        # FTRQ Create Part 1
        
#MP142F CHANGES STARTS        
# STEP BF9C90-I
# {
#   USES S-STEP "BF9C90-I";
#   "BC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#   "ButtonBarOKCancel" -> ButtonBar;
# }
# 
# IF action == "ACTION_BACK"
# {
#   EXIT;
# 
# }
# 
# STEP BF9C91-P1
# {
#   USES P-STEP "BF9C91-P";
#   "1" -> MIR-DV-PRCES-STATE-CD;
# }
# 
# IF LSIR-RETURN-CD != "00"
# {
#    BRANCH BF9C90-I;
# }
# 
# ButtonBar = "ButtonBarOKCancel";
# # FTRQ Create Part 2
# STEP BF9C91-I
# {
#   USES S-STEP "BF9C91-I";
#   "P" -> MIR-POL-FUT-ACTV-STAT-CD;
# }
# 
# IF action == "ACTION_BACK"
# {
#    MESSAGES-T[0] = "";
#    BRANCH BF9C90-I;
# }
# 
# STEP BF9C91-P2
# {
#   USES P-STEP "BF9C91-P";
#   "2" -> MIR-DV-PRCES-STATE-CD;
# }
# 
# IF LSIR-RETURN-CD != "00"
# {
#   BRANCH BF9C91-I;
# }
# 
# ButtonBar = "ButtonBarConfirmCancel";
# # FTRQ Create Part 3
# STEP BF9C90-O
# {
#   USES S-STEP "BF9C90-O";
#   STRINGTABLE.IDS_TITLE_BF9C91CreateConfirm -> Title;
# }
# 
# IF action == "ACTION_BACK"
# {
#   BRANCH BF9C91-P1;
# }
# 
# STEP BF9C91-P3
# {
#    USES P-STEP "BF9C91-P";
#   "3" -> MIR-DV-PRCES-STATE-CD;
# }
# 


        # FTRQ Create Part 1
       

        STEP BF9C90-I
        {
          USES S-STEP "BF9C90-I";
          "ButtonBarOKCancel" -> ButtonBar;
        }
        
        IF action == "ACTION_BACK"
        {
          
          EXIT;
        
        }

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
        BRANCH BF9C90-I;
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

   #16040 changes starts     
        MESSAGES-T[0] = "";
   #16040 changes ends     
        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "BC"
        {
            STEP CALLBC
            {
                   USES PROCESS "BF9C91BC";

            }                   
          
         }
         
        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SB"
	 {
	 
            STEP CALLSB
            {
                   USES PROCESS "BF9C91SB";

            }                   
	           
         }
#UY3064 START CHANGES HERE
        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "WL"
		 {
		 
	            STEP CALLWL
	            {
	                   USES PROCESS "BF9C91WL";
	
	            }                   
		           
         }
#UY3064 CHANGES END HERE
#MP142F CHANGES ENDS
#MP142G CHANGES STARTS
        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SC"
	 {
            STEP CALLSC
            {
                   USES PROCESS "BF9C91SC";
            } 
         }
         
#MP142U CHANGES STARTS

        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "CV"
	 {
            STEP CALLCR
            {
                   USES PROCESS "BF9C91CR";
            } 
         }
         
#UYS025 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AP"
   {
       STEP CALLAP
       {
              USES PROCESS "BF9C91AP";
       
       } 
   }
#UYS025 CHANGES ENDS
     
#UY3066 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SM"
   {
       STEP CALLSM
       {
                USES PROCESS "BF9C91SM";

       }                   
           
    }
#UY3066 CHANGES ENDS HERE

#UY3094 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "TI"
   {
        STEP CALLSB
        {
               USES PROCESS "BF9C91TI";
        }                   
   }
#UY3094 CHANGES ENDS HERE 	 

#UY3095 START CHANGES HERE
        IF MIR-DV-POL-FUT-ACTV-TYP-CD == "KC"
		 {
		 
	            STEP CALLKC
	            {
	                   USES PROCESS "BF9C91KC";
	
	            }                   
		           
         }
#UY3095 CHANGES END HERE

#UY3049 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AR"
   {
       STEP CALLAR
       {
                USES PROCESS "BF9C91AR";

       }                   
           
    }
#UY3049 CHANGES ENDS HERE
#UY3048 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MP"
   {
       STEP CALLMP
       {
                USES PROCESS "BF9C91MP";

       }                   
           
    }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MD"
   {
       STEP CALLMD
       {
                USES PROCESS "BF9C91MD";

       }                   
           
    }
#UY3048 CHANGES ENDS HERE
#U3C120 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "DP"
   {
       STEP CALLDP
       {
                USES PROCESS "BF9C91DP";

       }                   
           
    }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "HC"
   {
       STEP CALLHC
       {
                USES PROCESS "BF9C91HC";

       }                   
           
    }
#U3C120 CHANGES ENDS HERE
#MP142U CHANGES ENDS
       BRANCH BF9C90-I;
#MP142G CHANGES ENDS
}
