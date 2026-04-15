# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A64Manlmod.f                                               *
#*  Description: Manual Modification Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAAD  CTS      Intial Version                                            *
#*  Q94540  CTS      NET PAYABLE AMT CALC FOR FXWL                             *
#*                                                                             *
#*******************************************************************************


INCLUDE "BF9A64-I.s";
INCLUDE "BF9A64-P.p";

PROCESS BF9A64Manlmod
{
    Title = STRINGTABLE.IDS_TITLE_BF9A64Manlmod;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Display the entry screen for Manual Modification Screen


    STEP DisplayInfo
    {
        USES P-STEP "BF9A64-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" 
       EXIT;
  #Q94540  changes begins here
  WS-PREV-LN-TC-INT-AMT = MIR-LN-TC-INT-AMT;
  #Q94540  changes ends here
    STEP InputInfo
    {
        USES S-STEP "BF9A64-I";
        
    }
    
    MESSAGES-T[0] = "";

    IF action == "ACTION_BACK"
    {
       IF DisplayInput !="FALSE"
       {
          MESSAGES-T[0] = "";
          ButtonBar="ButtonBarOkCancel";
          EXIT;
       }
       ELSE
           EXIT;

    }

    IF action == "ACTION_REFRESH"
       BRANCH InputInfo;

    # Process the entered information
#Q94540  changes begins here
MIR-PREV-LN-TC-INT-AMT = WS-PREV-LN-TC-INT-AMT;
#Q94540  changes ends here
     STEP ProcessInfo
     {
        USES P-STEP "BF9A64-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
     }

     IF LSIR-RETURN-CD != "00" 
        BRANCH InputInfo;
     
     
    }


