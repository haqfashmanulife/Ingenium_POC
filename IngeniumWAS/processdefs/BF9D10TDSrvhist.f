# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D10TDSrvhist.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302I  6.0      New for release 6.0                                       *
#*  MP302U           Added a link for Survival Benefit Deduction Amount History*
#*                   Inquiry Screen                                            *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*  UY3037           SURVIVAL BENEFIT CHANGES FOR STREAM 3 PRODUCT             *
#*******************************************************************************
INCLUDE "BF9D10-P.p";
INCLUDE "BF9D10-I.s";
INCLUDE "BF9D10-O.s";
# INCLUDE "GenRetrieveMore.f";
INCLUDE "BF9D17SrvbenDed.f";
# UY3037  Changes Start
INCLUDE "BF0534List.f";
INCLUDE "BF9B34List.f";
# UY3037  Changes Ends

PROCESS BF9D10TDSrvhist
{
# MP302U Changes Starts

#    STEP Main
#    {
#        USES PROCESS "GenRetrieveMore";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF9D10TDSrvhist -> Title;
#        "BF9D10-I" -> InputS;
#        "BF9D10-P" -> RetrieveP;
#        "BF9D10-O" -> OutputS;
#    }
#   
#     IF action == "ACTION_BACK"
#        EXIT;
#
#    BRANCH Main;

     Title = STRINGTABLE.IDS_TITLE_BF9D10TDSrvhist;
     TitleBar = "TitleBar";
     TitleBarSize = "70";
     ButtonBar = "ButtonBarOKCancel";
     ButtonBarSize = "40";
     MessageFrame = "MessagesDisp";
     MessageFrameSize = "70";
    
     # Collect the key value 
    
     STEP Input
     {
         USES S-STEP "BF9D10-I";
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
   
     # Retrieve the data for the key value
    
     STEP Retrieve
     {
         USES P-STEP "BF9D10-P";
     }
    
     IF LSIR-RETURN-CD != "00"
        BRANCH Input;
    
     ButtonBar = "ButtonBarOK";
    
     # Display the record retrieved
    
     STEP Output
     {
         USES S-STEP "BF9D10-O";
     }

     IF action == "ACTION_MORE"
        BRANCH Retrieve;

     # This action signifies the users request to exit from this routine 

     IF action == "ACTION_BACK"
        EXIT;

     IF action == "GoToSrvbenDed"
     {
        STEP SrvbenDed
        {
            USES PROCESS "BF9D17SrvbenDed";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
            MIR-TRXN-EFF-DT-T [index]      -> MIR-SRVH-EFF-DT;
            MIR-TRXN-CAT-CD-T [index]      -> MIR-SRVH-TRXN-CAT-CD;
            
        }
        BRANCH Retrieve;
     }

# MP302U  Changes Ends
# UY3037  Changes Start

     IF action == "GoToLoanDetList"
     {
        STEP LoanDetList
        {
            USES PROCESS "BF0534List";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
            
        }
        BRANCH Retrieve;
     }

     IF action == "GoToAPLhisList"
     {
        STEP APLhisList
        {
            USES PROCESS "BF9B34List";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
            
        }
        BRANCH Retrieve;
     }
# UY3037  Changes Ends
     
}
