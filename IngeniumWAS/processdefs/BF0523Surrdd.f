# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0523Surrdd.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  UY3060  CTS      DIVIDEND PROCESSING FOR STREAM 3 PRODUCT                  *
#*******************************************************************************

INCLUDE "BF0523-I.s";
INCLUDE "BF0523-P.p";
#UY3060 CHANGES BEGIN
#INCLUDE "BF0523-O.s";
#INCLUDE "GenProcess.f";
INCLUDE "BF0523FBC-O.s";
INCLUDE "BF0523FB-I.s";
#UY3060 CHANGES END

PROCESS BF0523Surrdd
{
    Title = STRINGTABLE.IDS_TITLE_BF0523Surrdd;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

    STEP Input
    {
        USES S-STEP "BF0523-I";
        STRINGTABLE.IDS_TITLE_BF0523Input -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

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

    MIR-DV-PRCES-STATE-CD = "1";
    
    STEP Quote
    {
        USES P-STEP "BF0523-P";
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH Input;
    
    
    # If the user selects Cancel on the Confirm page, return to the Input page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }
    
            IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
          {

              STEP Output
               {
		 USES S-STEP "BF0523FBC-O";
		 "ButtonBarConfirmCancel" -> ButtonBar;
		  STRINGTABLE.IDS_TITLE_BF0523Output -> Title;
               }
                  
              IF action == "ACTION_BACK"
               {
                 MESSAGES-T[0] = "";
                 BRANCH Input;
               }
                
              IF LSIR-RETURN-CD != "00"
                 BRANCH Input;
                 
              STEP CashDisbUpdate
               {
                 USES P-STEP "BF0523-P";
                 "3" -> MIR-DV-PRCES-STATE-CD;
               }

              IF action == "ACTION_BACK"
               {
                 MESSAGES-T[0] = "";
                 BRANCH Input;
               }
                
              IF LSIR-RETURN-CD != "00"
                 BRANCH Output;
              ELSE
                 BRANCH Input;
                                              
                 
          }
          
        ELSE
          {
             IF LSIR-RETURN-CD != "00"
                BRANCH FBOutput-S;
 
             STEP FBInput-S
              {
               USES S-STEP "BF0523FB-I";
               "ButtonBarOKCancel" -> ButtonBar;
               STRINGTABLE.IDS_TITLE_BF0523FBInput -> Title;
              }

              IF action == "ACTION_BACK"
              {
                 MESSAGES-T[0] = "";
                 BRANCH Input;
              }

             STEP FBEdit
              {
               USES P-STEP "BF0523-P";
               "2" -> MIR-DV-PRCES-STATE-CD;
              }

             IF LSIR-RETURN-CD != "00" 
                 BRANCH FBInput-S;  
                 
             IF action == "ACTION_BACK"
              {
                MESSAGES-T[0] = "";
                BRANCH Input;
              }

                    
             STEP Output
              {
                USES S-STEP "BF0523FBC-O";
                "ButtonBarConfirmCancel" -> ButtonBar;
                STRINGTABLE.IDS_TITLE_BF0523Output -> Title;
              }

            IF action == "ACTION_BACK"
              {
                MESSAGES-T[0] = "";
                BRANCH Input;
              }
               

             STEP FBRetrieve
              {
                USES P-STEP "BF0523-P";
                "3" -> MIR-DV-PRCES-STATE-CD;
              }
                                
                 
             IF LSIR-RETURN-CD != "00"
                BRANCH Output;
             ELSE
                BRANCH Input;
                                              

        }
            

 }           
