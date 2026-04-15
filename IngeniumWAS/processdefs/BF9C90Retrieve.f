#*******************************************************************************
#*  Component:   BF9C90Retrieve.f                                              *
# *  Description: Future request Table(FTRQ) Inquiry Process                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      Future dated Activity Request inquiry                     *
# * MP142G  CTS      Changes for new activity type sundry amount change        *
#*  M142U2  CTS      Rider Switch Enhancements                                 *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS025  CTS      Future dated advance payment Inquiry                      *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*  UY3064  CTS      Whole Life Premium Payment Completion                     *
#*  UY3066  CTS      CHANGES FOR SAVING RIDER                                  *
#*  S15287  CTS      Kata Change                                               *
#*  UY3094  CTS      CHANGES FOR TERM TERM ADJUSTMENT PROCESSING               *
#*  UY3049  CTS      ANNUITY TRANSITION STREAM 3                               *
#*  UY3048  CTS      CHANGES FOR MATURITY STREAM 3                             *
#*  U3C120  CTS      CHANGES FOR CR120-FUTURE DATED ACTIVITY SCREEN            *
#*******************************************************************************

#MP142F CHANGES STARTS

#INCLUDE "BF9C90-P.p";
INCLUDE "BF9C90-I.s";
#INCLUDE "BF9C90-O.s";
#INCLUDE "GenRetrieve.f";

#MP142F CHANGES ENDS

INCLUDE "BF9C90BC.f";
INCLUDE "BF9C90SB.f";
#MP142G CHANGES STARTS
INCLUDE "BF9C90SC.f";
#MP142G CHANGES ENDS
#M142U2 CHANGES STARTS
INCLUDE "BF9C90CR.f";
#M142U2 CHANGES ENDS
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

#UYS025 CHANGES STARTS
INCLUDE "BF9C90AP.f";
#UYS025 CHANGES ENDS
#UY3064 CHANGES STARTS
INCLUDE "BF9C90WL.f";
#UY3064 CHANGES ENDS
#UY3066 CHANGES STARTS
INCLUDE "BF9C90SM.f";
#UY3066 CHANGES ENDS
#S15287 CHANGES STARTS
INCLUDE "BF9C90KC.f";
#S15287 CHANGES ENDS
#UY3094 CHANGES STARTS 
INCLUDE "BF9C90TI.f";
#UY3094 CHANGES ENDS
#UY3049 CHANGES STARTS
INCLUDE "BF9C90AR.f";
#UY3049 CHANGES ENDS
#UY3048 CHANGES STARTS
INCLUDE "BF9C90MP.f";
INCLUDE "BF9C90MD.f";
#UY3048 CHANGES ENDS
#U3C120 CHANGES STARTS
INCLUDE "BF9C90DP.f";
INCLUDE "BF9C90HC.f";
#UC3120 CHANGES ENDS
PROCESS BF9C90Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


#MP142F CHANGES STARTS
#PROCESS BF9C90Retrieve
#{
#    STEP Main
#    {
#        USES PROCESS "GenRetrieve";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF9C90Retrieve -> Title;
#        "BF9C90-I" -> InputS;
#        "BF9C90-P" -> RetrieveP;
#        "BF9C90-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#    BRANCH Main;

    STEP Input
    {
        USES S-STEP "BF9C90-I";
        
         "ButtonBarOKCancel" -> ButtonBar;        
    }
 
 # 23774A CHANGES STARTS

        temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-PBRQ-EFF-DT + " " + MIR-DV-POL-FUT-ACTV-TYP-CD;
         
        STEP AudOutput
        {
          USES P-STEP "BF9G99-P";
        
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;    
        }

 # 23774A CHANGES ENDS
     
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

#UY3004 CHANGES END

   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "BC"
   {
       STEP CALLBC
       {
              USES PROCESS "BF9C90BC";
       
       }                   
     
    }
    
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SB"
   {  
 
       STEP CALLSB
       {
              USES PROCESS "BF9C90SB";
       }                   
           
    }
#UY3064 CHANGES START HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "WL"
      {  
    
          STEP CALLWL
          {
                 USES PROCESS "BF9C90WL";
          }                   
              
    }
#UY3064 CHANGES END HERE

#MP142G CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SC"
   {  
 
       STEP CALLSC
       {
              USES PROCESS "BF9C90SC";
       }                   
           
    }
#MP142G CHANGES ENDS    

#M142U2 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "CV"
   {  
 
       STEP CALLCR
       {
              USES PROCESS "BF9C90CR";
       }                   
           
   }
#M142U2 CHANGES ENDS 

#UYS025 CHANGES STARTS
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AP"
   {
       STEP CALLAP
       {
              USES PROCESS "BF9C90AP";
       
       } 
    }

#UY3066 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "SM"
      {  
    
          STEP CALLSM
          {
                 USES PROCESS "BF9C90SM";
          }                   
              
     }
#UY3066 CHANGES ENDS HERE
#S15287 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "KC"
      {  
    
          STEP CALLKC
          {
                 USES PROCESS "BF9C90KC";
          }                   
              
     }
#S15287 CHANGES ENDS HERE
#UY3094 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "TI"
   {
        STEP CALLSB
        {
               USES PROCESS "BF9C90TI";
        }                   
   }
#UY3094 CHANGES ENDS HERE 
#UY3049 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "AR"
      {  
    
          STEP CALLAR
          {
                 USES PROCESS "BF9C90AR";
          }                   
              
     }
#UY3049 CHANGES ENDS HERE
#UY3048 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MP"
   {
        STEP CALLMP
        {
               USES PROCESS "BF9C90MP";
        }                   
   }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "MD"
   {
        STEP CALLMD
        {
               USES PROCESS "BF9C90MD";
        }                   
   }
#UY3048 CHANGES ENDS HERE 
#U3C120 CHANGES STARTS HERE
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "DP"
      {  
    
          STEP CALLDP
          {
                 USES PROCESS "BF9C90DP";
          }                   
              
     }
   IF MIR-DV-POL-FUT-ACTV-TYP-CD == "HC"
      {  
    
          STEP CALLHC
          {
                 USES PROCESS "BF9C90HC";
          }                   
              
     }
#U3C120 CHANGES ENDS HERE
#UYS025 CHANGES ENDS
    BRANCH Input;
    
#MP142F CHANGES ENDS    
}


