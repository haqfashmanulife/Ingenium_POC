# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F72Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS087  CTS      EASY ENTRY FOR BILL TYPE CHANGE                           *
#*  128567  CTS      CHANGES TO POPULATE THE ACTIVITY TYPE IN FUTURE DATED ACTV*
#*  128748  CTS      CHANGES FOR THE BUTTON BAR IN THE CONFIRMATION SCREEN     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9F70-I.s";
INCLUDE "BF9F70FB-I.s";
INCLUDE "BF9F72-P.p";
INCLUDE "BF6947-O.s";
INCLUDE "BF6947-P.p";
INCLUDE "BF9C90-O.s";
INCLUDE "BF9C90-P.p";

PROCESS BF9F72Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9F70Input;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9F70-I";
        STRINGTABLE.IDS_TITLE_BF9F70Input -> Title;
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
     
    # Update the record who's data was just entered.

    STEP Retrieve
    {
        USES P-STEP "BF9F72-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarOKCancel";

    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9F70FB-I";
        STRINGTABLE.IDS_TITLE_BF9F70Output -> Title;
    }
    
    IF action == "ACTION_BACK"
        BRANCH Input;

    STEP Update
    {
        USES P-STEP "BF9F72-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

       
    IF LSIR-RETURN-CD != "00"
       BRANCH Output;
#128748 Changes begins       
   ButtonBar = "ButtonBarOK";
  #128748 Changes ends
    IF  MIR-DV-BILL-CD == "P"
    {
        STEP PACRetrieve
        {
	        USES P-STEP "BF6947-P";
        }
       
          IF LSIR-RETURN-CD != "00"
          BRANCH Output;
         STEP PACOutput
	 {
	        USES S-STEP "BF6947-O";
	        STRINGTABLE.IDS_TITLE_BF6947Pac -> Title;
         }
       
        BRANCH Input;
    }
    
    STEP FtrqRetrieve
     {
	 USES P-STEP "BF9C90-P";
	 "BC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
     }
     
          IF LSIR-RETURN-CD != "00"
          BRANCH Output;
     STEP FtrqOutput
     {
	        USES S-STEP "BF9C90-O";
#128567 CHANGES  BEGINS
                	 "BC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
#128567 CHANGES  ENDS
	        STRINGTABLE.IDS_TITLE_BF9C90Retrieve -> Title;
     }    
            BRANCH Input;
}

